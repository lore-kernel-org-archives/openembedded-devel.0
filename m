Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F33E2C36014
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 00:19:28 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.630.1743725967813105186
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Apr 2025 17:19:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=acMHQBSj;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ff615a114bso2572392a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 17:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743725967; x=1744330767; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wPqBodsuEGsBwBAsKM/8oDjirVFMwNpvSC0o8vNtqY4=;
        b=acMHQBSjkvQPJh3+pkjvqXd7egcqnWMaKNaZ5YyrT1F/oslGtM/FgdT2S55i2ilj4l
         U+0ogrZv0+sykN2JRqRiwzMrJVB3IGW1QJ5Oc/UDAxX3ytpZgQV3SK2856UslzIhLg1a
         eCrELLDFWTtko3om5rc6g2Wh0eUHTXEg7dTu9HxkYijlzo5FiVBnmYbQ8uZ6xWgrnfo/
         vsJBpIt8JYNifZMRBoUONH8BTwhY1GF8IlxfbIhnJdSPqRe0vRxdU3XBymUgAV7oJPMn
         j50XjkhkohEBllxAJrJgbJqID84ZKPey222+8iRSHOb4Y4LFcZIgzwvrBZ9kGTq7njKq
         norg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743725967; x=1744330767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPqBodsuEGsBwBAsKM/8oDjirVFMwNpvSC0o8vNtqY4=;
        b=VNPXyy5m4VzL8gVVslmL2gPGWvvTOz6uSqBbX0Huoq33jMkktBpyx82cb1G2IknW1H
         UkXIPkPeGcsqoJAX5/dJ3k5M/xeW2ab57v5Qh/1cdAD8rRIZVlcEkCZRWtVhvLidby4S
         f9w0CjqGFjEp0X0tA9Oav5Vj2GtXbWlcwwC2b/8oTCTwXTQ2tN2hy9qe8HLwTdAHg7E4
         cgLypc0u8MFY/TkDb/9J3FYIEu0bYMzlfSXhuliJMk/ZEgfWcoXv6jIRwxV9gL59OvkQ
         9ZzbstAgzDM5GfSx/dDtnHCtecr6cJLtONGbDnPegoKgSz7vhxUwq/HAWHI+JIa8xEj3
         rixA==
X-Gm-Message-State: AOJu0YwjytMMdjXbBaLCCvTjWQU6pXunffR5iKG3GHkxOtFoJMVF1WFi
	oHEbtF8wGXTQeg8M7fP5ItaTgygJLtDJLwF4mu1tUmOUJP8y9lcNONlJaVUe
X-Gm-Gg: ASbGncs6TALqfatjFvCexWqdNAeHDPLjdPdoLMPPRHuO3xK37ERJv8CkWU/cKDXY1GY
	LKiegoj4WHdB8ur/lxwfVOjozRDqA+ndWAS+jzcDHIDlVGXT81W8K9wQtpZHpWMFnuF/BgoQKfh
	ZlYfbdrRqwxnjF86/3XgbNwlfbyPZyyIbBIp99EuLOWqoZqJpEp5LvoYOI2Sln1h1TLQ1Pocxxe
	8M7B0p2/ECRDKNAtBAdzzDK2mhFxeer4ov1xkguNIoJY/npdVOWo67lIHO83P7rhgLc0zZLGY53
	5CxxyE5AdI4BzOuyv9v/vYVDXmMMT4+XrUip
X-Google-Smtp-Source: AGHT+IEajKF7kh3Meqsa80yuPVeR9tzF+tSgdX8vrGiDno/dBCRZG+hVUo9rf4pL3IfX8+ANj5pUBg==
X-Received: by 2002:a17:90b:5830:b0:2fa:1c09:3cee with SMTP id 98e67ed59e1d1-3057a5ebb96mr6547680a91.9.1743725966592;
        Thu, 03 Apr 2025 17:19:26 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5499])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305827d70a4sm2171697a91.3.2025.04.03.17.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 17:19:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-pychromecast: Upgrade to 14.0.7
Date: Thu,  3 Apr 2025 17:19:24 -0700
Message-ID: <20250404001924.3844368-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 00:19:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116552

Apply a backport to fix build with setuptools 0.78.x

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...s-requirement-from-78.0-65.6-to-65.6.patch | 28 +++++++++++++++++++
 ....0.6.bb => python3-pychromecast_14.0.7.bb} |  4 +--
 2 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pychromecast/0001-Update-setuptools-requirement-from-78.0-65.6-to-65.6.patch
 rename meta-python/recipes-devtools/python/{python3-pychromecast_14.0.6.bb => python3-pychromecast_14.0.7.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast/0001-Update-setuptools-requirement-from-78.0-65.6-to-65.6.patch b/meta-python/recipes-devtools/python/python3-pychromecast/0001-Update-setuptools-requirement-from-78.0-65.6-to-65.6.patch
new file mode 100644
index 0000000000..d659af8116
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pychromecast/0001-Update-setuptools-requirement-from-78.0-65.6-to-65.6.patch
@@ -0,0 +1,28 @@
+From 74c841c0fc3ffc13842f3544502f66f16e751a0f Mon Sep 17 00:00:00 2001
+From: "dependabot[bot]" <49699333+dependabot[bot]@users.noreply.github.com>
+Date: Mon, 31 Mar 2025 14:26:50 +0200
+Subject: [PATCH] Update setuptools requirement from <78.0,>=65.6 to
+ >=65.6,<79.0 (#1047)
+
+Updates the requirements on [setuptools](https://github.com/pypa/setuptools) to permit the latest version.
+- [Release notes](https://github.com/pypa/setuptools/releases)
+- [Changelog](https://github.com/pypa/setuptools/blob/main/NEWS.rst)
+- [Commits](https://github.com/pypa/setuptools/compare/v65.6.0...v78.1.0)
+
+Upstream-Status: Backport [https://github.com/home-assistant-libs/pychromecast/pull/1047]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 5aa8df7..34f5dc0 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,5 +1,5 @@
+ [build-system]
+-requires = ["setuptools>=65.6,<78.0", "wheel>=0.37.1,<0.46.0"]
++requires = ["setuptools>=65.6,<79.0", "wheel>=0.37.1,<0.46.0"]
+ build-backend = "setuptools.build_meta"
+ 
+ [project]
diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.6.bb b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.7.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-pychromecast_14.0.6.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_14.0.7.bb
index fcb40d62bc..7bae0721db 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.7.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-#SRC_URI += "file://0001-Allow-newer-version-of-wheel-and-setuptools.patch"
-SRC_URI[sha256sum] = "8af91af4fb62d9d6e4df1832c6503dda74afb14c7726ede1ff863e178deb3f9a"
+SRC_URI += "file://0001-Update-setuptools-requirement-from-78.0-65.6-to-65.6.patch"
+SRC_URI[sha256sum] = "7abbae80a2c9e05b93b1a7b8b4d771bbc764d88fd5e56a566f46ac1bd3f93848"
 
 inherit pypi python_setuptools_build_meta
 

