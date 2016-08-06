Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1F0067714D
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Aug 2016 07:23:33 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id l69so17736479lfg.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Aug 2016 00:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=8LkwJO6qPa7IpEAw5DnNM3aE/jRNn2FGSkg9jG2Nwd0=;
	b=lwOxlkDHCWN4xbLVmTrbPcDCu6aa951s1+Wa/CoXFL3ZEo+3pIB1GFrosXY0tyH4DY
	DAldfRnWEzT1NV8yXoG7zfrhTUAbhGSp1COpjqh+Y6T9yYlvY+ZdG6jV/kSWx0BnwVVB
	Csrgj3zfCHuU8CUg2hS5kIh63Z2iMTi3bu/KFSd11KT+sjS4Vqa7HxP/z/526KZunNOo
	bAGJZWiFvw54YUgxuvopb58QPT1JTTEErVwktS4PYpqt9qRXD+ip0+0G8czpiWOs3hq4
	M9IquCMUS11RC0cVVn/frMEzTBj4AHKDDrwrSxX0WgCmGxEsypVQ8ZLCy85Uy1UNQWAK
	ymJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=8LkwJO6qPa7IpEAw5DnNM3aE/jRNn2FGSkg9jG2Nwd0=;
	b=L7Ml20YO0UQXzjFOucSsHv+0+qhCUlLT+m2S87Cr++9DkhNYYQqPnTqFme1x0+PeN2
	v4UdH/rg2BHxozVv927k33tBS2mfPsrFN/OHbN3kVXPHl6QHnEGXqzpnT1EwUig98UHC
	v60ScdXIDMy6GWYixGbRYL+hH+mv6zbbmMf3z3lMEAHNGhLdyciIAEfof3a/QgNIO1B9
	HWhxqGD/cq9HYYLZuJV58VuHWd93Jo/8pMtOkhwkTaPJ1MnKEaOSrXBQ3XMUq+750n8H
	Revo5SnWpuDD5dUZvZE3QaJmllbZRBiY5JfCibSjYvJkAeik7e9AuvdJ6h1exu/uM633
	Ih/Q==
X-Gm-Message-State: AEkoouss6baEuFDqqj2lFgs3lhc/1lw+CdZl1GQTM5p4AEJC2C81nSszGLwGrMwVwFySoXSqibLeOPvhWspcXw==
X-Received: by 10.25.1.213 with SMTP id 204mr27135152lfb.114.1470468213743;
	Sat, 06 Aug 2016 00:23:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.87.12 with HTTP; Sat, 6 Aug 2016 00:23:33 -0700 (PDT)
In-Reply-To: <1469931304-13906-3-git-send-email-schnitzeltony@googlemail.com>
References: <1469931304-13906-1-git-send-email-schnitzeltony@googlemail.com>
	<1469931304-13906-3-git-send-email-schnitzeltony@googlemail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 6 Aug 2016 09:23:33 +0200
Message-ID: <CA+chaQeTP0PgC1bSucTyQkt0=tAC0KcEmYA1mRL0Uu+xmu4zRA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 3/5] libmbim: update to 1.14.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 06 Aug 2016 07:23:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

ERROR: libmbim-1.14.0-r0 do_package: QA Issue: libmbim:
Files/directories were installed but not shipped in any package:
  /usr/share/bash-completion
  /usr/share/bash-completion/completions
  /usr/share/bash-completion/completions/mbimcli


On Sun, Jul 31, 2016 at 4:15 AM, Andreas M=C3=BCller <
schnitzeltony@googlemail.com> wrote:

> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  .../libmbim/{libmbim_1.12.2.bb =3D> libmbim_1.14.0.bb}                  =
|
> 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-connectivity/libmbim/{libmbim_1.12.2.bb =3D>
> libmbim_1.14.0.bb} (80%)
>
> diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb
> b/meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb
> similarity index 80%
> rename from meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb
> rename to meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb
> index f1ecce5..f2b8df6 100644
> --- a/meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb
> +++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb
> @@ -12,5 +12,5 @@ DEPENDS =3D "glib-2.0 libgudev"
>  inherit autotools pkgconfig
>
>  SRC_URI =3D "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar=
.xz
> "
> -SRC_URI[md5sum] =3D "921fb5ab3f13f1e00833e009d8f3b4f6"
> -SRC_URI[sha256sum] =3D "949351d3e3d69b81e40a49f1d18794
> 4c26149e0647a415f0227ccdc112047b29"
> +SRC_URI[md5sum] =3D "2ed809e65c85353d3ab59e372890e549"
> +SRC_URI[sha256sum] =3D "ca8d52a95a18cbabae8f15f83f1572
> 316e888b6504f946e6645d24405127ab5b"
> --
> 2.5.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

