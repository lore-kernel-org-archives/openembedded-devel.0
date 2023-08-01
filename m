Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93509C07E8C
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:42:28 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.7609.1690875735070554660
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:42:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="126613532"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="126613532"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:42:19 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F27DDE632
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:16 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C8C6ED9481
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:15 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5753510211;
	Tue,  1 Aug 2023 16:42:15 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cmake: upgrade 3.26.4 -> 3.27.0
Date: Tue,  1 Aug 2023 15:41:38 +0800
Message-Id: <1690875717-21608-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
References: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27786.005
X-TMASE-Result: 10--3.922800-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mrjdL0b7DvTG6U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNsZaZ5UBQsodV4BnlVId1nZsoi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62S6YKr3WfQABYTujckHq+IC646H+5TWTEffLBQ4Tz9+RB0Qq
	h7q+B3UiB3XhDET/gDXvKd22KAs2yLwMsYamaW+H2jJvMlqMz9S7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 07:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104178

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 chore(deps): bump cmake from 3.26.3 to 3.26.4
 chore: continue testing with python 2.7
 Update to CMake 3.27.0 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmake_3.26.4.bb => python3-cmake_3.27.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmake_3.26.4.bb => python3-cmake_3.27.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-cmake_3.26.4.bb b/meta-python/recipes-devtools/python/python3-cmake_3.27.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-cmake_3.26.4.bb
rename to meta-python/recipes-devtools/python/python3-cmake_3.27.0.bb
index c66c777574..81116752f0 100644
--- a/meta-python/recipes-devtools/python/python3-cmake_3.26.4.bb
+++ b/meta-python/recipes-devtools/python/python3-cmake_3.27.0.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "cmake"
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "d45b30b9ce7280829888c78650177ab525df2b6785e1a5b3d82b4c147d828c0e"
+SRC_URI[sha256sum] = "d03f0a76a2b96805044ad1178b92aeeb5f695caa6776a32522bb5c430a55b4e8"
 
 SRC_URI += " \
 	file://CMakeLists.txt \
-- 
2.34.1


