Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 328C3C001E0
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:42:18 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.7604.1690875730283396699
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:42:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="126655463"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="126655463"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:42:15 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 387ADCD7E2
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:13 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6F2E0D8B78
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:12 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 036E210211;
	Tue,  1 Aug 2023 16:42:11 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-gunicorn: upgrade 20.1.0 -> 21.2.0
Date: Tue,  1 Aug 2023 15:41:33 +0800
Message-Id: <1690875717-21608-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
References: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27786.005
X-TMASE-Result: 10--2.379600-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yXg2y0j5vXZGlEDhvi2wR879wRnyxuPjhHw6
	H06bMgiv0TZ+3Pa0fjpr5bZb8g/L5LBAQLqGlKivP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5nSqefas3A0znWWI8LLh4DeBzEkCCpnRlvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZKty56DySWWwe9TlLJn6tSscozLsjXOe50tYSFmgAjyV8cFs
	HF3Hlrq6xa3nbEeteb5d6q7D6Sqlre2eXQlWb3Rv7uVmwOlDlZLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 07:42:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104174

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: year updated to 2009-2023

Changelog:
 fix thread worker: revert change considering connection as idle

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-gunicorn_20.1.0.bb => python3-gunicorn_21.2.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gunicorn_20.1.0.bb => python3-gunicorn_21.2.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-gunicorn_20.1.0.bb b/meta-python/recipes-devtools/python/python3-gunicorn_21.2.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-gunicorn_20.1.0.bb
rename to meta-python/recipes-devtools/python/python3-gunicorn_21.2.0.bb
index f381b9df2b..d765c8fd05 100644
--- a/meta-python/recipes-devtools/python/python3-gunicorn_20.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gunicorn_21.2.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "WSGI HTTP Server for UNIX"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f75f3fb94cdeab1d607e2adaa6077752"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=302423eeae97079c633da81b6a5fe35e"
 
-SRC_URI[sha256sum] = "e0a968b5ba15f8a328fdfd7ab1fcb5af4470c28aaf7e55df02a99bc13138e6e8"
+SRC_URI[sha256sum] = "88ec8bff1d634f98e61b9f65bc4bf3cd918a90806c6f5c48bc5603849ec81033"
 
 inherit pypi setuptools3 ptest
 
-- 
2.34.1


