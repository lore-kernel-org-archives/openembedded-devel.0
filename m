Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1370FC3DA49
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 17:24:32 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.473.1721323467048877066
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jul 2024 10:24:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nbnuaacW;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4257d5fc9b7so5813345e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 10:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721323465; x=1721928265; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MH/4fCfxyIxv6jjD51r6imb0YdWowpQMcHObu0stOic=;
        b=nbnuaacWJH43dIMRlDcRG/wT5KPQ1or3EgR5egC1OrJ/eR555Fu+6pQOQc6ueLTnKN
         0WhSZeKy/nOIdvGAOPQRH865+HMeRojoUvd4XcQazRvNvAB87pJCBVdw06KOQJ9LmO14
         kPV5ct4vNLkqlApIgC22LpzQayVmWR84UU2CxQN5w1pZtLxfIKCDKRih+AT10A3bdwVe
         irTWGA8A8rfchVMYIhW1APcE8Ilg4fXoD3n5dkJhWczSg0IED22fbdr3G9+ALBielSw9
         m56yr0zZTQUeIZAZnVdAQ3enbM+uJemaK5jCQY/YCrDPDYMTkMXbxG79E3yw0y2gYbAM
         B5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721323465; x=1721928265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MH/4fCfxyIxv6jjD51r6imb0YdWowpQMcHObu0stOic=;
        b=jMTIF9eBzxYve7FNLKa52SYlRm/8ck5+rIIO2kxkiS3Se6SICZwmhkzL1o6Sbk7AEB
         Qyuu1JGG89TT6ObeRYcsN8avBKn6EYOecCPmlui08Iqo+7uPlwvbwywgy2lNF12lKRK1
         8pVGqgAFkBdh8i4d0EvoO/PzFFbCxhUkhME2bF1wnreh5ziOLv4g+C1uTxq5RkXnXeY6
         rVIt89gweTRPoxCgZrLQKlhuoR2fk/IoOBJCIFBoitLOKmTNIZn1/FBTiyanxqWZbKQD
         hJ464qInjtf+JsB9bGBp3r2zS6przDGrzx/kMU7LgxjOcbqEtyqny9KEEbNC8faK5WVG
         Kx3g==
X-Gm-Message-State: AOJu0Yzcq4fST5SknCVTQOr/Xu7tm2c6nDz44b/BabBk3SyhcpIeSqWt
	nTXrOycvH0oRxbxzHs+6wqNiMQwtfz55mBIdq17e880Q3qoUNa2S4Vva4Q==
X-Google-Smtp-Source: AGHT+IEMQqJBfhOJFMmVMQPukTbvKGN/K3UU09gVegPnzJsS8GM0htAItVHIgJyM8mIIiIC1B1ZJaA==
X-Received: by 2002:a05:600c:3544:b0:426:6822:5aa8 with SMTP id 5b1f17b1804b1-427c2cc8481mr48870885e9.18.1721323464931;
        Thu, 18 Jul 2024 10:24:24 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d2b1825asm21057095e9.15.2024.07.18.10.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 10:24:24 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [meta-python][PATCH] python3-incremental: improve packaging
Date: Thu, 18 Jul 2024 17:23:21 +0000
Message-Id: <20240718172321.412136-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 17:24:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111405

Summary of changes:
1. Create a new package: python3-incremental-tests
2. Create a new package: python3-incremental-scripts. This is an optional
package used to update Twisted locally on the command line. The package
requires python3-click. Most, if not all, users don't need this package.
3. There is no longer a circular dependency between python3-twisted and
python3-incremental at build time.
5. python3-incremental ipk package shrinks from 167 KiB to 32 KiB

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 .../python/python3-incremental_22.10.0.bb     | 27 ++++++++++++++-----
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-incremental_22.10.0.bb b/meta-python/recipes-devtools/python/python3-incremental_22.10.0.bb
index 503ef35a9..007be032f 100644
--- a/meta-python/recipes-devtools/python/python3-incremental_22.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-incremental_22.10.0.bb
@@ -7,13 +7,28 @@ SRC_URI[sha256sum] = "912feeb5e0f7e0188e6f42241d2f450002e11bbc0937c65865045854c2
 
 inherit pypi python_setuptools_build_meta
 
-RDEPENDS:${PN} += " \
-    python3-twisted-core \
+PACKAGE_BEFORE_PN = "\
+    ${PN}-scripts \
+    ${PN}-tests \
+"
+
+FILES:${PN}-scripts = "\
+    ${PYTHON_SITEPACKAGES_DIR}/incremental/update.py \
+    ${PYTHON_SITEPACKAGES_DIR}/incremental/__pycache__/update*.pyc \
+"
+
+RDEPENDS:${PN}-scripts = "\
     python3-click \
+    python3-twisted-core \
+"
+
+FILES:${PN}-tests = "${PYTHON_SITEPACKAGES_DIR}/incremental/tests"
+
+# The tests require unit testing tool 'trial' from the twisted package
+RDEPENDS:${PN}-tests = "\
+    ${PN}-scripts \
+    python3-twisted \
 "
 
-# -native is needed to build python[3]-twisted, however, we need to take steps to
-# prevent a circular dependency. The build apparently does not use the part of
-# python-incremental which uses python-twisted, so this hack is OK.
-RDEPENDS:python3-incremental-native:remove = "python3-twisted-core-native"
 BBCLASSEXTEND = "native"
+
-- 
2.34.1


