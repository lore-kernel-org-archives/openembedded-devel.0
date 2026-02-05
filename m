Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D48C1EA7974
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 05:15:47 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14220.1770268535527828073
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 21:15:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MorYF/ZE;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770268538; x=1801804538;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BtLfALln9uatC6soOViq6qLx7XluBrCbYMiWIAo0lsA=;
  b=MorYF/ZEJgpW+6mLhr6QO1qXPHVzfXVMNdGrSmpOOGbri+17uQdRcTvD
   ehmL4qP/kp8wSDgtz5SQnf77qMTTeGSzgZuGv3rLaH8U4vRigUMzI7NSX
   f+sIoeiB2CcYvBpcRAYLsc5h5rsqIdfIE+GFFqhk73nbq+PgaygCh450L
   ZnlDbJ+N80Uk71uOATsexdh+ZgUjtbz4sOaDyvkKE6A+xUNsR+FOzoCqH
   CNo+ddqV20RPaBdPbUE9/VWrAMoUV2P6izo5moGFpQUJcj7lBiaWutQ1w
   HzkN6JTIsBFIRz0YUq+qqCbtQn6aYAle4ko2WQ4NoBQA/cI8I8hfk5fbd
   w==;
X-CSE-ConnectionGUID: c68s8XoHSWix1YS05BUMHQ==
X-CSE-MsgGUID: +Qzh/f2qS4arg/f6wiDkPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="229250027"
X-IronPort-AV: E=Sophos;i="6.21,274,1763391600"; 
   d="scan'208";a="229250027"
Received: from unknown (HELO mail.fujitsu.com) ([20.61.8.234])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 14:15:37 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.fujitsu.com (Postfix) with ESMTPS id 9392C4071CB
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:15:37 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 39C841C100B7
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:15:37 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id A47A820000C1;
	Thu,  5 Feb 2026 05:15:34 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/24] python3-icontract: upgrade 2.7.2 -> 2.7.3
Date: Thu,  5 Feb 2026 13:14:27 +0800
Message-ID: <20260205051435.1366-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260205051435.1366-1-wangmy@fujitsu.com>
References: <20260205051435.1366-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 05:15:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124169

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Treat __setstate__ as constructor

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-icontract_2.7.2.bb => python3-icontract_2.7.3.bb} | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-icontract_2.7.2.bb => python3-icontract_2.7.3.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-icontract_2.7.2.bb b/meta-python/recipes-devtools/python/python3-icontract_2.7.3.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-icontract_2.7.2.bb
rename to meta-python/recipes-devtools/python/python3-icontract_2.7.3.bb
index 355f1fd88b..e76c7af8b0 100644
--- a/meta-python/recipes-devtools/python/python3-icontract_2.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-icontract_2.7.3.bb
@@ -3,11 +3,9 @@ HOMEPAGE = "https://pypi.org/project/icontract"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1d4a9b1f6b84bedf7a38843931e0dd57"
 
-PR = "r0"
-
 inherit pypi setuptools3
 PYPI_PACKAGE = "icontract"
-SRC_URI[sha256sum] = "281ec16f1d09bbcca7a4227e82cd10b4d5fb291f638df77c29b7acf493dd3178"
+SRC_URI[sha256sum] = "df37a43d86d532407bc6b84dea29dd9f7ece794b73211769fa8a33a76b8ed145"
 
 RDEPENDS:${PN} += "python3-asttokens"
 
-- 
2.43.0


