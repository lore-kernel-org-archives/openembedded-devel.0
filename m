Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F31C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 23:49:52 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11465.1784591392698078461
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 16:49:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=owRLN2Kt;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ca80d708489so2901073a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784591392; x=1785196192; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SiZg9Zn+HiGMEE/R/hS3aGRI/Ritx85FAtv9Ctt0EZ8=;
        b=owRLN2Kt3MQAYl00+/hkb4EKYHyhw9FA1tmIYY1AjEm233UGZr2D8IR66cGtw/DALw
         dOh53ZG28IrnGFqBlWVTQ8VAHdkExloAGPf9eV30s2A7VSXS6IkgOBxqo1HMft+PhfgY
         Fi1UzyCeVEW7Gi1tZDv7uiGtsdGGCcCvNPaVM+fYwLmYjE+fuXb9BsCa1PafACKgCNjr
         27nARmuTydYqQwoj2dREj0BzSBL0YVHg9vt2zjcl05MFOgb64cFjkQauK/+yDSfrO/xP
         u8/dAsgwxW4sDwR2QBiWHZNt8gcEoaigjWuMa1lGAaUBaziKCPHE4Nn0953UfiZ851F3
         U+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784591392; x=1785196192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SiZg9Zn+HiGMEE/R/hS3aGRI/Ritx85FAtv9Ctt0EZ8=;
        b=qc9/NjsEbb01Dido0Z2fx0/2Tm3AkWBJBnJ92klasYLqpOGhOCVReE5EDzhXCZExNd
         jc8xblLReZYbzSfWjf5EXEIWWIsSnLFUBAzev4Zn/7uqDbb/aIw7/zFLXP6FOFkAJPiT
         kqPee9q58w0Fdlg/7JAQmlly1kA78wOSvb5qM9t5xdJx+MYtw1v2HsHGBBME1pkhsZcq
         bneAR+ul3mzonm54xdrSeBb6Aqs7IHhAGqn7sjVfNZWM16Ox9UY5B/gaHoBFJU8ckshM
         F8JLN5OYjL39nHS/ZMnsgKyCcrSt9WoAveq0GN2xHMq9+o2h6AqXNCg5azRtaVb1H/xT
         VCNA==
X-Gm-Message-State: AOJu0YyR9V3SZU1CKNmT2f4L1SJwG46VUgjcArKEL9XvJs/wPTD5IF4R
	88dlz8Kdd/7oAhUTBY/ExQs+xIKImJlLbbVIEQh9XKYJsrObE0SxDW24Xd6Qjg==
X-Gm-Gg: AfdE7ckZjte4hUKVuVpU2eHkZSDT6tgot7wvDbiwb9fzs5nfuHK7ygP2bGV2rxUWKRr
	mkpUJm83WpnRAtwAtpzKvzE7qLmHkfQ1hrzF9rTdcINQ+Qb+SwJ1HI+FW5jGHNqbHUtSndN20dM
	a/wyNSnEHUL0aPt84Fk/9pzVyA8QbDMsTvSX0iwEXyQysLKkj6WcjeEPmB4F2ygZ2CLswoPny71
	i+mo/LQHbtrj4vSrB7TeZ7DBwJ/gpfWabY0E21wqIrLMfQ1tYu8GTGzC3IBjCyBrzaxeK24cvYR
	vvhYLh9O64QGP96dSViICsNPPRXK9x5DzsDBXCtRJNuSdgbXmJbRoZm59jzN2lgDSM1tiISnj1F
	IDO+gtR8Kts3ba2Y+kr0bQ2Va2vK+tEmos76gmwPuDxHelunLNqjefn3dw7q7ep3sMGhD6zECVz
	vQ3SNHGDmx2GayWMI=
X-Received: by 2002:a05:6300:614a:b0:3bf:b625:5bd0 with SMTP id adf61e73a8af0-3c38d90baa2mr22582996637.9.1784591392002;
        Mon, 20 Jul 2026 16:49:52 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe1014sm40076059eec.7.2026.07.20.16.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 16:49:51 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 1/2] python3-django: upgrade 6.0.6 -> 6.0.7
Date: Tue, 21 Jul 2026 11:49:43 +1200
Message-ID: <20260720234944.2410601-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 23:49:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128333

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://docs.djangoproject.com/en/dev/releases/6.0.7/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-django_6.0.6.bb => python3-django_6.0.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_6.0.6.bb => python3-django_6.0.7.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-django_6.0.6.bb b/meta-python/recipes-devtools/python/python3-django_6.0.7.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-django_6.0.6.bb
rename to meta-python/recipes-devtools/python/python3-django_6.0.7.bb
index a96a6dbf53..4542485154 100644
--- a/meta-python/recipes-devtools/python/python3-django_6.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-django_6.0.7.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "ad03916ba59523d781ae5c3f631960c23d69a9d9c43cecda52fc23b47e953713"
+SRC_URI[sha256sum] = "2998503fc083124fb58037084bfa00de323c7c743f05f1b4284e77bff0ab8890"
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 6.x branch,

