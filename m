Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D731106702B
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 14:06:21 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22489.1773324380475702086
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 07:06:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm1 header.b=dGvbFU6S;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1334352-2026031214061894330c8e73000207a9-slmw6_@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2026031214061894330c8e73000207a9
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 12 Mar 2026 15:06:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=MKeeuNtnjejyQUFEEgw4maxv58ajs35n54X17CeVhos=;
 b=dGvbFU6SgYNOpJcmrmWclpu7WoHHoGxSfIz5NRJw5SKhTfEMfiiBswtrt+0/Yo9w46hmXp
 dB4gZeQl/j0YJ4tzTHR1pYO4+GJP1QZj1kSWnqPfr1ZhlqJsdRWOmyaqcxRLbeyO91rLNZUU
 we/hPMBbUfRdgaDuVYuoYJkDh1ZEO3Ty509Xf/rmhrOUdIv0YdQreotPY+QoPHpKx75flcya
 AeLGooAzOI5hTU449Vqm/3ytOvwvEWSioz+K2U7GAavNG9n5MGMg2gmiYw25CKRwhwPWrTYA
 by1VGgjjMOmqfo+BvaBfZLbJ7bBxyGArKUHNw9Vn7MCNPWtHKTYYSlng==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [meta-oe][PATCH 6/6] libcbor: upgrade 0.12.0 -> 0.13.0
Date: Thu, 12 Mar 2026 15:05:01 +0100
Message-ID: <20260312140501.29859-6-andrej.kozemcak@siemens.com>
In-Reply-To: <20260312140501.29859-1-andrej.kozemcak@siemens.com>
References: <20260312140501.29859-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 14:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125171

Changelog:
  https://github.com/PJK/libcbor/releases/tag/v0.13.0

  Changed:
    - Fix small typo in release script
    - Fix failing 32 bit tests due to cmocka macro repeating stack pushes
    - Set cmake_minimum_required to 3.5
    - Fix float_ctrl ctrl assertions failing in debug mode
    - Check in vscode setup
    - Add CBOR sequences example
    - Add riscv64 config to CircleCI
    - Add a test for malformed definite maps
    - Add [[nodiscard]] support and auto-update to C23 in cmake
    - Configure ctest on to export the test results to CircleCI
    - Revamp the introduction doc into a more useful crash course
    - Add OSX asan/lsan supression config
    - Add cbor_copy_definite
    - Improve handling and coverage reporting of exhaustive enum switches
    - Add references to readme
    - Update python deps and related docs
    - Link tutorial in readme (and fix embedded RST formatting)
    - Add a doc note on lto linking
    - Add a doc for the reference count in cbor_array_set().
    - Add gh link to docs
    - Add #355 to changelog
    - Bump version to 0.13.0

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 .../libcbor/{libcbor_0.12.0.bb => libcbor_0.13.0.bb}         | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/libcbor/{libcbor_0.12.0.bb => libcbor_0.13.0.bb} (77%)

diff --git a/meta-oe/recipes-extended/libcbor/libcbor_0.12.0.bb b/meta-oe/recipes-extended/libcbor/libcbor_0.13.0.bb
similarity index 77%
rename from meta-oe/recipes-extended/libcbor/libcbor_0.12.0.bb
rename to meta-oe/recipes-extended/libcbor/libcbor_0.13.0.bb
index fa48d23bde..3bed8a6e72 100755
--- a/meta-oe/recipes-extended/libcbor/libcbor_0.12.0.bb
+++ b/meta-oe/recipes-extended/libcbor/libcbor_0.13.0.bb
@@ -4,10 +4,9 @@ DESCRIPTION = "C library for parsing and generating CBOR, the general-purpose sc
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=6f3b3881df62ca763a02d359a6e94071"
 
-SRC_URI = "git://github.com/PJK/libcbor.git;protocol=https;branch=master \
-        file://0001-allow-build-with-cmake-4.patch"
+SRC_URI = "git://github.com/PJK/libcbor.git;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "ae000f44e8d2a69e1f72a738f7c0b6b4b7cc4fbf"
+SRCREV = "9826a4315116a588f7416912db9da6fcecd8da11"
 
 inherit cmake
 
-- 
2.47.3


