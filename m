Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 043AE1062864
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 11:12:03 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18445.1773227519198980835
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Mar 2026 04:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZZODHkjb;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so37090895e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 04:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773227517; x=1773832317; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ksc34Qm5y6/5y85gBBTpjVlgcWhG7EIzkl4/ylObCx4=;
        b=ZZODHkjbrkO86xbrfYh10tHzZU3GajSvpF/lLJdALLskDujh07TC6x5cDo08m4Rd9K
         s/0wyOFAoHlCfwNEVOWDSPgX2KCGNofGKjrI/GxnF1pxCEFRnOGgLdARwEyxV03APNn1
         bLSdUWW2cEnNrHuQMR9/4LwbJqm8mrgvzIgmZtdoE//UQIreqkS2B3v/SreAppCwH5bc
         oymub1om4uPvlmbZFfIwRBrDlE7IM5HLKRsMp9bb0HPxSP6890kZVvZ0xPvTuvS8SKZJ
         VKb3sO3KQ4bnRe07+UK+A8jpTe/JZBF93lhFiT/XyYAQ7IYTJzQi1BDHx/dXPELmbAJQ
         mfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773227517; x=1773832317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ksc34Qm5y6/5y85gBBTpjVlgcWhG7EIzkl4/ylObCx4=;
        b=YN1/L4QFOZNjJeiJsEV+hitZbLmcXeVKmts4SDeR35oo8oDfB1ZjOi+GS7U6819ABJ
         KjE1mISlrRxFcVdpkxkp0hKd69ZHmkRH9ojvIlienwG8kB8rhlCfTXAewyksC053w/S4
         rwCdXMD3SPrt3JyU4qRNBMM1tx6k4lUTJvyyxo08ZZGsSQzfWYOhl+nJVoq1Hn2GTaA3
         0TWC5KnbXgN5acZlozpBrjA14/CI+nFk+i17uVt2Udu+7dTt1Eg3iADfSSvAlbCboX4E
         6Uiu2/elDHUsc5CW7A/DVI0k5kpuRpfGQa7ACy8YAKM3CtilSrb925dgjK+M/pwAipoQ
         v+wQ==
X-Gm-Message-State: AOJu0YyH1ozU1XVx/srCIOi2VWCj89b4wi8SbVeZbXu9WfT16dLp12zW
	TTv03NVWG7MRxvmoo9x1MznBryoC7afb7wSpBcuSv/RcZcgFh0Kgw+n0VThpsA==
X-Gm-Gg: ATEYQzyuSbnDEDzO93VVpSmkV9yfzATpeQhJ8frlfXFBLs5Cg5D57mvbhiJlrT6HaTp
	FVBFJL5o5DBUpnNfCe5X0T/dGOhKwEYnCOLAHrPphO85ff8AIl+UKhYrhKosdVwNYDrv64Jgf9G
	mhwTZ3lnw9BeOcpWOQDZzgxweEiUuYPwTurPVPmMcaf6d6UeWNore1xtkCzVImam9x2QmIMgh8B
	0varYeJGbPvP5J1mac4rZ0mibeUwwBcZUUO7T6kIWPKq4k71wY4yeqE1kQZSBhtdcCZOkoV3STA
	uTPz8Mv1HSNIWZnuqhUt1U93GfQqBsXQr2RKl7Vj3es1zzhc5Q0HEfEb3FfVKMLANAb2d+Bc+pd
	GNQ3y1ufaGvT+02NLbu5CTE70/2qFxt8YgffS7Yu1kxZj+O1R/iTrtAtIQgai1qGs4uzAma1bpC
	FPgelV/7/JQxASGfLdx014
X-Received: by 2002:a05:600c:4e16:b0:483:709e:f238 with SMTP id 5b1f17b1804b1-4854b14b0dbmr31298525e9.29.1773227517370;
        Wed, 11 Mar 2026 04:11:57 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0c3a10sm16201995e9.12.2026.03.11.04.11.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 04:11:56 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/2] exiv2: patch CVE-2026-27596
Date: Wed, 11 Mar 2026 12:11:54 +0100
Message-ID: <20260311111154.1737998-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311111154.1737998-1-skandigraun@gmail.com>
References: <20260311111154.1737998-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 11:12:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125083

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-27596

