Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F349AC0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 11:41:05 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.10498.1738150843990228137
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jan 2025 03:40:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kzhJ4Saq;
 spf=pass (domain: konsulko.com, ip: 209.85.221.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso3996865f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jan 2025 03:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1738150842; x=1738755642; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BebjJCupH84XsGH4AZ/RxD5d/Y1TbvlT52PU+DXz+UM=;
        b=kzhJ4SaqmrpYO0lWqOzr4t3BPoO2Kreh2sysqWlS0+foYnnLHvGj6OEwtpvm24aXJx
         myUDUvaMY19NI4N87lQjY1lD6HIu4eouZjnysfjnDBcPN+H6pCEdrmoJn4SHcgbAsKzO
         s5pltUjbxHjVjdV5IKJnjZFk/ze8Bn5fwY3Fg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738150842; x=1738755642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BebjJCupH84XsGH4AZ/RxD5d/Y1TbvlT52PU+DXz+UM=;
        b=ms6ok17DkY13c2fBadprHkDaoVHSp7pSQxYBzqTW/G1iJ6Tw3a+gJoaxSJFJkcB6ou
         SFZYomKQC5M6fx2nuUxmTkfXNFIjxkeuFy5wDhHGznRSUzZXkchRseiOepCKVgpU/TdC
         3RMHkw2RIVZofypWIKFxq8ZDhUm3RZ8gQuB+AByPCTa0VXbqSrSZeEXOq+RYHgj7VR/L
         aXxzTO8kwnQawbCPlEscD3DiMpH1gBXET4Bgr0fVxnTdY8N5c/E2Vfs4ER4WgUuDIjXA
         R+tUxJi2PV3bNk0cZooB6UxCedAEUpgu3SPjIZUIYiW7rFv7roLRMzfndNxDqkfYqp08
         wBpQ==
X-Gm-Message-State: AOJu0YxTcaJNZv+w5jgpK4gvQ/atiM8Rs4im3hvmGAWndgzrSF9bpqKK
	+QXrwlOJ0DtryqPedbXLY/ShO98cBOtX4y9opRXdNRCVlMj6FUXJECcOdmyLZDbExoEG7sieLa2
	K
X-Gm-Gg: ASbGncssETmXXV4yNuaq3tEyEXp+aApaDGXxK+Z3tMc8VeF3gBbDD5Cxj8Ig2ImMtmH
	oxE89PWzvaB8+X0G8vxt+U/Q1I0/gT0MN5ePrTNrxXXCg3FTkb2KfxxhEJgupRyGAuCRvuZEmmf
	MJL/hjbv4H5JE0s7Rgk+rr99xhxzj2DNb2s6zYxEbpg5xSaw9oc75JSGfJbyKO+O06/mlpbGtj1
	tbMkWpmY6Z56o8JxLuhj8PhKRRJW+jkL0/3k7MxLFh/GhL11g49pwC624CFMKdqjJXmMPRm4JE4
	NLYCEn1oaaz7JjnyM+KDKzQiXdDWDQ==
X-Google-Smtp-Source: AGHT+IHUDpK53Ff3CaMD9C/gpawgZn1TiEE9Bfsf7WFRTGH/ZziT4ovazmgtmBykLc6eT2bo6Gb71A==
X-Received: by 2002:a5d:4904:0:b0:387:8752:5691 with SMTP id ffacd0b85a97d-38c520b964emr1623934f8f.47.1738150842123;
        Wed, 29 Jan 2025 03:40:42 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a176449sm16982283f8f.11.2025.01.29.03.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 03:40:41 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>,
	Stephan Kulow <stephan.kulow@siemens.com>
Subject: [meta-python][PATCH 1/7] python3-scikit-build-core: Use PYTHON_INCLUDE_DIR
Date: Wed, 29 Jan 2025 13:40:33 +0200
Message-Id: <20250129114039.3562870-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jan 2025 11:41:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115131

Add a patch to use PYTHON_INCLUDE_DIR to find Python Interpreter
and Development.Module as suggested by Stephan Kulow:
https://github.com/scikit-build/scikit-build-core/issues/952#issuecomment-2554058930

This work was sponsored by GOVCERT.LU.

Suggested-by: Stephan Kulow <stephan.kulow@siemens.com>
Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-builder.py-Check-PYTHON_INCLUDE_DIR.patch | 32 +++++++++++++++++++
 .../python3-scikit-build-core_0.10.7.bb       |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-scikit-build-core/0001-builder.py-Check-PYTHON_INCLUDE_DIR.patch

diff --git a/meta-python/recipes-devtools/python/python3-scikit-build-core/0001-builder.py-Check-PYTHON_INCLUDE_DIR.patch b/meta-python/recipes-devtools/python/python3-scikit-build-core/0001-builder.py-Check-PYTHON_INCLUDE_DIR.patch
new file mode 100644
index 0000000000..13cb7b1e7f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-scikit-build-core/0001-builder.py-Check-PYTHON_INCLUDE_DIR.patch
@@ -0,0 +1,32 @@
+From 5bc2d175c6a31a3de04444e5e22af310799ab10d Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Mon, 27 Jan 2025 19:17:48 +0200
+Subject: [PATCH] builder.py: Check PYTHON_INCLUDE_DIR
+
+Use PYTHON_INCLUDE_DIR to find Python Interpreter and
+Development.Module.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Suggested-by: Stephan Kulow <stephan.kulow@siemens.com>
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ src/scikit_build_core/builder/builder.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/scikit_build_core/builder/builder.py b/src/scikit_build_core/builder/builder.py
+index b19173f..f4fb2af 100644
+--- a/src/scikit_build_core/builder/builder.py
++++ b/src/scikit_build_core/builder/builder.py
+@@ -203,7 +203,7 @@ class Builder:
+         python_sabi_library = (
+             get_python_library(self.config.env, abi3=True) if limited_api else None
+         )
+-        python_include_dir = get_python_include_dir()
++        python_include_dir = os.getenv("PYTHON_INCLUDE_DIR") or get_python_include_dir()
+         numpy_include_dir = get_numpy_include_dir()
+ 
+         # Classic Find Python
+-- 
+2.39.5
+
diff --git a/meta-python/recipes-devtools/python/python3-scikit-build-core_0.10.7.bb b/meta-python/recipes-devtools/python/python3-scikit-build-core_0.10.7.bb
index 7c6c9ddda3..4df47c3c5d 100644
--- a/meta-python/recipes-devtools/python/python3-scikit-build-core_0.10.7.bb
+++ b/meta-python/recipes-devtools/python/python3-scikit-build-core_0.10.7.bb
@@ -9,6 +9,7 @@ DEPENDS = "python3-hatch-vcs-native"
 
 inherit pypi python_hatchling
 
+SRC_URI += "file://0001-builder.py-Check-PYTHON_INCLUDE_DIR.patch"
 SRC_URI[sha256sum] = "04cbb59fe795202a7eeede1849112ee9dcbf3469feebd9b8b36aa541336ac4f8"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


