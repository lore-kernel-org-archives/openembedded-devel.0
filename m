Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD60C00A8F
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 23:38:35 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.6625.1698104310434997367
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 16:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="136743696"
X-IronPort-AV: E=Sophos;i="6.03,246,1694703600"; 
   d="scan'208";a="136743696"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 08:38:27 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 29250D4257
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:38:24 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5A0CCD88AD
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:38:23 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A207D70BE1;
	Tue, 24 Oct 2023 08:38:22 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-types-psutil: upgrade 5.9.5.16 -> 5.9.5.17
Date: Tue, 24 Oct 2023 07:38:09 +0800
Message-Id: <1698104289-31865-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27954.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27954.003
X-TMASE-Result: 10-0.768400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mr1MQptE5i65CU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa3BF2OdN6oAASl6ppmExqcYnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFFFCzDPWBx53+eIdYtHgDKeYLs
	/oYcrdjMx990PEf3QNJmd8hQRE+Ic9A90LagL61GdHo6o7BZkf6b2NzDuqYsvX4iwkqFSlFOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 23:38:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105699

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 psutil: updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ypes-psutil_5.9.5.16.bb => python3-types-psutil_5.9.5.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-psutil_5.9.5.16.bb => python3-types-psutil_5.9.5.17.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.16.bb b/meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.17.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.16.bb
rename to meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.17.bb
index 02245be622..055cecd640 100644
--- a/meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.16.bb
+++ b/meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.17.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=ef4dc1e740f5c928f1
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "4e9b219efb625d3d04f6bf106934f87cab49aa41a94b0a3b3089403f47a79228"
+SRC_URI[sha256sum] = "f7d8769812d72a4b513d7ec9eb5580fe2f6013fc270394a603cb6534811f3e4d"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


