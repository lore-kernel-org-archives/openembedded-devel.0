Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E18A7C61DB2
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:06 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.6740.1747817996379290218
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 02:00:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tlZf6M49;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747818005; x=1779354005;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=0FGiMfZA2fImWCIcYYmRIi1UXDeJBsuwZ/Z+T9KBhjo=;
  b=tlZf6M49pLUIbJh7uA9BhUS5qAq41PCDiAJDmMeH+LsTOFiYx1/Ud9WO
   NXAcokyrsSCb8p3IZUyoMha7VIBjG+5x7oe6DlglXAD8Eq1WIFRNInjOF
   mZLwcMptUZo+20IMsPWTf5dTm5dRzWBLY+ErFoIsoCkEzKcUKKfq+rDJX
   6T6bbUom4bzWwfuwTjBCwwUoekiBOG6FKB6atHwCVUa8ozNH/uKBB62mY
   9ZwPIyKKfLe25R/GQWw8GmbgOt/U0Cp8S0PHjBWD+JHicY9zocir9CEgq
   2rkM27eiqEhzPYB64XgrExHEjOLheNITAvSfmA8iNPkoEl+b02EBzMRwe
   A==;
X-CSE-ConnectionGUID: 5jEYrKBbSReW7ZKJWQWjYw==
X-CSE-MsgGUID: TvMFF08+R5isey6/wC6JUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="200161127"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="200161127"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 18:00:04 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id DB0B9D942F
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 18:00:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8F5BCD50A3
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 18:00:01 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1E7581A009A;
	Wed, 21 May 2025 17:00:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 40/43] python3-validators: upgrade 0.34.0 -> 0.35.0
Date: Wed, 21 May 2025 16:59:29 +0800
Message-Id: <1747817972-28874-40-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117564

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 0.35.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-validators_0.34.0.bb => python3-validators_0.35.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-validators_0.34.0.bb => python3-validators_0.35.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-validators_0.34.0.bb b/meta-python/recipes-devtools/python/python3-validators_0.35.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-validators_0.34.0.bb
rename to meta-python/recipes-devtools/python/python3-validators_0.35.0.bb
index 5bbcf4d5a5..d598cdc97c 100644
--- a/meta-python/recipes-devtools/python/python3-validators_0.34.0.bb
+++ b/meta-python/recipes-devtools/python/python3-validators_0.35.0.bb
@@ -2,8 +2,8 @@ SUMMARY = "Python Data Validation for Humans"
 HOMEPAGE = "https://python-validators.github.io/validators"
 LICENSE = "MIT"
 
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b3fb4b9e6db86c69a33d5e3ee013ab59"
-SRC_URI[sha256sum] = "647fe407b45af9a74d245b943b18e6a816acf4926974278f6dd617778e1e781f"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78327e3919fcd4e9a4a07299899c634c"
+SRC_URI[sha256sum] = "992d6c48a4e77c81f1b4daba10d16c3a9bb0dbb79b3a19ea847ff0928e70497a"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


