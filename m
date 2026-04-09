Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AEF1EA3C44
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:34:31 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128841.1775730864174017586
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:34:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qh/tpR0W;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730862; x=1807266862;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IFqjxjW5xGAdI6FaXRbt5C8+U85T3xiHQNKwe57DktM=;
  b=qh/tpR0WnmgBhu799ikMvKM3whD1zhDaMkTIU+MaNJD63AwMVLk72+LH
   VsmxYKVoBxiiL/rlLCDobhmXtY5ZJymoV2L8vy3L240AyP73z17nPMoyZ
   um39jJivemOfb5E5lJ9Qf3psvGexOzYMQkwbq1HvyLtrNWU8kvZ+8N5bu
   P/E98Bd3are/nuS6qc2kZW9NVkf9/pHJ62vbW2+TXYZa7PfWfJ9tXN4pa
   AhvjeF5pvBnTVm3Cioh0akIVxKc7fAowZJyU9bIpwUKXAOW5LsvVX1xmW
   ba6GMijNu9TGBvQoMQjcmYXp4fd7QsW2YNF7KCja1udwKDMmGjWwuMSfK
   A==;
X-CSE-ConnectionGUID: dOp25CHfRXyHQvYLzLtnwA==
X-CSE-MsgGUID: j1m1iibTRq6UKT9NYlB+lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="235843820"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="235843820"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:34:21 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id BD3C5820718
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:34:22 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 6FD968D29CB
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:34:22 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id EE47A4045FC;
	Thu,  9 Apr 2026 10:34:19 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/37] python3-sqlalchemy: upgrade 2.0.48 -> 2.0.49
Date: Thu,  9 Apr 2026 18:32:16 +0800
Message-ID: <20260409103223.1574-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260409103223.1574-1-wangmy@fujitsu.com>
References: <20260409103223.1574-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:34:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126179

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sqlalchemy_2.0.48.bb => python3-sqlalchemy_2.0.49.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.48.bb => python3-sqlalchemy_2.0.49.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.48.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.49.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.48.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.49.bb
index 6681792f01..ecc9099e30 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.48.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.49.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=53a9111717b305b0fae0d704a24925c3"
 
-SRC_URI[sha256sum] = "5ca74f37f3369b45e1f6b7b06afb182af1fd5dde009e4ffd831830d98cbe5fe7"
+SRC_URI[sha256sum] = "d15950a57a210e36dd4cec1aac22787e2a4d57ba9318233e2ef8b2daf9ff2d5f"
 
 inherit pypi python_setuptools_build_meta cython
 
-- 
2.43.0


