Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JOtXr-00006B-Uw
	for openembedded-devel@openembedded.org; Tue, 12 Feb 2008 12:43:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1CBhheE019110
	for <openembedded-devel@openembedded.org>; Tue, 12 Feb 2008 11:43:43 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18932-05 for <openembedded-devel@openembedded.org>;
	Tue, 12 Feb 2008 11:43:39 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1CBhZrF019088
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Tue, 12 Feb 2008 11:43:35 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <47B180DC.1040107@miromico.ch>
References: <47AB02C4.4060202@miromico.ch>  <47B180DC.1040107@miromico.ch>
Date: Tue, 12 Feb 2008 11:43:35 +0000
Message-Id: <1202816615.8288.62.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Init fails with segfault on AVR32
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
X-List-Received-Date: Tue, 12 Feb 2008 11:43:28 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2008-02-12 at 12:19 +0100, Alex wrote:
> While waiting for support from the mailinglist I tried a few more things 
> to get my atngw100 system running.
> 
> I tried to use init from (statically linked) busybox. This will suffer 
> the same problem but gives me a better clue where
> the problem lies.
> 
> I found out that in a first step /bin/mount.util-linux is responsible 
> for the segfault. And this is due to the shared library
> "ld-uClibc-0.9.28".
> 
> If I replace this library with ld-uClibc-0.9.29 from atmel's buildroot. 
> The segfault is gone!
> 
> There are rumours that some of you have OE running on ATNGW100 hardware. 
> So what can I make wrong?
> Can someone send me his local.conf?
> I update OE from time to time in the hope this will save my problems.
> 
> I use:
> - bitbake version 1.18.11
> - monotone 0.31
> 
> And I update OE using the following commands:
>  > mtn --db=/oe/OE.mtn pull monotone.openembedded.org org.openembedded.dev
>  > cd /oe/org.openembedded.dev && mtn update
> 
> Hope someone can help me. I'm trying for weeks to get this stuff 
> running....

I don't have any AVR hardware but narrowing it down to a library like
that is a great step forward. Can you see any differences in the patches
or versions used to build uclibc between buildroot and OE?

Cheers,

Richard



