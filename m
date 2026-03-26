Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9333D10A3D74
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:58:04 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45666.1774526280547053646
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:58:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LkQMRDN9;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526280; x=1806062280;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yrjXWALmlMVJztTelgxBO9/wQWYl942/OiUSZQ1U/iA=;
  b=LkQMRDN99OP/pM/IcFcCU6mL+g/dZ1OG4CkQi2sUQQMErac7B54geFOE
   UweijuV9jigQhWqzfjoiQfPUgFDL6SOLTOM1JfBCvc1+HfL6+ex1ZuGGi
   xdoSMA/wvT3RrSOrt3sHxlkqcRMe7hXM+aZBFdpSE3ub/t7wFJ9b7wh/a
   Vca1QrLah0CIdyBupLw6g9W3I4CmqQgB7mEHoXQt0bPYF39HaXFITk7df
   5lDFN+acny5WMkJxdx+o0QM59gfX2WiASKkbGqg8xdelfWwynRvUgejfR
   sHeZZttTGlbapYZZli4KB+NK0XexSD0pDC60hLjDhq2v2rcp6ydLO2gA+
   Q==;
X-CSE-ConnectionGUID: LUzDIQ3xSJ+wh+U+gjL5Zg==
X-CSE-MsgGUID: FtamdAv4TBK7aHLPCldmiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="213717131"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="213717131"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:59 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 1EBBCC0040D
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:59 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id CB5F1181AA55
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 6ADB31807162;
	Thu, 26 Mar 2026 11:57:56 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 49/63] python3-rich-toolkit: upgrade 0.15.1 -> 0.19.7
Date: Thu, 26 Mar 2026 19:56:19 +0800
Message-ID: <20260326115634.1199-49-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125704

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-rich-toolkit_0.15.1.bb => python3-rich-toolkit_0.19.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rich-toolkit_0.15.1.bb => python3-rich-toolkit_0.19.7.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-rich-toolkit_0.15.1.bb b/meta-python/recipes-devtools/python/python3-rich-toolkit_0.19.7.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-rich-toolkit_0.15.1.bb
rename to meta-python/recipes-devtools/python/python3-rich-toolkit_0.19.7.bb
index b649d41575..26801293b5 100644
--- a/meta-python/recipes-devtools/python/python3-rich-toolkit_0.15.1.bb
+++ b/meta-python/recipes-devtools/python/python3-rich-toolkit_0.19.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/patrick91/rich-toolkit"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://pyproject.toml;md5=29c91c89ee62891477a1476375143bef;beginline=6;endline=6"
 
-SRC_URI[sha256sum] = "6f9630eb29f3843d19d48c3bd5706a086d36d62016687f9d0efa027ddc2dd08a"
+SRC_URI[sha256sum] = "133c0915872da91d4c25d85342d5ec1dfacc69b63448af1a08a0d4b4f23ef46e"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0


