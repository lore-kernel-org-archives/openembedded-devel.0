Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4960BC369A1
	for <webhook@archiver.kernel.org>; Sat, 12 Apr 2025 04:17:25 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.4483.1744431440859553222
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Apr 2025 21:17:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bc4gKvsF;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b03bc416962so1918115a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 21:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744431440; x=1745036240; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MS/pUX9pLbpaifev9LFbnc0Srb59A0Gzo5nj5TaiPUE=;
        b=Bc4gKvsFoN19sVFPvbaw0imPROWFKmgQLh9QBvbm9Vo43drHIC1heQSDZE6Ih78Jvn
         2wdME5PzGIT+6uWOs5vsKO6MNbZ+EK3TrLSPTo+kCBTMeFPLQeNdIkOHyzTZrJ8IcfSB
         Wkj0Pn1Wn01i18pSQfS6rvmCdxjBH011tfkKdDt8zswsmiknF/idwh4Z23qnl9zuu9PB
         p42Ahex18Xd0Ka1FzIfUbbdtNxQDGO+Ozx8QMDtuQefZmtC1mYGc5mObSOWrpRZmO3qU
         S17sZGbBy7lQM5I8FU0++EtowDabGLqXYnz5j9eBHeqw5cknDunymEapnYZ+4Z/DykZ0
         72ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744431440; x=1745036240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MS/pUX9pLbpaifev9LFbnc0Srb59A0Gzo5nj5TaiPUE=;
        b=dsrOyuTq7IJE+nPlgXhVJ8A7zuuupig8MdK22CsOEytWbmb2GRZjb16hyf+4ZpUoyQ
         NfQYY6cIAAjAvljRVe9SjyMA4JWUB8oqFttxMYuGkdBKTNaiuvulZVTNLVltRfM3VQBr
         CoYjWFcCgYeDZoCTRVQLERtyxKonOL7E8Xybvv1ebk5GpYRZIY2wYOxuT5OvQE3C49TP
         Hg553CYHpYWl77sQ+SWwsjoOYkRdSyK1O7YHP7xHQ8lHR5cvx0ZVnSaGlu1yaifRqPFR
         0O1zgwTFqRYo5sI7bbPCw6ek+srN2ZZy2bhHV7A363CBDGjEjjL97gdxrTbb3jUopkUf
         1TwA==
X-Gm-Message-State: AOJu0Yzm6vB0YwOLGwY5MzoQQ0jZCax0uetccK2qopKJsqRbVqBy2202
	6IqXQfmpA9ybBp+BKTnQcdCESFMfiS2lLHmvs0+GEC7eFCR5t/EEVpu6V0P4
X-Gm-Gg: ASbGnct4dwc20PwZlJDc+PcQRt+Z58iC9dSYn0DHNRDrJ0oLbbOo8Qjg8+c6VGuhCdX
	3bXxCj//j+1O+nXqVKFCc2qCScembGI3DSfvT9nlUVIwh9pqjVMFCcJ6YrjpTTgINWwRAMZJQin
	L1QVBD3YI/+K4nKlLepirZWNCtIUHOMxGqSrK3XGXHZn+CGLZhuyJme9U1aiWwfLOrNBYLWkYfd
	VtUOKa0uxgPMG9qxJ3GL+5JrS3lU4VdiuU3MzMpTpd+hkSEC04GiYUIN+F8vJyxZuqjfAhTb5xi
	ohkzyDZJ1DysbNv44j13YhoX/3KMS1KP
X-Google-Smtp-Source: AGHT+IFi60+OFnq8qEAgDvjoSEJVq5xYyD+/aXiRAyJ/aEJ6zbQRCaF28PGLXY5Ebc3Pa6VTBmuv9w==
X-Received: by 2002:a17:902:cccc:b0:224:6ee:ad with SMTP id d9443c01a7336-22bea4fdc13mr78583445ad.44.1744431440036;
        Fri, 11 Apr 2025 21:17:20 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::7ceb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2198c0bsm2501410b3a.23.2025.04.11.21.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 21:17:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-robotframework-seriallibrary: Switch to PEP-517 poetry build backend
Date: Fri, 11 Apr 2025 21:17:17 -0700
Message-ID: <20250412041717.4076589-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250412041717.4076589-1-raj.khem@gmail.com>
References: <20250412041717.4076589-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Apr 2025 04:17:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116807

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...roject.toml-Replace-install_requires.patch | 31 +++++++++++++++++++
 ...hon3-robotframework-seriallibrary_0.4.3.bb |  3 +-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-robotframework-seriallibrary/0001-pyproject.toml-Replace-install_requires.patch

diff --git a/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary/0001-pyproject.toml-Replace-install_requires.patch b/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary/0001-pyproject.toml-Replace-install_requires.patch
new file mode 100644
index 0000000000..b4a58ca607
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary/0001-pyproject.toml-Replace-install_requires.patch
@@ -0,0 +1,31 @@
+From 29ca728481a275cc46fdf4f32b3aac5706aa0904 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 11 Apr 2025 21:03:43 -0700
+Subject: [PATCH] pyproject.toml: Replace install_requires
+
+install_requires is used with setuptools, with poetry it needs
+to use poetry.dependencies
+
+Fixes
+poetry.core.constraints.version.exceptions.ParseConstraintError: Could not parse version constraint: robotframework
+
+Upstream-Status: Submitted [https://github.com/whosaysni/robotframework-seriallibrary/pull/25]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pyproject.toml | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index be9f51a..0ade7ee 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -24,7 +24,5 @@ packages = [
+   ]
+ 
+ [tool.poetry.dependencies]
+-install_requires=["robotframework", "pyserial"]
+-
+-
+-
++robotframework = ">=4.0"
++pyserial = ">=3.0"
diff --git a/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.4.3.bb b/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.4.3.bb
index c48c3e2cec..7f282c0fbe 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.4.3.bb
@@ -3,11 +3,12 @@ HOMEPAGE = "https://github.com/whosaysni/robotframework-seriallibrary"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ad407cda031a6aaf51a1fecaaa6e7d29"
 
+SRC_URI += "file://0001-pyproject.toml-Replace-install_requires.patch"
 SRC_URI[sha256sum] = "f20befe5c1106dd8ddca9f60a2f18bf5ec7d5f06f6f09a03fa66bae54777e6bb"
 
 PYPI_PACKAGE = "robotframework-seriallibrary"
 
-inherit pypi setuptools3
+inherit pypi python_poetry_core
 
 RDEPENDS:${PN} += " \
     python3-pyserial \

