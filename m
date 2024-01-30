Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5BA6C46CD2
	for <webhook@archiver.kernel.org>; Tue, 30 Jan 2024 10:32:25 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.15396.1706610740472853936
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jan 2024 02:32:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DEQrqFmu;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40faf6788d1so957645e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jan 2024 02:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706610739; x=1707215539; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rH4+cDmJ7YjWJ04LS5wYMbnJCgCEAeaAlg9jdDEsdSA=;
        b=DEQrqFmuvyKwE/CzSLSRpGEo3xCjqjFPgJJyrgDiGBiAKBPTkXbpvrRImTZhBeq6Jf
         DykA3Qd+OANxFMUPXR9pmnIFsMsavNzMllsCq8jPT3W9MjrzyxtnLw4bAHGikrrHelv2
         WeTGRyrJyXZDRzrF629t+Nk+kSfol22rbfXJe/JvsXbDgHYBXqvOLx7mUjYW+DkzjpKj
         8us4ASvl995tQ2T0hN2Sl3gUpGuGOLiAukLoqoVC3cLzSBf0eX/FN2pRcE87b+AGpbYX
         SG02ESR+sxwvg9DUriMZqGtZADRbK29394ob0cO2+B3IHWdNpw0VM1dbp3s/DBw1BLlC
         /sSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706610739; x=1707215539;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rH4+cDmJ7YjWJ04LS5wYMbnJCgCEAeaAlg9jdDEsdSA=;
        b=t5b90eGBi98awfbQFTOrgfNPlioNcXzCEllHdUVHwkuawPHqcH7AgFKv/8rlx+Td7o
         wo8RGL7NnjXa9foDvizCLngI9V3/oE0eNo9g4tB5IsVDNeTGmif2BPVZUKYzUTG6yFt9
         MzS7TFnm3M9v/n3hxQ1e+Oqr1duFPYYPs4yvSDdoS9R37R29/8DbF1Q6OZs+RjLnNzGa
         FEBuKgLJ/AG9NK9+xYeFQrqoS9DIH3PV6rt3Fs/e4gHYxQQMZP5R/19Qlr79vyJHtNe0
         HdmRtMARDHQ9QT5CztiWO3ZWBoPRrADzR9W/Xs2LbYAmeBO8ptqF+XYSlw7qJvY55cAm
         uo7Q==
X-Gm-Message-State: AOJu0YykKA9Wk2yHd9+FwuLcI33a6nQBUO4iWAKeIGxKqzPqSHQ4rhJS
	Jbcp6iwlv8vZgCNwfY5zsKr3cMIf76Yq3s5TeHuDK3zWPResxoSBMhjtCwmct2bjM7z3EoW3InL
	NFVEOb1eWzoLDKluNnKYDfrHn98c=
X-Google-Smtp-Source: AGHT+IFhNepD39fOUlf8lWk13upQgNF1mPMxDjlqq2qWKJciVWh6DqX/7Qg5u3/CEdwEFu/ENFbyzeTr8+xXvpnA6KE=
X-Received: by 2002:a05:600c:1554:b0:40e:45c0:ad64 with SMTP id
 f20-20020a05600c155400b0040e45c0ad64mr1032840wmg.14.1706610738693; Tue, 30
 Jan 2024 02:32:18 -0800 (PST)
MIME-Version: 1.0
References: <1705972840-25182-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1705972840-25182-1-git-send-email-wangmy@fujitsu.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 30 Jan 2024 11:32:06 +0100
Message-ID: <CA+chaQdjcwfigonKT3ngt6bfxHhWfhd4B-dg-aZ2r+sPZK0_FA@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] redis: upgrade 7.2.3 -> 7.2.4
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d98a0d0610274680"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jan 2024 10:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108491

--000000000000d98a0d0610274680
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2024 at 2:25=E2=80=AFAM wangmy <wangmy@fujitsu.com> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
>
> 0001-src-Do-not-reset-FINAL_LIBS.patch
> 0006-Define-correct-gregs-for-RISCV32.patch
> lua-update-Makefile-to-use-environment-build-setting.patch
> refreshed for 7.2.4
>

Please review the changes from devtool, dropping Upstream-Status probably
wasn't intentional.

but now it causes scripts/yocto-check-layer failures:

INFO: Traceback (most recent call last):
  File
