Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 116A4C54734
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 13:44:33 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.78790.1724766266138506423
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Aug 2024 06:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bYebXYhA;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-428119da952so49118615e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Aug 2024 06:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724766264; x=1725371064; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VhODa63cgEK4jFeJYSYT3xDbaStrd9l4tltw4eb3s5I=;
        b=bYebXYhA8DTegbpIU937xLet7go9IlCC3a2uXpMrEDT7MiL4XTTfWCkGHuDxwrCcUL
         wg7KD2f08V9RkfbZlw1ahGMdUjXM9d9kPJeRKGzq8u/iUB+Krg4VUAd9/Bb/S1lSgNAG
         TgV6v7Lx8qymRLI8zMxvvJq6qAgSSNzhDkh8mdolRkFHBd6ItS+8ea5rXdNBfIj2Cpmf
         0DEPvcvratEtk1tiNLRBSNYAgFeyFaNwqAiC4b8XGu1mf4dpBG+nowEc4F2b4mPaLGVT
         Bz7QU4L43U3kp2fgmVStvnhHkIsV+Svy0eVq02ukPzxIFnxbgCm6L/9ASR9eCYID2fAN
         EViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724766264; x=1725371064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VhODa63cgEK4jFeJYSYT3xDbaStrd9l4tltw4eb3s5I=;
        b=jvU7Knnra3f1yPH6fahxsNeNW02rwfb82S1vQWnh8Oke/xNzCMFZhtsShE1ALcVBAY
         XyNsFxdKmvPPMXeQ5UrzCuMezcAo8saUhk3Nu1krR0hT1DRF5O9nRsa0qlZ75BA06UZZ
         JJFuqCwGKsyO7Jzf95ZyJoxCbNowEIga477ZfMsQk9tlslUsaXNFxDWuEj3xLJ1dfkiS
         UEPc+Kn5tcVAF+8APCc/ZdIfs5Ua+iW7qY3BGUSXo/wKkZUjsF2o8YsGD1O36TFy4+3B
         2mfOMLfjJxek2D58HlOCIIp2ZqYa4/3uEwYPZrgebIxjOeS1eLq9v6xTtUxaFzjTQO3x
         2E3Q==
X-Gm-Message-State: AOJu0YzHylUcMYs3kAXMa4Xs6KMfOu4AAsyxb3h1ovnD2LvUos3Iw1o4
	VaSQZKVNjqfadl23NabE9+Sj/RaWiM/jAdTYW3/0+I6MxOhrhXMPx1T+RQ==
X-Google-Smtp-Source: AGHT+IFxqF45wBUjII6OWhZr3zSb0LJ1TnnJp3WWdrVv64y2Cvi+LHF0PzSCID0pO5BTJiLzdU2QHQ==
X-Received: by 2002:a05:600c:a4b:b0:426:6edb:7e14 with SMTP id 5b1f17b1804b1-42acca00b7cmr84860915e9.35.1724766263948;
        Tue, 27 Aug 2024 06:44:23 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac517f9basm185248255e9.39.2024.08.27.06.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 06:44:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] vdpauinfo: require x11 in DISTRO_FEATURES
Date: Tue, 27 Aug 2024 15:44:17 +0200
Message-ID: <20240827134417.4022710-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Aug 2024 13:44:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111977

It depends on libvdpau and libvdpau has:
inherit features_check
REQUIRED_DISTRO_FEATURES = "x11"

since:
commit 0055684612edddae0f041e984c8497c5e5b32e74
Author: Armin Kuster <akuster808@gmail.com>
Date:   Tue Mar 6 17:27:30 2018 -0800
Subject: libvdpau: only include when x11 in DISTRO_FEATURES

the same restriction should be repeated here to avoid:
ERROR: Nothing PROVIDES 'libvdpau' (but meta-oe/meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb DEPENDS on or otherwise requires it)
libvdpau was skipped: missing required distro feature 'x11' (not in DISTRO_FEATURES)

Also add it to packagegroup-meta-oe and fix libvdpau there.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
 meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb            | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index d6d8cfd32b..71fb1c2ac8 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -606,7 +606,7 @@ RDEPENDS:packagegroup-meta-oe-graphics ="\
     ${@bb.utils.contains("DISTRO_FEATURES", "x11 pam", "tigervnc", "", d)} \
     tslib \
     unclutter-xfixes \
-    libvdpau \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "libvdpau vdpauinfo", "", d)} \
     xcursorgen \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11 pam", "xscreensaver", "", d)} \
     yad \
diff --git a/meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb b/meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb
index 99afe74507..3f44e537a4 100644
--- a/meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb
+++ b/meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb
@@ -6,6 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5b6e110c362fe46168199f3490e52c3c"
 
 DEPENDS = "libvdpau"
 
+# libvdpau is available only with x11
+inherit features_check
+REQUIRED_DISTRO_FEATURES = "x11"
+
 RDEPENDS:${PN} = "libvdpau"
 
 SRCREV = "d3c5bd63bf8878d59b22d618d2bb5116db392d28"
-- 
2.46.0


