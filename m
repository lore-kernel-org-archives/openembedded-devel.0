Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC9F1C46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:20:14 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.989.1705972809860465833
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:20:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="146938088"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="146938088"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:19:47 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 26876D9DA9
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:19:44 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5637DD9784
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:19:43 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id CE7AE1E9C8D
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:19:42 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5F9951A006A;
	Tue, 23 Jan 2024 09:19:42 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] md4c: upgrade 0.4.8 -> 0.5.0
Date: Tue, 23 Jan 2024 09:18:40 +0800
Message-Id: <1705972720-25089-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.004
X-TMASE-Result: 10-0.384800-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yXg2y0j5vXZGlEDhvi2wR87QarzCEH4/6mMs
	5GjXLqvGCC8aAmGeO6nqXvXKPBg5BmVjCRquYdk+EXjPIvKd74BMkOX0UoduuaY5ZGw7wyeH52h
	w+qEUqGRaf/8Uw5sGwgYUFsN5WfiFrsq/7BhdGyBvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe2hKvDc1vo2QC24oEZ6SpSmcfuxsiY4QFFExd+PJsZB2pg0Fln58OmVvoQ3ke3i6PnJMN
	X2/CuL+lygYsb7vsZUUGKIDeUunrQ+YqeRuTlBXPBbEPfw22OmgguDGM9Y84ex9n1XpDqsJmC9S
	iJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108394

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2024.

Changelog:
 https://github.com/mity/md4c/blob/master/CHANGELOG.md

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/md4c/{md4c_0.4.8.bb => md4c_0.5.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/md4c/{md4c_0.4.8.bb => md4c_0.5.0.bb} (68%)

diff --git a/meta-oe/recipes-support/md4c/md4c_0.4.8.bb b/meta-oe/recipes-support/md4c/md4c_0.5.0.bb
similarity index 68%
rename from meta-oe/recipes-support/md4c/md4c_0.4.8.bb
rename to meta-oe/recipes-support/md4c/md4c_0.5.0.bb
index fc3dbb3ae..755d5f50f 100644
--- a/meta-oe/recipes-support/md4c/md4c_0.4.8.bb
+++ b/meta-oe/recipes-support/md4c/md4c_0.5.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "MD4C is Markdown parser implementation in C."
 HOMEPAGE = "http://github.com/mity/md4c"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7e0fbcf3701aad22f2d2e0624a703795"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=383f39920f391605af6e8e46e60e2378"
 
 
 S = "${WORKDIR}/git"
@@ -12,6 +12,6 @@ SRC_URI = " \
         git://github.com/mity/md4c.git;protocol=https;branch=master \
 "
 
-SRCREV = "c3340b480e5232711858108be07460a9836c8ab5"
+SRCREV = "481230f4180cb0e0aad56da06de9327d5bacd570"
 
 inherit cmake
-- 
2.34.1


