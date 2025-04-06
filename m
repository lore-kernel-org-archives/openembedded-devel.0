Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D94EC36002
	for <webhook@archiver.kernel.org>; Sun,  6 Apr 2025 22:07:34 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.34242.1743977252202876204
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Apr 2025 15:07:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1EzcjVkj;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so37444975e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 06 Apr 2025 15:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1743977249; x=1744582049; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/JDgvHY48Tibu5gD2m2oeKA/+APjbXe201XOkelG2T8=;
        b=1EzcjVkjjTQFH2yDdDoX0yBbkj2aT2c44FWz5M22WEkfrq93MBi7K2z8EJQ1PQnPd1
         LPKuaHfSp3EAarTPnlMbx19ppo5ykZV6VgmNjV2hD1YvMsrcQuY58oqjPt+UgycGAYTA
         f3LyQYeu6Fsjg7PSnohy6AsBv0ohQTTb8+BwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743977249; x=1744582049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/JDgvHY48Tibu5gD2m2oeKA/+APjbXe201XOkelG2T8=;
        b=vEMB5Ey3Ie/YyzltndrbWS2u16b6slfoTZvoviibUT0zWfl/BDeOf0U9Tp8hUvlbkK
         tf8TKoCVic5gwEYPdbhyhnFp3Q/qJt/J6a+zJJXwdiLZXreRxHSileK6QgWCgCzr6W3J
         NYYd8JG9nDSSuVNJKL+oi2nsHQISusVFcaqSTgE+IIPLXPU3vYvXlFfSEiBOPYNj+AfO
         tdle1t+wt9zV6brkHg7GNGNfp4MmHFRlPOhjWmleDCX4s9y6NepzOx3kxGJ9duOLEBOY
         YBo9rL0tRrpHL3oR04eWezpex+wr0x055nFlVqv9LHvQaMTgT09fj5N17ko8PcpgzF+D
         CuAQ==
X-Gm-Message-State: AOJu0YwbbrTZf2JZ3/BZJ9DZ8074Li0Ep862S6/6cowZtxYbQ5GNNph5
	34BjlS2GwcSvq6gRmSJfI4LRO7f1/mN+l9lXq8PEwbm4aV2gw/tkTOzCykMAjWg2dpFrqmngN0p
	zM5DMGA==
X-Gm-Gg: ASbGncuzzrk4Ft+7ZG8XRmPTAoFB6C6AgOqaaj7Or4Noh45nPO51hJTHzhXEUNLIr5d
	zkaZMTBoGUd7vFoIVAtEmSFfMVvfsAC3CvluuGdfBshUS2SUb4/sFfEkqyVx9mve7PjKbKV21ai
	KkPgZ4gHznJyBQP4biN9/f0VsGjAAXMIVbt338XLkyRZsYzO9oMM6i66pf++A62cjHRC3y4qbJN
	iKn1QG93RoVA4Ubr24vncuQxUh297brb017IZo/WS6kFcakFelmP+KpitgQVMVk0BXgQBk8MeZA
	vRxd6QyHN+MPIHhoSapZlF+H/h6mVv3zKuYnalUP1LmfnSo+zjsqQ5nyllJBmY+ZFs9vaHX5piI
	93t1kyjahFYWN2jPyAX6z90ytE4CdzqdKN4c8fyfMFZssIi02ugY5HZz0cYCnUw==
X-Google-Smtp-Source: AGHT+IGaoDee4F515QNrESVqqLsxKJqLiPQ0SasmgDuGSZGZbxKgQVzFU+frzOCrnC4LlMQSxXQ+WQ==
X-Received: by 2002:a05:600c:1c07:b0:43d:45a:8fc1 with SMTP id 5b1f17b1804b1-43ecf84287dmr98030575e9.4.1743977249491;
        Sun, 06 Apr 2025 15:07:29 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb000deef00022a9cf8b2e22df36.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:22a9:cf8b:2e22:df36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16ba978sm114920465e9.23.2025.04.06.15.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 15:07:29 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-gnome][PATCH] gimp: Remove default dependency to libheif from meta-multimedia
Date: Mon,  7 Apr 2025 00:07:22 +0200
Message-Id: <20250406220722.26730-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Apr 2025 22:07:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116613

From: Yoann Congal <yoann.congal@smile.fr>

meta-gnome does not currently depend on meta-multimedia.
When "commercial" is in LICENSE_FLAGS_ACCEPTED, gimp depends on libheif
by default but libheif is in meta-multimedia. That leads to build
failures, for example, in the reproducible-meta-oe AB build[0].

To fix this, remove the default "heif" PACKAGECONFIG.

To enable heif support in gimp, users can add "commercial" in
LICENSE_FLAGS_ACCEPTED and add meta-multimedia to their build.

[0]: https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/39/steps/16/logs/stdio

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>

---
PS: Another fix would be to make meta-gnome depend on meta-multimedia but
that seemed quite intrusive for this feature.
---
 meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb b/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb
index 3c83b2ee3a..b1e61bf4ec 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb
@@ -96,7 +96,6 @@ PACKAGECONFIG ?= " \
     mng \
     webp \
     ${@oe.utils.conditional('SITEINFO_BITS', '32', '', 'vector-icons', d)} \
-    ${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commercial', 'heif', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcursor', '', d)} \
 "
 

