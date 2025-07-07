Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC11C83F15
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:07:17 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.55564.1751879229244037852
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XbgJJn/b;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751879229; x=1783415229;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T9si7GHIqmXjOlMSUAVULn6hypyjjAMtYiEkfBGPG8s=;
  b=XbgJJn/bwqXZWgfkWCsKLq5VFqzGYedcG99D3NgoDhZx2HroFQDQ3Wrk
   5QMB2T1kx6YR2SPcCVSpdB+8OQnQcneUHF5rOW34QUOVuUBQ7+bY5QIVB
   AFwCeXhpbKkrLjFYqJHaYaMLf6Rufr3epDFrtLHJ2CPLnuov3pI30aQdI
   /gvT47m0kz0xYLJSErJ9Sx9ThCaB9LZ2f9jSLI4DkoI7ysrAem2JJINYN
   sbz6tNnaJ1GPpAmE2razpC69JNGUHggp2EwVFoTxqxKaAMtJhHPc1vVKF
   rzKPuJULlYtU+0HfUhXBgRqknALUEvjrZEiGJ1jVZuThr/mu8/heq9zD3
   w==;
X-CSE-ConnectionGUID: EI/7gsRZTmeUezGBQa/mug==
X-CSE-MsgGUID: VTYmIEteTcuMpCWxhzedlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="205517789"
X-IronPort-AV: E=Sophos;i="6.16,293,1744038000"; 
   d="scan'208";a="205517789"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 18:07:07 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 810C142A301
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:07 +0000 (UTC)
Received: from oym-m2.gw.nic.fujitsu.com (oym-m2.gw.nic.fujitsu.com [10.85.9.162])
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTP id 00CC310000EE
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:07 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4E37FBF3C1
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 18:07:06 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 90CC31A000B;
	Mon,  7 Jul 2025 17:07:05 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/35] genimage: upgrade 18 -> 19
Date: Mon,  7 Jul 2025 17:06:24 +0800
Message-ID: <20250707090656.1216-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250707090656.1216-1-wangmy@fujitsu.com>
References: <20250707090656.1216-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:07:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118249

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
===============
Update COPYING with current FSF contact information
Include the most recent GPLv2 version
https://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
This avoids rpmlint errors like E: incorrect-fsf-address

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../genimage/{genimage_18.bb => genimage_19.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/genimage/{genimage_18.bb => genimage_19.bb} (79%)

diff --git a/meta-oe/recipes-support/genimage/genimage_18.bb b/meta-oe/recipes-support/genimage/genimage_19.bb
similarity index 79%
rename from meta-oe/recipes-support/genimage/genimage_18.bb
rename to meta-oe/recipes-support/genimage/genimage_19.bb
index 23169f5d44..7d760825e3 100644
--- a/meta-oe/recipes-support/genimage/genimage_18.bb
+++ b/meta-oe/recipes-support/genimage/genimage_19.bb
@@ -5,12 +5,12 @@ HOMEPAGE = "https://github.com/pengutronix/genimage"
 
 SECTION = "base"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+LIC_FILES_CHKSUM = "file://COPYING;md5=570a9b3749dd0463a1778803b12a6dce"
 
 DEPENDS = "libconfuse"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/genimage-${PV}.tar.xz"
-SRC_URI[sha256sum] = "ebc3f886c4d80064dd6c6d5e3c2e98e5a670078264108ce2f89ada8a2e13fedd"
+SRC_URI[sha256sum] = "7ec4fcb865662a8b2ff20284819044ffa84137bf3ca16fb749701291bc01f108"
 
 EXTRA_OECONF = "--enable-largefile"
 
-- 
2.43.0


