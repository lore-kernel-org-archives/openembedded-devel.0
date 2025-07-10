Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EBA8C83F17
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 17:39:00 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.1133.1752169139369517623
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jul 2025 10:38:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MMpTkbwe;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-555163cd09aso972087e87.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 10:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752169137; x=1752773937; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLD4Crmkcv63Sp7Jk46k5AHxrlMZNLYqVt5Ct+TAnio=;
        b=MMpTkbweyw8JkRpJ+5IBwSzEfUWCPxh7IrAmYg3bvt6bAfVUBxcIR6I9Updgdz/vZK
         O2RcX52YbCQk20uWS7vWKrhT0Mw7ahOc34OcwYlluWnyNAMsvJjsrvtKy8yoIUIBFEYr
         /ZUWSMbMD34RvJ2HWUA2dWLwCgbdmHOn82r6QdxMDdpca7rBaTzuszU5BPEONX09RUP/
         BsLf9oCD2j3CPh2xNDGUXVZMYWCXLIcDXL2FCWk3HBDj7UxaC29tSeeAbdMe6wj/boO5
         4aYLi4ogJnTv/Ztu/jV9hfSFL4Ju46G04KzATsWIfeAOxIxGEcEoWrcnfQqnUSxXCY69
         8ueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169137; x=1752773937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLD4Crmkcv63Sp7Jk46k5AHxrlMZNLYqVt5Ct+TAnio=;
        b=FeQvulaCZY5MCTT31P7OgpUzRJdDiY+BEeltJf8Mk+KAewGSlDWaX4kkhnRV+81pPv
         fL8xdOef0yrlkv+wb9cMrvStpC2iEtaNIWAAeXqVa2NwWmHfov2gvzTACBjFAIln5Dy8
         NGzbwiLT/Ndnbwp3vRTCHHWYFNIBs4W7Ql4C0LNwsatxJ+3zke4QjtSKM9a3WYMyxf8Y
         rnTSp8zawPtgpO6m4kz/3Xnmoh7d6OldfxuAb9c9Fo2zhAxIMHJKkXFvKeUSYbHXSH3h
         +q+ZUwU7w36go/UMdEC8Q8nP1xg0F3UB4XQsSdE4Lw3KoM43VvaJmKaeQCByhnuTLKda
         bKKA==
X-Gm-Message-State: AOJu0YzjKOJJaCTHKI2v4fd1smR4+v64Y/rm4hij8WsTmdIVk3+TWzpW
	CLcmOX6FS0Dhaht8+STECIGlsXow7EcQxDInMJ/BKSpiJpx/41Wv/n3cY/9etg==
X-Gm-Gg: ASbGncuCMXXc2VgM5xiDkQKYPJYY3a6MD3DMCfPZweIUCpzdmZ9JjmHa7o6Sh435M7m
	n7MgUUrOGRYSPPbojmTWV1zASNPtcLzo7wXXNasLu8ueUjgnRyFQgcnm5kjx+CCAcp/znX7a/QB
	Tofpr5HYKDl0IvQEJWOqPrXJqKjmiiBfVjT2xlAgqH2aYZnqnYD6637NSxlJ1yDBWJoj5qVJTT7
	jgUm5QJehc9J5GTKj+DQODVZlbqBViUYv32e/qZuBB5OuLq+XgdqnVVvVH9N9LhXzQgM93QpqbP
	VxKLh/YOTUxYQp1430ap3+gRDiVhRPuLkc3g//vRR7Q/S5UJuoI9IZchvLb27Pz0nXfV9pEonDk
	SLJQ=
X-Google-Smtp-Source: AGHT+IF9Z2B0YnMtqGS/zdVOwbFsFfeMBDeGZ1YvpwUuWkgXsNQb/+42Zb59MHyLx8oLm2xpDQnraw==
X-Received: by 2002:a05:6512:2c86:b0:550:e4a2:e0e0 with SMTP id 2adb3069b0e04-558fa9116b3mr2568640e87.44.1752169136776;
        Thu, 10 Jul 2025 10:38:56 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b8185csm431191e87.246.2025.07.10.10.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:38:55 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 3/5] cmatrix: Add patch for CMake 4+ compatibility
Date: Thu, 10 Jul 2025 20:38:25 +0300
Message-ID: <20250710173827.43239-3-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250710173827.43239-1-alperyasinak1@gmail.com>
References: <20250710173827.43239-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 17:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118418

Fix:

| CMake Error at CMakeLists.txt:3 (cmake_minimum_required):
|   Compatibility with CMake < 3.5 has been removed from CMake.
|
|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
|   to tell CMake that the project requires at least <min> but has been updated
|   to work with policies introduced by <max> or earlier.
|
|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
|
|
| -- Configuring incomplete, errors occurred!

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../0002-allow-build-with-cmake-4.patch       | 42 +++++++++++++++++++
 .../recipes-extended/cmatrix/cmatrix_2.0.bb   |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-extended/cmatrix/cmatrix/0002-allow-build-with-cmake-4.patch

diff --git a/meta-oe/recipes-extended/cmatrix/cmatrix/0002-allow-build-with-cmake-4.patch b/meta-oe/recipes-extended/cmatrix/cmatrix/0002-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..ab5229a94a
--- /dev/null
+++ b/meta-oe/recipes-extended/cmatrix/cmatrix/0002-allow-build-with-cmake-4.patch
@@ -0,0 +1,42 @@
+From 1099359c94bb3e404446d3624e4400823de27367 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Thu, 10 Jul 2025 13:39:21 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix
+
+| CMake Error at CMakeLists.txt:3 (cmake_minimum_required):
+|   Compatibility with CMake < 3.5 has been removed from CMake.
+|
+|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+|   to tell CMake that the project requires at least <min> but has been updated
+|   to work with policies introduced by <max> or earlier.
+|
+|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+|
+|
+| -- Configuring incomplete, errors occurred!
+
+Upstream-Status: Submitted [https://github.com/abishekvashok/cmatrix/pull/201]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index a2f8b4d..3e60aec 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,6 +1,6 @@
+ # CMake build system for CMatrix
+ 
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(CMatrix LANGUAGES C)
+ set(VERSION "2.0")
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb b/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb
index e1a6af622b..2c00c6ded4 100644
--- a/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb
+++ b/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI = " \
     git://github.com/abishekvashok/cmatrix.git;branch=stable;protocol=https \
     file://0001-reproducibility-Prevent-configuration-from-reading-h.patch \
+    file://0002-allow-build-with-cmake-4.patch \
 "
 SRCREV = "adfdf1656f23e5ab3b52c7d7edf91249a4477e8d"
 
-- 
2.43.0


