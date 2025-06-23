Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F15CC8302A
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 07:11:57 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.13874.1750662712468065205
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 00:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=T2KgbSQn;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750662717; x=1782198717;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tkqhF6PirCp5llclj+MTnHBQKeYjN/RnmDDXkZAUVY4=;
  b=T2KgbSQnb4HzLDjQ38kA2Q+AbOSEOAQys3yZfbW6pcf/bZZdGgcRzoeo
   PCU1x0fc1kuY44if3jXEynpfxH6D4/DOzlDDvKM/d4mHBfB9ia9YMw4ZS
   z/OWdk1AJ7dl26hdTzI/jLaeVrqw7RowjnUJWMOP4n01wDFRFmeB3gh9u
   D+vYQNJewPHmJQ73ckAz6kl/R6S+W8Eu6e/vCP9GMdKF+UYbSEa18z0VM
   4NrWHJhagvpHC79RjlJr0kiBGYBQtFWsRTwxD9oM9DdC3EXSNbmHxBvaT
   IEn/sMOd0qWX72GbymkvgeQMZE2Z4H3gScNmw1ArVsVLNnxUlfYl1M/DN
   Q==;
X-CSE-ConnectionGUID: 1svLWymZT9Wi/xZ4kcHq4g==
X-CSE-MsgGUID: h2PmoIFHSCefYGzbAWplZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="192069988"
X-IronPort-AV: E=Sophos;i="6.16,258,1744038000"; 
   d="scan'208";a="192069988"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 16:11:56 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id A9A59D5053
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 653ADCFB68
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:53 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D63C91A0071;
	Mon, 23 Jun 2025 15:11:52 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/30] python3-pycodestyle: upgrade 2.13.0 -> 2.14.0
Date: Mon, 23 Jun 2025 15:11:27 +0800
Message-ID: <20250623071138.402-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250623071138.402-1-wangmy@fujitsu.com>
References: <20250623071138.402-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 07:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118048

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add support for python 3.14.
- Fix false positive for TypeVar defaults with more than one argument.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-pycodestyle_2.13.0.bb => python3-pycodestyle_2.14.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycodestyle_2.13.0.bb => python3-pycodestyle_2.14.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pycodestyle_2.13.0.bb b/meta-python/recipes-devtools/python/python3-pycodestyle_2.14.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pycodestyle_2.13.0.bb
rename to meta-python/recipes-devtools/python/python3-pycodestyle_2.14.0.bb
index f690d97b94..4389198fba 100644
--- a/meta-python/recipes-devtools/python/python3-pycodestyle_2.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pycodestyle_2.14.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a8546d0e77f416fb05a26acd89c8b3bd"
 
-SRC_URI[sha256sum] = "c8415bf09abe81d9c7f872502a6eee881fbe85d8763dd5b9924bb0a01d67efae"
+SRC_URI[sha256sum] = "c4b5b517d278089ff9d0abdec919cd97262a3367449ea1c8b49b91529167b783"
 
 inherit pypi setuptools3
 
-- 
2.43.0


