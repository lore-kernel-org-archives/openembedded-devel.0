Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 474DC7FEE7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 22:07:26 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id j5so175268qtq.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jan 2020 14:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=xR39G1D/FSKikW2+fY0sZf0TqI89hwNOH/VFz0FjFVM=;
	b=d9WmSOSPLbiX56wWv0LZCBKc8Ery8vTSo1ncCYmY63kX+QzYh5KFoTsrN79dqEmveu
	fpmBCfE7x8Ofh37M0TMAwuFRSjL6bFqIPA8n4dJl1C7VouQKdlqv2B4REbsis4xgwhY/
	59ZQfu6xpI+aP4UFQ9sUP32OwrhLlFirZt+Gw5ymAFAo70YqtHhZjdb5BKiSmg9TamKR
	EgrnqwYht7UGdj9TpYnv2euQUvGFHfqSfQeEGH54ecfu8qEtpEuqUMREZFdKyGmc3EYS
	ei/CVQpM1loAHedZzfSu/WvPO2am85RcUl6INcrEfbqvdiWKRCKEnkX7BXSMLHFWafah
	Vlgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=xR39G1D/FSKikW2+fY0sZf0TqI89hwNOH/VFz0FjFVM=;
	b=Bwc1ZbJQRTJ6y7qC3fcvXURWf5N4J/z+wNCSzMaprLzRmvETA6F4/uR8axVX3mzBx/
	NXYVLkBqqRb1digeaV8mVKOXuvX259mhHVnLEzletPuxML2ClgKytNJMvwTDJGjT6Wsy
	TiPPEI/L3kRC71yBKHuuRnVmNznDBPzZxIvEzOKFwraZRBTp8XIKqYxRD/Ny8Ggoxlpq
	KOdKZheQS8utfq3svz6axtu4dvI+Czz6RZx7JdxmkglHNZLwuEDf5yTEFeCrx5Clqanr
	kCoOILx1BfY+5V4qZFR+XN3fOsy2/Gkua4soQUYVTO+JKzPnh4Le+m+iIYAW6fjEAMOU
	muuA==
X-Gm-Message-State: APjAAAVKHRSIcEXtFA7TqAjKBhVz/UlqsjzTJ82EoadV5nMsUtAQIHJl
	eROXJBLr8RE0TFYJfoJZc+piqkEwR6HBXgj6JKQ=
X-Google-Smtp-Source: APXvYqxSqpIjQU2zsdC887YezzVlz8nxF2ONtox6CqmnQcqkatol//ZcJ9KrBMUuc9CfH5ichjkQH9C8fnw1/oDLN4w=
X-Received: by 2002:ac8:544f:: with SMTP id d15mr9960656qtq.53.1578607646904; 
	Thu, 09 Jan 2020 14:07:26 -0800 (PST)
MIME-Version: 1.0
References: <20200109210518.22451-1-schnitzeltony@gmail.com>
	<20200109210518.22451-8-schnitzeltony@gmail.com>
In-Reply-To: <20200109210518.22451-8-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Jan 2020 14:07:00 -0800
Message-ID: <CAMKF1sru3Jm-AbJJziRycvs7gRCwuiyLsVhX-FmE0rgaj-PrbA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 8/9] libsigc++-3: upgrade 3.0.0 -> 3.0.2
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
X-List-Received-Date: Thu, 09 Jan 2020 22:07:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

you have good commit msg so I merged this with earlier patch proposed here

https://patchwork.openembedded.org/patch/168647/

On Thu, Jan 9, 2020 at 1:06 PM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>
> From [1]:
>
> 3.0.2 (stable)
>
> * Build: Meson build improvements.
>   (Kjell Ahlstedt, Chun-Wei Fan)
>
> From [2]:
>
> 3.0.1 (stable)
>
> * Build:
>   - Add meson build, alongside the existing autotools and CMake builds.
>   (Kjell Ahlstedt, Chun-Wei Fan)
>   - CMake: Fix the MSVC build, enable warnings, and disable unnecessary
>   warnings, with MVSC.
>   (Stuart Dootson)
> * connection: Allow copying of empty connections.
>   (Aigrind)
> * sigc++/adaptors/bind.h: Make bind_functor::bound_ public.
>   (Used by sigc::visitor::do_visit_each().
>   (Kjell Ahlstedt) Bug #26
> * test_limit_reference: Avoid virtual-move-assign warning
>   (seen with g++ 9.2)
>   (Murray Cumming)
> * signal: slot_iterator_buf: Remove unused T_result default type
>   (Murray Cumming)
> * tests: Slight cleanups
>   (Murray Cumming)
> * Remove unused #ifdefed code.
>   (Murray Cumming)
>
> [1] http://ftp.gnome.org/pub/gnome/sources/libsigc++/3.0/libsigc++-3.0.2.=
news
> [2] http://ftp.gnome.org/pub/gnome/sources/libsigc++/3.0/libsigc++-3.0.1.=
news
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../{libsigc++-3_3.0.0.bb =3D> libsigc++-3_3.0.2.bb}            | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-core/libsigc++-2.0/{libsigc++-3_3.0.0.bb =3D> lib=
sigc++-3_3.0.2.bb} (77%)
>
> diff --git a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.0.bb b/me=
ta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.2.bb
> similarity index 77%
> rename from meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.0.bb
> rename to meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.2.bb
> index 3c0330f50..0acdb3e98 100644
> --- a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.0.bb
> +++ b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.2.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D959bffe2993816=
eb32ec4bc1ec1d5875"
>  DEPENDS =3D "mm-common"
>
>  SRC_URI =3D "http://ftp.gnome.org/pub/GNOME/sources/libsigc++/3.0/libsig=
c++-${PV}.tar.xz"
> -SRC_URI[md5sum] =3D "6ffe924f1d8624b5716468cde67dc03f"
> -SRC_URI[sha256sum] =3D "50a0855c1eb26e6044ffe888dbe061938ab4241f96d8f375=
4ea7ead38ab8ed06"
> +SRC_URI[md5sum] =3D "1f93f8ed4ead38e876157834b2c57c21"
> +SRC_URI[sha256sum] =3D "4b77676de1e74774ec456bcc6ac6f04a2791a12cc1fe07f8=
305d4c3c86e2f339"
>
>  S =3D "${WORKDIR}/libsigc++-${PV}"
>
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

