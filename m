Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OpbpA-0000XS-MH
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 08:57:05 +0200
Received: by mail-iw0-f175.google.com with SMTP id 2so3819215iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 23:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=K/YIgs2/doWaT2XNaRzUlKynmOeTdnfnFKptJ9Al/dw=;
	b=OsbuZIoAcj9l2IDmSnkjCtPzhBFj0tmOxfrGsZlHdIB1Gaw1X3gd+zQ//ouE4OPphc
	720EZTxkQwiM/S/bwTmEvp6Gd4NYpZnvsvtZsiBgOKP4scQwT6lCWWqayEqla9HMdJ04
	6+C3KAbWzmbcWWTKpQJDreNuu1PfKeiFQxDAM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=FYwgvtdnrieMmqKYlVrHcvMCe9B6Y7WNUT8EE4bwozT1YqkVA5mtxDmdDH4iC2Ofjn
	cdJFnpNM7WQt0GunUB6JviCcURM6lFP/DWoeA4F/z3dVYhBk1+c4DMAj6Qqd//ks5kRi
	DTkxLMmidvvSlsofG8qa86WvKP6HdTunvd/Fg=
MIME-Version: 1.0
Received: by 10.231.79.77 with SMTP id o13mr3421635ibk.36.1283064996186; Sat,
	28 Aug 2010 23:56:36 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sat, 28 Aug 2010 23:56:36 -0700 (PDT)
In-Reply-To: <1283027073-12308-19-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
	<1283027073-12308-19-git-send-email-raj.khem@gmail.com>
Date: Sun, 29 Aug 2010 08:56:36 +0200
Message-ID: <AANLkTimbE_TR4CYx6taTXXaHEpW73GDqS=Mh3YgLSfo9@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 18/23] initramfs-module-bootmenu_1.0.bb, initramfs-module-kexecboot_1.0.bb: Rename klibc-utils-static-fstype -> klibc-static-utils-fstype
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
X-List-Received-Date: Sun, 29 Aug 2010 06:57:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.co

2010/8/28 Khem Raj <raj.khem@gmail.com>:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0.../initrdscripts/initramfs-module-bootmenu_1.0.bb | =A0 =A02 +-
> =A0.../initramfs-module-kexecboot_1.0.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A02 +-
> =A02 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/initrdscripts/initramfs-module-bootmenu_1.0.bb b/rec=
ipes/initrdscripts/initramfs-module-bootmenu_1.0.bb
> index 890fef3..f662cb4 100644
> --- a/recipes/initrdscripts/initramfs-module-bootmenu_1.0.bb
> +++ b/recipes/initrdscripts/initramfs-module-bootmenu_1.0.bb
> @@ -1,7 +1,7 @@
> =A0SRC_URI =3D "file://30-bootmenu.sh"
> =A0PR =3D "r19"
> =A0DESCRIPTION =3D "An initramfs module with UI for selection of boot dev=
ice."
> -RDEPENDS_${PN} =3D "klibc-utils-static-fstype initramfs-uniboot initramf=
s-module-block initramfs-module-loop initramfs-module-nfs"
> +RDEPENDS_${PN} =3D "klibc-static-utils-fstype initramfs-uniboot initramf=
s-module-block initramfs-module-loop initramfs-module-nfs"
> =A0# For VFAT mounting.
> =A0RRECOMMENDS_${PN} =3D "kernel-module-nls-cp437 kernel-module-nls-iso88=
59-1"
>
> diff --git a/recipes/initrdscripts/initramfs-module-kexecboot_1.0.bb b/re=
cipes/initrdscripts/initramfs-module-kexecboot_1.0.bb
> index e153d2b..a973b06 100644
> --- a/recipes/initrdscripts/initramfs-module-kexecboot_1.0.bb
> +++ b/recipes/initrdscripts/initramfs-module-kexecboot_1.0.bb
> @@ -1,7 +1,7 @@
> =A0SRC_URI =3D "file://87-kexecboot.sh"
> =A0PR =3D "r3"
> =A0DESCRIPTION =3D "An initramfs module for kexecing kernel from rootfs."
> -RDEPENDS_${PN} =3D "initramfs-uniboot kexec-klibc-static"
> +RDEPENDS_${PN} =3D "initramfs-uniboot kexec-tools-klibc"
>
> =A0do_install() {
> =A0 =A0 =A0 =A0install -d ${D}/initrd.d
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


