Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14AE1CD37AC
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 18:54:47 +0000 (UTC)
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18913.1778784885873954946
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 May 2026 11:54:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kELfra2D;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1331e851faaso125468c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2026 11:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778784885; x=1779389685; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kG9xeyfsSCUx8A/AhhpbzFcyFJvds0jwF1zSRlj70yA=;
        b=kELfra2DKlp5wvDsS/hLyXHgVgQqiwC0yMP5jU3RpW2fdI104GCuTGuiKxMPw0r8Ih
         sw3cKrxZ3eU8D/kLAHHxANu0TRrPf1zKGR++t4o1l9POFF0xkCHwdz7pYvh50y5AyL1v
         I0zhLJfiMrE+uEJQoYMvlxAlbNe1+AUQ/gb9Hu7g2jc5/QnVRHGfvtCQzCprAmrnWp2W
         cnmPSJSOdpUo8La7311sYbM8c+3WPs5Q5d5QK4VO4gBymQfU9Wmj23yHE5cjlEiaUEMb
         0NLTeMFCruuwsBEfIISioVPey2sEct8u+Rhu1tCQPzcFaQiRAFS38Of+pbZVCZlr8uoF
         VoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778784885; x=1779389685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kG9xeyfsSCUx8A/AhhpbzFcyFJvds0jwF1zSRlj70yA=;
        b=PvkMJQimpKxehKd+rUy1wZzYhpX0DcmVKWfiyilW83TI3Hjbihu8O3618jFNbRCbhL
         KUsWyVxKI/HGIZTlnW84Yh4/nYy4oHozNpT87P++HyrwlttvgLTCowskvg/VYjCgh2vV
         NDD9Fh/OAgT14HuzL8o6WAp+Q3C5OSuIEFLnSJWCcdWzDwZSQ5kB15P615G7IPWUebfj
         tuR/q8d8LklOsh7I3Mo5DlhI7hh49eMbZpdRWexbCL+yFbZsEqvMulYY2+bSbCLJIlzq
         /05H9QSLMFXcv7vWKPZ07lkrpCJpREV807YUX4He7YqiYhXPxN6bxgKJt61GRVCjTEMR
         0kCA==
X-Gm-Message-State: AOJu0YyFsZ8Ll3ruVm0mpu+9DkVt1DCsT2XzJlbUc90/7V6S8YcycpmP
	S09VLrI0lcxCDw9Nf34Lwm7Sa50ORtVLf08xZXgO5PWF9xqSV33unxOQFD6sysUxrs8=
X-Gm-Gg: Acq92OGf2hiRfr8dQX0dL3EUy7nAKYtsNAz5qMVlMUmYsjadyoFZVvSnItPMpDGOHLq
	/SqJrRpgXbXGPC2TbrgVNFdnYz3VDQFmN2Fm7UgoFg49gHGVAvLlwXCSbelee7u/DLgpSfN13BJ
	0NHiK9iwX+D4EquBr08m9EK82aRxKoaOOnYxTWVpYO5GruL6hxXpG6cFHjWPdE0xkf+MY4J+9wb
	nsSUiMG8nUoC2+bQCWu3WuUcybl0TmJdEtwculvopmOkt/wPBAxx2QahUVLjMUs7hagtYKQuB3c
	rpYv4HL9mcJUzb/XnlPMy0s+Rfj5EgLDQ/HuP3pmsY3OeXZn7I9B8dHudIYMsh2XTroS3q1T93A
	iZXzLYjhR7tWja4O4MH/lTnnawWTD7sgBdV6PhStnnzHSmMYa4HtZJRNUgRi0Fujhj3yKcGijUh
	8OVPiU+1bWPZ6lHFUzuOYqcXkZ0n0kN3RRnIaOijO0Msp5qwFHhrN2DXJfyEOcYuqO6cGJJxIpT
	FGBTwFeggFaF/NTs2X2nUSc04MNw/JujIP+bhyD0n3p9l8bmd3cVoGrzxSE5NoLoWsSYf7Kn4vm
	TmGFMYmF5TLEaXAV8i32IxryOerFEdPDR6OeR9NU
X-Received: by 2002:a05:7022:3d0e:b0:134:fc38:5d2f with SMTP id a92af1059eb24-135000b0fddmr374013c88.21.1778784884822;
        Thu, 14 May 2026 11:54:44 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb9ef5sm5422930c88.2.2026.05.14.11.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 11:54:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 2/3] python3-cucumber-tag-expressions: Fix build with newer uv build
Date: Thu, 14 May 2026 11:54:40 -0700
Message-ID: <20260514185441.1330509-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260514185441.1330509-1-khem.raj@oss.qualcomm.com>
References: <20260514185441.1330509-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2026 18:54:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126992

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ax-required-version-of-uv-to-be-0.12.patch | 31 +++++++++++++++++++
 .../python3-cucumber-tag-expressions_9.1.0.bb |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cucumber-tag-expressions/0001-pyprojects-Relax-required-version-of-uv-to-be-0.12.patch

diff --git a/meta-python/recipes-devtools/python/python3-cucumber-tag-expressions/0001-pyprojects-Relax-required-version-of-uv-to-be-0.12.patch b/meta-python/recipes-devtools/python/python3-cucumber-tag-expressions/0001-pyprojects-Relax-required-version-of-uv-to-be-0.12.patch
new file mode 100644
index 0000000000..e389b99fce
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cucumber-tag-expressions/0001-pyprojects-Relax-required-version-of-uv-to-be-0.12.patch
@@ -0,0 +1,31 @@
+From 5cf10b111d61f00db2b3d9c8c6635fc31f3ceefd Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Thu, 14 May 2026 06:43:36 -0700
+Subject: [PATCH] pyprojects: Relax required version of uv to be < 0.12
+
+Core now has 0.11.x and it fails this check
+
+| * Getting build dependencies for wheel...
+|
+| ERROR Missing dependencies:
+|       uv_build<0.11.0,>=0.10.0
+
+Upstream-Status: Inappropriate [OE Specific]
+
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index b0f253e..b39d0fd 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,6 +1,6 @@
+ [build-system]
+ build-backend = "uv_build"
+-requires = ["uv_build>=0.10.0,<0.11.0"]
++requires = ["uv_build>=0.10.0,<0.12.0"]
+
+ [project]
+ name = "cucumber-tag-expressions"
diff --git a/meta-python/recipes-devtools/python/python3-cucumber-tag-expressions_9.1.0.bb b/meta-python/recipes-devtools/python/python3-cucumber-tag-expressions_9.1.0.bb
index add7031f1e..e26f20ebb8 100644
--- a/meta-python/recipes-devtools/python/python3-cucumber-tag-expressions_9.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cucumber-tag-expressions_9.1.0.bb
@@ -4,6 +4,7 @@ HOMEPAGE = "https://github.com/cucumber/tag-expressions"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=134f1026f0de92fd30e71976590a2868"

+SRC_URI += "file://0001-pyprojects-Relax-required-version-of-uv-to-be-0.12.patch"
 SRC_URI[sha256sum] = "d960383d5885300ebcbcb14e41657946fde2a59d5c0f485eb291bc6a0e228acc"

 inherit pypi python_setuptools_build_meta

