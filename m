Received: from [212.227.126.179] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <robert@linuxdevelopment.de>)
	id 1JZKFt-0004NG-DD; Wed, 12 Mar 2008 07:16:03 +0100
Received: from [10.0.0.200] (M92b1.m.pppool.de [89.49.146.177])
	by mrelayeu.kundenserver.de (node=mrelayeu7) with ESMTP (Nemesis)
	id 0ML2xA-1JZKDt0phR-0002xG; Wed, 12 Mar 2008 07:13:57 +0100
Message-ID: <47D774A4.3040207@linuxdevelopment.de>
Date: Wed, 12 Mar 2008 07:13:56 +0100
From: =?ISO-8859-1?Q?Robert_W=F6rle?= <robert@linuxdevelopment.de>
User-Agent: Thunderbird 2.0.0.9 (X11/20070801)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200803111746.59194.geoffrey@pager.net>
	<1205277784.16531.18.camel@dax.rpnet.com>
In-Reply-To: <1205277784.16531.18.camel@dax.rpnet.com>
X-Enigmail-Version: 0.95.5
X-Provags-ID: V01U2FsdGVkX18Z4qJcjqKJgdBmg3oYYBIhpSOPG226oW7VFsh
	puqMnBI8PG/WBod/5uB5nhQjezUPVXxTG1xWSHU655qmxKWqT1
	ggPDo7Ox+Irb/BhRcvdw0Mwu4GAweiHPJBUwCfMFq4=
X-SA-Exim-Connect-IP: 212.227.126.179
X-SA-Exim-Mail-From: robert@linuxdevelopment.de
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: Stuck with AVR32 segfaults in init
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
X-List-Received-Date: Wed, 12 Mar 2008 06:16:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


> 
> If you take an OE binary and run it within a working filesystem from
> whereever, what happens? If it segfaults there you may be able to debug
> it. If it doesn't, try copying libs from OE into that system until it
> breaks? That should at least tell you where the problem is.

Dear all
I was starting a oe build the day koen announced the merge and it went
with some obstacles and finished the major libs nicely but i cant tell
what i had to do to get past the uclibc parts.

I did then get a 0.9.28 based libs and apps which i now merge with a
atmel bsp kernel and uClibc.
So i can now run all oe libs ( beside uClibc) with that and it feels
wonderful. I am currently running the ngw100 with a 5.7 lcd attached and
can get up a Xfbdev + gtk+ + x11vnc within the nand and nor ( totale of
16 mb)  Hurray the power if footprinting of oe !!


But i am also stuck now redoing this and rebuilding a new oe toolchain
for avr32 . I cant get pass the external-toolchain ERROR mentioned in
some earlier mails.
I tried both oe uclibc 0.9.28 and 0.9.29
So i now have one tool chain up and running and i can go on to develop
my target application but nobody is allowed to touch my laptop with that
toolchain or he dies !!

Maybe we need some of the guru`s here to help us poor avr32 small users
to get the basic oe toolchain up and running and stable at least for the
ucLibc part.

Robert
>


