Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FCDD1067026
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 14:06:11 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22329.1773324363213466159
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 07:06:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm1 header.b=XqrI0Za8;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1334352-20260312140601611cc6d33d00020705-ib_hno@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260312140601611cc6d33d00020705
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 12 Mar 2026 15:06:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=R3FN+C/FJ1cY40N6cQ7LaQPGKKTxC7qaBRp33nJs1/o=;
 b=XqrI0Za8Jex+tVTLWPdpxLksoIfRJk6cXEqqvqlDUZnPebfo7slHHCm9uKIgSX2+zs5Xyh
 9wDYvb08tS8gvuqDtDPVxSwLX+e0hOfFLwQkdEM+Z/JzSeBhZhCBmZktMR5ani3HeiwlpY4y
 cMEQW/gNZPcE9BTQabf9ppA7OG8pb6+GIcTnjPP881IGrQD8D53QaXHb/st4XZ+lTX9wTl0p
 pd2+WxvkOGRAyzd83JorEI8ggT+iJHGP+T9Om41RkPHg4cYTYgYs9tcM1CnkxcLiR04H8fE/
 u0KCyWJ2RySCFSjZB4dr50kJplVpfxfpx7DKgpllJ2hvei4zdibSvVmA==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [meta-networking][PATCH 3/6] libcpr: upgrade 1.13.0 -> 1.14.2
Date: Thu, 12 Mar 2026 15:04:58 +0100
Message-ID: <20260312140501.29859-3-andrej.kozemcak@siemens.com>
In-Reply-To: <20260312140501.29859-1-andrej.kozemcak@siemens.com>
References: <20260312140501.29859-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 14:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125168

The tag is not on any branch.

Changelog:

1.14.2:
  https://github.com/libcpr/cpr/releases/tag/1.14.2

  Changed:
    - test: don't reflect Content-Length from request
    - Fixed curlholder Double Free
    - Fix error when running CMake configure multiple times with CPR_BUILD_TESTS, bump CMake min version to 3.18
    - fix: replace curl_error_map with switch to fix Static Initialization Order Fiasco
    - Updated Bazel Instructions
    - Bump actions/upload-artifact from 5 to 6
    - Bump actions/checkout from 5 to 6
    - Bump jwlawson/actions-setup-cmake from 1.14 to 2.1

v1.14.1:
  https://github.com/libcpr/cpr/releases/tag/1.14.1

  Changed:
    - Fixed SSE Windows string parsing

v1.14.0
  https://github.com/libcpr/cpr/releases/tag/1.14.0

  Changed:
    - fix: Crash when building with /MT in MSVC (double-destructor) #1276
    - 1.14.0 Release Preparation - NuGet Release Build Fixes
    - Add support for Server Sent Events (SSE)

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 .../libcpr/{libcpr_1.13.0.bb => libcpr_1.14.2.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libcpr/{libcpr_1.13.0.bb => libcpr_1.14.2.bb} (79%)

diff --git a/meta-networking/recipes-support/libcpr/libcpr_1.13.0.bb b/meta-networking/recipes-support/libcpr/libcpr_1.14.2.bb
similarity index 79%
rename from meta-networking/recipes-support/libcpr/libcpr_1.13.0.bb
rename to meta-networking/recipes-support/libcpr/libcpr_1.14.2.bb
index 04dda31770..bdbd244e33 100644
--- a/meta-networking/recipes-support/libcpr/libcpr_1.13.0.bb
+++ b/meta-networking/recipes-support/libcpr/libcpr_1.14.2.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=08beaae5deae1c43c065592da8f38095"
 
 DEPENDS = "curl openssl"
 
-SRC_URI = "git://github.com/libcpr/cpr.git;protocol=https;branch=master;tag=${PV}"
-SRCREV = "516cb3e5f4e38bede088f69fcf122c6089e38f00"
+SRC_URI = "git://github.com/libcpr/cpr.git;protocol=https;nobranch=1;tag=${PV}"
+SRCREV = "f091b2c061b307ee89b164c39976fc9202a1c79d"
 
 
 inherit cmake
-- 
2.47.3


