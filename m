Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3161DC5DF85
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:36:11 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3308.1787132169127160110
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:36:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SXtM3tGf;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132169; x=1818668169;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qn+L79p6ZkQNEB4/tRCCgf7J0OiU075wz6RjSon4oaA=;
  b=SXtM3tGfJ71dI23Q7CoAr+yr4SQDH4xHsIP/3RtpPD1bmibcRlo+fw4Y
   /h9HejZhAChcAxM8STl86i6q/xC9NEOXNqDuVdpp34HQQxK+gsjUe3FNG
   wUALwdn4/r1pPCntxoOdCTbwJyEkU93ap08Tu281TY2xsVfdA6A5QzvIu
   sF6/tO6OViYos0ZfB4nbpuTjroTrJgbgSP4Ulnwgr5dwlQT4inN2egzIF
   PoAD5fTroKmC8n5q/Vu9kL2UsFXJ0WWLEZcHEGQ/JdPf0AGwnSi1Dr6gB
   Gz6yQCNpjdISTfa/7EescBbCYiCExhCPQRyG0EH9WP+Xresg3mlmidjYq
   g==;
X-CSE-ConnectionGUID: uhpKkV4/SReI41vvzCYGXQ==
X-CSE-MsgGUID: lK+C6ChmQIC7OOY4c/0+lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="239330829"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="239330829"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:36:07 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 719DE8200BB
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:07 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 2C0EE148CE4C
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:07 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 39CD41801C0A;
	Wed, 19 Aug 2026 09:36:04 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/70] python3-djangorestframework: upgrade 3.17.1 -> 3.18.0
Date: Wed, 19 Aug 2026 17:34:31 +0800
Message-ID: <20260819093514.1101-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129297

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ramework_3.17.1.bb => python3-djangorestframework_3.18.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-djangorestframework_3.17.1.bb => python3-djangorestframework_3.18.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-djangorestframework_3.17.1.bb b/meta-python/recipes-devtools/python/python3-djangorestframework_3.18.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-djangorestframework_3.17.1.bb
rename to meta-python/recipes-devtools/python/python3-djangorestframework_3.18.0.bb
index 42edd15156..a0f9bef7a2 100644
--- a/meta-python/recipes-devtools/python/python3-djangorestframework_3.17.1.bb
+++ b/meta-python/recipes-devtools/python/python3-djangorestframework_3.18.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://pypi.python.org/pypi/djangorestframework"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1"
 
-SRC_URI[sha256sum] = "a6def5f447fe78ff853bff1d47a3c59bf38f5434b031780b351b0c73a62db1a5"
+SRC_URI[sha256sum] = "2323a5111837e0b784dcb8323abc78ecc54fa2a5af7aff2677cf50cdd849477f"
 
 PYPI_PACKAGE = "djangorestframework"
 
-- 
2.43.0


