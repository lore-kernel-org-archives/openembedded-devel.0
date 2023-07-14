Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FACAC001DE
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 01:01:10 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.8419.1689296462529218869
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jul 2023 18:01:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="103954394"
X-IronPort-AV: E=Sophos;i="6.01,204,1684767600"; 
   d="scan'208";a="103954394"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 10:00:59 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6E21DC68E1
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Jul 2023 10:00:57 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A13DD9691
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Jul 2023 10:00:56 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id C0457858BA;
	Fri, 14 Jul 2023 10:00:55 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libyang: Fix install conflict when enable multilib.
Date: Fri, 14 Jul 2023 09:00:43 +0800
Message-Id: <1689296444-28141-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689296444-28141-1-git-send-email-wangmy@fujitsu.com>
References: <1689296444-28141-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27750.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27750.003
X-TMASE-Result: 10--3.712100-10.000000
X-TMASE-MatchedRID: hWRIiYV8xz+MPz8Goa6fXdl0i+WyI+91Urr7Qc5WhKiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmLy9zcRSkKatU8HitdqBBn7lXePXNM4FjNS5VVMJCvragKJcjtscVQFvEZ
	Og39Q8OPi8zVgXoAltsIJ+4gwXrEtJ0RPnyOnrZJ6pW6EZo3WgcVX/1MG9h5Q5+RL/04I7NuLJR
	iaRDahFJ0R9aFmfqN+vggzCZjtyK+9bq2W7vHBcGg5xIc8IFzNZzA8Djn7XVVLv5Eyr/YIrqsDh
	ztRXZ9Cm+LY9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jul 2023 01:01:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103859

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
  file /usr/include/libyang/config.h conflicts between attempted installs of libyang-dev-2.1.55-r0.core2_64 and lib32-libyang-dev-2.1.55-r0.i686

The differences of config.h are as follows:
@@ -27,8 +27,8 @@
 /** plugins */
 #define LYPLG_SUFFIX ".so"
 #define LYPLG_SUFFIX_LEN (sizeof LYPLG_SUFFIX - 1)
-#define LYPLG_TYPE_DIR "/usr/lib/libyang/types"
-#define LYPLG_EXT_DIR "/usr/lib/libyang/extensions"
+#define LYPLG_TYPE_DIR "/usr/lib64/libyang/types"
+#define LYPLG_EXT_DIR "/usr/lib64/libyang/extensions"

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-extended/libyang/libyang_2.1.55.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libyang/libyang_2.1.55.bb b/meta-oe/recipes-extended/libyang/libyang_2.1.55.bb
index b1438c3b2b..bddf30bf6a 100644
--- a/meta-oe/recipes-extended/libyang/libyang_2.1.55.bb
+++ b/meta-oe/recipes-extended/libyang/libyang_2.1.55.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://github.com/CESNET/libyang.git;branch=master;protocol=https \
 S = "${WORKDIR}/git"
 
 # Main dependencies
-inherit cmake pkgconfig lib_package ptest
+inherit cmake pkgconfig lib_package ptest multilib_header
 DEPENDS = "libpcre2"
 DEPENDS += "${@bb.utils.contains('PTEST_ENABLED', '1', 'cmocka', '', d)}"
 
@@ -30,6 +30,10 @@ do_compile:prepend () {
     fi
 }
 
+do_install:append () {
+        oe_multilib_header  libyang/config.h
+}
+
 do_install_ptest () {
     install -d ${D}${PTEST_PATH}/tests
     cp -f ${B}/tests/utest_* ${D}${PTEST_PATH}/tests/
-- 
2.34.1


