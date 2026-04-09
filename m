Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80CE4F364C5
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 22:07:05 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.144029.1775772423048848432
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 15:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=XrHWH0LV;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-2026040922070421d2c1beca000207cc-sxqkkg@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2026040922070421d2c1beca000207cc
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 10 Apr 2026 00:07:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=7404Z4HOdNwAMJa8rc8XjPTh5Py+A+Tosa69aLrI9Jc=;
 b=XrHWH0LV7jqD+sYwWVxXr60jEnw6BZfYRANsQIDTSvEWiYVAAJsws7JSwPWZrNfZ35Ut3E
 2DyPPu1KeLyAW51a7C5Oyb1+FAyJ5l6K8tEwb8/MSeSQK3ORsN5FRBLW4dMKPF6Qd7Lu5sVa
 sS19v8sFse2Cs3+cHCyhQwXyAFkVyN9JZL7Gkj6mbXlanAMk2hdzxJQa+xYHe50NZ8IVCX12
 c3TrBUrD8tpYWsr3ARQ4RJJ2kzne/46NSQWdQZF2mx9uab4pAO4sT5Bv0VrnDUdwFApWZdck
 SGsAqd0F7SPJsxTLEwDs/kx5OayhXrzXnRdp3WZ7nMrGX97Ct6dqUAjA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][PATCH 3/4] mjansson-mdns: add new recipe
Date: Fri, 10 Apr 2026 00:06:09 +0200
Message-ID: <20260409220610.1216303-3-peter.marko@siemens.com>
In-Reply-To: <20260409220610.1216303-1-peter.marko@siemens.com>
References: <20260409220610.1216303-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 22:07:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126205

From: Peter Marko <peter.marko@siemens.com>

Public domain mDNS/DNS-SD library in C

Add github namespace to recipe name and handle it in CVE_PRODUCT because
there already is a different mdns recipe in meta-openembedded.

Example application is built but not installed.
This is good to verify that current toolchain is copatible with headers.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...e_minimum_required-version-to-3.5-94.patch | 21 +++++++++++++++++++
 .../mjansson-mdns/mjansson-mdns_1.4.3.bb      | 14 +++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/mjansson-mdns/files/0001-Bump-cmake_minimum_required-version-to-3.5-94.patch
 create mode 100644 meta-networking/recipes-protocols/mjansson-mdns/mjansson-mdns_1.4.3.bb

diff --git a/meta-networking/recipes-protocols/mjansson-mdns/files/0001-Bump-cmake_minimum_required-version-to-3.5-94.patch b/meta-networking/recipes-protocols/mjansson-mdns/files/0001-Bump-cmake_minimum_required-version-to-3.5-94.patch
new file mode 100644
index 0000000000..2afccbe463
--- /dev/null
+++ b/meta-networking/recipes-protocols/mjansson-mdns/files/0001-Bump-cmake_minimum_required-version-to-3.5-94.patch
@@ -0,0 +1,21 @@
+From ab8f4118469d7a0bb83b9fcb88fe53482c35f0cb Mon Sep 17 00:00:00 2001
+From: skrede <code@skrede.me>
+Date: Sun, 26 Oct 2025 14:35:05 +0100
+Subject: [PATCH] Bump cmake_minimum_required version to 3.5 (#94)
+
+Upstream-Status: Backport [https://github.com/mjansson/mdns/commit/ab8f4118469d7a0bb83b9fcb88fe53482c35f0cb]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 1bce26d..50f1f05 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.0)
++cmake_minimum_required(VERSION 3.5)
+ project(mdns VERSION 1.4.2 LANGUAGES C)
+ 
+ option(MDNS_BUILD_EXAMPLE "build example" ON)
diff --git a/meta-networking/recipes-protocols/mjansson-mdns/mjansson-mdns_1.4.3.bb b/meta-networking/recipes-protocols/mjansson-mdns/mjansson-mdns_1.4.3.bb
new file mode 100644
index 0000000000..5c404cbb9d
--- /dev/null
+++ b/meta-networking/recipes-protocols/mjansson-mdns/mjansson-mdns_1.4.3.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Public domain mDNS/DNS-SD library in C"
+DESCRIPTION = "This library provides a header only cross-platform mDNS and DNS-DS library in C"
+SECTION = "net"
+LICENSE = "Unlicense"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"
+
+SRC_URI = "git://github.com/mjansson/mdns.git;protocol=https;branch=main;tag=${PV} \
+    file://0001-Bump-cmake_minimum_required-version-to-3.5-94.patch \
+"
+SRCREV = "1727be0602941a714cb6048a737f0584b1cebf3c"
+
+inherit cmake
+
+CVE_PRODUCT = "mjansson:mdns"

