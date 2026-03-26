Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7F6D10A88F8
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 17:54:20 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54750.1774547655076147669
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 10:54:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=r/L15AOH;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64ae222d87dso1383527d50.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 10:54:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774547654; cv=none;
        d=google.com; s=arc-20240605;
        b=j/aXezWGsnyDco/8LC9HF17OGBIsjczgYzjzMxzo1hX2FFcMbDM7EFQxXBzBMJUyCC
         xuHAlEutyimJZQo8wo2ye9wP+Ced0Y8mbxMFhpXzB6Sdz6hreqKYWoFfacW14iRo+fvS
         +fa8B0GtzzVqgBeXQGB0qghB363HxeH8G6Mt+lNNORHM3lQpzPdDxUnrUxnJivAd4lhZ
         ruz4HMYMFvZNveBrLHGJr44nsBy/aL142h4Z8i14Rs08QWOqniWfcvtWJe0ihKv7fvfp
         TKgSa5tQFwDL7K3CERyVPi1uxtzWuPpe6VBGTEPlgNp5sc7GxepP+4easslGAxTR6IDb
         qYBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hvhSGGri0m9gxcWgGNbXoEOvCyg/S4Fgk5uBezfcQ6Y=;
        fh=VxuMlt7ly5kfavXKYfixPQyCH/YH0iyGy+yD75LEUdc=;
        b=TZw4lbfU4ZTelKvdSZPe+KC51OFkM+7NVQkvq3oZtdE9lAr7Doyxw4LHpQjxxfoOsR
         ye7mihswMNJjtL9Pc8gJYElrlra9mlmJHRXzEl8NYj9KsRKBks0r8r10GuymlrUAoAxy
         LZf5Z/eQQb7B7piBK1jnqqsISTYSbNz46H626exe/0i4vQX3d4ELxf3C6+LEqNB4R/bu
         gSLc9O64JBBNr9E7cXZIJWUtzhU+AZexVrCEIGQjqbWP5Hgu+HQq9WqrxvpERhS0CWOR
         +ANknX1QZsDBXFEjP7UO7kQ11pw186oUW4C0+nkZl6sdQ+g+asOjFusJWA96MLOw+K1u
         DGYQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774547654; x=1775152454; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hvhSGGri0m9gxcWgGNbXoEOvCyg/S4Fgk5uBezfcQ6Y=;
        b=r/L15AOHp5KcwhtFxcnQ89gCWj58Q9NX/AzLJdm31PxIM8BdCglNTgN8j0K6Np57ND
         E+LmJmNuleuET5arlHgeah7J5xnaU731ko4DXp5vP+NL8yeKA7urExO7ZzoSZghXn//P
         ID1Ty2eEKQ9S5xaBo/wZCW8GsC/OhdXn/xr6UmRY1gobWdm5BazoWxcvTsUSVgyvn647
         bk7hAegZYslMru3ELvAVOIowqWAOXvZT8sFbl5pd5ELotwYDKyNP+iDob9W9MZrtrcYK
         QLVCSQdQAfL8X3uOBqasFoS9qBJzIdjHuxg+2g3plmoIcf0k1Za4Rbt9jiCBPAEaNz1f
         N07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774547654; x=1775152454;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hvhSGGri0m9gxcWgGNbXoEOvCyg/S4Fgk5uBezfcQ6Y=;
        b=c7cfn5tS1sdKaEsS0NcfIC/1aLq/Bfl93bZFx2seCUyPRRRKBuAcOpvFE6ocXQMRws
         2V3Xe0neOSF8hBmmMKtGfVjGS8xw3hSAbo2Ky+7gvCFa2j6ZYAz6JhoVW4wHUaNpWfx0
         haYj2LQaCElBZJyFuSksBhr9tphGvnKGiyGHHd3fjONL9aJpgiYrY8XaPLm1eTtxkDav
         tr97q+oduHXU29PMQ8TvKBCJs2keh/a0jPGtK/7ooxZidgNspwdAvdXA4ihOwfKOjiKw
         HnosvZTT02IXpkQMh4EBMR1OgaLOyqvse4kw9Msk61wHbBonpoJYvIBg128wqBjQAIzm
         BH/g==
