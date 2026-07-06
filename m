Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6212CC43602
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 09:01:54 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.146086.1783328504699754883
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2026 02:01:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=BayyEWsO;
 spf=pass (domain: snapchat.com, ip: 209.85.221.43, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47afb758487so178639f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 02:01:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783328503; cv=none;
        d=google.com; s=arc-20260327;
        b=URVaHJmxReE1TGEATtsHkOej5DKn2x3bxWYhV2c+P53rR70KxuC86y8Td2OKRif+Wz
         0aAyD/7r+OgB2zcA48jisI51EML6f9qaBTGqifLl8wFwTAdS/vFmGG+ycdIYaLHuO+YB
         aDWbqWbd+yusFkG0z1cVCWZVoys2YYGY6u9cz69ifs5+kF5tSkzO3svA5iZRYZH2W3QA
         PFYaR8mUgTfJ32tliQs/XdmrmrXQmXqZMB7ftb3/KFqge2285CUX4mHnYVlfcl7Snme0
         nPIkqWxE2HsdE90NzpmTKbBJpFfm6Jt/xjiGO2sN6q6jqnf3iszIsQwT+r3oajm7awaU
         iBwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BmhphFVhvXciR/ID6BGYqfLK8NAriEKI6qn4zYioHmU=;
        fh=3gNmh+G7U8VRR2Luhp6b+laC5vWoIq0nVkCmdnHWMps=;
        b=Zcm002yrR36VxfkXvzB8a60PnPN3u/+wZ2YMK6YDNiiWoMwSQE53m+PdV2W+1C6wsc
         TNgtiX4ojheWFel2H8ixuz9KmSIixhAhuC/kjs5eo4bxXvwWgo6zxZoH3Opd1maTcwtZ
         zDBoWCb7X6qdPSb19AFopD2avSbJ9KrWQv3YHBJRBoe+NuoXH57vyX/RHYGSdYTP2hzm
         pRJ1gaLwZ4DWg2yGe0NrZO3E4GAI35il5+koFcafAOP3bKDnJicwLRdFJJOEPUp/5Yuo
         pv9tWPdpz8uqfed9/gFd+YH+lPQkTfgp5y0HucyHj2rcl1Qebt9VMrv9dD/AEEaJDpFk
         eV3g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1783328503; x=1783933303; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BmhphFVhvXciR/ID6BGYqfLK8NAriEKI6qn4zYioHmU=;
        b=BayyEWsON2aZLOE1DHMp1EoiJZuquh9BNV6WcqtkWbBgWYy1utWmHoRJFjKvZ/BmQV
         TRADC0Wsxz9YeoRPVrTdhD854NqknE8wLDqnvAGXhmfNBIyvnk81T1On5x08LuZUKu+F
         UVnYiUU8alHzgd79lGqN51gW6MLqyCOh3IMP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328503; x=1783933303;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BmhphFVhvXciR/ID6BGYqfLK8NAriEKI6qn4zYioHmU=;
        b=ZGV3BOgm0NshbONJHy9zxCP9O1emtyBBDTi4cRJYI1aSGSQiNbeXNhjlYOGeJbR1zT
         AN7p6Prqw6AMOZebKM5pCPoC1wELnzMSMgU93KKzimpwX0lt9LfCVrZDqUMEhSIX/jjo
         UHgYEwKNoBwwLAXBYTkp5cwsdYNrcRNSyZfMob5XUTmzyQ+iS1pVm5ZDoa0zzKj6n4OU
         VayAYpgL2ITGHdx7j0axsnpjzSNS9qujkUVOCg80DDcBcv3CDHpF/gO2kEb5U+Gk5QKf
         1rHmC2g7X4sEcRzioZ44CQo/w92M5PUiFYXrqy1q0/TKOX8LHKq3cPKqhe3P8temka/V
         y/Mw==
X-Gm-Message-State: AOJu0YysGMMVzLo8A/hyWrUQfmeeK04Gm4F1K5+3do42VmWClQeFA3lU
	HwwqryCCK52pXsKJvN3ZvBgVlkUsbPKYn282p7YENPIy/lvqgys8gZk2KDNBmMFpbnS/xD/hLxY
	qs1hR6/kC86VXJljyZ/BstsrOnZTn6t8qlK4OoA6GsFgRsahwAVhBLXM=
X-Gm-Gg: AfdE7cmxBaJINheIhAzyDOFGrhDbcAgHz1EMSsJqYT4s+3S4ydnJ+tatFGTH+v6P/gI
	KEhYZ1p0GL0qIbZB7HJxyEVqDckjaQa8oZuryN+iXu/9aK8HbM1qyzwO4/5r5MdPN0PDEab5AC5
	xV3hfpABsTOoUMgKExO+UxWUNJ1vDk4Q8HPy1BpFeXThekhqkNgYSPMxBe1C9cmujLfj2hj/NIs
	eWfW+2atHhFGcZyUJDXLz4dOOSdvXJUmngNRhfrk2621s96tfHoB5vKP9GwnziRtpF71I5mxCPp
	MjnvkKOAd6WxVDVXAYw1lNZzbraI6w==
X-Received: by 2002:a05:6000:2401:b0:46f:e15b:415 with SMTP id
 ffacd0b85a97d-47aab57d0a3mr11556263f8f.12.1783328502620; Mon, 06 Jul 2026
 02:01:42 -0700 (PDT)
MIME-Version: 1.0
References: <18BFA7C29903736F.1336494@lists.openembedded.org>
In-Reply-To: <18BFA7C29903736F.1336494@lists.openembedded.org>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Mon, 6 Jul 2026 11:01:31 +0200
X-Gm-Features: AVVi8Cec9HJsn1wcCAycBryJCCOwcnsbUEhC6UIRVYsmAmLfEJh63zE9KJZKFcU
Message-ID: <CAHUKmYYQBJ7P6Vo0LvwUGR07fC48E-H1T=Jt_0sXpOXQkrOsUw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] ttf-noto-emoji: upgrade 20200916 -> 2.051
To: ecordonnier@snap.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000eaf4a00655ed85be"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 09:01:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128033

