Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Sh7bg-0000Gx-Ek
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jun 2012 01:13:08 +0200
Received: by pbbrq2 with SMTP id rq2so9829507pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jun 2012 16:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=M5vXzDo9bJlQXrsnCLZrmp3DXAmDB9DvnnGSnuuO99o=;
	b=k/EMVqV9dY0Y149VLv7lCl9DlRXUfn0a/5VvviH1qtEtOkx8Hdpbnw7XsAtbhuAlA9
	qEre8zYHDSZo7ZweOcgrvxY3/j1tXm9vWvKQHgViMSK09cgmd0Ph4hJgBPvSgEz/M5QK
	1kCoJJf1LpbnRd0421mVMYlVcz5Iclp9+K2pdoHhMOGi8cQvrjzEY9L/a5klb+Lr2Yph
	Naj7Ckiz0I80W1Z2lJgVQtZ1N35SRIT2HgE4TeGGdhyGU1Y//kt7imJkg3AAdCmvZMHf
	C3Yxkq8brlHk7651Q0liP1weNAzTm+6PYNVtNzsWm47NYTq1KGHjP3nAl0MlVum6RChb
	wObw==
MIME-Version: 1.0
Received: by 10.68.231.10 with SMTP id tc10mr48958484pbc.107.1340146943480;
	Tue, 19 Jun 2012 16:02:23 -0700 (PDT)
Received: by 10.142.188.4 with HTTP; Tue, 19 Jun 2012 16:02:23 -0700 (PDT)
In-Reply-To: <1340092029-30030-1-git-send-email-andrea.adami@gmail.com>
References: <1340091036-26496-1-git-send-email-andrea.adami@gmail.com>
	<1340092029-30030-1-git-send-email-andrea.adami@gmail.com>
Date: Wed, 20 Jun 2012 01:02:23 +0200
Message-ID: <CAAQYJAsdR1_T5Kc7rsA81Nmk+JfS4=Sw0XgZ31r+ewdKB71v=w@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-initramfs][PATCH v2] ubi-utils-klibc: catch up with struct renaming in mtd/ubi-user.h
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
X-List-Received-Date: Tue, 19 Jun 2012 23:13:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 19, 2012 at 9:47 AM, Andrea Adami <andrea.adami@gmail.com> wrot=
e:
> * v2 replaces malformed v1 patch
> * fix build, broken by header upgrade
> * bump PR
>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
> =A0.../mtd/ubi-utils-klibc/libubi.c.patch =A0 =A0 =A0 =A0 =A0 =A0 | =A0 1=
7 +++++++++++++++++
> =A01 files changed, 17 insertions(+), 0 deletions(-)
>
> diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c=
.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch
> index db95904..048e39b 100644
> --- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch
> +++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch
> @@ -9,3 +9,20 @@
> =A0{
> =A0 =A0 =A0 =A0int fd, ret;
>
> +@@ -1352,13 +1352,13 @@
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
> --
> 1.7.3.4
>

This strange renaming issue happened today, with stock linux-libc-headers.
I'm trying to understand why right now I get still pre-3.0 headers...
this is mtd/ubi-user.h

Anyhow, this patch is superseded by the next one, committing ver. 1.5.0

Andrea