X-Gm-Message-State: AOJu0Yyt66BO/NA3hirkonsnTnz8B42o1y2gP5t8GmBxu2e0HPHB5BOm
	7V4YHiqYbdI6n4Ru0J44XrUIVS5JoFLZ7De3cv31HHIgHEj5d0udtpIqhXKgVDHS0PciPtmsD9N
	OKU6Z3dBP341KDMouAGFhYw/XE5gEUK4ReOrEBJU=
X-Gm-Gg: ATEYQzy9tYKxZ+uXaxt28t8E4LE0UUzFZg6Ylj8X6ZFXWnEJz9UnC8jxyXlpVl22Xer
	M1wOxO0+2zydah3QjaR4UvryHf7KMbZKgSdw4UVLjNhF8hAilhu6j5VSAl+LG3LiVeeUpuqWW/y
	+UZY7dcJMY7+kdVfGpzSzHiu2Rt1FlzETOCb3T9UYyyZ45qs7B9l1uWqHWaalJHzNoviSjlWJ1k
	WHYu6Vgmf9FcrltEPU4IOE1c4mXVVNNyZZy+UpJfQDKHHiX+cQoCkZPNdaCcINSaI3GGDVKaeqe
	LkTxqC5a5f1NRPsFRzDyAIFDACl3d8iCRQOZKYQ7KI3/06oEHSmnODV/2gCzHwPD1Vppb+B2MeO
	GB1GliJYrD8gkXYEXAbxkTkjt
X-Received: by 2002:a05:690e:4191:b0:64c:b44e:dfd6 with SMTP id
 956f58d0204a3-64ee6088f7bmr7232825d50.6.1774547654019; Thu, 26 Mar 2026
 10:54:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260326174714.3811074-1-martin.jansa@gmail.com>
In-Reply-To: <20260326174714.3811074-1-martin.jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Mar 2026 10:53:47 -0700
X-Gm-Features: AQROBzAQKHZayqCw2xc-VsgsyRwDdZNMb1ZkJfssEXdzDkV809NPF-HQKKHDnV4
Message-ID: <CAMKF1sqoLKKC0QBJbY1+ZVodCx2sh+Z4cDWy97ykrugzZN-a3w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] freerdp: remove 0001-Fix-const-qualifier-error.patch
To: martin.jansa@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008e0c77064df112a0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 17:54:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125767

--0000000000008e0c77064df112a0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ankur sent a patch earlier, does that fix it ?
https://lore.kernel.org/openembedded-devel/20260324192553.2628357-2-ankur.t=
yagi85@gmail.com/T/#u

On Thu, Mar 26, 2026 at 10:47=E2=80=AFAM Martin Jansa via lists.openembedde=
d.org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:

