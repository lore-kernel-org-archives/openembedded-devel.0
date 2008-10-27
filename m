Received: from [62.250.3.53] (helo=relay.versatel.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <linux@hf-electronics.com>) id 1KuNFA-0005jG-1b
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Oct 2008 09:14:32 +0100
Received: from [62.58.160.127] (helo=hf-electronics.com)
	by relay.versatel.net with smtp (Exim 4.69)
	(envelope-from <linux@hf-electronics.com>) id 1KuNEO-0000rm-Dr
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Oct 2008 09:13:44 +0100
Received: from <linux@hf-electronics.com> with PostMaster 4.3.2 (MPS);
	Mon, 27 Oct 2008 09:12:37 +100
From: "Henk Geraads" <linux@hf-electronics.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 27 Oct 2008 09:13:04 +0100
Message-ID: <NGBBLNEOGLJIIJKLFLPFOEAEDKAA.linux@hf-electronics.com>
MIME-Version: 1.0
X-Priority: 1 (Highest)
X-MSMail-Priority: High
X-Mailer: Microsoft Outlook IMO, Build 9.0.6604 (9.0.2911.0)
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.5579
Importance: High
Subject: Problems building a kernelmodule for OE
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
X-List-Received-Date: Mon, 27 Oct 2008 08:14:32 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I am not sure if i posted it in the correct mailing list!
But I am trying to make a kernel module for the OE distro angstrom 200=
7-12 for machine CM-X270.

when I try to make the module, following error message is produced!

	In file included from include/linux/jiffies.h:4,
     	      	     from include/linux/sched.h:54,
      	           from include/asm/uaccess.h:14,
                 	     from /home/henk/cm270/fifodrv/cfi-ktst/cfi-mod.=
c:10:
	include/linux/calc64.h: In function 'do_div_llr':
	include/linux/calc64.h:25: error: '__LINUX_ARM_ARCH__' undeclared (fi=
rst use in this function)
	include/linux/calc64.h:25: error: (Each undeclared identifier is repo=
rted only once
	include/linux/calc64.h:25: error: for each function it appears in.)
	/home/henk/cm270/fifodrv../cfi-ktst/cfi-mod.c: In function 'cfi_ioctl=
':
	/home/henk/cm270/fifodrv/cfi-ktst/cfi-mod.c:67: warning: implicit dec=
laration of function 'GPLR'
	/home/henk/cm270/fifodrv/cfi-ktst/cfi-mod.c:67: warning: implicit dec=
laration of function 'GPIO_bit'
	/home/henk/cm270/fifodrv/cfi-ktst/cfi-mod.c: In function 'cfi_init':
	/home/henk/cm270/fifodrv/cfi-ktst/cfi-mod.c:204: error: 'GPIO_IN' und=
eclared (first use in this function)
	/home/henk/cm270/fifodrv/cfi-ktst/cfi-mod.c:208: error: 'MSC1' undecl=
ared (first use in this function)
	/home/henk/cm270/fifodrv/cfi-ktst/cfi-mod.c:209: error: 'GPIO79_nCS_3=
_MD' undeclared (first use in this function)
	make[2]: *** [/home/henk/cm270/fifodrv/cfi-ktst/cfi-mod.o] Error 1
	make[1]: *** [_module_/home/henk/cm270/fifodrv/cfi-ktst] Error 2
	make: *** [default] Error 2

My source for the module cfi-kernel is located in the
path: /home/henk/cm270/fifodrv

I create with "bitbake linux -c defshell -f" an enviroment with the
"correct" path's and env.var's.

Makefile:
	# Makefile for external CFI kernel module
	CFLAGS =3D -march=3Darmv5t -Wall -D_GNU_SOURCE=20

	ifneq ($(KERNELRELEASE),)
	# we are inside the kernel tree and called from kernel build system

	obj-m   :=3D cfi-mod.o
	else
	# we are a separate module and start the kernel make and give it our =
directory
	KERNELDIR =3D /home/henk/oe/build/tmp/angstrom/work/cm-x270-angstrom-lin=
ux-gnueabi/linux-2.6.23-r8/linux-2.6.23

	#KERNELDIR =3D ../linux-26
	PWD       :=3D $(shell pwd)

	default:
		$(MAKE) -C $(KERNELDIR) M=3D$(PWD) modules
	endif

	clean::
		$(RM) -rf *.o .depend .*.cmd *.ko *.mod.c .tmp_versions *~

	.PHONY: clean

	depend .depend dep:
		$(CC) $(CFLAGS) -M *.c > .depend

	ifeq (.depend,$(wildcard .depend))
	include .depend
	endif


start op the module sourcecode:

	#include <linux/module.h>
	#include <linux/kernel.h>
	#include <linux/ioport.h>
	#include <linux/fs.h>
	#include <asm/uaccess.h>
	#include <asm/io.h>

	MODULE_AUTHOR("Henk"); =20
	......


What is my mistake??

Thanks in advance for any reaction!

Henk




