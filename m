Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A49CD8CAD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:30:22 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76251.1781001012412309304
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 03:30:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JJoQrvyb;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781001018; x=1812537018;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=P0aCMCBin/Vxhn/wC0wYIdmEi4NU9XnVvHH++7I82dU=;
  b=JJoQrvybsNSGeJbiX1U6IA0hfUQyi4fwD1gxFsmUurlteBXZFVSIbj9x
   XlnYRLwGW0dtizqhuKZq9rCmmHRJ9+MFCqtz97lKZIcpnE9yWYrDLtjT9
   SxbgRcNFbudxptUbDCAVvOjhytU6nFWg1ue5SDl/njrWSeFF0sFodn36a
   SoArvTWPe+xYzKnm9rT4l4G8sMB81BgorApFkRsMjMaFhQ9LHtK062wX3
   Ys5Mq9GVXblN8s4gksjFchfnIdfCBVm1G+BAYK2F1tKbOD4aIS4ZGlM2C
   BSRpIlPf6uvdpX6n41zsHzTC8m7QYeGwwiL5Tjb5kIRkY5dKK1VdR0iAG
   A==;
X-CSE-ConnectionGUID: zxedmJDjT6ic8JhZde/g8w==
X-CSE-MsgGUID: vlgrNzwDRXGLRJWrIIETTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="243544229"
X-IronPort-AV: E=Sophos;i="6.24,196,1774278000"; 
   d="scan'208";a="243544229"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 19:30:17 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 37BFE3D03
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:30:17 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id DB4A0C09B5C
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:30:16 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id EC86E10003CE;
	Tue,  9 Jun 2026 10:30:14 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/30] python3-uefi-firmware: upgrade 1.13 -> 1.16
Date: Tue,  9 Jun 2026 18:29:11 +0800
Message-ID: <20260609102913.2204-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260609102913.2204-1-wangmy@fujitsu.com>
References: <20260609102913.2204-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127482

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
===============
- fix(packaging): build abi3 extension with stable suffix (#153)
- Fetch refs in release workflow
- Generate version dynamically from refs
- Add test dependencies (#151)

Changelog:
============
- Replace more bytes/str mixing
- Apply hardening fixes from upstream Tiano implementation
- Build generic stable ABI wheels targeting Python 3.10+
- Add test dependencies
- Parsing fixes and support for generate_checksums=True
- fix(packaging): build abi3 extension with stable suffix

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-uefi-firmware_1.13.bb => python3-uefi-firmware_1.16.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-uefi-firmware_1.13.bb => python3-uefi-firmware_1.16.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-uefi-firmware_1.13.bb b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.16.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-uefi-firmware_1.13.bb
rename to meta-python/recipes-devtools/python/python3-uefi-firmware_1.16.bb
index 7fe92e31f2..178b83f399 100644
--- a/meta-python/recipes-devtools/python/python3-uefi-firmware_1.13.bb
+++ b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.16.bb
@@ -5,11 +5,11 @@ extracting, and recreating UEFI firmware volumes. This includes parsing \
 modules for BIOS, OptionROM, Intel ME and other formats too."
 HOMEPAGE = "https://github.com/theopolis/uefi-firmware-parser"
 LICENSE = "BSD-2-Clause & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://setup.py;md5=5a59066a8676f17262ef7e691f8ef253"
+LIC_FILES_CHKSUM = "file://setup.py;md5=f3ddb5c3a389eada068ddcf6b89f62b2"
 
 SRC_URI = "git://github.com/theopolis/uefi-firmware-parser;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "6d7cf5f0672c577028462ec175fec9fda95cc5f0"
+SRCREV = "e202e576cefd1fefb3f510237bbd0aea8aedca07"
 
 inherit setuptools3
 
-- 
2.43.0


