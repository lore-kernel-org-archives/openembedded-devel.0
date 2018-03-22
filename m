Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 06AF778862
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 07:32:31 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id c20so2520697ywa.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 00:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=IAfFg78MsuqEQW6UQ6se+6uePN+yjJlIYDapjR19X7w=;
	b=Llx/fkVtllIdBNpg+CuYk9ubpkQt8BN/sf3IKkAYJXv6sbG9iJJWFH0PBt9xQxeRM2
	JjTSPvWo/y4Dc35A2u2Hp/oAhLJ4v6XIo2TbLZ91sCxj33l1krYpa3gtpSh09grWNhN+
	dG5C13tPpfSQ3KH2/5qIDn8baA2uw9aKXeU7+gIYDxArpem2Xd5MXl2oQPI4eeX2oUnw
	vVNsfapoonzFKBe8joblAH33tMOmzYC7s6+gOctHm8QON4KSK13W/n4ZCqqmP1z4gci2
	dOo2PhXUSAhcD4ycf1YLD1OThfPnNRUZNqMQPnsAyzRsS0vQ5HadPTC0bt338MnyyCmV
	6JHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=IAfFg78MsuqEQW6UQ6se+6uePN+yjJlIYDapjR19X7w=;
	b=nlRkNcGqMK7rrbMUPB/bBoNJCfpjvFOs/2Cm2v/7C5RdRS0xNNBxuUhXMoKt2ByoHw
	S5SBjqSXnwKWTLjTwu3fRmENycYumoIPF3VTL2xeCTdGFZhtQ5HATEZlfeXxF7Ir5BmW
	3lgK0CKTKZfgcshF8AYudQTC3L3yiGx779Dmit/zNmf4XKeonjt2r7I02UWjgQrUFS6v
	blwMn/V5fUOvPQowsuXXm2+zTmnnCqt5mLpfrFYKH61v8GE7V81SEeaS2jPBfrNrGDQb
	t0z3dab+1UV6tw8TrLZS15Whu2YSrSud1Z6npojxnNPbArmH/Wy3zo9/eqV0SenYUzlz
	HBtA==
X-Gm-Message-State: AElRT7Hzu7IhsUnfFJmLEOYQ7Jq3adiFgIi9rD8C33N0V/TGWZnd1N7x
	khRydDLA/PlY9UhEyP2suui6I49DL1p4JPJsoTY=
X-Google-Smtp-Source: AG47ELtvIR3BiLC+K7+BbaYSFlVQJJkylkL5yN64pdQ3Z11IMozWzesShiKMB4ZDvs8cXiKFJwqBc4NbWcAHbhSdfoA=
X-Received: by 10.13.249.197 with SMTP id j188mr13793090ywf.318.1521703952708; 
	Thu, 22 Mar 2018 00:32:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP; Thu, 22 Mar 2018 00:32:32
	-0700 (PDT)
In-Reply-To: <20180321210022.4682-2-schnitzeltony@gmail.com>
References: <20180321210022.4682-1-schnitzeltony@gmail.com>
	<20180321210022.4682-2-schnitzeltony@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 22 Mar 2018 08:32:32 +0100
Message-ID: <CALbNGRTmtUkCFOyTuTejh6RxrGmjXEsxkwFk78+0uJkRB8Mjog@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/5] glibmm: refresh remove-examples.patch
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
X-List-Received-Date: Thu, 22 Mar 2018 07:32:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 21, 2018 at 10:00 PM, Andreas M=C3=BCller
<schnitzeltony@gmail.com> wrote:
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../glib-2.0/glibmm/remove-examples.patch          | 29 ++++++++++++++--=
------
>  1 file changed, 19 insertions(+), 10 deletions(-)
>
> diff --git a/meta-oe/recipes-core/glib-2.0/glibmm/remove-examples.patch b=
/meta-oe/recipes-core/glib-2.0/glibmm/remove-examples.patch
> index a5944c288..214f1e338 100644
> --- a/meta-oe/recipes-core/glib-2.0/glibmm/remove-examples.patch
> +++ b/meta-oe/recipes-core/glib-2.0/glibmm/remove-examples.patch
> @@ -1,7 +1,16 @@
> -Index: glibmm-2.22.1/Makefile.am
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- glibmm-2.22.1.orig/Makefile.am
> -+++ glibmm-2.22.1/Makefile.am
> +From 874fe8ef8f159cff17b199b9575fbfcf00fe2a1c Mon Sep 17 00:00:00 2001
> +From: Koen Kooi <koen@dominion.thruhere.net>
> +Date: Tue, 12 Jul 2011 11:46:37 +0200
> +
> +---
> + Makefile.am  | 7 +------
> + configure.ac | 1 -
> + 2 files changed, 1 insertion(+), 7 deletions(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index a0df8af..c3d5e06 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
>  @@ -23,12 +23,7 @@ src_subdirs =3D glib/src gio/src
>   else
>   src_subdirs =3D
> @@ -16,15 +25,15 @@ Index: glibmm-2.22.1/Makefile.am
>
>   glibmm_includedir =3D $(includedir)/$(GLIBMM_MODULE_NAME)
>   glibmm_include_HEADERS =3D glib/glibmm.h
> -Index: glibmm-2.22.1/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- glibmm-2.22.1.orig/configure.ac
> -+++ glibmm-2.22.1/configure.ac
> -@@ -136,7 +136,6 @@ AC_CONFIG_FILES([Makefile
> +diff --git a/configure.ac b/configure.ac
> +index c20e778..74203be 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -166,7 +166,6 @@ AC_CONFIG_FILES([Makefile
>                    gio/src/Makefile
>                    gio/giomm/Makefile
>                    tests/Makefile
>  -                 examples/Makefile
>                    docs/Makefile
>                    docs/reference/Doxyfile
> -                  MSVC_Net2005/glibmm/glibmm.rc
> +                  MSVC_Net2013/glibmm/glibmm.rc
> --
> 2.14.3
>
This one was fixed by Martin already - sorry I did not catch that...

Andreas

