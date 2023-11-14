Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15135C074FE
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 03:08:28 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.5381.1699931300927931115
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 19:08:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FhvY767d;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1cc938f9612so33241315ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 19:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699931300; x=1700536100; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9BjlPiiD/oHB6+vw0z13GoOUpIGiRb/9PjSyEx/eic=;
        b=FhvY767dtccMReOduYTBkF2X8S3IhWUf7vPFvX4bhW6UxtP2qx20oe06Y+i8Gma5/f
         WGOnYQ0ulZxTXHP34WIDO8VAm0H2E+IQCDFrSt5SaakPffumzNfn40+V5sAXdirn0CE8
         WQ7jpRZrMuVjblzWMx29xgem3NVR/kXg/NfNjYXQlcUpQIlbAilXWS8bhjmZFiL3sI6n
         /wyrK4ztMvkiJlF6feN4/jMfoFEu/Wb3XdSjljEO0mF3r+ZYta+5luCve6mkj8ZLpgN8
         COCrzNVH3KCmTqVHhxcPd0frf1GgNc/ImdhiRnvURX7eNUzEE8VrSpV1+hWU8+cA6dxa
         5vdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699931300; x=1700536100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9BjlPiiD/oHB6+vw0z13GoOUpIGiRb/9PjSyEx/eic=;
        b=Q5ZCgzxbL8B8QDycRtrPreMxbpYG1CZFUqxoWYIC3FMMndhy99d9Dq26cub6VqAyhX
         PgW5hlCgT8QJxpPr3lN06yi9ISpTcld1cGC2soLAbpgO6U5gOlbvI1AZ1xkGrljulGRE
         G2x1ca7wzuSXU7TC65lZN42K3iEy9g+imnPukShemkSgwgX04jtLiDHylB+hoWjOun2s
         /PKDFups7oNUDIJTQC2PPeYBWEBVXFAR6G6LtbDUA1CDQY/Xq5bYWg6vRrQttUC1qKp+
         e2LMrz+Sn9KzQnQ6o+0JcUvQ1/APRozXl/RsJhr5uC0SFD0HYqyNDly43iKn4GA/+nLV
         evKg==
X-Gm-Message-State: AOJu0Yy+p9kzThXoGNyAmdBQpzYxrETwMRrygf1PnEh4zD+wuHwaThcX
	cs0c+FgJGmqnF+p6z+uQVN4fvT83Gg0Kvg==
X-Google-Smtp-Source: AGHT+IGs9SJyK3Bm9QNQWrHmdEy3hj/diDVeIUzpujwzFf4Op9xmX1avBEeHHP+xlZWplokC5OkU7w==
X-Received: by 2002:a17:902:864c:b0:1cc:51b8:8102 with SMTP id y12-20020a170902864c00b001cc51b88102mr1060089plt.2.1699931299641;
        Mon, 13 Nov 2023 19:08:19 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id n2-20020a1709026a8200b001c44dbc92a2sm4687978plk.184.2023.11.13.19.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 19:08:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 04/10] dleyna-core: Update to tip of master
Date: Mon, 13 Nov 2023 19:08:05 -0800
Message-ID: <20231113-gnomebaseclass-switch-to-meson-v1-4-111dd5d0fe68@gmail.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 03:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106691

Get the support for newer gupnp 1.2=0D
=0D
Fixes=0D
| configure: error: Package requirements (gupnp-1.2 >=3D 1.2.0) were not me=
t:=0D
|=0D
| No package 'gupnp-1.2' found=0D
=0D
Signed-off-by: Khem Raj <raj.khem@gmail.com>=0D
---=0D
 meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb | 2 +-=0D
 1 file changed, 1 insertion(+), 1 deletion(-)=0D
=0D
diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb=
 b/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb=0D
index eafbb50db4..20a54b1bd7 100644=0D
--- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb=0D
+++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb=0D
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd25=
5951079008b364516c \=0D
 =0D
 DEPENDS =3D "glib-2.0 gupnp"=0D
 =0D
-PV .=3D "+git${SRCPV}"=0D
+PV .=3D "+git"=0D
 =0D
 SRC_URI =3D "git://github.com/01org/${BPN}.git;branch=3Dmaster;protocol=3D=
https"=0D
 SRCREV =3D "1c6853f5bc697dc0a8774fd70dbc915c4dbe7c5b"=0D
=0D
-- =0D
2.42.1=0D
=0D