--000000000000eaf4a00655ed85be
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've added this line because of the version going backwards:

PE =3D "1"

On Mon, Jul 6, 2026 at 11:00=E2=80=AFAM Etienne Cordonnier via
lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org> wrot=
e:

> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> - NotoEmoji-Regular.ttf was removed upstream in
> https://github.com/googlefonts/noto-emoji/commit/1442f6acc8463c428c8b38fc=
558e87c28d8efa5b
> - A new COLRv1 format is provided, with a smaller file-size
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  .../packagegroups/packagegroup-meta-oe.bb     |  4 +++-
>  .../ttf-fonts/ttf-noto-emoji_2.051.bb         | 23 +++++++++++++++++++
>  .../ttf-fonts/ttf-noto-emoji_20200916.bb      | 18 ---------------
>  3 files changed, 26 insertions(+), 19 deletions(-)
>  create mode 100644 meta-oe/recipes-graphics/ttf-fonts/
> ttf-noto-emoji_2.051.bb
>  delete mode 100644 meta-oe/recipes-graphics/ttf-fonts/
> ttf-noto-emoji_20200916.bb
>
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index a4b03e2a88..c3600d5c95 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -556,7 +556,9 @@ RDEPENDS:packagegroup-meta-oe-graphics =3D "\
>      ttf-lklug \
>      ttf-lohit \
>      ttf-noto-emoji-color \
> -    ttf-noto-emoji-regular \
> +    ttf-noto-emoji-color-noflags \
> +    ttf-noto-emoji-colrv1 \
> +    ttf-noto-emoji-colrv1-noflags \
>      ttf-pt-sans \
>      ttf-roboto \
>      ttf-sazanami-gothic \
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_2.051.bb
> b/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_2.051.bb
> new file mode 100644
> index 0000000000..6376b0e10d
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_2.051.bb
> @@ -0,0 +1,23 @@
> +require ttf.inc
> +
> +SUMMARY =3D "Google noto emoji font pack"
> +HOMEPAGE =3D "https://github.com/googlefonts/noto-emoji "
> +LICENSE =3D "OFL-1.1"
> +LIC_FILES_CHKSUM =3D
> "file://fonts/LICENSE;md5=3D55719faa0112708e946b820b24b14097"
> +
> +SRC_URI =3D "git://
> github.com/googlefonts/noto-emoji;branch=3Dmain;protocol=3Dhttps"
> +SRCREV =3D "8998f5dd683424a73e2314a8c1f1e359c19e8742"
> +PE =3D "1"
> +
> +PACKAGES =3D+ "${PN}-color ${PN}-color-noflags ${PN}-colrv1
> ${PN}-colrv1-noflags"
> +FONT_PACKAGES =3D "${PN} ${PN}-color ${PN}-color-noflags ${PN}-colrv1
> ${PN}-colrv1-noflags"
> +
> +FILES:${PN} =3D "${datadir}/fonts/truetype/*.ttf"
> +FILES:${PN}-color =3D "${datadir}/fonts/truetype/NotoColorEmoji.ttf"
> +FILES:${PN}-color-noflags =3D
> "${datadir}/fonts/truetype/NotoColorEmoji-noflags.ttf"
> +# The COLRv1 format is a color scalable font compared with the previous
> color bitmap fonts.
> +# COLRv1 is significantly smaller than the color bitmap format (~5MB vs
> ~11MB).
> +FILES:${PN}-colrv1 =3D "${datadir}/fonts/truetype/Noto-COLRv1.ttf"
> +FILES:${PN}-colrv1-noflags =3D
> "${datadir}/fonts/truetype/Noto-COLRv1-noflags.ttf"
> +
> +do_compile[noexec] =3D "1"
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20200916.b=
b
> b/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20200916.bb
> deleted file mode 100644
> index b5dae22a9d..0000000000
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20200916.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -require ttf.inc
> -
> -SUMMARY =3D "Google noto emoji font pack"
> -HOMEPAGE =3D "https://github.com/googlefonts/noto-emoji "
> -LICENSE =3D "OFL-1.1"
> -LIC_FILES_CHKSUM =3D
> "file://fonts/LICENSE;md5=3D55719faa0112708e946b820b24b14097"
> -
> -SRC_URI =3D "git://
> github.com/googlefonts/noto-emoji;branch=3Dmain;protocol=3Dhttps"
> -SRCREV =3D "aac7ccaa4d1dea4543453b96f7d6fc47066a57ff"
> -
> -PACKAGES =3D "${PN}-color ${PN}-regular"
> -FONT_PACKAGES =3D "${PN}-color ${PN}-regular"
> -
> -
> -FILES:${PN}-color =3D "${datadir}/fonts/truetype/NotoColorEmoji.ttf"
> -FILES:${PN}-regular =3D "${datadir}/fonts/truetype/NotoEmoji-Regular.ttf=
"
> -
> -do_compile[noexec] =3D "1"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128032):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Ddevel_message_128032&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0=
hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&=
m=3DxWIo8mqjVJop6Ehi11O8oBRfOmU0O7MVv6uulsTjLPKZVhFHaGR17yIVEL0iZW2H&s=3DTZ=
2cVAatsYqC2u_CNRsrPcI1pk8k9RPQfSAFL18B1IE&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_120136711_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DxWIo8mqjVJop6=
Ehi11O8oBRfOmU0O7MVv6uulsTjLPKZVhFHaGR17yIVEL0iZW2H&s=3D9-DrjWnmwxs9uVaQVJd=
pjYBPR8Oic04IBip_LCYe7Rs&e=3D
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Ddevel_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHv=
abgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DxWIo8=
mqjVJop6Ehi11O8oBRfOmU0O7MVv6uulsTjLPKZVhFHaGR17yIVEL0iZW2H&s=3DcvJyyu_Q1wT=
nFVsqujskyqFoy0thkClc4NSo3y0qK8s&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000eaf4a00655ed85be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve added this line because of the version going back=
wards:<br><br>PE =3D &quot;1&quot;</div><br><div class=3D"gmail_quote gmail=
_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 6, 2026=
 at 11:00=E2=80=AFAM Etienne Cordonnier via <a href=3D"http://lists.openemb=
