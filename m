Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id C6D897D00A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 10:26:41 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id r17so1544055wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 03:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=KLPX2KQ/vqKEMAqrvHuYi8D1kiX2tPMyUVe0jhmqX+4=;
	b=orkNJ2Sb/ZVSNSHBiK8y+ezMroUPpyGtIGqtR4/1iLLJA14S3jy/EVH1Hw6rPz8Y5H
	9KpaCJmFS3vz3kW9HNf89SNsISjexHw82rKHjSbufS3LnRgHpE3G3H1QCl9DrhSB2Xda
	QeY4MtaFI2MkPue+AZNJuk8at1EjBCuCza8n0/pAG0+9VHZKteUg+qFlOJVRnm0O6F9w
	tRkuQx7+vaKeFpHRxMgAPhl44vMXljuKdEkfESKAkbU5SzLXUe46Y+9WkRw1A4YQ652W
	tkbAXTZVJ7G9PUCzCb313aBMgLpOfa4bH0P31a8u4T9dqQrVOHlpFJwgIrgm18svq7U5
	2fYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KLPX2KQ/vqKEMAqrvHuYi8D1kiX2tPMyUVe0jhmqX+4=;
	b=X8QtJfi+CSLrbJNK2zfECv2ehaXDpiDUbqwq9eKrmBPWk61ZItILobZOlEaRKuWBbk
	rEwYxjlpl5sZAQ+BiC32EurWMOv3YJbJ6agskEnzpdgxSULF2AQaEs4JQkXtRXJ6Zs1J
	A+Ivu9acphyPJhU+p5SL9yJrw3IHeBnkYD6WlwvFav42SimhiowHOFetJzL899wD7irn
	tXSVV8eaGlvaOaiH3HkCVdlXkNwnj6INa7ymI2KfwlvMqMUXLkGjs1FVoYsoyBsHE6kX
	aksmML8Rpb/AHWuLA0aOMQlv7uHiqSIYpVbb12NvQ4Rk58PTYPkSNmefDQiD40fRGsa6
	cSag==
X-Gm-Message-State: APjAAAV8qBVBjEYoze0IBNzAVUwqTha7seGs8xscMmzSSyEZSBp3x9kb
	aVwhKv7pt5aj+jHQy4fp0bEGtspi4fQ=
X-Google-Smtp-Source: APXvYqwPtNTI//lbjvRnqzcMInX00C7xUxfWEaDXIBxpSga1L8qEAWqjXBzSJnoFPc0EW+sO83uG0w==
X-Received: by 2002:a1c:f714:: with SMTP id v20mr2523344wmh.147.1568370401965; 
	Fri, 13 Sep 2019 03:26:41 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id t6sm3253377wmf.8.2019.09.13.03.26.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 13 Sep 2019 03:26:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Sep 2019 10:26:50 +0000
Message-Id: <20190913102650.2022-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-clang][PATCH] clang: make sure python3 is used for native builds
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Sep 2019 10:26:42 -0000

* with /usr/bin/python -> python2.7 on the host, I was seeing:
  CMake Error at work-shared/llvm-project-source-9.0.0-r0/git/lldb/cmake/modules/LLDBConfig.cmake:229 (message):
    Found incompatible Python interpreter (2.7) and Python libraries (3.7)
  Call Stack (most recent call first):
    work-shared/llvm-project-source-9.0.0-r0/git/lldb/CMakeLists.txt:20 (include)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-devtools/clang/clang_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-devtools/clang/clang_git.bb b/recipes-devtools/clang/clang_git.bb
index 3906ef1..880307f 100644
--- a/recipes-devtools/clang/clang_git.bb
+++ b/recipes-devtools/clang/clang_git.bb
@@ -17,7 +17,7 @@ BUILD_RANLIB_class-nativesdk = "llvm-ranlib"
 BUILD_NM_class-nativesdk = "llvm-nm"
 LDFLAGS_append_class-nativesdk = " -fuse-ld=gold"
 
-inherit cmake cmake-native python3-dir
+inherit cmake cmake-native python3-dir python3native
 
 OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "BOTH"
 
@@ -102,6 +102,7 @@ EXTRA_OECMAKE_append_class-native = "\
                   -DBOOTSTRAP_LLVM_ENABLE_LLD=ON \
                   -DLLVM_TARGETS_TO_BUILD='${LLVM_TARGETS_TO_BUILD}' \
                   -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD='${LLVM_EXPERIMENTAL_TARGETS_TO_BUILD}' \
+                  -DPYTHON_EXECUTABLE='${PYTHON}' \
 "
 EXTRA_OECMAKE_append_class-nativesdk = "\
                   -DCMAKE_CROSSCOMPILING:BOOL=ON \
-- 
2.17.1


