Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0AD5CCD1BB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 02:23:09 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.4828.1761099782447904978
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 19:23:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SBIjDTvP;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761099782; x=1792635782;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/5zi0i7e4ofUc2pA040wS3t2R7UQrJFLPUbQWSCBTjg=;
  b=SBIjDTvP+pL9ox22iBr5oHAH4I555WW2Y4Wpl9egDABBsPBbdjW0GGH6
   N90cI8d14U/kK0grfHcPKLn2irVjcW1mlAnvoYAqVBuAcC0PW6otoHwYd
   8WVUIEvzLGvM1fN7N944nPigLBV+T98i67EADnkqNHh2wBlUg+BKk4Up+
   YXILQKLVbxlIIn7lXTWtsJ9u/FV9+a1DWjJ3EwU8z8IS2M+Yuf2RjjONB
   LVwjXWT8Z5nmGCWqt+aotnUQzXsbjvZ5UiOqJAWvwoSxr4QyzKs4WW/Np
   cLuKxvQZ/eFYd8tcaGGemc0Or5eDGfPiXdTVqc7Ty4CE4RqiZJ5qoatqe
   A==;
X-CSE-ConnectionGUID: NolBtgQ4RTqwIiXM1tTzZA==
X-CSE-MsgGUID: 3/e2liT+QDmIutpR/Yaa5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="216654687"
X-IronPort-AV: E=Sophos;i="6.19,246,1754924400"; 
   d="scan'208";a="216654687"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 11:23:01 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id D48841C1C726
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:00 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 89F748D2058
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id D4F6D82C0DE;
	Wed, 22 Oct 2025 02:22:57 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/29] python3-colorlog: upgrade 6.9.0 -> 6.10.1
Date: Wed, 22 Oct 2025 10:22:10 +0800
Message-ID: <20251022022227.226-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251022022227.226-1-wangmy@fujitsu.com>
References: <20251022022227.226-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120861

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  When logging exceptions, enable colorized traceback

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-colorlog_6.9.0.bb => python3-colorlog_6.10.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-colorlog_6.9.0.bb => python3-colorlog_6.10.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-colorlog_6.9.0.bb b/meta-python/recipes-devtools/python/python3-colorlog_6.10.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-colorlog_6.9.0.bb
rename to meta-python/recipes-devtools/python/python3-colorlog_6.10.1.bb
index a418d213af..5e5a6174f2 100644
--- a/meta-python/recipes-devtools/python/python3-colorlog_6.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-colorlog_6.10.1.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "colorlog"
 
-SRC_URI[sha256sum] = "bfba54a1b93b94f54e1f4fe48395725a3d92fd2a4af702f6bd70946bdc0c6ac2"
+SRC_URI[sha256sum] = "eb4ae5cb65fe7fec7773c2306061a8e63e02efc2c72eba9d27b0fa23c94f1321"
 
 RDEPENDS:${PN} += "python3-logging"
 
-- 
2.43.0


