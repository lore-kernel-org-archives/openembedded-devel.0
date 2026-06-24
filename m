Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E4C7CDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 06:23:52 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1081.1782282222876559430
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Jun 2026 23:23:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cR+9dEk9;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782282223; x=1813818223;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EdI+QULhbjW2tJKx/BRIqWLXfe8GzD/g4hlxrWI/UYo=;
  b=cR+9dEk9FM/K6PHYB7D0pRotP8Wz9TGe35emGVx8PLIV9Us6hEnBE38L
   LfnTuxVOKdxLkcQGZrBVKzUjsWZLtW4ctROWucLWRF9L3YvC+MyuXJk54
   8GxvauDKLw52DAh1ZIXkvtvaq57HbAoTuioijaQCY5N32PSkniwpEKpjH
   AfEd+ltX1G4IHeRx3GkjVHryQKY/by164S2bItf/aYIeVetjOmYBqcf1H
   0SvMkOfpVHA4UGOCkkMK1HZlDDMMmAvXHfzUawtSI8b7/gEw2CXnJ7p/O
   PVMjIDlFPAZAs0YTKxC4hhvU+iObRHXNxFm0iP1gNzbGHz2QhXJSnofNA
   w==;
X-CSE-ConnectionGUID: VkOkFG1MRHu6vQh16DpBzQ==
X-CSE-MsgGUID: CgX6Vfv8SnOayNlznKMO6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="243297686"
X-IronPort-AV: E=Sophos;i="6.24,221,1774278000"; 
   d="scan'208";a="243297686"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 15:23:39 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 5194A100014B
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 06:23:39 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 07B8DC00FD8
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 06:23:39 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 1FDEC18002CD;
	Wed, 24 Jun 2026 06:23:36 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] tigervnc: Update to newer version
Date: Wed, 24 Jun 2026 14:23:33 +0800
Message-ID: <20260624062333.1219-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 06:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127706

From: Wang Mingyu <wangmy@fujitsu.com>

Add compat for Nettle >= 4.0
Nettle 4.0 has changed it's digest functions, and removed the length
argument.

This commit adds compatibility with both older and newer versions of
Nettle.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.2.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.2.bb
index a35ab2e3da..4964a441c8 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.2.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.2.bb
@@ -16,9 +16,9 @@ REQUIRED_DISTRO_FEATURES = "x11 pam"
 # out-of-tree builds.
 B = "${S}"
 
-SRCREV = "b555312d70d7ff017f866649a7e7167af4eb8fca"
+SRCREV = "be6e25fca026ce715d5be1d7ba40ef49bebbde51"
 
-SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.16-branch;protocol=https;tag=v${PV} \
+SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=master;protocol=https \
            file://0001-do-not-build-tests-sub-directory.patch \
            file://0002-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch \
            file://0003-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch \
-- 
2.43.0