edded.org">lists.openembedded.org</a> &lt;ecordonnier=3D<a href=3D"mailto:s=
nap.com@lists.openembedded.org">snap.com@lists.openembedded.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Etienn=
e Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" target=3D"_blank">=
ecordonnier@snap.com</a>&gt;<br>
<br>
- NotoEmoji-Regular.ttf was removed upstream in <a href=3D"https://github.c=
om/googlefonts/noto-emoji/commit/1442f6acc8463c428c8b38fc558e87c28d8efa5b" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/googlefonts/noto-em=
oji/commit/1442f6acc8463c428c8b38fc558e87c28d8efa5b</a> <br>
- A new COLRv1 format is provided, with a smaller file-size<br>
<br>
Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.co=
m" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
---<br>
=C2=A0.../packagegroups/<a href=3D"http://packagegroup-meta-oe.bb" rel=3D"n=
oreferrer" target=3D"_blank">packagegroup-meta-oe.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 4 +++-<br>
=C2=A0.../ttf-fonts/<a href=3D"http://ttf-noto-emoji_2.051.bb" rel=3D"noref=
errer" target=3D"_blank">ttf-noto-emoji_2.051.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 23 +++++++++++++++++++<br>
=C2=A0.../ttf-fonts/<a href=3D"http://ttf-noto-emoji_20200916.bb" rel=3D"no=
referrer" target=3D"_blank">ttf-noto-emoji_20200916.bb</a>=C2=A0 =C2=A0 =C2=
=A0 | 18 ---------------<br>
=C2=A03 files changed, 26 insertions(+), 19 deletions(-)<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/ttf-fonts/<a href=3D"http=
://ttf-noto-emoji_2.051.bb" rel=3D"noreferrer" target=3D"_blank">ttf-noto-e=
moji_2.051.bb</a><br>
=C2=A0delete mode 100644 meta-oe/recipes-graphics/ttf-fonts/<a href=3D"http=
://ttf-noto-emoji_20200916.bb" rel=3D"noreferrer" target=3D"_blank">ttf-not=
o-emoji_20200916.bb</a><br>
<br>
diff --git a/meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegr=
oup-meta-oe.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-oe.b=
b</a> b/meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegroup-m=
eta-oe.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-oe.bb</a>=
<br>
index a4b03e2a88..c3600d5c95 100644<br>
--- a/meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegroup-met=
a-oe.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-oe.bb</a><b=
r>
+++ b/meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegroup-met=
a-oe.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-oe.bb</a><b=
r>
@@ -556,7 +556,9 @@ RDEPENDS:packagegroup-meta-oe-graphics =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0ttf-lklug \<br>
=C2=A0 =C2=A0 =C2=A0ttf-lohit \<br>
=C2=A0 =C2=A0 =C2=A0ttf-noto-emoji-color \<br>
-=C2=A0 =C2=A0 ttf-noto-emoji-regular \<br>
+=C2=A0 =C2=A0 ttf-noto-emoji-color-noflags \<br>
+=C2=A0 =C2=A0 ttf-noto-emoji-colrv1 \<br>
+=C2=A0 =C2=A0 ttf-noto-emoji-colrv1-noflags \<br>
=C2=A0 =C2=A0 =C2=A0ttf-pt-sans \<br>
=C2=A0 =C2=A0 =C2=A0ttf-roboto \<br>
=C2=A0 =C2=A0 =C2=A0ttf-sazanami-gothic \<br>
diff --git a/meta-oe/recipes-graphics/ttf-fonts/<a href=3D"http://ttf-noto-=
emoji_2.051.bb" rel=3D"noreferrer" target=3D"_blank">ttf-noto-emoji_2.051.b=
b</a> b/meta-oe/recipes-graphics/ttf-fonts/<a href=3D"http://ttf-noto-emoji=
_2.051.bb" rel=3D"noreferrer" target=3D"_blank">ttf-noto-emoji_2.051.bb</a>=
<br>
new file mode 100644<br>
index 0000000000..6376b0e10d<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-graphics/ttf-fonts/<a href=3D"http://ttf-noto-emoji_2=
.051.bb" rel=3D"noreferrer" target=3D"_blank">ttf-noto-emoji_2.051.bb</a><b=
r>
@@ -0,0 +1,23 @@<br>
+require ttf.inc<br>
+<br>
+SUMMARY =3D &quot;Google noto emoji font pack&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/googlefonts/noto-emoji" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/googlefonts/noto-emo=
ji</a> &quot;<br>
+LICENSE =3D &quot;OFL-1.1&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://fonts/LICENSE;md5=3D55719faa0112708e946b=
820b24b14097&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/googlefonts/noto-emoj=
i;branch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/googlefonts/noto-emoji;branch=3Dmain;protocol=3Dhttps</a>&quot;<br>
+SRCREV =3D &quot;8998f5dd683424a73e2314a8c1f1e359c19e8742&quot;<br>
+PE =3D &quot;1&quot;<br>
+<br>
+PACKAGES =3D+ &quot;${PN}-color ${PN}-color-noflags ${PN}-colrv1 ${PN}-col=
rv1-noflags&quot;<br>
+FONT_PACKAGES =3D &quot;${PN} ${PN}-color ${PN}-color-noflags ${PN}-colrv1=
 ${PN}-colrv1-noflags&quot;<br>
