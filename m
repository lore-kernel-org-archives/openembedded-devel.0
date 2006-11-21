Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <freyther@gmx.net>) id 1GmYjF-0007cI-CR
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Nov 2006 17:44:13 +0100
Received: (qmail invoked by alias); 21 Nov 2006 16:41:26 -0000
Received: from unknown (EHLO [192.168.61.154]) [145.253.107.2]
	by mail.gmx.net (mp010) with SMTP; 21 Nov 2006 17:41:26 +0100
X-Authenticated: #1949623
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <20061120135015.ckbllosdeokgk8gc@bigbob.org.uk>
References: <20061120135015.ckbllosdeokgk8gc@bigbob.org.uk>
X-Gpgmail-State: !signed
Message-Id: <C254AAFA-CF5B-4AF7-B6C4-C830C6842BA3@gmx.net>
From: Holger Freyther <freyther@gmx.net>
Date: Tue, 21 Nov 2006 17:38:55 +0100
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.752.3)
X-Y-GMX-Trusted: 0
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: cannot run strip
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
X-List-Received-Date: Tue, 21 Nov 2006 16:44:13 -0000
Content-Type: text/plain;
	charset=US-ASCII;
	delsp=yes;
	format=flowed
Content-Transfer-Encoding: 7bit


Am 20.11.2006 um 19:50 schrieb Rob Neild:

> What am I doing wrong? The build can't find strip...
>
> BBPATH=/home/rob/openembedded/build:/home/rob/openembedded/ 
> org.openembedded.oz354x
>
> TARGET_ARCH    = "arm"
> TARGET_OS      = "linux"
> MACHINE        = "akita"
> DISTRO         = "openzaurus"
> DISTRO_VERSION = "3.5.4.1"
> TARGET_FPU     = "soft"
>
> NOTE: package qemu-native-0.8.2: started
> NOTE: package qemu-native-0.8.2-r1: task do_fetch: started
> NOTE: package qemu-native-0.8.2-r1: task do_fetch: completed
> NOTE: package qemu-native-0.8.2-r1: task do_populate_staging: started
> ERROR: function do_stage failed
>
> | install qemu.1 qemu-img.1
> "/home/rob/openembedded/tmp/staging/i686-linux/share/man/man1"
> | mkdir -p "/home/rob/openembedded/tmp/staging/i686-linux/bin"
> | install -m 755 -s qemu-img
> "/home/rob/openembedded/tmp/staging/i686-linux/bin"
> | install: cannot run strip: No such file or directory
> | install: strip failed
> | make: *** [install] Error 1
> | FATAL: oe_runmake failed
>

Tell us more:

E.g. I would ask myself if I have 'strip' on my machine

z.


--
Holger 'zecke' Freyther
geek, QA monkey, OpenEmbedded Engineer

Me http://www.openembedded.org/~zecke
Blog http://zecke.blogspot.com





