Received: from [213.36.80.91] (helo=mail.libertysurf.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1JgGAO-0002Qa-EP
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Mar 2008 11:19:00 +0200
Received: from blini.bolloretelecom.eu (62.210.194.121) by
	mail.libertysurf.net (7.3.118.8)
	id 479F73A801899E91 for openembedded-devel@lists.openembedded.org;
	Mon, 31 Mar 2008 12:14:57 +0200
Received: from [192.168.95.62] (unknown [192.168.95.62])
	by blini.bolloretelecom.eu (Postfix) with ESMTP id A42BA23E58
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2008 11:18:57 +0200 (CEST)
Message-ID: <47F0AC84.6080005@bolloretelecom.eu>
Date: Mon, 31 Mar 2008 11:19:00 +0200
From: =?UTF-8?B?SmVyZW15IExhaW7DqQ==?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.0.13pre) Gecko/20080208 Thunderbird/1.5.0.14pre
	Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <47ED3CE1.7020000@bolloretelecom.eu> <fsjh0h$6k1$1@ger.gmane.org>
In-Reply-To: <fsjh0h$6k1$1@ger.gmane.org>
X-Enigmail-Version: 0.94.2.0
Subject: Re: uImage generation: kernel.bbclass vs linux.inc
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
X-List-Received-Date: Mon, 31 Mar 2008 09:19:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: Quoted-Printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi wrote:
> Jeremy Lain=C3=A9 schreef: | With the recent changes to kernel.bbclass
> it seems that uboot-mkimage is | called twice: | | linux.inc:
> do_compile_append() | | 1/ uses uboot-mkimage to generate generates
> arch/${ARCH}/boot/uImage
>
> That's needed to get the correct uImage packaged, some machines
> have the uImage in the rootfs (don't turn on lzo in jffs2, uboot
> doesn't like that).
>
I totally agree, the change to uImage needs to be done in time for it
to be picked up by packaging. My point is I think we should:

a/ move do_compile_append() into kernel.bbclass
b/ in do_deploy() : not run uboot-mkimage since this has already been
done during do_compile_append()

> That raises the question how kexec handles uImage files and how we
> can make it easy for people to generate uImage for flashing and
> zImage for kexecing in the same build.
>
OK, we will have to look into this.
> DATETIME in version strings should die, we have PR for that. If the
>  output changed, PR should have been bumped. Lazyness is not a
> valid excuse for littering my deploydir with identical files with a
> different timestamp each build. Your filesystem has mtime if you
> really want to see a date.
>
I agree, I have commited this change.

- --
Jeremy LAINE
Bollor=C3=A9 telecom | 11bis, rue Scribe | F-75009 Paris
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFH8KyDCL1n3lVB9EYRAl2IAJ9sqVBp4OAgg55zzKCGuhyLk5Gq5QCfdrxB
Ghj+IYQbuVPITyMIxR3DFc4=3D
=3Dr441
-----END PGP SIGNATURE-----



