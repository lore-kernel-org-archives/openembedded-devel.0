Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 75B427D8E4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2019 18:15:37 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id c35so17364141qtk.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2019 11:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=GLPwEteJ72nxi8nUtJnp84PMUPeqP94n/WhRd4bUsAg=;
	b=NBhaPZYviX+Y1va25H5nr354SH2Ew4oWgviSLHxkoJZUsRmqxutTumziznwDxfsz8f
	RPlzSRiXdDVteJXAI2LUklC+Gw9zjZ4Z5sOJjSm0Y/PKvDhBfbzcdUf15lHOjyL8eopV
	YdZP8IbjO3jcPe7jmE53PnWUzNlOAt8gCpaTRLlTvngpoTQmXQnPQ6G16QhQz7IyO9Fb
	GJCn6O8/4VCrCpNh/YAQ+of+vDAH9gSWBWb+OZ3he+fUJiVn4fD+mJOd7gH6B+z+Vbk3
	wKNeChmT6ADOABobQigXUA9F9SCmdGdjaVDzUFu7MyNPiNcWq1k4nqx/mKel6725sBNR
	vmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=GLPwEteJ72nxi8nUtJnp84PMUPeqP94n/WhRd4bUsAg=;
	b=jysTiMv6KxDaRyPjGlDRfeifutf0PVU4TnnC8wTIQjo8YwJ5SMK7YsLVHArom+GK6b
	hXOxeCUOVg+6UvtK+GLKFoRTHhsJs/TZPKC9zLPDEQAMlkinQWr0jsTMtY4Fg5HM845c
	a3AZxHKL4e37Ai5BUvRqPJwxEOvxDsB/Na6wvDN3YcXkj/RMVkV8PKVajHTq8sgMeu5t
	X3TXXy2r8Dk8KRVJ/YjgIu6h7ezMj3fLC9v8X1CcTc4cjhlqp7xIu8RnNCgbXiq1IRx/
	gB1Fg43YcFxt/Ug9bz6WipfT4vs0otYubG8v9ZsimwMecy3213EX4D/z7kFi/Md5JPFy
	lvjg==
X-Gm-Message-State: APjAAAUHeqFaP2Tdabp4mDXMnn72rXC1c+U2U3R8sgAopLjnTYgKr8Gu
	lV07su7d1uS4SWFRFgupo1egZWscU8Ne4cPYS8E=
X-Google-Smtp-Source: APXvYqzuUFDQSfr/AgFOSrcB1usKzoO3MILy7Uzzm4p0c+fRwL+vqmgrw/JDtAma2fQcx6ZGxHV675utPmuNINic/Ug=
X-Received: by 2002:a0c:b64c:: with SMTP id q12mr55385762qvf.50.1556648137985; 
	Tue, 30 Apr 2019 11:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190430084400.4135-1-schnitzeltony@gmail.com>
In-Reply-To: <20190430084400.4135-1-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 30 Apr 2019 11:15:11 -0700
Message-ID: <CAMKF1soQsW9bdL=yESKpd_fBJ6qjXXEp=3MAAB6SJg_G-OT16w@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] xfce4-vala: auto-detect vala api version
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
X-List-Received-Date: Tue, 30 Apr 2019 18:15:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2019 at 1:44 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> Get rid of tedious maintenance burden
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  ...Detect-vapidir-if-not-set-explicitly.patch | 31 +++++++++++++++++++
>  .../vala/xfce4-vala_4.10.3.bb                 |  7 +++--
>  2 files changed, 35 insertions(+), 3 deletions(-)
>  create mode 100644 meta-xfce/recipes-bindings/vala/xfce4-vala/0001-confi=
gure.ac-Detect-vapidir-if-not-set-explicitly.patch
>
> diff --git a/meta-xfce/recipes-bindings/vala/xfce4-vala/0001-configure.ac=
-Detect-vapidir-if-not-set-explicitly.patch b/meta-xfce/recipes-bindings/va=
la/xfce4-vala/0001-configure.ac-Detect-vapidir-if-not-set-explicitly.patch
> new file mode 100644
> index 000000000..a3a9330ef
> --- /dev/null
> +++ b/meta-xfce/recipes-bindings/vala/xfce4-vala/0001-configure.ac-Detect=
-vapidir-if-not-set-explicitly.patch
> @@ -0,0 +1,31 @@
> +From 35267d995a81263b98f0ad56399ac3e30f9cf152 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
> +Date: Tue, 30 Apr 2019 09:48:08 +0200
> +Subject: [PATCH] configure.ac: Detect vala-api version if not set explic=
itly
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 9bf4230..c489385 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -38,7 +38,7 @@ AC_ARG_WITH([vala-api],
> +               AC_HELP_STRING([--with-vala-api=3DVERSION],
> +                               [Use Vala API version VERSION]),
> +               [vala_api=3D$withval],
> +-              [vala_api=3D'0.16'])
> ++              [vala_api=3D`$PKG_CONFIG --variable=3Dvapidir_versioned v=
apigen | sed -e 's:.*vala-::' -e s:/vapi::`])

thanks for fixing it once for all

> + M8T_CHECK_VALA([$vala_api])
> + AC_ARG_WITH([default-vapidir],
> +               AC_HELP_STRING([--with-default-vapidir],
> +--
> +2.20.1
> +
> diff --git a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb b/meta-=
xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
> index 97007bec4..68dbc69af 100644
> --- a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
> +++ b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
> @@ -7,12 +7,13 @@ inherit xfce pkgconfig distro_features_check
>
>  REQUIRED_DISTRO_FEATURES =3D "x11"
>
> -SRC_URI =3D "http://archive.xfce.org/src/bindings/${BPN}/${@xfce_verdir(=
"${PV}")}/${BPN}-${PV}.tar.bz2"
> +SRC_URI =3D " \
> +    http://archive.xfce.org/src/bindings/${BPN}/${@xfce_verdir("${PV}")}=
/${BPN}-${PV}.tar.bz2 \
> +    file://0001-configure.ac-Detect-vapidir-if-not-set-explicitly.patch =
\
> +"
>  SRC_URI[md5sum] =3D "0bbb1d6e473e0fe9b335b7b1b49d8a71"
>  SRC_URI[sha256sum] =3D "07a8f2b7c09fcdd3d86e0c52adea3c58ca011d0142a93997=
a01b4af77260ae7b"
>
> -EXTRA_OECONF =3D "-with-vala-api=3D0.42"
> -
>  FILES_${PN} +=3D "${datadir}/vala-*/vapi"
>
>  RDEPENDS_${PN} =3D "vala"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

