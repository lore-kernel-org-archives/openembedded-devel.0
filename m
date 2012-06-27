Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Sk1Cb-0002vH-9e
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jun 2012 00:59:13 +0200
Received: by ghbz2 with SMTP id z2so1370383ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2012 15:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=8d4PZYPxJyOqWxLqtdIgOaAMM/wVzkIu/UKCphJW0o0=;
	b=1Isi8LghQrzd0quc2I2pGRTKdwjbJInyfl7HVp9hhYkbTRcJe0UIB4sifWDEaW7gPV
	7UPYOqbgIp18nthFRBgJS1+Maxkv6vm/XaeqHHPhRmR8v/JZns7mMpBpqumvq9dT4yGT
	aj/VKvpGBAALM5a1vZ6u9+mbeQBJEKrKtngnbjFhTW1ZMZlZP90TBj27SdB/sQxyhTd1
	ixAd4hGBVkiSeGfHfvtblJshKuojP6YuFOSXpzClHQRmskxIszRy8VCDD5r6/iXKzQVP
	zwRpMNqiwXu6iBHkSH000I92jeyJAVw45T9Y0aAxFDBahdJq/9Kg+f5fbAXZ5nQ4GH9E
	RGsQ==
MIME-Version: 1.0
Received: by 10.68.231.10 with SMTP id tc10mr68837664pbc.107.1340837298719;
	Wed, 27 Jun 2012 15:48:18 -0700 (PDT)
Received: by 10.142.144.18 with HTTP; Wed, 27 Jun 2012 15:48:18 -0700 (PDT)
In-Reply-To: <1340321011-5631-1-git-send-email-andrea.adami@gmail.com>
References: <1340321011-5631-1-git-send-email-andrea.adami@gmail.com>
Date: Thu, 28 Jun 2012 00:48:18 +0200
Message-ID: <CAAQYJAuu3o1ybUQph03Ngk5gp0sytVLbPLa98-bCTFDxriVELQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-initramfs][PATCH] ubi-utils-klibc_1.5.0: fix build because of ioctl renaming
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
X-List-Received-Date: Wed, 27 Jun 2012 22:59:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 22, 2012 at 1:23 AM, Andrea Adami <andrea.adami@gmail.com> wrot=
e:
> * This patch follows the one in oe-core for mtd-utils_1.5.0
> * which was staging an older version of the ubi-user.h header.
> * We need to match the renaming done in kernel 3.0
> * http://lists.infradead.org/pipermail/linux-mtd/2011-March/
> * 034419.html
>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
> =A0.../mtd/ubi-utils-klibc/libubi.c.patch =A0 =A0 =A0 =A0 =A0 =A0 | =A0 1=
7 +++++++++++++++++
> =A0.../recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb =A0| =A0 =A02 +-
> =A02 files changed, 18 insertions(+), 1 deletions(-)
>
> diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c=
.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch
> index db95904..b52e207 100644
> --- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch
> +++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch
> @@ -9,3 +9,20 @@
> =A0{
> =A0 =A0 =A0 =A0int fd, ret;
>
> +@@ -1346,13 +1346,13 @@
> +
> + int ubi_set_property(int fd, uint8_t property, uint64_t value)
> + {
> +- =A0 =A0 =A0struct ubi_set_prop_req r;
> ++ =A0 =A0 =A0struct ubi_set_vol_prop_req r;
> +
> +- =A0 =A0 =A0memset(&r, 0, sizeof(struct ubi_set_prop_req));
> ++ =A0 =A0 =A0memset(&r, 0, sizeof(struct ubi_set_vol_prop_req));
> + =A0 =A0 =A0 r.property =3D property;
> + =A0 =A0 =A0 r.value =3D value;
> +
> +- =A0 =A0 =A0return ioctl(fd, UBI_IOCSETPROP, &r);
> ++ =A0 =A0 =A0return ioctl(fd, UBI_IOCSETVOLPROP, &r);
> + }
> +
> + int ubi_leb_unmap(int fd, int lnum)
> diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb=
 b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb
> index 2095552..d4d0055 100644
> --- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb
> +++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb
> @@ -6,7 +6,7 @@ LICENSE =3D "GPLv2+"
> =A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c3=
17bb3 \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://include/common.h;beginline=
=3D1;endline=3D17;md5=3Dba05b07912a44ea2bf81ce409380049c"
>
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0inherit klibc
>
> --
> 1.7.3.4
>


patch superseded, replaced by a new v2

Andrea


