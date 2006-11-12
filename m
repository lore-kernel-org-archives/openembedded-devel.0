Received: from [212.60.202.195] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <nils.faerber@kernelconcepts.de>) id 1Gj3Zj-0005qU-Jy
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Nov 2006 01:51:55 +0100
Received: from [80.131.207.104] (helo=[192.168.178.29])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA:32) (Exim 4.50) id 1Gj43I-0002zZ-3b
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Nov 2006 02:22:28 +0100
Message-ID: <45566FBC.1030206@kernelconcepts.de>
Date: Sun, 12 Nov 2006 01:50:04 +0100
From: Nils Faerber <nils.faerber@kernelconcepts.de>
User-Agent: Thunderbird 1.5.0.7 (X11/20060922)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.94.0.0
Subject: ARM EABI SDK build
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
X-List-Received-Date: Sun, 12 Nov 2006 00:51:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello!
I am terribly sorry but now you got me on your track too ;)

As first task I wanted to build an ARM EABI softfloat toolchain using
current OE. So I created a machine config for a PXA270 machine using
Angstrom as dist and created my own smaller version of meta-sdk in order
not to build X11, GTK, OPIE and GPE (for now).

The first problem I stepped over is that gcc4-build-sdk.inc still has
the line

SRC_URI += 'file://602-sdk-libstdc++-includes.patch;patch=1'

or in fact without the 602- prefix. But this patch is already included
in the gcc_4.1.1.bb. So I commented that out.

Now the build continued a bit further but fails at gcc-cross-sdk-4.1.1-r0:

|
/home/nils/work/oe/colli-sdk/tmp/work/i686-angstrom-linux-gnueabi/gcc-cross-sdk-4.1.1-r0/gcc-4.1.1/libiberty/getpwd.c:
In function ‘getpwd’:
|
/home/nils/work/oe/colli-sdk/tmp/work/i686-angstrom-linux-gnueabi/gcc-cross-sdk-4.1.1-r0/gcc-4.1.1/libiberty/getpwd.c:75:
error: storage size of ‘dotstat’ isn’t known
|
/home/nils/work/oe/colli-sdk/tmp/work/i686-angstrom-linux-gnueabi/gcc-cross-sdk-4.1.1-r0/gcc-4.1.1/libiberty/getpwd.c:75:
error: storage size of ‘pwdstat’ isn’t known


Which I do not understand at all.

Does anyone have an idea what might causing this?
Or even better, does anyone have a working config for an ARM EABI
softfloat toolchain (SDK) target?

Thanks!

Cheers
  nils faerber

PS: Apart from that minor problem OE has become a lot better during that
last 3/4 of an year when I last looked at it ;)

-- 
kernel concepts GbR      Tel: +49-271-771091-12
Dreisbachstr. 24         Fax: +49-271-771091-19
D-57250 Netphen          Mob: +49-176-21024535
--


