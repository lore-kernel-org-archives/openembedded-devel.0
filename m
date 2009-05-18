Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1M68Xz-00031a-4w
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 21:30:51 +0200
Received: from [78.54.213.71] (helo=[192.168.1.177])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1M68UD-0003dx-99
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 21:26:57 +0200
Message-ID: <4A11B5B4.8040804@kernelconcepts.de>
Date: Mon, 18 May 2009 21:23:32 +0200
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20090517212442.6E35A1893E6@amethyst.openembedded.net>	<4A115165.9070300@kernelconcepts.de>
	<200905181716.24601.khimov@altell.ru>
In-Reply-To: <200905181716.24601.khimov@altell.ru>
X-Enigmail-Version: 0.95.7
Subject: Re: [oe-commits] Roman I Khimov : (e)glibc-package: fix kernel version passed to qemu
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
X-List-Received-Date: Mon, 18 May 2009 19:30:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Roman I Khimov schrieb:

> I've not heard yet of this really breaking something. And frankly I don't see 
> any reason for that. If it actually does - feel free to shout and scream of 
> course, we'll think how to handle it better.

I assume it breaks for everyone using qemu 0.9.x. I see it failing with this
message now:

NOTE: Running task 635 of 6760 (ID: 194,
/disk/d2/dev/recipes/glibc/glibc_2.6.1.bb, do_package)
NOTE: preparing tree for binary locale generation
NOTE: generating locale de_DE (UTF-8)
qemu-arm version 0.9.1, Copyright (c) 2003-2008 Fabrice Bellard
usage: qemu-arm [options] program [arguments...]
Linux CPU emulator (compiled for arm emulation)
[...]

This happens building Angstrom for both armv4 and armv5 targets and even with
the latest OLDEST_KERNEL changes Koen made some hours ago.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de
                                        http://www.kernelconcepts.de/en


