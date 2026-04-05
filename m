Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 635C8E9D80B
	for <webhook@archiver.kernel.org>; Sun,  5 Apr 2026 15:37:19 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37008.1775403431130118347
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2026 08:37:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pKX1XOq6;
 spf=pass (domain: gmail.com, ip: 74.125.224.51, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64fc6b21789so2310091d50.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 08:37:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775403430; cv=none;
        d=google.com; s=arc-20240605;
        b=Anx67TA1ZyenIAryRVKyweOTQb8hZ2bhD/aA97Iw/NE8SoXdRTpQQT93IlBC40mw7y
         kfDvIoWiM1EsZCQY0Bl0tpIkgQEMTq2NlOXO07L9HjAj0uiDGWWcvaM5z03wXYlcgZ5s
         ePICcyZzxqqZVty9SDtKs3qaWe/CLNOaV6YCX1HsHhACHQZCBpSdo56Zs7OAgoyIRfJw
         1Pa0pf+1CF51U1jz1ptLyrlciwR5fw34LPYoA015IHShW+DfV/roLTW0Hey5v48vDKkq
         YHYt+vgtbm0Lnma9O6MHrZkh/Y58HoinMuF1//4wFU0FrgrH17cGRNDAYDKWWGxlvhve
         eVmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lo9V5myQw9gKcYm7FHa0MCybVloNQ9IiBidAFpAW7CA=;
        fh=sQq4UwMItvi2zQkbQsQ7gG/lHqOQ30Mc0djsN0hkevw=;
        b=D6sl7aVMiiJIPNAOz4sZURsRsUct7xqRevnplZJj97M9drSfVqO43QyY4f/vpwZ22h
         NAI9H8yqumUi/FnYoZww4poEX7Kj2Yb+O4Id46Q1Gm+zhrtOQXDc0alLGFhmpfzWMzvM
         MXFXwNIUvrA+rcz6JvBGOsfrLPlmQBwuq8dDk/jL4WpnSBpys5vHEF8r7pH0hWwGahu/
         pi7cukogZtNDeZviCZzyvxoDTDTD1VkuZNtn3SbBmRPEcYr5ljK8lYW3tgWvO/puWJP8
         9EWfSWrKUhrf21hc7yhx7ICYC9j7+XD+xszU5H2c0lJB779y0WTaqdn5Zk4HCXPJlvfm
         ZjQg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775403430; x=1776008230; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lo9V5myQw9gKcYm7FHa0MCybVloNQ9IiBidAFpAW7CA=;
        b=pKX1XOq6syhcpdneFqZG303TMjfgYlheEU4L1snZZIOfqeHgHb6Mnvt5QhzYWgViY6
         zgRcWlouYOvEP8ElylgZQ05z70b7Bf7/YLZcAmLbWjrtm0gx4iWR9qQv+Dn2wFl7SVzy
         AZn75ao8kX9qYpDbGUiwb3h6J6IPMR476VIB/+uR7IH677nJhG+amiL34NywvpmOQMWd
         R3k+dYeJttyfXhvFMPktWTWGpKau0urtq0UUX2+aMBjk61dk0l+qYeJkUzZuS+HSNdhI
         uLP6UUgF7k3mrR2qzEChHq65uz4WSNeFQ4oz/xU5GF6aUV9kQefCvS5giOSZOtivwgr2
         btQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775403430; x=1776008230;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lo9V5myQw9gKcYm7FHa0MCybVloNQ9IiBidAFpAW7CA=;
        b=OGhQdlq9TGIZEhdy5EgjAw/izc3bui622vQu8Q6JkM6yu/Nb/LlgSXWd0xMVuiHHkK
         PRic5zJ+7DzFpAKb1CPTWsk3oja/cncHcgTecF4kMm4V5mVD65XE3l1lsOsFEXGGnNHi
         lMJ03ur9tIOveJDup3szCX9Pz2Q99Y9k2S71ndS+dPsZXF4q0yZnMAEylpRhE4fqhcpc
         O07D/ZpyUE+5BBWBvdWN5rCOZiCOlNIKd80j1qk5gwNIE7rsOEeCJWr56MktIaju4OJ6
         A9SMd4aVpxUhlAaQy23uejucXtNdMmigF/huCsP3XK8G8VfpQbyEN1WtQDIwVKORGJSc
         +fuQ==
X-Gm-Message-State: AOJu0YwJ7Z4U88Zl7gmDRdu3/4tRoZ6D9Bj+ymxy6btyqulq2+QSazBk
	+l20kY2C+p33pjGydZxybtuMLCXBis1EHoxYjF/+wrtSQPHq6aqqDcSQruOoog0Kf34yucwYiZA
	wbFoHpRgip0vyk6HIqI4QfKD6WSptdWbxrg==
X-Gm-Gg: AeBDieu6gVy8TntOKamc75J6oC9zWRzbOnwvXp11Q00vn2u7p+uwnGhbigAVZHaSQBT
	O9mOrvAFxI66TWej7Qxd5o3ctkUVH/4oDYFhSke82A15ldM7nqFDaPx74BSnV8oTG90i82SG7IA
	7tGd8T1SFAiSxFp9XGlYOy0UH+ZLuhVROSXJfz4+KK9tLsEa1sqKxLXgQGHcvL0txitGpSZfRJZ
	l8/GWJ+2uIPNL9N83RcLR1Nro5cbdCTG+LONAfokw03rBcPW6o8L64l/d4RKSXt+ZLxPPDuMRSi
	IVWrf0JtRR0meDyzoYT53qgfYPVWr+6aCTlOEANqvywDyopsSujgcrIHuO36OpHukyaXPXLpqy2
	6GhCwZmzcGsZKZ427WasFbcyz
X-Received: by 2002:a05:690e:438d:b0:650:2ff9:d65a with SMTP id
 956f58d0204a3-65048747943mr6228561d50.31.1775403430006; Sun, 05 Apr 2026
 08:37:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1775370794.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1775370794.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 5 Apr 2026 08:36:42 -0700
X-Gm-Features: AQROBzBdcsniFl_GKuPlCUcUfKViCvnmuiITUKE9L1hw00QOAlkBlrDxJLrj5y0
Message-ID: <CAMKF1sodGnR56GBQuJjfNGv3h9GUfQmdjNuhG7oA_BEZe4SjCg@mail.gmail.com>
Subject: Re: [oe] [PATCH 0/7] Scarthgap pull request
To: anuj.mittal@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c752eb064eb85278"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 15:37:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126015

--000000000000c752eb064eb85278
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

looks good. Installed now. Thanks Anuj

On Sun, Apr 5, 2026 at 6:27=E2=80=AFAM Anuj Mittal via lists.openembedded.o=
rg
<anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> Please merge these changes in scarthgap. Tested locally and on
> autobuilder.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1435
>
> The following changes since commit
> 06f846a325fde423bb0a6d49d771d8c1e144d7eb:
>
>   bluealsa: fix QA issue staticdev (2026-03-24 15:53:24 +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/sca=
rthgap
>
> for you to fetch changes up to 1ad0d777d1de1769e5995eb806f7ae5c15d0be54:
>
>   strongswan: Fix CVE-2026-25075 (2026-04-03 15:00:48 +0530)
>
> ----------------------------------------------------------------
>
> Hitendra Prajapati (1):
>   python3-cbor2: patch CVE-2026-26209
>
> Markus Volk (1):
>   flatpak: add PACKAGECONFIG for dconf
>
> Martin Jansa (1):
>   freerdp: remove 0001-Fix-const-qualifier-error.patch
>
> Vijay Anusuri (4):
>   libssh: Fix CVE-2026-0964
>   libssh: Fix CVE-2026-0966
>   giflib: Fix CVE-2026-23868
>   strongswan: Fix CVE-2026-25075
>
>  .../strongswan/CVE-2026-25075.patch           |  50 ++
>  .../strongswan/strongswan_5.9.14.bb           |   1 +
>  .../giflib/giflib/CVE-2026-23868.patch        |  34 ++
>  .../recipes-devtools/giflib/giflib_5.2.2.bb   |   1 +
>  .../flatpak/flatpak_1.15.8.bb                 |   3 +-
>  .../0001-Fix-const-qualifier-error.patch      |  57 ---
>  .../recipes-support/freerdp/freerdp_2.11.8.bb |   1 -
>  .../libssh/libssh/CVE-2026-0964.patch         |  46 ++
>  .../libssh/libssh/CVE-2026-0966-1.patch       |  35 ++
>  .../libssh/libssh/CVE-2026-0966-2.patch       |  71 +++
>  .../libssh/libssh/CVE-2026-0966-3.patch       |  65 +++
>  .../recipes-support/libssh/libssh_0.10.6.bb   |   4 +
>  .../python3-cbor2/CVE-2026-26209-pre1.patch   | 469 ++++++++++++++++++
>  .../python/python3-cbor2/CVE-2026-26209.patch | 415 ++++++++++++++++
>  .../python/python3-cbor2_5.6.4.bb             |   2 +
>  15 files changed, 1194 insertions(+), 60 deletions(-)
>  create mode 100644
> meta-networking/recipes-support/strongswan/strongswan/CVE-2026-25075.patc=
h
>  create mode 100644
> meta-oe/recipes-devtools/giflib/giflib/CVE-2026-23868.patch
>  delete mode 100644
> meta-oe/recipes-support/freerdp/freerdp/0001-Fix-const-qualifier-error.pa=
tch
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2026-0964.patch
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-1.patch
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-2.patch
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-3.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209-pre1.pat=
ch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209.patch
>
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126014):
> https://lists.openembedded.org/g/openembedded-devel/message/126014
> Mute This Topic: https://lists.openembedded.org/mt/118676682/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c752eb064eb85278
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">looks good. Installed now. Thanks Anuj</div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Sun, Apr 5, 2026 at 6:27=E2=80=AFAM Anuj Mittal via <a href=3D"http://=
lists.openembedded.org">lists.openembedded.org</a> &lt;anuj.mittal=3D<a hre=
f=3D"mailto:oss.qualcomm.com@lists.openembedded.org">oss.qualcomm.com@lists=
.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Please merge these changes in scarthgap. Tested locally an=
d on<br>
autobuilder.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1435" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1435</a><br>
<br>
The following changes since commit 06f846a325fde423bb0a6d49d771d8c1e144d7eb=
:<br>
<br>
=C2=A0 bluealsa: fix QA issue staticdev (2026-03-24 15:53:24 +0530)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-opene=
mbedded-contrib</a> anujm/scarthgap<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib/lo=
g/?h=3Danujm/scarthgap" rel=3D"noreferrer" target=3D"_blank">https://git.op=
enembedded.org/meta-openembedded-contrib/log/?h=3Danujm/scarthgap</a><br>
<br>
for you to fetch changes up to 1ad0d777d1de1769e5995eb806f7ae5c15d0be54:<br=
>
<br>
=C2=A0 strongswan: Fix CVE-2026-25075 (2026-04-03 15:00:48 +0530)<br>
<br>
----------------------------------------------------------------<br>
<br>
Hitendra Prajapati (1):<br>
=C2=A0 python3-cbor2: patch CVE-2026-26209<br>
<br>
Markus Volk (1):<br>
=C2=A0 flatpak: add PACKAGECONFIG for dconf<br>
<br>
Martin Jansa (1):<br>
=C2=A0 freerdp: remove 0001-Fix-const-qualifier-error.patch<br>
<br>
Vijay Anusuri (4):<br>
=C2=A0 libssh: Fix CVE-2026-0964<br>
=C2=A0 libssh: Fix CVE-2026-0966<br>
=C2=A0 giflib: Fix CVE-2026-23868<br>
=C2=A0 strongswan: Fix CVE-2026-25075<br>
<br>
=C2=A0.../strongswan/CVE-2026-25075.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 50 ++<br>
=C2=A0.../strongswan/<a href=3D"http://strongswan_5.9.14.bb" rel=3D"norefer=
rer" target=3D"_blank">strongswan_5.9.14.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../giflib/giflib/CVE-2026-23868.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 34 ++<br>
=C2=A0.../recipes-devtools/giflib/<a href=3D"http://giflib_5.2.2.bb" rel=3D=
"noreferrer" target=3D"_blank">giflib_5.2.2.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A01 +<br>
=C2=A0.../flatpak/<a href=3D"http://flatpak_1.15.8.bb" rel=3D"noreferrer" t=
arget=3D"_blank">flatpak_1.15.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +-<br>
=C2=A0.../0001-Fix-const-qualifier-error.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
57 ---<br>
=C2=A0.../recipes-support/freerdp/<a href=3D"http://freerdp_2.11.8.bb" rel=
=3D"noreferrer" target=3D"_blank">freerdp_2.11.8.bb</a> |=C2=A0 =C2=A01 -<b=
r>
=C2=A0.../libssh/libssh/CVE-2026-0964.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 46 ++<br>
=C2=A0.../libssh/libssh/CVE-2026-0966-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 35 ++<br>
=C2=A0.../libssh/libssh/CVE-2026-0966-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 71 +++<br>
=C2=A0.../libssh/libssh/CVE-2026-0966-3.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 65 +++<br>
=C2=A0.../recipes-support/libssh/<a href=3D"http://libssh_0.10.6.bb" rel=3D=
"noreferrer" target=3D"_blank">libssh_0.10.6.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A04 +<br>
=C2=A0.../python3-cbor2/CVE-2026-26209-pre1.patch=C2=A0 =C2=A0| 469 +++++++=
+++++++++++<br>
=C2=A0.../python/python3-cbor2/CVE-2026-26209.patch | 415 ++++++++++++++++<=
br>
=C2=A0.../python/<a href=3D"http://python3-cbor2_5.6.4.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-cbor2_5.6.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A015 files changed, 1194 insertions(+), 60 deletions(-)<br>
=C2=A0create mode 100644 meta-networking/recipes-support/strongswan/strongs=
wan/CVE-2026-25075.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/giflib/giflib/CVE-2026-23=
868.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-support/freerdp/freerdp/0001-Fix-c=
onst-qualifier-error.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-096=
4.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-096=
6-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-096=
6-2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-096=
6-3.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/=
CVE-2026-26209-pre1.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/=
CVE-2026-26209.patch<br>
<br>
-- <br>
2.53.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#126014): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/126014" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/126014</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118676682/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118676682/1997914</a><br>
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

--000000000000c752eb064eb85278--