+<br>
+FILES:${PN} =3D &quot;${datadir}/fonts/truetype/*.ttf&quot;<br>
+FILES:${PN}-color =3D &quot;${datadir}/fonts/truetype/NotoColorEmoji.ttf&q=
uot;<br>
+FILES:${PN}-color-noflags =3D &quot;${datadir}/fonts/truetype/NotoColorEmo=
ji-noflags.ttf&quot;<br>
+# The COLRv1 format is a color scalable font compared with the previous co=
lor bitmap fonts.<br>
+# COLRv1 is significantly smaller than the color bitmap format (~5MB vs ~1=
1MB).<br>
+FILES:${PN}-colrv1 =3D &quot;${datadir}/fonts/truetype/Noto-COLRv1.ttf&quo=
t;<br>
+FILES:${PN}-colrv1-noflags =3D &quot;${datadir}/fonts/truetype/Noto-COLRv1=
-noflags.ttf&quot;<br>
+<br>
+do_compile[noexec] =3D &quot;1&quot;<br>
diff --git a/meta-oe/recipes-graphics/ttf-fonts/<a href=3D"http://ttf-noto-=
emoji_20200916.bb" rel=3D"noreferrer" target=3D"_blank">ttf-noto-emoji_2020=
0916.bb</a> b/meta-oe/recipes-graphics/ttf-fonts/<a href=3D"http://ttf-noto=
-emoji_20200916.bb" rel=3D"noreferrer" target=3D"_blank">ttf-noto-emoji_202=
00916.bb</a><br>
deleted file mode 100644<br>
index b5dae22a9d..0000000000<br>
--- a/meta-oe/recipes-graphics/ttf-fonts/<a href=3D"http://ttf-noto-emoji_2=
0200916.bb" rel=3D"noreferrer" target=3D"_blank">ttf-noto-emoji_20200916.bb=
</a><br>
+++ /dev/null<br>
@@ -1,18 +0,0 @@<br>
-require ttf.inc<br>
-<br>
-SUMMARY =3D &quot;Google noto emoji font pack&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"https://github.com/googlefonts/noto-emoji" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/googlefonts/noto-emo=
ji</a> &quot;<br>
-LICENSE =3D &quot;OFL-1.1&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://fonts/LICENSE;md5=3D55719faa0112708e946b=
820b24b14097&quot;<br>
-<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/googlefonts/noto-emoj=
i;branch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/googlefonts/noto-emoji;branch=3Dmain;protocol=3Dhttps</a>&quot;<br>
-SRCREV =3D &quot;aac7ccaa4d1dea4543453b96f7d6fc47066a57ff&quot;<br>
-<br>
-PACKAGES =3D &quot;${PN}-color ${PN}-regular&quot;<br>
-FONT_PACKAGES =3D &quot;${PN}-color ${PN}-regular&quot;<br>
-<br>
-<br>
-FILES:${PN}-color =3D &quot;${datadir}/fonts/truetype/NotoColorEmoji.ttf&q=
uot;<br>
-FILES:${PN}-regular =3D &quot;${datadir}/fonts/truetype/NotoEmoji-Regular.=
ttf&quot;<br>
-<br>
-do_compile[noexec] =3D &quot;1&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128032): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Ddevel_message_1=
28032&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&am=
p;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DxWIo8mqjVJop6Ehi1=
1O8oBRfOmU0O7MVv6uulsTjLPKZVhFHaGR17yIVEL0iZW2H&amp;s=3DTZ2cVAatsYqC2u_CNRs=
rPcI1pk8k9RPQfSAFL18B1IE&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">htt=
ps://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_=
g_openembedded-2Ddevel_message_128032&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjID=
Ph0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa=
66m67E&amp;m=3DxWIo8mqjVJop6Ehi11O8oBRfOmU0O7MVv6uulsTjLPKZVhFHaGR17yIVEL0i=
ZW2H&amp;s=3DTZ2cVAatsYqC2u_CNRsrPcI1pk8k9RPQfSAFL18B1IE&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_120136711_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3DxWIo8mqjVJop6Ehi11O8oBRfOmU0O7MVv6uulsTjLPKZVh=
FHaGR17yIVEL0iZW2H&amp;s=3D9-DrjWnmwxs9uVaQVJdpjYBPR8Oic04IBip_LCYe7Rs&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_120136711_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DxWIo8mqjVJop6Ehi11O8oBRfOmU0O7M=
Vv6uulsTjLPKZVhFHaGR17yIVEL0iZW2H&amp;s=3D9-DrjWnmwxs9uVaQVJdpjYBPR8Oic04IB=
ip_LCYe7Rs&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Ddevel_unsub&amp;d=3DDwIFaQ&amp;=
c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj=
9TsRih1DULJTKUkSGa66m67E&amp;m=3DxWIo8mqjVJop6Ehi11O8oBRfOmU0O7MVv6uulsTjLP=
KZVhFHaGR17yIVEL0iZW2H&amp;s=3DcvJyyu_Q1wTnFVsqujskyqFoy0thkClc4NSo3y0qK8s&=
amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoin=
t.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Ddevel_un=
sub&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;=
r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DxWIo8mqjVJop6Ehi11O=
8oBRfOmU0O7MVv6uulsTjLPKZVhFHaGR17yIVEL0iZW2H&amp;s=3DcvJyyu_Q1wTnFVsqujsky=
qFoy0thkClc4NSo3y0qK8s&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@sn=
ap.com" target=3D"_blank">ecordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000eaf4a00655ed85be--