> From: Martin Jansa <martin.jansa@gmail.com>
>
> Instead of fixing the build with clang this is now breaking it after
> 2.11.8 commit:
>
> https://github.com/FreeRDP/FreeRDP/commit/67818bddb31900cdf3acb26cb0b673c=
c90b71cc9
>
> freerdp/2.11.8/git/client/Wayland/wlfreerdp.c:637:19: error: incompatible
> function pointer types assigning to 'OBJECT_NEW_FN' (aka 'void *(*)(const
> void *)') from 'void *(void *)' [-Wincompatible-function-pointer-types]
>   637 |         obj->fnObjectNew =3D uwac_event_clone;
>       |                          ^ ~~~~~~~~~~~~~~~~
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  .../0001-Fix-const-qualifier-error.patch      | 57 -------------------
>  .../recipes-support/freerdp/freerdp_2.11.8.bb |  1 -
>  2 files changed, 58 deletions(-)
>  delete mode 100644
> meta-oe/recipes-support/freerdp/freerdp/0001-Fix-const-qualifier-error.pa=
tch
>
> diff --git
> a/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-const-qualifier-error.=
patch
> b/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-const-qualifier-error.=
patch
> deleted file mode 100644
> index 87a456d16d..0000000000
> ---
> a/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-const-qualifier-error.=
patch
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -From 761b4df04a141cc8c9507c741e4046c6c6b00491 Mon Sep 17 00:00:00 2001
> -From: Wang Mingyu <wangmy@fujitsu.com>
> -Date: Mon, 11 Sep 2023 09:00:39 +0000
> -Subject: [PATCH] Fix const qualifier error
> -
> -Fixes clang error
> -error: incompatible function pointer types assigning to 'OBJECT_NEW_FN'
> (aka 'void *(*)(void *)') from 'void *(const void *)'
> [-Wincompatible-function-pointer-types]
> -|         obj->fnObjectNew =3D uwac_event_clone;
> -|                          ^ ~~~~~~~~~~~~~~~~
> -
> -
> https://github.com/FreeRDP/FreeRDP/commit/6e3c00725aae99d03a0baa65430eced=
debd9dee8
> -Upstream-Status
> <https://github.com/FreeRDP/FreeRDP/commit/6e3c00725aae99d03a0baa65430ece=
ddebd9dee8-Upstream-Status>:
> Backport
> -
> -Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ----
> - libfreerdp/codec/rfx.c            | 4 ++--
> - winpr/include/winpr/collections.h | 2 +-
> - 2 files changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/libfreerdp/codec/rfx.c b/libfreerdp/codec/rfx.c
> -index ccbc5af..eec7365 100644
> ---- a/libfreerdp/codec/rfx.c
> -+++ b/libfreerdp/codec/rfx.c
> -@@ -153,7 +153,7 @@ static void rfx_tile_init(void* obj)
> -       }
> - }
> -
> --static void* rfx_decoder_tile_new(void* val)
> -+static void* rfx_decoder_tile_new(const void* val)
> - {
> -       RFX_TILE* tile =3D NULL;
> -       WINPR_UNUSED(val);
> -@@ -184,7 +184,7 @@ static void rfx_decoder_tile_free(void* obj)
> -       }
> - }
> -
> --static void* rfx_encoder_tile_new(void* val)
> -+static void* rfx_encoder_tile_new(const void* val)
> - {
> -       WINPR_UNUSED(val);
> -       return calloc(1, sizeof(RFX_TILE));
> -diff --git a/winpr/include/winpr/collections.h
> b/winpr/include/winpr/collections.h
> -index 807f011..b8c8d9d 100644
> ---- a/winpr/include/winpr/collections.h
> -+++ b/winpr/include/winpr/collections.h
> -@@ -36,7 +36,7 @@ extern "C"
> - {
> - #endif
> -
> --      typedef void* (*OBJECT_NEW_FN)(void* val);
> -+      typedef void* (*OBJECT_NEW_FN)(const void* val);
> -       typedef void (*OBJECT_INIT_FN)(void* obj);
> -       typedef void (*OBJECT_UNINIT_FN)(void* obj);
> -       typedef void (*OBJECT_FREE_FN)(void* obj);
> ---
> -2.34.1
> -
> diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.8.bb
> b/meta-oe/recipes-support/freerdp/freerdp_2.11.8.bb
> index 9c3d532438..c596aaa328 100644
> --- a/meta-oe/recipes-support/freerdp/freerdp_2.11.8.bb
> +++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.8.bb
> @@ -16,7 +16,6 @@ PKGV =3D "${GITPKGVTAG}"
>  SRCREV =3D "9b678b6d5a40ce01607d8c3b1b1416437c8416c4"
>  SRC_URI =3D "git://
> github.com/FreeRDP/FreeRDP.git;branch=3Dstable-2.0;protocol=3Dhttps \
>             file://winpr-makecert-Build-with-install-RPATH.patch \
> -           file://0001-Fix-const-qualifier-error.patch \
>             file://0002-Do-not-install-tools-a-CMake-targets.patch \
>             file://CVE-2024-32661.patch \
>             "
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125765):
> https://lists.openembedded.org/g/openembedded-devel/message/125765
> Mute This Topic: https://lists.openembedded.org/mt/118522890/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000008e0c77064df112a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ankur sent a patch earlier, does that fix it ?<div><a href=
=3D"https://lore.kernel.org/openembedded-devel/20260324192553.2628357-2-ank=
ur.tyagi85@gmail.com/T/#u">https://lore.kernel.org/openembedded-devel/20260=
324192553.2628357-2-ankur.tyagi85@gmail.com/T/#u</a></div></div><br><div cl=
ass=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Thu, Mar 26, 2026 at 10:47=E2=80=AFAM Martin Jansa via <a href=3D"h=
ttp://lists.openembedded.org">lists.openembedded.org</a> &lt;martin.jansa=
=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.open=
embedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">From: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com=
" target=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
<br>
Instead of fixing the build with clang this is now breaking it after 2.11.8=
 commit:<br>
<a href=3D"https://github.com/FreeRDP/FreeRDP/commit/67818bddb31900cdf3acb2=
6cb0b673cc90b71cc9" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/FreeRDP/FreeRDP/commit/67818bddb31900cdf3acb26cb0b673cc90b71cc9</a><br>
<br>
freerdp/2.11.8/git/client/Wayland/wlfreerdp.c:637:19: error: incompatible f=
unction pointer types assigning to &#39;OBJECT_NEW_FN&#39; (aka &#39;void *=
(*)(const void *)&#39;) from &#39;void *(void *)&#39; [-Wincompatible-funct=
ion-pointer-types]<br>
=C2=A0 637 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0obj-&gt;fnObjectNew =3D uwac_=
event_clone;<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^ ~~~~~~~~~~~~~~~~<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" t=
arget=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../0001-Fix-const-qualifier-error.patch=C2=A0 =C2=A0 =C2=A0 | 57 ---=
----------------<br>
=C2=A0.../recipes-support/freerdp/<a href=3D"http://freerdp_2.11.8.bb" rel=
=3D"noreferrer" target=3D"_blank">freerdp_2.11.8.bb</a> |=C2=A0 1 -<br>
=C2=A02 files changed, 58 deletions(-)<br>
=C2=A0delete mode 100644 meta-oe/recipes-support/freerdp/freerdp/0001-Fix-c=
onst-qualifier-error.patch<br>
<br>
diff --git a/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-const-qualifi=
er-error.patch b/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-const-qua=
lifier-error.patch<br>
deleted file mode 100644<br>
index 87a456d16d..0000000000<br>
--- a/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-const-qualifier-erro=
r.patch<br>
+++ /dev/null<br>
@@ -1,57 +0,0 @@<br>
-From 761b4df04a141cc8c9507c741e4046c6c6b00491 Mon Sep 17 00:00:00 2001<br>
-From: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"_bla=
nk">wangmy@fujitsu.com</a>&gt;<br>
-Date: Mon, 11 Sep 2023 09:00:39 +0000<br>
-Subject: [PATCH] Fix const qualifier error<br>
-<br>
-Fixes clang error<br>
-error: incompatible function pointer types assigning to &#39;OBJECT_NEW_FN=
&#39; (aka &#39;void *(*)(void *)&#39;) from &#39;void *(const void *)&#39;=
 [-Wincompatible-function-pointer-types]<br>
