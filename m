Return-Path: <jaragunde@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id B0D137307E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 18:32:41 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3A56oFwxfBfIEkfSAi5ahl5UVVlGMj4u6mDksu8pMi?=
	=?us-ascii?q?zoh2WeGdxcWzZh7h7PlgxGXEQZ/co6odzbGH7ua5CSdZuMzJmUtBWaQEbwUCh8?=
	=?us-ascii?q?QSkl5oK+++Imq/EsTXaTcnFt9JTl5v8iLzG0FUHMHjew+a+SXqvnYdFRrlKAV6?=
	=?us-ascii?q?OPn+FJLMgMSrzeCy/IDYbxlViDanb75/KBW7oR/MusQVjoduN7s9xgXUqXZUZu?=
	=?us-ascii?q?pawn9lK0iOlBjm/Mew+5Bj8yVUu/0/8sNLTLv3caclQ7FGFToqK2866tHluhnF?=
	=?us-ascii?q?VguP+2ATUn4KnRpSAgjK9w/1U5HsuSbnrOV92S2aPcrrTbAoXDmp8qlmRAP0hC?=
	=?us-ascii?q?oBKjU09nzchM5tg6JBuB+vpwJxzZPabo+WM/Rxcb/Sc9wBSGpdXctcTTBND5mg?=
	=?us-ascii?q?Y4YNCecKIOZWr5P6p1sLtRawAROjC//oyjBTgX/9wLE30/47HgHJwQwgGc8Bv2?=
	=?us-ascii?q?rJp9vvLqASS/66zajVxjjEbfNZwy3955LHchA8p/GDQKx/fNHQyUkgDQzFilSQ?=
	=?us-ascii?q?ppb/MzyJ0eQNtnGW4ux9XuyhjG4nrht+ojmpxso0k4nJmpgZylHD9SlhwIc1Is?=
	=?us-ascii?q?G3SFJ8Yd68CptQsCOaOJVqTcM+WW1ovzw6yrIAtJWmfyYK0IwqyhrCZ/CdboSE?=
	=?us-ascii?q?/xDuWPyVLDp8nn5pZbKyiha0/EO90OPzTNO030xPriddl9nMsW0C2ALL58icT/?=
	=?us-ascii?q?t94l+h2TGS1wDP8u1EIV47la7cK5M5zL4/jJwTsEXCHi/whkr6lq6Wdko+9eis?=
	=?us-ascii?q?6uToeK/qqYObN49xkg3+M6IuldKjAekgNgUCQnKX9fmh2LDh50H0RLFHgucrnq?=
	=?us-ascii?q?TZsJ3WPcEbqbS4Aw9R3IYj8RG/DzK+3dQah3YHNkhKeB2aj4jvJl7BPuv1Dfaw?=
	=?us-ascii?q?g1u2lDdrxurJMqf9DZXKK3jPiK3hcqpl605A1AozyshS55VMCr4fJvL8RErxu8?=
	=?us-ascii?q?fGARAkLgO73fvoBMxg2YwAR2KAHKuZPbjWsV+J/eIvP/KMaJUSuDblNfcl4eDh?=
	=?us-ascii?q?jXoillADYKamwIUYZ22iEvRhOUWZbmLmgs0dHmcSogo+UOvqhUWFUT5PfXmyQa?=
	=?us-ascii?q?M85jYgBYKhFofDXYCsgKed3CilG51WfXpKBUyLEXftbYmLQO0MYjqIIsB9ijwE?=
	=?us-ascii?q?SaShS4g52BGrrgD60aZnLuvS+iECt5Lszt515/bJmhwp+jx0Ct6S02CJT21ugm?=
	=?us-ascii?q?wIQDo2j+hDphl60lqF3K1yjvBUGNAW6/5XXwMSMZ/H0/c8DMj/XA/EdNqFRFuq?=
	=?us-ascii?q?BNK8DmIfVNU0lv0HaEF3HJ2LlBnMwiymDvctFqaGFtRg8KvG1nfsIcpw43fJ3a?=
	=?us-ascii?q?0ghh8tRc4ZZj7uvbJ26wWGX92BqE6ejav/Lak=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2FKAwA5Kq9Y/5tjdVtdHgYMGQYMgyVhg?=
	=?us-ascii?q?QmDW4p6oUqCRIIPgg0aEIV4gyU/GAEBAQEBAQEBAQEBAl8ogjMgDz0QAQEBAQE?=
	=?us-ascii?q?BAQEBIwEBAQEBASMCDYEHDwFGNQImAnKJeQEJrjCCJotCDAElgQuFQYoPggAML?=
	=?us-ascii?q?oJfBZwUhnSLMAKCTI5DSJJgHzmBAFSHHT81i0YBAQE?=
X-IPAS-Result: =?us-ascii?q?A2FKAwA5Kq9Y/5tjdVtdHgYMGQYMgyVhgQmDW4p6oUqCRII?=
	=?us-ascii?q?Pgg0aEIV4gyU/GAEBAQEBAQEBAQEBAl8ogjMgDz0QAQEBAQEBAQEBIwEBAQEBA?=
	=?us-ascii?q?SMCDYEHDwFGNQImAnKJeQEJrjCCJotCDAElgQuFQYoPggAMLoJfBZwUhnSLMAK?=
	=?us-ascii?q?CTI5DSJJgHzmBAFSHHT81i0YBAQE?=
X-IronPort-AV: E=Sophos;i="5.35,198,1484002800"; 
   d="scan'208";a="7737604"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 23 Feb 2017 19:32:23 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1cgyBj-0007jr-Pp; Thu, 23 Feb 2017 19:32:23 +0100
Received: from ip162.dynamic.igalia.com ([192.168.10.162]
	helo=goomba.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
	id 1cgyBh-0003kt-Bu; Thu, 23 Feb 2017 19:32:21 +0100
From: =?UTF-8?q?Jacobo=20Aragunde=20P=C3=A9rez?= <jaragunde@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2017 19:32:11 +0100
Message-Id: <1487874731-28216-1-git-send-email-jaragunde@igalia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: otavio@ossystems.com.br
Subject: [meta-browser][PATCH v2] chromium: disable generate_character_data for x86
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Feb 2017 18:32:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Chromium-wayland fails with:
  http://errors.yoctoproject.org/Errors/Build/32356/

Build problems happen to both qemux86 and intel-core2-32 builds.
Root cause seems to be ICU mixing host and target architectures,
same as in: https://bugreports.qt.io/browse/QTBUG-57705

Signed-off-by: Jacobo Aragunde Pérez <jaragunde@igalia.com>
---
 recipes-browser/chromium/chromium.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-browser/chromium/chromium.inc b/recipes-browser/chromium/chromium.inc
index 0e7250e..e603af0 100644
--- a/recipes-browser/chromium/chromium.inc
+++ b/recipes-browser/chromium/chromium.inc
@@ -15,6 +15,7 @@ inherit gettext pythonnative
 
 ARMFPABI_armv7a = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'arm_float_abi=hard', 'arm_float_abi=softfp', d)}"
 GYP_DEFINES += "${ARMFPABI} release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot=''"
+GYP_DEFINES_append_x86 = " generate_character_data=0"
 
 do_configure() {
 	cd ${S}
-- 
2.7.4


