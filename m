Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79FBFC04FE0
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:42:28 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.7633.1690875734649116257
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:42:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="105920454"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="105920454"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:42:24 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8549F10889
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:20 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id BF5A3D3F1A
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:19 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 163FC10211;
	Tue,  1 Aug 2023 16:42:19 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-flask-socketio: upgrade 5.3.4 -> 5.3.5
Date: Tue,  1 Aug 2023 15:41:43 +0800
Message-Id: <1690875717-21608-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
References: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27786.005
X-TMASE-Result: 10-0.671300-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrXs5nqGvDCfOJVYMIlqhVMGMR
	UVZacmGcbtZuiv7jLQUNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl/qzSYnI5VS9npt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFFfpEpl9L+7zGtRF/kX2Oa//u7
	7qNxpM/ANl125y8wtZFeonBU6LGtoJl1ArrDEzzMIQhwjm2lVYSO0VbWs2xXEP8n1AHjYDJ+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 07:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104184

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Prevent allow_unsafe_werkzeug option from being passed to web servers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-flask-socketio_5.3.4.bb => python3-flask-socketio_5.3.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-socketio_5.3.4.bb => python3-flask-socketio_5.3.5.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-socketio_5.3.4.bb b/meta-python/recipes-devtools/python/python3-flask-socketio_5.3.5.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-flask-socketio_5.3.4.bb
rename to meta-python/recipes-devtools/python/python3-flask-socketio_5.3.5.bb
index 4dae0d14ba..34919d2222 100644
--- a/meta-python/recipes-devtools/python/python3-flask-socketio_5.3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-socketio_5.3.5.bb
@@ -9,7 +9,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "Flask-SocketIO"
 
-SRC_URI[sha256sum] = "1cbd379c9bf68ac37bcc4750d01708922fa6365d13a5447d3f8893792879410c"
+SRC_URI[sha256sum] = "5f01158d10db71aa78c969b631ce3b9148b47ab0de1995158f9577f85b004d25"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-flask \
-- 
2.34.1


