Return-Path: <kelefa.sane@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4FB1C5AD49
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 14:08:56 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.50624.1748873326163468125
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jun 2025 07:08:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=me8kDgDN;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: kelefa.sane@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso29812845e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Jun 2025 07:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1748873324; x=1749478124; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S+SVxiIpGTTsuHDnImRmBRiJyRg1Q97fqkAlEb0eD+c=;
        b=me8kDgDNgpMHu6Rc3cq+m9zDZommSv9SZ0kmp1eLKwpP3V0IkKi0RCLo1BmTRvreOy
         0ELakd5hqoLXzbzyUbyrntWDSWq/LtpSXrMFhRIL5dy4+6p3ZiNipTde3FhFC6yzmMIw
         xo65G5bQAuRtteQJMlcrw6hUBtgoe0JM/Y+6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748873324; x=1749478124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S+SVxiIpGTTsuHDnImRmBRiJyRg1Q97fqkAlEb0eD+c=;
        b=XDT4hKSTADFHl7Ru2te8pKt5p3N7EgYeGhmOqIWjkNF4bZMyOhAaywUvDVekkyTIUe
         W+TvG9rv2bzKIQBm1Ozn2TXjOiYOcVVack0sdxb9DcCejVEgXVRzfeGEKxuRKypmJcbr
         WeJqCvDplBdM6T1VkV1M1G5KJt+YyG0VYkvaNqKGI0nkEXt86E8FxciEQpdzFPzYemlz
         B9Vi/bMhQyrXUHrRZvVaz6JBjlZ7AYSDHRM+j4MfK5UPT3x2CF4t1Zs0K6F4J4bGdOau
         MA9VUU3d0bI0Ql7VevG1dWNzeeaTk3POiIP7K296OxJTUrlTEVbtuZZDXFddmupq7Ksr
         yBgw==
X-Gm-Message-State: AOJu0YzuUioWNw7dhtXzAYekzBkRDPX7wFQoWq3eMr5/M/FA9zG8vyT/
	QXkHOdXZ5jlx9yuhs9/CvQuzYQoPGd3QvC/WScqGFQDBvbEH+vejrB1ieHxjb7U4oYy3fd8C41w
	z4AEr
X-Gm-Gg: ASbGncsZj9ZYIh8Yv8frCTQLsembF1wqbghiL8rBpuMnSSVgGhIn/NfiAEviOOkLDRt
	ru/VKJoQZREgjj1fkdE3aYwKu/FBmwZasPMVyvjBYzHSJhAWLuWuQYM/tgEZpkiZzD5mAbaD3Lq
	owClMX6e4Myocamf34U40Hy7TFhxWxjveC7CVLF8rFrEMBFu6mqLq9LNwmfeKhWHiNH/2AXv+FT
	9d3Xvi2wba3BUCCnwCSwMIbb1HpxGiX9DrFHoVydJn1EmIAw9CojiggpvSULhWZrxDebF4q+Skl
	csgr6YuyPlDy1v4+VIkRsXhZqMCNAmrCpR7oLV+eUI54TLXG9tUjX4f9e93KoD+/ZQi4AtINBBV
	niBr5hb0SmVUHe15VyQwyAGm6y3MByRMj6UrjemPHqc1ackJNkRR2og==
X-Google-Smtp-Source: AGHT+IEKsqbds5p5KBYZBmk4APN4X8j9Ed4Rw65LEcn7fz7y8vzozyYkshgHdW9BjZADxecQ81Rx4w==
X-Received: by 2002:a05:6000:3103:b0:3a4:eecd:f4d2 with SMTP id ffacd0b85a97d-3a4f89ddd7cmr10300210f8f.38.1748873324095;
        Mon, 02 Jun 2025 07:08:44 -0700 (PDT)
Received: from FRSMI24-OUB.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fc28f3sm124871295e9.39.2025.06.02.07.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 07:08:43 -0700 (PDT)
From: kelefa.sane@smile.fr
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?K=C3=A9l=C3=A9fa=20San=C3=A9?= <kelefa.sane@smile.fr>
Subject: [meta-oe][PATCH] imx-cst:fix race condition build error
Date: Mon,  2 Jun 2025 16:08:28 +0200
Message-ID: <20250602140828.518094-1-kelefa.sane@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Jun 2025 14:08:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117707

