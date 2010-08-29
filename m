Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Opbyr-0001W4-6B
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 09:07:05 +0200
Received: by mail-iw0-f175.google.com with SMTP id 2so3823337iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 00:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=RQ4NvtIB/nHfkG/rlNGjxrRb0Slakn2gUroUohkoJy8=;
	b=iELSozOVeggJMHBr/OJrNd/4/e63/CFt+wWMFIQ3arqQRgshiRijQGVMapgywYWQrF
	uMpaa5dHJJr5ybH6wbcUV+9snAm/n+WZfjlPn3slLhweVUn/YDZxvU1mmvzQjLFhwmXx
	0+1o1coMarCpsR7C/Bgt44Q03PwmjEM/xXEYM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=cbGFAtPqkOAcrmGI+oOR3kM75/vx3fq/Vd7hcntA08cltnm4840q0im5rWhq0tEjxp
	4hKyihcPWTQj10RhZ7FORBYdxTpGQvtPvx5JC91civNJtV3Q7vRFeyYs1muqeXnZ5H1m
	/6ZolmkCToAxGrkYhkpQsP105dGvQrc7mou9Y=
MIME-Version: 1.0
Received: by 10.231.190.203 with SMTP id dj11mr3419391ibb.93.1283065594835;
	Sun, 29 Aug 2010 00:06:34 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sun, 29 Aug 2010 00:06:34 -0700 (PDT)
In-Reply-To: <1283027073-12308-18-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
	<1283027073-12308-18-git-send-email-raj.khem@gmail.com>
Date: Sun, 29 Aug 2010 09:06:34 +0200
Message-ID: <AANLkTimWigK2JjqaXQo-D2HpjbFwBpmiO6mohDz9zzyV@mail.gmail.com>
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
Subject: Re: [PATCH 17/23] initramfs-bootmenu-debug-image.bb, initramfs-bootmenu-image.bb: Rename klibc-utils-static-modprobe->klibc-static-utils-modprobe
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
X-List-Received-Date: Sun, 29 Aug 2010 07:07:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

2010/8/28 Khem Raj <raj.khem@gmail.com>:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0recipes/images/initramfs-bootmenu-debug-image.bb | =A0 =A02 +-
> =A0recipes/images/initramfs-bootmenu-image.bb =A0 =A0 =A0 | =A0 =A02 +-
> =A02 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/images/initramfs-bootmenu-debug-image.bb b/recipes/i=
mages/initramfs-bootmenu-debug-image.bb
> index df5bf2b..a8f8ee3 100644
> --- a/recipes/images/initramfs-bootmenu-debug-image.bb
> +++ b/recipes/images/initramfs-bootmenu-debug-image.bb
> @@ -1,7 +1,7 @@
> =A0# initramfs image with interactive boot menu allowing to select rootfs=
 location
> =A0# from choices of block devices, loopback images and NFS.
>
> -IMAGE_INSTALL =3D "busybox-static initramfs-module-bootmenu initramfs-mo=
dule-check-modules initramfs-module-kexecboot klibc-utils-static-modprobe"
> +IMAGE_INSTALL =3D "busybox-static initramfs-module-bootmenu initramfs-mo=
dule-check-modules initramfs-module-kexecboot klibc-static-utils-modprobe"
> =A0IMAGE_INSTALL +=3D " dropbear dropbear-backdoor"
> =A0IMAGE_LINGUAS =3D ""
>
> diff --git a/recipes/images/initramfs-bootmenu-image.bb b/recipes/images/=
initramfs-bootmenu-image.bb
> index 79806c9..51be798 100644
> --- a/recipes/images/initramfs-bootmenu-image.bb
> +++ b/recipes/images/initramfs-bootmenu-image.bb
> @@ -1,7 +1,7 @@
> =A0# initramfs image with interactive boot menu allowing to select rootfs=
 location
> =A0# from choices of block devices, loopback images and NFS.
>
> -IMAGE_INSTALL =3D "busybox-static initramfs-module-bootmenu initramfs-mo=
dule-check-modules initramfs-module-kexecboot klibc-utils-static-modprobe"
> +IMAGE_INSTALL =3D "busybox-static initramfs-module-bootmenu initramfs-mo=
dule-check-modules initramfs-module-kexecboot klibc-static-utils-modprobe"
> =A0IMAGE_LINGUAS =3D ""
>
>
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


