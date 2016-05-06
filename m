Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id E32B772DC4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 13:42:18 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id w143so8905436wmw.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 06:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=dgJEJd/rXVr6IYhZmvlAryowFwJ6zTnhnfdXqU+YaNE=;
	b=bV3FbCzARwpB0VvsNlcH4S7HYeJQjpfo7+wZt36IOmhHStnsE9jQwbDsqXVtXfmtIj
	Kyx4R3DD7boYaR5RxOsrI3ItFsbPnnK3xWlp17dSeYP4WTzWcCfBmooLsn81a9B7QyTk
	fK/Dp5xMghuJGGtXMVV+wQU/BIFhWiJEx3u+HcqlgIbxbvCd7E5kqtdEZ0Vz3wU8KXyd
	pbwXtB1o3Dr6xS+cLUO8z7WnFceFrttACw5Bo3B6Mqv+tqKA2RlXyRp91xaoePFIGmej
	nKOAP7Z3ITB1dwllCgvlt7TZ99UsRhUt/zRup2Z74L5hWg2bMVLQHUCvVGzTsO/7VHkJ
	foNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dgJEJd/rXVr6IYhZmvlAryowFwJ6zTnhnfdXqU+YaNE=;
	b=HWYAtMMhV8teQspvNsDLuRjwPhMwTLNdmiTxi22GdGdf6kxmATdsiz8UqVBa/ZFLrD
	xZWhPQIO7SyZfqVUrH+hmP8UAvI6nJHK0ghfuckl+lppzhLSoEXSGWVvBbx8y9ArR67d
	VEaI3EFMTCn78HqAiJ8LSVaQ+Jcle1YorW/DYny39AJjLj8tcZTm9NhOBK//pRUpsSxt
	O7+hkISeAGy4uiYwu0thSag+fYG54GjaUZP+vyr4goEbMLOtsnQ/mbthBRoqMFso1PES
	k537j2ENAiZDqjDdPlXoE1VWZt8sXrBGPOjyNVlYitzvLQezw+DQJ8gOEI8j9xdGmmtl
	fX5g==
X-Gm-Message-State: AOPr4FXr6UHbVNSy3UZstmgjTjXIgzrsO847gOJcZ7kHrS7VSbksK+rMLFHjVAy/tPpyvw==
X-Received: by 10.28.9.135 with SMTP id 129mr9050734wmj.31.1462542138899;
	Fri, 06 May 2016 06:42:18 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	m20sm8503595wma.23.2016.05.06.06.42.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 06:42:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 May 2016 15:43:47 +0200
Message-Id: <1462542227-29023-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.8.2
Subject: [PATCH][master][krogoth][meta-oe] llvm3.3: Disable auto -dbg packages
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
X-List-Received-Date: Fri, 06 May 2016 13:42:19 -0000

* set NOAUTOPACKAGEDEBUG to disable automatic creation of -dbg FILES split
* it doesn't work well with our do_split_packages calls and in the end breaks
  installing llvm3.3-dbg (e.g. when you enable IMAGE_GEN_DEBUGFS)
* it shows a bit ugly error where multiple messages are written over
  each other:
WARNING: [log_check] In line: [ConfiCollected errors:
]
WARNING: [log_check] luneos-dev-image: found an error message in the logfile (keyword 'Collected errors'):
[log_check] ConfiCollected errors:

ERROR:
ConfiCollected errors:

 * satisfy_dependencies_for: Cannot satisfy the following dependencies for llvm3.3-dbg:

 *      libllvm3.3-lto-dbg *    libllvm3.3-llvm-3.3-dbg *

 * opkg_install: Cannot install package llvm3.3-dbg.

guring gstreamer1.0-libav-dbg.

  but the main point is that do_split_packages returns some package
  names of packages which in the end aren't created, because there
  are no files in them after other -dbg packages eat them all due
  to automatic -dbg creation

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/llvm/llvm.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/llvm/llvm.inc b/meta-oe/recipes-core/llvm/llvm.inc
index 02d4617..fa971f3 100644
--- a/meta-oe/recipes-core/llvm/llvm.inc
+++ b/meta-oe/recipes-core/llvm/llvm.inc
@@ -121,7 +121,7 @@ ALLOW_EMPTY_${PN} = "1"
 ALLOW_EMPTY_${PN}-staticdev = "1"
 FILES_${PN} = ""
 FILES_${PN}-staticdev = ""
-DOTDEBUG-dbg = " \
+FILES_${PN}-dbg = " \
     ${bindir}/${LLVM_DIR}/.debug \
     ${libdir}/${LLVM_DIR}/.debug/BugpointPasses.so \
     ${libdir}/${LLVM_DIR}/.debug/LLVMHello.so \
@@ -142,6 +142,7 @@ FILES_${PN}-llvmhello = "\
 "
 
 PACKAGES_DYNAMIC = "^libllvm${LLVM_RELEASE}-.*$"
+NOAUTOPACKAGEDEBUG = "1"
 
 INSANE_SKIP_${MLPREFIX}libllvm${LLVM_RELEASE}-llvm-${LLVM_RELEASE} += "dev-so"
 
-- 
2.8.2


