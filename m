Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30DC9C25B67
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 23:42:55 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.136498.1698104570035325557
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 16:42:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="137285683"
X-IronPort-AV: E=Sophos;i="6.03,246,1694703600"; 
   d="scan'208";a="137285683"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 08:42:48 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id DBC22DDC76
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:42:45 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 22A52D5D57
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:42:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5FCAC6C9CE;
	Tue, 24 Oct 2023 08:42:44 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-xxhash: upgrade 3.3.0 -> 3.4.1
Date: Tue, 24 Oct 2023 07:42:17 +0800
Message-Id: <1698104537-32069-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27954.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27954.003
X-TMASE-Result: 10-0.676600-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrGEfoClqBl86U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa3zndiJkHFMhK9vZBFSQyQDlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzDKiVMXYIDICxur
	CPjAJjsNNKHkYoIM5LfFmUP/OSRHjM4DOcAWXwb+tgofcI6TFFWK+mWQggXca5z6CVkEz6/hqW3
	xDBUK64iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 23:42:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105704

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Build wheels for Python 3.12
Remove setuptools_scm

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-xxhash_3.3.0.bb => python3-xxhash_3.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xxhash_3.3.0.bb => python3-xxhash_3.4.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-xxhash_3.3.0.bb b/meta-python/recipes-devtools/python/python3-xxhash_3.4.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-xxhash_3.3.0.bb
rename to meta-python/recipes-devtools/python/python3-xxhash_3.4.1.bb
index e3aec97375..4050d12eb9 100644
--- a/meta-python/recipes-devtools/python/python3-xxhash_3.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xxhash_3.4.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3a9dab7f159514231249aa3e108ab26b"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "c3f9e322b1ebeebd44e3d9d2d9b124e0c550c1ef41bd552afdcdd719516ee41a"
+SRC_URI[sha256sum] = "0379d6cf1ff987cd421609a264ce025e74f346e3e145dd106c0cc2e3ec3f99a9"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.34.1


