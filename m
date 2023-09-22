Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 527CBCE7A86
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 22:24:58 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.10153.1695421495766420193
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 15:24:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: straka.derek@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6562395dfcfso14182976d6.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 15:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695421494; x=1696026294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z0qEFLMzyimXC9zdUzeA3Ch0U9m6Vc4DKNK7yShadS0=;
        b=lCnfD6peDJ2zGtSfHhmjJSr277zaac9WJ+lCh4sdEgM58SCVwjXMxWvHC38BcN33IY
         vKlgUpJjAVBbucQN4jN//Zw2DRqB6ZNuXa2L5qcTnYydaspM/t4Z+vOd808kPmNP64II
         OAaIsxGlnhdEYXMvxyhG75zWb+y4o1FOKCmmYTMGPGCvYsNTATvS4I/Z00Q1Nu1rBxfA
         5WL9SFE4kJ6RhREAj7TbjDabuIkf32s9vsxd7GOEZlzL9IriObDUoPlNsTha1XyqkhU3
         IKOVZhWf96UC7ooop6cpPKmos4Hl8PuF4GJA1hFSmMZ0e3EcvWbdxVxGG4tlGOEELmrT
         KzAQ==
X-Gm-Message-State: AOJu0YyUBBJ7mNGDTuUedo+6brXQkrZosroD0Ojam53c4tjF/OPqJxys
	HOozC2nj6mbfdLBMnhUJLTGlx6ycarV6qg==
X-Google-Smtp-Source: AGHT+IEwwokUAXBXHv1GfaV++jUM2N340h39D1dT+uDLlk0eHcDh+QccwBNFWF/FxTlSGq1KGMDyng==
X-Received: by 2002:a05:6214:2502:b0:659:180c:38a0 with SMTP id gf2-20020a056214250200b00659180c38a0mr810438qvb.7.1695421494430;
        Fri, 22 Sep 2023 15:24:54 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id w6-20020a0ce106000000b0064f50e2c551sm1801779qvk.1.2023.09.22.15.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 15:24:54 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-posix-ipc: Update version 1.0.5 -> 1.1.1
Date: Fri, 22 Sep 2023 22:24:43 +0000
Message-Id: <20230922222443.3161561-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 22:24:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105079

Verified LICENSE remains BSD-3-Clause (Copyright year updated)

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-posix-ipc_1.0.5.bb             | 15 ---------------
 .../python/python3-posix-ipc_1.1.1.bb             | 11 +++++++++++
 2 files changed, 11 insertions(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-posix-ipc_1.0.5.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-posix-ipc_1.1.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc_1.0.5.bb b/meta-python/recipes-devtools/python/python3-posix-ipc_1.0.5.bb
deleted file mode 100644
index d66ef0e3c..000000000
--- a/meta-python/recipes-devtools/python/python3-posix-ipc_1.0.5.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "POSIX IPC primitives (semaphores, shared memory and message queues) for Python"
-HOMEPAGE = "http://semanchuk.com/philip/posix_ipc/"
-SECTION = "devel/python"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=dc089fb2f37e90799a54c19a20c9880f"
-
-PYPI_PACKAGE = "posix_ipc"
-
-# Archived version so we need to overwrite what the pypi class will derive
-PYPI_SRC_URI = "https://pypi.python.org/packages/source/p/${PYPI_PACKAGE}/${PYPI_PACKAGE}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "8c9443859492ecf3aae9182aa6b5c78c"
-SRC_URI[sha256sum] = "6cddb1ce2cf4aae383f2a0079c26c69bee257fe2720f372201ef047f8ceb8b97"
-
-inherit setuptools3 pypi
diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc_1.1.1.bb b/meta-python/recipes-devtools/python/python3-posix-ipc_1.1.1.bb
new file mode 100644
index 000000000..a71187399
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc_1.1.1.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "POSIX IPC primitives (semaphores, shared memory and message queues) for Python"
+HOMEPAGE = "http://semanchuk.com/philip/posix_ipc/"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=513d94a7390d4d72f3475e2d45c739b5"
+
+PYPI_PACKAGE = "posix_ipc"
+
+SRC_URI[sha256sum] = "e2456ba0cfb2ee5ba14121450e8d825b3c4a1461fca0761220aab66d4111cbb7"
+
+inherit setuptools3 pypi
-- 
2.34.1