From: Kéléfa Sané <kelefa.sane@smile.fr>

Add missing makefile rule depedency on compilation of cst_lexer.c, which
require header cst_parser.h generated at compilation with cst_parser.c

This issue has been detected during the Yocto autobuilder test CI,
probably during a high CPU load
(https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/46/steps/33/logs/stdio).

Signed-off-by: Kelefa Sane <kelefa.sane@smile.fr>
---
 ...fix-missing-makefile-rule-dependency.patch | 45 +++++++++++++++++++
 .../recipes-support/imx-cst/imx-cst_3.4.0.bb  |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-support/imx-cst/imx-cst/0001-fix-missing-makefile-rule-dependency.patch

diff --git a/meta-oe/recipes-support/imx-cst/imx-cst/0001-fix-missing-makefile-rule-dependency.patch b/meta-oe/recipes-support/imx-cst/imx-cst/0001-fix-missing-makefile-rule-dependency.patch
new file mode 100644
index 0000000000..ce7626ab31
--- /dev/null
+++ b/meta-oe/recipes-support/imx-cst/imx-cst/0001-fix-missing-makefile-rule-dependency.patch
@@ -0,0 +1,45 @@
+From 73509cb22ffab827dc3e3ccda2781683b8e8296d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?K=C3=A9l=C3=A9fa=20San=C3=A9?= <kelefa.sane@smile.fr>
+Date: Mon, 2 Jun 2025 11:07:08 +0200
+Subject: [PATCH] fix missing makefile rule dependency
+
+During, the package build with an high CPU load we can face
+a build failed issue, caused by the header file cst_parser.h not present
+when compiling cst_lexer.c, which depend on cst_parser.h:
+| x86_64-poky-linux-gcc  ... -c cst_lexer.c -o cst_lexer.d
+| ../../code/front_end/src/cst_lexer.l:21:10: fatal error:
+|cst_parser.h: No such file or directory
+|    21 | #include "cst_parser.h"
+|       |          ^~~~~~~~~~~~~~
+| compilation terminated.
+
+The file cst_parser.h is generated during compilation
+by a makefile rule which also generate cst_parser.c
+
+To fix the issue, makefile rule needed to be update
+in order for compilation of cst_lexer.c to be done,
+always after the generation of cst_parser.h and .c
+
+Upstream-Status: Submitted [https://community.nxp.com/t5/Other-NXP-Products/Package-imx-code-signing-tool-3-4-0-dfsg-2-build-issue/m-p/2108575#M28853]
+
+Signed-off-by: Kelefa Sane <kelefa.sane@smile.fr>
+---
+ code/build/make/rules.mk | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/code/build/make/rules.mk b/code/build/make/rules.mk
+index 7720e4b..239108b 100644
+--- a/code/build/make/rules.mk
++++ b/code/build/make/rules.mk
+@@ -35,6 +35,11 @@ LFLAGS  := -t
+ 	@echo "Link $@"
+ 	$(LD) $^ $(LDFLAGS) -o $@
+ 
++# Compilation of cst_lexer.c require cst_parser.h 
++# (cst_lexer.c include cst_parser.h) which is generated
++# by the same makefile genrating cst_parser.c
++cst_lexer.o: cst_parser.c
++
+ %.o: %.c
+ 	@echo "Compile $@"
+ 	# generate dependency file
diff --git a/meta-oe/recipes-support/imx-cst/imx-cst_3.4.0.bb b/meta-oe/recipes-support/imx-cst/imx-cst_3.4.0.bb
index c4b7ce032d..375c0b4e10 100644
--- a/meta-oe/recipes-support/imx-cst/imx-cst_3.4.0.bb
+++ b/meta-oe/recipes-support/imx-cst/imx-cst_3.4.0.bb
@@ -16,6 +16,7 @@ DEBIAN_PGK_VERSION = "${PV}+dfsg"
 
 SRC_URI = "\
     ${DEBIAN_MIRROR}/main/i/${DEBIAN_PGK_NAME}/${DEBIAN_PGK_NAME}_${DEBIAN_PGK_VERSION}.orig.tar.xz \
+    file://0001-fix-missing-makefile-rule-dependency.patch \
 "
 
 SRC_URI[sha256sum] = "52ee3cee3bc500a42095f73c4584e223b4b9d2dfc1cd3e5df965c5952eba8c8d"

