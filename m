Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1LcgJ2-0001Kr-Vf
	for openembedded-devel@openembedded.org; Thu, 26 Feb 2009 14:29:41 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n1QDQKFk012918
	for <openembedded-devel@openembedded.org>; Thu, 26 Feb 2009 13:26:20 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12887-01 for <openembedded-devel@openembedded.org>;
	Thu, 26 Feb 2009 13:26:16 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n1QDQEG7012912
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Thu, 26 Feb 2009 13:26:15 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20090225230412.GA25783@denix.org>
References: <200902131728.08634.openembedded@haerwu.biz>
	<20090224064639.GE2172@smtp.west.cox.net>
	<1235492001.27962.60.camel@andromeda> <49A4203E.3060202@balister.org>
	<59251.AFRWVFwAXS0=.1235513405.squirrel@webmail.no-log.org>
	<1235514594.4890.525.camel@lenovo.internal.reciva.com>
	<1235552980.5399.10.camel@dax.rpnet.com>
	<20090225230412.GA25783@denix.org>
Date: Thu, 26 Feb 2009 13:28:40 +0000
Message-Id: <1235654920.6336.33.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: checksums situation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Feb 2009 13:29:41 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-02-25 at 18:04 -0500, Denys Dmytriyenko wrote:
> I'm not in the position to explain how Bitbake works to the Bitbake's core 
> developer and maintainer. :) So, below is just my understanding of how it 
> works.
> 
> So, for overlays it currently works the same way for checksums.ini as it does 
> for conf/class files - it uses only one instance of a file with the same name, 
> depending on the priority either from overlay or from upstream org.oe.dev. In 
> other words - if my overlay has a higher priority, it would use my 
> checksums.ini INSTEAD of the upstream one in org.oe.dev. Same with conf/class 
> files - if I have a copy of base.bbclass in my overlay, it REPLACES the one 
> from upstream org.oe.dev...

There are two different mechanisms that bitbake uses to find files. One
is the conf/class mechanism using BBPATH, the other is the BBFILES
mechanism and collections (overlays).

For BBFILES, we have some globs which expand into a list of files.
Depending on some pattern matching, they get given different priorities
so files from a given collection can "win" compared to those from
another. This is what you describe above and as you rightly point out it
wouldn't work for checksums.ini files.

When we need a conf file, say "bitbake.conf" we search through BBPATH,
appending "conf/" to each entry and seeing if it exists. The first match
found wins. Class files work similarly.

For checksum.ini I'm proposing we'd go through BBPATH and append all the
checksum.ini files found together to form one large complete version.
People's overlay/collections can then supplement the checksum data
easily. There certainly isn't a technical reason I can see why this
wouldn't work.

Cheers,

Richard



