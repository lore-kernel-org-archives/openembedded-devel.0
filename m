Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C471C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 11:09:03 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.8053.1699355335307664796
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Nov 2023 03:08:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=adTpc7CY;
 spf=pass (domain: konsulko.com, ip: 209.85.208.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-53e04b17132so9132786a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 03:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1699355333; x=1699960133; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKjIQRa4Pgnao86gnZRcFaCK+xmq8G0JcLNw4ffJuU8=;
        b=adTpc7CYpuwpyauY0KS3vJIMDb8OHhiJ2+D8ZJqQpXQPqa2JoFACWCIESsifUgKRCY
         GzrbO/yejO5ehrhm+5lCgQgmd500XEVxTOgh28XUCYt1D/qEbbQ+imp6HhDDrHOV2WnH
         9uI4L3/r8NThaQTxtksECh4RZpzE6Yap6A8D4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699355333; x=1699960133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qKjIQRa4Pgnao86gnZRcFaCK+xmq8G0JcLNw4ffJuU8=;
        b=jftbCMqyTyBUWMMh8CDGJo0GKbz4VSDGrUCAGB9Ya3DRPpAXgTKS8Ea6waVG2WnxzA
         I//pTY0JYD39Gfaa0Axcoxo9IbSeNZ95VuTkq+t5/74Q0zpjXwcPQbU615swbkMnUZXj
         1/hu4Z/KvClwbdlYdj7QGBQ/9+qFZjRsG/J+Kl+jfqQOWKpKJCRblcTulqr4W+Q+jYKP
         vJIy4PT9PTxh5hZ1rYetaIjai3UMzU3KHgFg8q1rc1mpu+k4ZdHYj+gHguhYSbtJZESV
         taXX4AttM9xutkB3Rpgi2+jfgvAyLKWvznm4p3GDz2UQ784R8o6cnGRaTLB670P+X1Xv
         /a/A==
X-Gm-Message-State: AOJu0YyqJEZ3bMCitvgkBOTGGuPIQ6bc1is94FlazEVNn29H4Vku2kO6
	7/vvMrr0yIkhT1I6SSn5hisZBtBAf4E2HFjXtro=
X-Google-Smtp-Source: AGHT+IHtTTG3VVi368jwKKZhJRPL/bsLlEBLGWX12h5SrYN48+82rAA0lkIP6MD17wytmoqfdLTsXQ==
X-Received: by 2002:aa7:cb16:0:b0:526:9cfb:c12 with SMTP id s22-20020aa7cb16000000b005269cfb0c12mr24777446edt.38.1699355333605;
        Tue, 07 Nov 2023 03:08:53 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 29-20020a508e5d000000b0052ffc2e82f1sm5515763edx.4.2023.11.07.03.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 03:08:53 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-jsonref: Upgrade 1.0.1 -> 1.1.0
Date: Tue,  7 Nov 2023 13:08:48 +0200
Message-Id: <20231107110848.1610779-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231107110848.1610779-1-leon.anavi@konsulko.com>
References: <20231107110848.1610779-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 11:09:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106449

Upgrade to version 1.1.0:

- Fixes documents where the root is a reference object not being
  cached
- Allows a reference object to refer to a fragment within itself
- Extra properties of a reference object will now have references
  resolved

License-Update: License remains the same

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../files/migrate-to-pdm-backend.patch        | 27 +++++++++++++++++++
 .../python-jsonref/python3-jsonref_1.0.1.bb   | 16 -----------
 .../python-jsonref/python3-jsonref_1.1.0.bb   | 23 ++++++++++++++++
 3 files changed, 50 insertions(+), 16 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python-jsonref/files/migrate-to-pdm-backend.patch
 delete mode 100644 meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.0.1.bb
 create mode 100644 meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb

diff --git a/meta-python/recipes-devtools/python-jsonref/files/migrate-to-pdm-backend.patch b/meta-python/recipes-devtools/python-jsonref/files/migrate-to-pdm-backend.patch
new file mode 100644
index 000000000..805d9edce
--- /dev/null
+++ b/meta-python/recipes-devtools/python-jsonref/files/migrate-to-pdm-backend.patch
@@ -0,0 +1,27 @@
+From 1b594cf12e5a69aa25f49f532c1201a6b39e280d Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Tue, 7 Nov 2023 10:43:32 +0000
+Subject: [PATCH] Migrate to pdm-backend
+
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ pyproject.toml | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index f549376..c608213 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -36,7 +36,5 @@ includes = [
+ profile = "black"
+ 
+ [build-system]
+-requires = [
+-    "pdm-pep517>=1.0.0",
+-]
+-build-backend = "pdm.pep517.api"
++requires = ["pdm-backend"]
++build-backend = "pdm.backend"
+-- 
+2.39.2
+
diff --git a/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.0.1.bb b/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.0.1.bb
deleted file mode 100644
index 5b842a462..000000000
--- a/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.0.1.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "jsonref is a library for automatic dereferencing of JSON Reference objects for Python"
-HOMEPAGE = "https://github.com/gazpachoking/jsonref"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a34264f25338d41744dca1abfe4eb18f"
-
-SRC_URI[sha256sum] = "51d3e18b83ca7170ff51286a0e1a6719d8b7fcc7abdb16b189395a8536996b97"
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND = "native nativesdk"
-
-RDEPENDS:${PN} += " \
-	${PYTHON_PN}-core \
-	${PYTHON_PN}-json \
-	${PYTHON_PN}-netclient \
-"
diff --git a/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb b/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb
new file mode 100644
index 000000000..fae1da268
--- /dev/null
+++ b/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb
@@ -0,0 +1,23 @@
+SUMMARY = "jsonref is a library for automatic dereferencing of JSON Reference objects for Python"
+HOMEPAGE = "https://github.com/gazpachoking/jsonref"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4ac1cccee5d43e11fc4eddcf445be64a"
+
+SRC_URI[sha256sum] = "32fe8e1d85af0fdefbebce950af85590b22b60f9e95443176adbde4e1ecea552"
+
+SRC_URI += "file://migrate-to-pdm-backend.patch"
+
+inherit pypi python_setuptools_build_meta
+
+BBCLASSEXTEND = "native nativesdk"
+
+DEPENDS += " \
+    ${PYTHON_PN}-pdm-native \
+    ${PYTHON_PN}-pdm-backend-native \
+"
+
+RDEPENDS:${PN} += " \
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-netclient \
+"
-- 
2.39.2


