Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1KuUSx-0004ao-F1
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Oct 2008 16:57:15 +0100
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id 2212C628084
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Oct 2008 16:56:27 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <NGBBLNEOGLJIIJKLFLPFOEAEDKAA.linux@hf-electronics.com>
References: <NGBBLNEOGLJIIJKLFLPFOEAEDKAA.linux@hf-electronics.com>
Date: Mon, 27 Oct 2008 16:56:26 +0100
Message-Id: <1225122986.5129.41.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.0 
Subject: Re: Problems building a kernelmodule for OE
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
X-List-Received-Date: Mon, 27 Oct 2008 15:57:15 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: quoted-printable

Henk Geraads wrote:

> when I try to make the module, following error message is produced!

It seems, that source code is a bit outdated (intended for older kernel
that you have) or you are compiling it in a bad way.

> 	include/linux/calc64.h:25: error: '__LINUX_ARM_ARCH__' undeclared (fir=
st use in this function)

Strange. It should be defined.

> 	/home/henk/cm270/fifodrv/cfi-ktst/cfi-mod.c:67: warning: implicit decl=
aration of function 'GPLR'
> 	/home/henk/cm270/fifodrv/cfi-ktst/cfi-mod.c:67: warning: implicit decl=
aration of function 'GPIO_bit'
> 	/home/henk/cm270/fifodrv/cfi-ktst/cfi-mod.c: In function 'cfi_init':
> 	/home/henk/cm270/fifodrv/cfi-ktst/cfi-mod.c:204: error: 'GPIO_IN' unde=
clared (first use in this function)
> 	/home/henk/cm270/fifodrv/cfi-ktst/cfi-mod.c:208: error: 'MSC1' undecla=
red (first use in this function)
> 	/home/henk/cm270/fifodrv/cfi-ktst/cfi-mod.c:209: error: 'GPIO79_nCS_3_=
MD' undeclared (first use in this function)

It indicates that you need to include asm/arch/pxa2xx-regs.h and
asm/arch/pxa2xx-gpio.h.

--=20
Best Regards / S pozdravem,

Stanislav Brabec
software developer
---------------------------------------------------------------------
SUSE LINUX, s. r. o.                          e-mail: sbrabec@suse.cz
Lihovarsk=E1 1060/12           tel: +420 284 028 966, +49 911 740538747
190 00 Praha 9                                  fax: +420 284 028 951
Czech Republic                                    http://www.suse.cz/



