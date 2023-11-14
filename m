Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4859C4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 03:08:27 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.5398.1699931305954949319
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 19:08:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kfnXzaS3;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1cc1e1e74beso46830895ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 19:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699931305; x=1700536105; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6JexafhmUBMI5zzlEz1aAfMlrLLsdNN11c4NqidnCU=;
        b=kfnXzaS3RfUxQrivtsVCszvFb1wEswC+9d8oH4HJRR7MZ7pWd/+iwzMbr+rxxAyWIv
         mUpPTRtTymS8TmFjoTept492wEnDWUYuWCfOJiuaegP5RJgusKn295w96Ww+ybYstPj7
         J0AJwct064SCt7PNBFnE6u0d4+sdBLiqSUG/UXoyQbE/hy7MLTLSZbwGGp6TWnYNnoiX
         jrqWHL1/uoKOREBJyLsZbXG0IfbY8FFxzl4Q0wnqWl6bAvYGsrff3LsdfsEpoqROKn1q
         JhUrsMW4ftbOi3kgtnBoRkebcC6+hy9cD3TyO4h0qzb+HXEzLo583BAI8EP1YnvOwTRb
         LHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699931305; x=1700536105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z6JexafhmUBMI5zzlEz1aAfMlrLLsdNN11c4NqidnCU=;
        b=I6lx3LEETAQ9nLbwZ5xL53InnIMyBMqEE2xxZzssL9bTJYv3Rbl94JF5NLNBibVRoT
         SxawXhJqsV1r7cBh3s5YG4woQTzvyXjst06EiLrhxNEPIM4uim4ZtHi1/ZqBkMZT0Dvy
         m4b1GoJ0wni1VbST6BFPZ3c2gELu2T3sD3UHHm/pSnxRznOhKMVSEenpaQ4jotsqcQ7E
         ilfUB2EU9mEzstbfZ1gktr4eimVCv8zent9S1H/KhqCBS7/fdRP9XaWj5I5falCXpRfX
         P8eaz/x1VYBKhrjrzYvNUkbMgeg1NOdO0Ru3zrIu/X4tpH7b+HD7hZCu61oBq5Bynp0G
         mkPA==
X-Gm-Message-State: AOJu0YzRxD2ui/r/TGQPmeXC5SPRZvwMVOVOnoM1d7SEvfLOUbISgNbO
	XFA5wTVhwidN40KggGWXujzYcBXmrq9AxQ==
X-Google-Smtp-Source: AGHT+IF2L04O8g68I8i8+rewkOEKDP4cjWeJvmO7oxn2PGxVsqBECyeg4ACT2FNLqLqxZrz6k1vu0Q==
X-Received: by 2002:a17:902:ce8f:b0:1cc:2f90:6291 with SMTP id f15-20020a170902ce8f00b001cc2f906291mr1229512plg.54.1699931305034;
        Mon, 13 Nov 2023 19:08:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id n2-20020a1709026a8200b001c44dbc92a2sm4687978plk.184.2023.11.13.19.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 19:08:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 10/10] gimp: Update to 2.10.36
Date: Mon, 13 Nov 2023 19:08:11 -0800
Message-ID: <20231113-gnomebaseclass-switch-to-meson-v1-10-111dd5d0fe68@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231113-gnomebaseclass-switch-to-meson-v1-0-111dd5d0fe68@gmail.com>
References: <20231113-gnomebaseclass-switch-to-meson-v1-0-111dd5d0fe68@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 03:08:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106697

Explicitly ask for autotools build system since gnomebase is now=0D
defaulting to meson.=0D
=0D
Signed-off-by: Khem Raj <raj.khem@gmail.com>=0D
---=0D
 meta-gnome/recipes-gimp/gimp/{gimp_2.10.34.bb =3D> gimp_2.10.36.bb} | 3 ++=
-=0D
 1 file changed, 2 insertions(+), 1 deletion(-)=0D
=0D
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.34.bb b/meta-gnome/reci=
pes-gimp/gimp/gimp_2.10.36.bb=0D
similarity index 93%=0D
rename from meta-gnome/recipes-gimp/gimp/gimp_2.10.34.bb=0D
rename to meta-gnome/recipes-gimp/gimp/gimp_2.10.36.bb=0D
index 7343036807..4526839ad6 100644=0D
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.34.bb=0D
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.36.bb=0D
@@ -37,6 +37,7 @@ DEPENDS =3D " \=0D
 "=0D
 DEPENDS:append:libc-musl =3D " libexecinfo"=0D
 =0D
+GNOMEBASEBUILDCLASS =3D "autotools"=0D
 inherit features_check gnomebase gtk-icon-cache gtk-doc mime-xdg=0D
 =0D
 REQUIRED_DISTRO_FEATURES =3D "x11"=0D
@@ -46,7 +47,7 @@ SHPV =3D "${@gnome_verdir("${PV}")}"=0D
 SRC_URI =3D "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2 \=
=0D
            file://0001-configure-Keep-first-line-of-compiler-version-strin=
g.patch \=0D
            file://0001-libtool-Do-not-add-build-time-library-paths-to-LD_L=
I.patch"=0D
-SRC_URI[sha256sum] =3D "84004642d351b398a4293cd7fd3592044a944f05bb52850ee6=
068f247c657aa3"=0D
+SRC_URI[sha256sum] =3D "3d3bc3c69a4bdb3aea9ba2d5385ed98ea03953f3857aafd1d6=
976011ed7cdbb2"=0D
 =0D
 EXTRA_OECONF =3D "--disable-python \=0D
                 --without-webkit \=0D
=0D
-- =0D
2.42.1=0D
=0D

