Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D31C7C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 08:47:56 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.17702.1702543670247182317
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 00:47:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="143161234"
X-IronPort-AV: E=Sophos;i="6.04,274,1695654000"; 
   d="scan'208";a="143161234"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 17:47:48 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E934D6189
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:47:46 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C077DA22C
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:47:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 72531353853;
	Thu, 14 Dec 2023 17:47:44 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-bandit: upgrade 1.7.5 -> 1.7.6
Date: Thu, 14 Dec 2023 16:46:18 +0800
Message-Id: <1702543578-27508-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28056.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28056.006
X-TMASE-Result: 10--4.404300-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrBgA+oehWZhGU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN+Basxm9uZ4eGR58lWlapIOmHqf6ZGvCR1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO36CZ
	XLlV1mSdUkn5sJiBS/wIxMXhPeOGHGNAWoWdO4RTJqBZD7I1F3DplsUwRisHsHHcGCtV8tQVToN
	wh6fodNWr1yG8HWZykBaF3TE4iz2fIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 08:47:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107425

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/PyCQA/bandit/releases/tag/1.7.6

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-bandit_1.7.5.bb => python3-bandit_1.7.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bandit_1.7.5.bb => python3-bandit_1.7.6.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-bandit_1.7.5.bb b/meta-python/recipes-devtools/python/python3-bandit_1.7.6.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-bandit_1.7.5.bb
rename to meta-python/recipes-devtools/python/python3-bandit_1.7.6.bb
index ede7f92e8..3cf927e10 100644
--- a/meta-python/recipes-devtools/python/python3-bandit_1.7.5.bb
+++ b/meta-python/recipes-devtools/python/python3-bandit_1.7.6.bb
@@ -2,7 +2,7 @@ SUMMARY = "Security oriented static analyser for python code."
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI[sha256sum] = "bdfc739baa03b880c2d15d0431b31c658ffc348e907fe197e54e0389dd59e11e"
+SRC_URI[sha256sum] = "72ce7bc9741374d96fb2f1c9a8960829885f1243ffde743de70a19cee353e8f3"
 
 DEPENDS = "python3-pbr-native python3-git python3-pbr python3-pyyaml python3-six python3-stevedore"
 
-- 
2.34.1


