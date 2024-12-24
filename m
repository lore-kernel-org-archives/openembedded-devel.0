Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2BFEC0218E
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:31 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.30359.1735032440774627257
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NRhvEe9i;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032442; x=1766568442;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=FPbt92NSkcibAZvD/udFCVmMuiXhDDWe0YNtOHrJLMI=;
  b=NRhvEe9i+rnHrMV+sqOj/oGihSzkAPUSKx0483GqOa74JQOL7VcB6FTz
   HFwoVHaqK0fyLrc3UUzP/z52cQzmwsO9lbssLgdORt7T5I4mUWwmxLiGt
   54MPistQk2b6C0xpQ29aykg7tXlS8MGA/oB/W3VqX3TTC95KlKffaMEEu
   kuoK4xG2CBRhQz6MQYjy3A/eLmvl/RWmMRYuWSQqX7W7DLbZZ1ZelV6ab
   tsWruSJUov8p/DOQjG99xPj1Z0Mn6VieTf+YnYjyd4swn3W4qosfnSwGc
   P6xo/YGbS0c/XncgFJMvcDIBC4hUTCXduZKvetX8iLKH0e6vXpLugFfeg
   w==;
X-CSE-ConnectionGUID: yafR3qA2Q4mYe0DnCzrwHQ==
X-CSE-MsgGUID: siTSVAbrR2WYNnjN9vBLyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="183972683"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="183972683"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:20 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5BFC5D6EA1
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:18 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 305C2F740
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C344E20071A3A
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:17 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6ACC91A0071;
	Tue, 24 Dec 2024 17:27:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/67] python3-cytoolz: upgrade 1.0.0 -> 1.0.1
Date: Tue, 24 Dec 2024 17:26:12 +0800
Message-Id: <1735032421-13513-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10-0.250400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mregIHHX2L4YyU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN3IFFT9wqfr0QhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXL1XhkbdBKrLRy4wb/JoTnGS+nXQjCMZU+xvJ
	itlblxnF8zFvefygHgCVLb1L67gfQUj6P2nV2QyjwFdd8DEQeSkz5rUsJj1WD+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114492

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Add support for Python 3.13

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-cytoolz_1.0.0.bb => python3-cytoolz_1.0.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cytoolz_1.0.0.bb => python3-cytoolz_1.0.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-cytoolz_1.0.0.bb b/meta-python/recipes-devtools/python/python3-cytoolz_1.0.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-cytoolz_1.0.0.bb
rename to meta-python/recipes-devtools/python/python3-cytoolz_1.0.1.bb
index 9df99e03c8..4aa110107a 100644
--- a/meta-python/recipes-devtools/python/python3-cytoolz_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cytoolz_1.0.1.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d422ebce3e9c6447563bd410e9b22f2e"
 
-SRC_URI[sha256sum] = "eb453b30182152f9917a5189b7d99046b6ce90cdf8aeb0feff4b2683e600defd"
+SRC_URI[sha256sum] = "89cc3161b89e1bb3ed7636f74ed2e55984fd35516904fc878cae216e42b2c7d6"
 
 inherit pypi setuptools3 cython
 
-- 
2.43.0


