Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IFf8O-0008Mf-QX
	for openembedded-devel@openembedded.org; Tue, 31 Jul 2007 01:58:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l6UNuqf4006477;
	Tue, 31 Jul 2007 00:56:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06409-02; Tue, 31 Jul 2007 00:56:48 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l6UNukKe006470
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Tue, 31 Jul 2007 00:56:46 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: bitbake-dev <bitbake-dev@lists.berlios.de>,
	openembedded-devel <openembedded-devel@openembedded.org>
Date: Tue, 31 Jul 2007 00:56:45 +0100
Message-Id: <1185839805.7719.103.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Henryk =?ISO-8859-1?Q?Pl=F6tz?= <henryk@openmoko.org>
Subject: The future of "svnnow"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jul 2007 23:58:45 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

As people know the ability to build the latest head revisions of svn
(for example) repositories in OE with bitbake has been limited and less
than ideal.

Various patches have floated around with good points and bad points and
there was some discussion on the bitbake-dev list about them. The
multithreading in bitbake 1.8 posed some major challenges.

To solve the problems I have made the following changes:

Addition of an sqlite based persistent datastore to store "information"
in. This is divided into "domains" and a domain is easy to
create/destroy or clean. Currently we have three domains:

  1. BB_URLDATA - this replaced the ugly global variable in the fetcher 
     and means we don't recompute the data from SRC_URI each time we 
     need to use it. This is wiped every bitbake run.
  2. BB_URI_HEADREVS - a cache of the head revisions of SCMs
  3. BB_URI_LOCALCOUNT - this will be used by SCMs that require a local 
     counter since their revisions don't sort (e.g. git).

Addition of methods the fetchers. We needed three new ones:

  1. _revision_key - some key we can uniquely identify a given scm with 
     (the url alone might not be enough) 
  2. _latest_revision - returns the head revision of a given scm
  3. _sortable_revision - returns the sortable version of that revision

Core changes to the fetcher:

  1. A get_srcrev() function to return the SRCREV string. This works 
     for since SCM SRC_URIs but needs finishing to support multi SCM 
     SRC_URIs.
  2. latest_revision() method as _latest_revision above but uses the 
     cache.
  3. sortable_revision() method which will implement BB_URI_LOCALCOUNT
     for scms like git but this isn't implemented yet


So what does the result look like?
==================================

In OE, you'd set

PV = "x.y.z+svnr${SRCREV}"

and SRCREV is declared in bitbake.conf as:

SRCREV = "${@bb.fetch.get_srcrev()}"

and this is all you do. Now the PV changes when the svn head changes and
you have cutting edge packages. The path to the tarball in DL_DIR
changes based on the revision too.

How often it checks for changes in the head depends on when
BB_URI_HEADREVS is cleared. Currently bitbake does this at each startup
but this could easily be controlled by a variable so each user can set
their preference.

For distros the plan is that they can lock this down with:

SRCREV_pn-somepackage = "90"

or maybe this as well (if the x.y.z needs to be changed):

PV_pn-somepackage = "x.y.z+svnr90"

I've just noticed this doesn't work yet, that needs fixing. Minor
issue ;-).

The problem is dealing with SRCDATE. Since we often set SRCDATE =
"something", SRCDATE is set for every package. The only way bitbake can
spot the use of SRCDATE is to peek at the unexpanded PV variable and see
if it contains the string "DATE". If it does, it uses SRCDATE, if it
doesn't is assumes SRCREV is in use. I don't like this behaviour but I
can't see the alternative. In due course I'm hoping we stop supporting
SRCDATE for svn since SRCREV should be much more powerful.


What still needs to be done (patches welcome)
=============================================

1. Fix revision lockdown SRCREV_pn-somepackage = "90" etc. Thats a
problem in localpath() in svn.py.

2. Handling of multiple SCMs in the SRC_URI. The plan here is simple,
any package doing this has to set SRCREV_FORMAT specifying the format of
the SRCREV string. get_srcrev() can collect the SCM revisions, fill out
the string and return it. The format and inner workings of this are open
for discussion and to be determined. 

3. Finish sortable_revision(). If self._sortable_revision() isn't
present, it should read a counter, revision pair from BB_URI_LOCALCOUNT.
If the revision is different to _latest_revision, increase the counter
and store + return it. 

4. Fix the git fetcher to make git "now" work. These "local revision
counter" packages will not be shareable between different builds but we
always knew that would be the case with git and this is as close as we
can get.

5. Examine the other fetchers and see if we can add some kind of "now"
support to them too.

6. Add policy control variables to control the wiping of BB_URI_HEADREVS


Migration Path
==============

SRCREV cannot be used by packages in OE.dev until we bump the version
requirement to bitbake 1.8.8 assuming that contains these changes. We
need to decide how much of the above we want to implement before 1.8.8
and test svn heavily before that release (with people testing SRCREV
locally if possible). Once the minimum version is 1.8.8 we can look at
converting the svn packages in OE.dev.


Final Note
==========

I realise this comes across more as "how things are" rather than a
discussion about how we should do them. This is partly because things
were discussed on the bitbake list in the past, partly because I don't
see any other way some of this can work and partly because presenting a
solution is perhaps the best way to generate discussion. If anyone can
see better ways to do any of this, please do speak up! I don't think all
of this is perfect, there are bits I strongly dislike. The main thing in
its favour is I think we can make it work!


Comments and discussion are very welcome. At the very least we need to
agree:

a) this is the right approach
b) how much of the outstanding task list we need to complete before 1.8.8
c) how to migrate to these changes in OE.dev

and due to the invasive nature of some of the changes, testing, testing,
testing! :)

Cheers,

Richard




