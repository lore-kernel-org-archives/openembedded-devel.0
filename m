Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IK0Xv-0002d6-Qo
	for openembedded-devel@openembedded.org; Sun, 12 Aug 2007 01:39:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l7BNd1Fk021363
	for <openembedded-devel@openembedded.org>;
	Sun, 12 Aug 2007 00:39:01 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21248-03 for <openembedded-devel@openembedded.org>;
	Sun, 12 Aug 2007 00:38:57 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l7BNcrSM021356
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sun, 12 Aug 2007 00:38:53 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1186100819.6626.65.camel@localhost.localdomain>
References: <1185839805.7719.103.camel@localhost.localdomain>
	<46AEE9A0.2050504@dominion.kabel.utwente.nl>
	<1186100819.6626.65.camel@localhost.localdomain>
Date: Sun, 12 Aug 2007 00:38:52 +0100
Message-Id: <1186875532.5859.67.camel@localhost.localdomain>
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
X-List-Received-Date: Sat, 11 Aug 2007 23:39:04 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2007-08-03 at 01:26 +0100, Richard Purdie wrote:
> Just an update on the current status:
> 
> On Tue, 2007-07-31 at 09:49 +0200, Koen Kooi wrote:
> > Richard Purdie schreef:
> > > 2. Handling of multiple SCMs in the SRC_URI. The plan here is simple,
> > > any package doing this has to set SRCREV_FORMAT specifying the format of
> > > the SRCREV string. get_srcrev() can collect the SCM revisions, fill out
> > > the string and return it. The format and inner workings of this are open
> > > for discussion and to be determined. 
> 
> Not Done. Does anyone have any thoughts on this?

Now done.

URIs are tagged with a name field e.g.:

SRC_URI "\
svn://someurl/someplace;module=somemodule;name=myname1 \
svn://someurl2/someplace2;module=somemodule2;name=myname2 \
"

and then you set:

SRCREV_FORMAT = "myname1_rmyname2"

and you set it to however you want the SRCREV part of the version field
formatted. This could result in:

SRCREV = "123_r456"

> > > 6. Add policy control variables to control the wiping of BB_URI_HEADREVS
> 
> Not Done.

Now done.

You can set this in local.conf:

BB_SRCREV_POLICY = "cache"
BB_SRCREV_POLICY = "clear"

"cache" preserves the cached data, clear wipes it each time bitbake
runs.

That should make SRCREV feature complete, it just needs lots of testing
now, the manual needs updating and then we can release bitbake 1.8.8.

Cheers,

Richard



