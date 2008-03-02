Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1JVw2g-0002cb-O0
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 Mar 2008 22:48:29 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 67DFB14023C4
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Mar 2008 22:46:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eG4QR3m0mxSV
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Mar 2008 22:46:49 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 28F6314171BB
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Mar 2008 22:46:48 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 02 Mar 2008 22:47:15 +0100
Message-Id: <1204494435.17068.23.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.0 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: iwwmmxt optimization and soft float in OE on PXA270
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
X-List-Received-Date: Sun, 02 Mar 2008 21:48:29 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hallo.

What is your opinion on enabling of iwmmxt optimization on >=PXA270
devices, and optionally also soft floats?

I read old posts talking regarding broken iwmmxt support in gcc.

I also read something about float emulation options for PXA270, its
speed and ABI breakage. It seems, that soft float should be the fastest
option for devices without hardware FPU.

I wanted to test it and I have recompiled everything I am using with:
-march=iwmmxt -mcpu=iwmmxt -mtune=iwmmxt -Os -funswitch-loops -fgcse-after-reload -msoft-float

It should be the best possible optimization for PXA270 (compiled for
iwmmxt, use soft float instead of exception based kernel driver, use -Os
to make binaries as small as possible and add optimizations from -O3).

Then I have created a spitz feed based on the latest OE.dev and
installed.

Here is iwmmxt soft float Spitz feed:
http://www.penguin.cz/~utx/zaurus/feed/
(You have to degrade or remove xorg-kdrive before boot - known bug. You
have to replace the default feed by the experimental one. And finally,
2.6.24 is available in the feed and you can upgrade.)

Problems relevant to iwmmxt:
- qemu does not work properly and fails to compile locales, timezones
  and emacs.
- minimo compilation fails (not yet analyzed)

Problems relevant to soft float:
- Breaks ABI of applications using math.

I am now using it for several days, and I don't see any problems, which
were not known with the default compiler.

Other results:
- Os does not create significantly smaller binaries when compared with
  the default -O2.
- Some applications seems to run a bit faster (MPlayer).


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