Backport the commits referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../exiv2/exiv2/CVE-2026-27596-1.patch        | 58 +++++++++++++++++++
 .../exiv2/exiv2/CVE-2026-27596-2.patch        | 24 ++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb |  2 +
 3 files changed, 84 insertions(+)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596-1.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596-2.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596-1.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596-1.patch
new file mode 100644
index 0000000000..67757947d3
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596-1.patch
@@ -0,0 +1,58 @@
+From 05d3cc42c6f56678ae62697d60af01af8876eada Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Thu, 26 Feb 2026 20:44:18 +0000
+Subject: [PATCH] Regression test for
+ https://github.com/Exiv2/exiv2/issues/3511
+
+CVE: CVE-2026-27596
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/commit/fe0d0154ab2886feb503e6cfd38c3b6d5722921f]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ test/data/issue_3511_poc.eps             | 13 +++++++++++++
+ tests/bugfixes/github/test_issue_3511.py | 17 +++++++++++++++++
+ 2 files changed, 30 insertions(+)
+ create mode 100644 test/data/issue_3511_poc.eps
+ create mode 100644 tests/bugfixes/github/test_issue_3511.py
+
+diff --git a/test/data/issue_3511_poc.eps b/test/data/issue_3511_poc.eps
+new file mode 100644
+index 0000000..4d403cc
+--- /dev/null
++++ b/test/data/issue_3511_poc.eps
+@@ -0,0 +1,13 @@
++%!PS-Adobe-3.0 EPSF-3.0
++%%BoundingBox: 0 0 100 100
++%%EndComments
++%%BeginProlog
++%%EndProlog
++%%Page: 1 1
++%%BeginPageSetup
++%%EndPageSetup
++%BeginPhotoshop: 16
++3842494D040C00000000000441424344
++%EndPhotoshop
++%%PageTrailer
++%%EOF
+diff --git a/tests/bugfixes/github/test_issue_3511.py b/tests/bugfixes/github/test_issue_3511.py
+new file mode 100644
+index 0000000..1825550
+--- /dev/null
++++ b/tests/bugfixes/github/test_issue_3511.py
+@@ -0,0 +1,17 @@
++# -*- coding: utf-8 -*-
++
++import system_tests
++
++
++class test_issue_3511_sigma_LoaderNative_getData(metaclass=system_tests.CaseMeta):
++    url = "https://github.com/Exiv2/exiv2/issues/3511"
++
++    filename = "$data_path/issue_3511_poc.eps"
++    commands = ["$exiv2 -pp $filename"]
++    retval = [1]
++    stderr = [
++        """$exiv2_exception_message $filename:
++$kerCorruptedMetadata
++"""
++    ]
++    stdout = [""]
diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596-2.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596-2.patch
new file mode 100644
index 0000000000..addc01bfd0
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596-2.patch
@@ -0,0 +1,24 @@
+From 6b65696b4af2f0a6b6756ba693aebf83889bafa3 Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Thu, 26 Feb 2026 20:44:54 +0000
+Subject: [PATCH] Check for integer overflow.
+
+CVE: CVE-2026-27596
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/commit/2cb728a850b4aa048a683711906d716c5f9a32ac]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/preview.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/preview.cpp b/src/preview.cpp
+index d99a03a..aefb323 100644
+--- a/src/preview.cpp
++++ b/src/preview.cpp
+@@ -492,6 +492,7 @@ namespace {
+ #endif
+                 return DataBuf();
+             }
++            enforce(sizeData >= 28, Exiv2::kerCorruptedMetadata);
+             return DataBuf(record + sizeHdr + 28, sizeData - 28);
+         } else {
+             throw Error(kerErrorMessage, "Invalid native preview filter: " + nativePreview_.filter_);
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
index 602ef3910f..2bf9c88b3e 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
@@ -33,6 +33,8 @@ SRC_URI = "https://github.com/Exiv2/${BPN}/releases/download/v${PV}/${BP}-Source
            file://CVE-2021-37622-1.patch \
            file://CVE-2021-37622-2.patch \
            file://CVE-2026-25884.patch \
+           file://CVE-2026-27596-1.patch \
+           file://CVE-2026-27596-2.patch \
            "
 SRC_URI[sha256sum] = "a79f5613812aa21755d578a297874fb59a85101e793edc64ec2c6bd994e3e778"
 