"/OE/build/oe-core/openembedded-core/scripts/lib/checklayer/cases/common.py=
",
line 87, in test_patches_upstream_status
    self.assertEqual(len(patches), 0 , \
AssertionError: 2 !=3D 0 : Found following patches with malformed or missin=
g
upstream status:
/OE/build/oe-core/meta-openembedded/meta-oe/recipes-multimedia/webm/libvpx/=
libvpx-configure-support-blank-prefix.patch
/OE/build/oe-core/meta-openembedded/meta-oe/recipes-extended/redis/redis-7.=
2.4/lua-update-Makefile-to-use-environment-build-setting.patch

Will send fix for this, but please be more careful next time.

diff --git
> a/meta-oe/recipes-extended/redis/redis-7.2.3/lua-update-Makefile-to-use-e=
nvironment-build-setting.patch
> b/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to-use-e=
nvironment-build-setting.patch
> similarity index 93%
> rename from
> meta-oe/recipes-extended/redis/redis-7.2.3/lua-update-Makefile-to-use-env=
ironment-build-setting.patch
> rename to
> meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to-use-env=
ironment-build-setting.patch
> index bff07535d..b562e2522 100644
> ---
> a/meta-oe/recipes-extended/redis/redis-7.2.3/lua-update-Makefile-to-use-e=
nvironment-build-setting.patch
> +++
> b/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to-use-e=
nvironment-build-setting.patch
> @@ -1,4 +1,4 @@
> -From 734ab2f7879c6f94fc18ea6a10adb9bd156ba769 Mon Sep 17 00:00:00 2001
> +From aa3d31355f3cc140b1dc2f4fcff8e3c0aa261549 Mon Sep 17 00:00:00 2001
>  From: Venture Research <tech@ventureresearch.com>
>  Date: Fri, 8 Feb 2013 20:22:19 -0600
>  Subject: [PATCH] lua: update Makefile to use environment build settings
> @@ -16,18 +16,16 @@ updated to work wtih 6.2.1
>  Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
>
>  ---
> -Upstream-Status: Pending
> -
>   deps/Makefile         |  1 -
>   deps/lua/Makefile     |  1 -
>   deps/lua/src/Makefile | 16 ++++++----------
>   3 files changed, 6 insertions(+), 12 deletions(-)
>

--000000000000d98a0d0610274680
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Jan 23, 2024 at 2:25=E2=80=AFAM w=
angmy &lt;<a href=3D"mailto:wangmy@fujitsu.com">wangmy@fujitsu.com</a>&gt; =
wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">From: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.co=
m" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
<br>
0001-src-Do-not-reset-FINAL_LIBS.patch<br>
0006-Define-correct-gregs-for-RISCV32.patch<br>
lua-update-Makefile-to-use-environment-build-setting.patch<br>
refreshed for 7.2.4<br></blockquote><div><br></div><div>Please review the c=
hanges from devtool, dropping Upstream-Status probably wasn&#39;t intention=
al.<br></div><div><br></div><div>but now it causes=C2=A0scripts/yocto-check=
-layer failures:</div><div><br></div><div>INFO: Traceback (most recent call=
 last):<br>=C2=A0 File &quot;/OE/build/oe-core/openembedded-core/scripts/li=
b/checklayer/cases/common.py&quot;, line 87, in test_patches_upstream_statu=
s<br>=C2=A0 =C2=A0 self.assertEqual(len(patches), 0 , \<br>AssertionError: =
2 !=3D 0 : Found following patches with malformed or missing upstream statu=
s:<br>/OE/build/oe-core/meta-openembedded/meta-oe/recipes-multimedia/webm/l=
ibvpx/libvpx-configure-support-blank-prefix.patch<br>/OE/build/oe-core/meta=
-openembedded/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefil=
e-to-use-environment-build-setting.patch<br></div><div><br></div><div>Will =
send fix for this, but please be more careful next time.</div><div><br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.3/lua-update-Makefile=
-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/re=
dis-7.2.4/lua-update-Makefile-to-use-environment-build-setting.patch<br>
similarity index 93%<br>
rename from meta-oe/recipes-extended/redis/redis-7.2.3/lua-update-Makefile-=
to-use-environment-build-setting.patch<br>
rename to meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to=
-use-environment-build-setting.patch<br>
index bff07535d..b562e2522 100644<br>
--- a/meta-oe/recipes-extended/redis/redis-7.2.3/lua-update-Makefile-to-use=
-environment-build-setting.patch<br>
+++ b/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to-use=
-environment-build-setting.patch<br>
@@ -1,4 +1,4 @@<br>
-From 734ab2f7879c6f94fc18ea6a10adb9bd156ba769 Mon Sep 17 00:00:00 2001<br>
+From aa3d31355f3cc140b1dc2f4fcff8e3c0aa261549 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Venture Research &lt;<a href=3D"mailto:tech@ventureresearch.com=
" target=3D"_blank">tech@ventureresearch.com</a>&gt;<br>
=C2=A0Date: Fri, 8 Feb 2013 20:22:19 -0600<br>
=C2=A0Subject: [PATCH] lua: update Makefile to use environment build settin=
gs<br>
@@ -16,18 +16,16 @@ updated to work wtih 6.2.1<br>
=C2=A0Signed-off-by: Yi Fan Yu &lt;<a href=3D"mailto:yifan.yu@windriver.com=
" target=3D"_blank">yifan.yu@windriver.com</a>&gt;<br>
<br>
=C2=A0---<br>
-Upstream-Status: Pending<br>
-<br>
=C2=A0 deps/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 -<br>
=C2=A0 deps/lua/Makefile=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 -<br>
=C2=A0 deps/lua/src/Makefile | 16 ++++++----------<br>
=C2=A0 3 files changed, 6 insertions(+), 12 deletions(-)<br>
</blockquote></div></div>

--000000000000d98a0d0610274680--

