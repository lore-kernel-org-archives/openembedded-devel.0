Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC3DF36C28
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 06:28:04 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14178.1776666481290016326
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Apr 2026 23:28:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=q2ygmW18;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43fe608cb92so1650070f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Apr 2026 23:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776666480; x=1777271280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JNmRyBlaYGvzsofgIeKWx4satM2DRmu+mPMDL51yacE=;
        b=q2ygmW18Fc4g1mIDOvwsabv15IfCTkeBymEEJ35gWrCbUCPBn8cyRtdzz4IcQqWCRx
         uyt4pRUtyLXZapnXTp6HtuThA48SXCA+aclEKXOwSwNLf2rqgcigHGitS3qKZvExyZov
         sbqoSOAcg5zyr44g/Id8bs8ILwAsg5eOLxEezDLk/lrWLJ4raQ0uiYuMf0WYRGk681Bk
         MQmvW5+4HxMmLnZe6+ngEyFNlUmVPEHGysKvt5/tnwjrREFI89oFCW2hcKeYoRpnO5JW
         glfXc26hiC0l5MO8MdMHlCWJBzI5UARoY473hifO/zSPSoBOAafDZ4T438GjD/wePlUM
         vxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776666480; x=1777271280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JNmRyBlaYGvzsofgIeKWx4satM2DRmu+mPMDL51yacE=;
        b=S83uik5lH8v87PnwGos9eALbmHvk+v1QuM1AsOSBM8N+AwcT2BfvE7336XrY4CvA/i
         /9EYCcyyijqj/Y/B6MFMIdWnhrokXlHXeU3xw6MYZR/I99240qMkqTxe+EeArQ8KLPgU
         h/gJbHddxRXpYp4fWFrkoP98Hdwv8+6AAgyLu24srjhhI9LlaLuzYF+jS6HfNtulMvjP
         vMbj/Zefw7mzomJRibQRzCWctPhNWSxwm1jCZAq8sQ4mndO0kVfoUyXgdOaSGiIAQRJI
         513wSG1ZdxTTbXpIQyKH7BEhvrsuGVyocQ/MpTJxQ26aR0hB0kKYIMRFOtXAMKdM0ghZ
         +wcg==
X-Gm-Message-State: AOJu0YwHJZg8ULygjVWQRKxF4D/5YOYTqzl557yW1+Lizmgik/4ZjSW3
	1P0+T/KPR47hi1iGzQ8nYYyEMReVwMJb8Gw7p4xMcysLY+BfnKr7TO8pLSE3Fg==
X-Gm-Gg: AeBDievJufvmze8Ik3k8OHN1mKV2vSoD7inRxxJdqOyDwb3O4nKWKJCHZqVfak1AOLK
	vybEgi7ogCP6E+AkyjdBwrceGCjDOW4CDpLLKA99bXftZiZRKVD8qQRQuJ52MviQTQW1/A70mVn
	7dJX/HVcmRu3uj0lE4dZenCal9N2Bkqo3iWJvDybJANTUc/LthQH0YfYKUEzH8bN4waJUCI/Y6J
	KO81f3PUGZs6yRnthr2jwOVUY0T0b8cY/aH2Rdg1XtcB86xTf3GVvSAb9Uzwqap2e5GwVKexxqZ
	pe70U3L2Lt1fWIjnZGq3wrkjHeyCp6cqqS3EAcey5DVWyhke22Ej5YJ4JX9LLuUokFIITWmEkp6
	rLr8f7VJak9Pp5jUYa0lE1/cgXmLpgEHm9KdbKuRfCJpr1WtYh86oD7asknKSDCCMsrjISpqGxy
	o55Xa9UAZkCr4FkA8czPnqjn85ajCdgGk=
X-Received: by 2002:a05:600c:8588:b0:489:2005:b36e with SMTP id 5b1f17b1804b1-4892005b4e9mr8297715e9.19.1776666479493;
        Sun, 19 Apr 2026 23:27:59 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc17f642sm238296665e9.5.2026.04.19.23.27.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:27:59 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 11/17] libgphoto2: patch CVE-2026-40335
Date: Mon, 20 Apr 2026 08:27:43 +0200
Message-ID: <20260420062750.3795917-11-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420062750.3795917-1-skandigraun@gmail.com>
References: <20260420062750.3795917-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 06:28:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126475

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-40335

Backport the patch that is referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gphoto2/libgphoto2/CVE-2026-40335.patch   | 43 +++++++++++++++++++
 .../gphoto2/libgphoto2_2.5.33.bb              |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40335.patch

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40335.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40335.patch
new file mode 100644
index 0000000000..dfe832e6c8
--- /dev/null
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40335.patch
@@ -0,0 +1,43 @@
+From edcdf804662eb4340fdc371af4853d6579e969ab Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <marcus@jet.franken.de>
+Date: Wed, 8 Apr 2026 15:07:38 +0200
+Subject: [PATCH] =?UTF-8?q?Fixed=20UINT128/INT128=20Unchecked=20Offset=20A?=
+ =?UTF-8?q?dvance=20(CWE-125)=20=E2=80=94=20MEDIUM?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Finding 5: UINT128/INT128 Unchecked Offset Advance (CWE-125) — MEDIUM
+
+In ptp_unpack_DPV(), the PTP_DTC_UINT128 and PTP_DTC_INT128 cases advance *offset += 16 without verifying 16 bytes remain. The entry check at line 609 only guarantees *offset < total (at least 1 byte available). After the unchecked advance, *offset can exceed total, and the CTVAL macro's bounds check (total - *offset < sizeof(target)) wraps due to unsigned arithmetic.
+
+CVE-2026-40335
+
+Reported-By: Sebastián Alba <sebasjosue84@gmail.com>
+
+CVE: CVE-2026-40335
+Upstream-Status: Backport [https://github.com/gphoto/libgphoto2/commit/433bde9888d70aa726e32744cd751d7dbe94379a]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ camlibs/ptp2/ptp-pack.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/camlibs/ptp2/ptp-pack.c b/camlibs/ptp2/ptp-pack.c
+index 982b4f4..7fc120d 100644
+--- a/camlibs/ptp2/ptp-pack.c
++++ b/camlibs/ptp2/ptp-pack.c
+@@ -614,10 +614,14 @@ ptp_unpack_DPV (
+ 	case PTP_DTC_UINT64: CTVAL(value->u64,dtoh64a); break;
+ 
+ 	case PTP_DTC_UINT128:
++		if (total - *offset < 16)
++			return 0;
+ 		*offset += 16;
+ 		/*fprintf(stderr,"unhandled unpack of uint128n");*/
+ 		break;
+ 	case PTP_DTC_INT128:
++		if (total - *offset < 16)
++			return 0;
+ 		*offset += 16;
+ 		/*fprintf(stderr,"unhandled unpack of int128n");*/
+ 		break;
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
index e8e56171a1..269731731b 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
@@ -15,6 +15,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/${BP}.tar.xz;name=libgphoto2 \
            file://0001-libgphoto2-fix-const-correctness-for-c23-builds.patch \
            file://CVE-2026-40333.patch \
            file://CVE-2026-40334.patch \
+           file://CVE-2026-40335.patch \
            "
 SRC_URI[libgphoto2.sha256sum] = "28825f767a85544cb58f6e15028f8e53a5bb37a62148b3f1708b524781c3bef2"
 

