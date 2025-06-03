Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C9FC5AD49
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 11:51:58 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.9336.1748951515857737767
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jun 2025 04:51:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=V6qtUARV;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a3673e12c4so3662044f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Jun 2025 04:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1748951514; x=1749556314; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DjIrxpO2nNeFqofKKt5cY+8DFdVGtVffR1HpzZvLrO8=;
        b=V6qtUARVL1tAmhctaI+iUiLNnxYIPmNCIT8WywIpT6k86yZFdx6yBpFUV8nMb267wj
         cI/pBbZbOFRpniERdiXyxSqg1KyMpik7PTl57XneJKnnjvg9W5sVru9EUUiM2BYkC443
         rCrIq7cEZxOFOuksEW1bLmyaidXSgGX/ZCZsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748951514; x=1749556314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DjIrxpO2nNeFqofKKt5cY+8DFdVGtVffR1HpzZvLrO8=;
        b=DkgZwqXarvO+BA3rKhkH1gU9u8+w/TYeyrzGaf20zpIL8qGt1+VZsprTSnuZSGdwaB
         eoAfgVl87VZ9zLY7e2lFDvVS01f+iVpYlcP/NRd7tuBs9tOT2Nw3RQC8rCLus7Trsqr5
         PGxmv2vRln8z1lfszA2rNSX1WzxEpfSaWwGa17tXOj86yKgPlJDQrpQT23hcdEbVxDrt
         2LDRI78EeEI15LBmA07/Mg02F56la8N9WjjCyeD8uY9nxaKtNe8BpRqykWGnxh1BLVyh
         jOBNP5Lkm9qaHb5cSI44UxAXOepeqIxvz9a64j8u4LjDna68LUCG53NbJ7jNgDzKO1Te
         5CAg==
X-Gm-Message-State: AOJu0Yz/kK8YYwU5clMNQM9OR0LviRha8SKVp9cOvO2HscHK0JFZf39D
	KvPeu+cKRsHEPx7k1mWBCPGnJ6M93aGy7WSskR+DMTylbM5PIJ2g5Kj1ISgXJgfXWpEw4oXPMjN
	v0GiWwq0=
X-Gm-Gg: ASbGncvSU2Ox3vr/ULtoTjCmru9c/IwYwWDNenhBzjJMuGEblm1gTalJni1w9JcZn9R
	5Et9FLTzkZIE9MegCM5mtmSDViXpaFaI/kpdmRrAbhI7ox9p92L1rTFdG1aJoDl6lsLpE6rkm/Y
	aNElEqacyUQHqUk41pxoUktaWCMMeIiPPjEpaKZXByLXKGDAdPrvBoRpKmqDMcbt5wsGNaLWLuJ
	hcrDXuchLn1aIZpAiKbzWqa/w3oO4QBbKcA1Y+UWQCBGzI+U1MVCDjlzQsCU/5rdyQ9ehkOAPuz
	ecXlOUWgzB+tT88+lpTuPVexxu/5tmB9LIr0PUTxMbLeUnG5j/W6NuP97DeyFql2kamPFTA4nwv
	C/wKE73aruiBMENmYa2OeVBkZ/pKEAArdqX+JDebfWZCdIOOplFbITSJu/+eHzMQ+qo4T
X-Google-Smtp-Source: AGHT+IGLhH8HR2cUlWga0uI6NAHYICcfj196fUQLkNJE0E54l7NU1ZsgDaz71S3+lXP0Wm+UXjsk2Q==
X-Received: by 2002:a05:6000:2089:b0:3a4:e68c:beeb with SMTP id ffacd0b85a97d-3a4f7a4d34dmr11673508f8f.22.1748951513684;
        Tue, 03 Jun 2025 04:51:53 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa00bbdc09194e7fd0f8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bbdc:919:4e7f:d0f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d8000e9asm159527845e9.21.2025.06.03.04.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:51:53 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH] pcp: fix build race condition
Date: Tue,  3 Jun 2025 13:51:30 +0200
Message-Id: <20250603115130.1530093-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Jun 2025 11:51:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117721

From: Yoann Congal <yoann.congal@smile.fr>

In upstream (handcrafted) Makefile, .c and .h files are soft-linked
before being compiled. Under heavy load or a build with a high CPU
count, the compilation can start before header files are softlinked,
resulting in a build error:
| pcp-htop.c:13:10: fatal error: CommandLine.h: No such file or directory
|    13 | #include "CommandLine.h"
|       |          ^~~~~~~~~~~~~~~

Fix this by adding the make dependency between object files and the
headers.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...htop-fix-header-build-race-condition.patch | 33 +++++++++++++++++++
 meta-oe/recipes-support/pcp/pcp_6.3.7.bb      |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-support/pcp/pcp/0001-pcp-htop-fix-header-build-race-condition.patch

diff --git a/meta-oe/recipes-support/pcp/pcp/0001-pcp-htop-fix-header-build-race-condition.patch b/meta-oe/recipes-support/pcp/pcp/0001-pcp-htop-fix-header-build-race-condition.patch
new file mode 100644
index 0000000000..48880fbb4d
--- /dev/null
+++ b/meta-oe/recipes-support/pcp/pcp/0001-pcp-htop-fix-header-build-race-condition.patch
@@ -0,0 +1,33 @@
+From d04ea418c5fcfec2f6fbb2dd9f982ddf12c5be87 Mon Sep 17 00:00:00 2001
+From: Yoann Congal <yoann.congal@smile.fr>
+Date: Tue, 3 Jun 2025 10:02:58 +0200
+Subject: [PATCH] pcp-htop: fix header build race condition
+
+.c and .h files are soft-linked before being compiled. Under heavy load
+or a build with a high CPU count, the compilation can start before
+header files are softlinked, resulting in a build error:
+| pcp-htop.c:13:10: fatal error: CommandLine.h: No such file or directory
+|    13 | #include "CommandLine.h"
+|       |          ^~~~~~~~~~~~~~~
+
+Fix this by adding the make dependency between object files and the
+headers.
+
+Upstream-Status: Submitted [https://github.com/performancecopilot/pcp/pull/2217]
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ src/pcp/htop/GNUmakefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/pcp/htop/GNUmakefile b/src/pcp/htop/GNUmakefile
+index 3e29638d6..898f0b766 100644
+--- a/src/pcp/htop/GNUmakefile
++++ b/src/pcp/htop/GNUmakefile
+@@ -224,6 +224,7 @@ default:	build-me
+ include $(BUILDRULES)
+ 
+ ifeq "$(HAVE_NCURSESW)" "true"
++$(OBJECTS): $(HFILES)
+ build-me: $(TOPXFILES) $(SUBXFILES) $(CFGXFILES) $(CMDTARGET) $(DISTLINKS) $(MAN_PAGES)
+ 
+ install: default
diff --git a/meta-oe/recipes-support/pcp/pcp_6.3.7.bb b/meta-oe/recipes-support/pcp/pcp_6.3.7.bb
index c390b9eec2..65efac06be 100644
--- a/meta-oe/recipes-support/pcp/pcp_6.3.7.bb
+++ b/meta-oe/recipes-support/pcp/pcp_6.3.7.bb
@@ -14,6 +14,7 @@ SRC_URI += "file://0001-Remove-unsuitble-part-for-cross-compile.patch \
             file://pass-options-to-AR.patch \
             file://fix_parallel_make.patch \
 			file://0001-bind2-Use-pmcpp-from-native-builds.patch \
+            file://0001-pcp-htop-fix-header-build-race-condition.patch \
            "
 
 export PCP_DIR = "${RECIPE_SYSROOT_NATIVE}"