-|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0obj-&gt;fnObjectNew =3D uwac_event_clon=
e;<br>
-|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ^ ~~~~~~~~~~~~~~~~<br>
-<br>
-<a href=3D"https://github.com/FreeRDP/FreeRDP/commit/6e3c00725aae99d03a0ba=
a65430eceddebd9dee8-Upstream-Status" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/FreeRDP/FreeRDP/commit/6e3c00725aae99d03a0baa65430eceddeb=
d9dee8<br>
-Upstream-Status</a>: Backport<br>
-<br>
-Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" targe=
t=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
----<br>
- libfreerdp/codec/rfx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<=
br>
- winpr/include/winpr/collections.h | 2 +-<br>
- 2 files changed, 3 insertions(+), 3 deletions(-)<br>
-<br>
-diff --git a/libfreerdp/codec/rfx.c b/libfreerdp/codec/rfx.c<br>
-index ccbc5af..eec7365 100644<br>
---- a/libfreerdp/codec/rfx.c<br>
-+++ b/libfreerdp/codec/rfx.c<br>
-@@ -153,7 +153,7 @@ static void rfx_tile_init(void* obj)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- }<br>
- <br>
--static void* rfx_decoder_tile_new(void* val)<br>
-+static void* rfx_decoder_tile_new(const void* val)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0RFX_TILE* tile =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0WINPR_UNUSED(val);<br>
-@@ -184,7 +184,7 @@ static void rfx_decoder_tile_free(void* obj)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- }<br>
- <br>
--static void* rfx_encoder_tile_new(void* val)<br>
-+static void* rfx_encoder_tile_new(const void* val)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0WINPR_UNUSED(val);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return calloc(1, sizeof(RFX_TILE));<br>
-diff --git a/winpr/include/winpr/collections.h b/winpr/include/winpr/colle=
ctions.h<br>
-index 807f011..b8c8d9d 100644<br>
---- a/winpr/include/winpr/collections.h<br>
-+++ b/winpr/include/winpr/collections.h<br>
-@@ -36,7 +36,7 @@ extern &quot;C&quot;<br>
- {<br>
- #endif<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 typedef void* (*OBJECT_NEW_FN)(void* val);<br>
-+=C2=A0 =C2=A0 =C2=A0 typedef void* (*OBJECT_NEW_FN)(const void* val);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0typedef void (*OBJECT_INIT_FN)(void* obj);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0typedef void (*OBJECT_UNINIT_FN)(void* obj);<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0typedef void (*OBJECT_FREE_FN)(void* obj);<br>
--- <br>
-2.34.1<br>
-<br>
diff --git a/meta-oe/recipes-support/freerdp/<a href=3D"http://freerdp_2.11=
.8.bb" rel=3D"noreferrer" target=3D"_blank">freerdp_2.11.8.bb</a> b/meta-oe=
/recipes-support/freerdp/<a href=3D"http://freerdp_2.11.8.bb" rel=3D"norefe=
rrer" target=3D"_blank">freerdp_2.11.8.bb</a><br>
index 9c3d532438..c596aaa328 100644<br>
--- a/meta-oe/recipes-support/freerdp/<a href=3D"http://freerdp_2.11.8.bb" =
rel=3D"noreferrer" target=3D"_blank">freerdp_2.11.8.bb</a><br>
+++ b/meta-oe/recipes-support/freerdp/<a href=3D"http://freerdp_2.11.8.bb" =
rel=3D"noreferrer" target=3D"_blank">freerdp_2.11.8.bb</a><br>
@@ -16,7 +16,6 @@ PKGV =3D &quot;${GITPKGVTAG}&quot;<br>
=C2=A0SRCREV =3D &quot;9b678b6d5a40ce01607d8c3b1b1416437c8416c4&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/FreeRDP/FreeRDP.=
git;branch=3Dstable-2.0;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/FreeRDP/FreeRDP.git;branch=3Dstable-2.0;protocol=3Dhttps</a>=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://winpr-makecert-Build-with-=
install-RPATH.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-const-qualifier-e=
rror.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-Do-not-install-tools-=
a-CMake-targets.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2024-32661.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#125765): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/125765" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/125765</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118522890/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118522890/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000008e0c77064df112a0--

