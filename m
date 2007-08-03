Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IGl2V-0004eG-IY
	for openembedded-devel@openembedded.org; Fri, 03 Aug 2007 02:29:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l730R76W023501
	for <openembedded-devel@openembedded.org>;
	Fri, 3 Aug 2007 01:27:07 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22959-10 for <openembedded-devel@openembedded.org>;
	Fri,  3 Aug 2007 01:27:03 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l730R04B023494
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Fri, 3 Aug 2007 01:27:00 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <46AEE9A0.2050504@dominion.kabel.utwente.nl>
References: <1185839805.7719.103.camel@localhost.localdomain>
	<46AEE9A0.2050504@dominion.kabel.utwente.nl>
Date: Fri, 03 Aug 2007 01:26:59 +0100
Message-Id: <1186100819.6626.65.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: The future of "svnnow"
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
X-List-Received-Date: Fri, 03 Aug 2007 00:29:11 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Just an update on the current status:

On Tue, 2007-07-31 at 09:49 +0200, Koen Kooi wrote:
> Richard Purdie schreef:
> > What still needs to be done (patches welcome)
> > =============================================
> > 
> > 1. Fix revision lockdown SRCREV_pn-somepackage = "90" etc. Thats a
> > problem in localpath() in svn.py.

Done.

> > 2. Handling of multiple SCMs in the SRC_URI. The plan here is simple,
> > any package doing this has to set SRCREV_FORMAT specifying the format of
> > the SRCREV string. get_srcrev() can collect the SCM revisions, fill out
> > the string and return it. The format and inner workings of this are open
> > for discussion and to be determined. 

Not Done. Does anyone have any thoughts on this?

> > 3. Finish sortable_revision(). If self._sortable_revision() isn't
> > present, it should read a counter, revision pair from BB_URI_LOCALCOUNT.
> > If the revision is different to _latest_revision, increase the counter
> > and store + return it. 

Done.

> > 4. Fix the git fetcher to make git "now" work. These "local revision
> > counter" packages will not be shareable between different builds but we
> > always knew that would be the case with git and this is as close as we
> > can get.

Done.

> > 5. Examine the other fetchers and see if we can add some kind of "now"
> > support to them too.

I'm ignoring perforce and svk. It doesn't make sense for ssh/wget/local
urls. I doubt we can get any kind of coherent state out of cvs and to be
honest I don't care about it. So I guess thats Done.

> > 6. Add policy control variables to control the wiping of BB_URI_HEADREVS

Not Done.

>   7. make a minrev and max rev for patches 

Done.

> and try to convert dates to revisions for
> existing users of ;mindate=20070707;maxdate=20080808 in SRC_URI

Not Done. SEP field invoked here ;-).

Cheers,

Richard



