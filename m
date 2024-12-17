Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B4AE77187
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 09:02:06 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.77614.1734426116070653535
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Dec 2024 01:01:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BKbyHdV5;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734426118; x=1765962118;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=fQYkiIgqqN6kcBq45MWFPzFwC7i1sXaw6fnq0CT1DDw=;
  b=BKbyHdV5P8VHo+rHpyPgmKaHa+4qgq5BJZQKz4Lf8Woa42BjCdue+89F
   hKINWB4zg5Nf5YISaiYecPuXezishVUNzePdWJamgQkUJgr5DQizY87Pq
   vxc6UjJrYXiNAQa9/clF4mtBGsbd6+C6HvHatfoQUwBkgDRvz+Abb+Ebv
   CRA0Mr8lUXiQ1Muk9C43kvunIQHuMOXcrcOwbjCnX2wp57pGeFHY7PeAq
   V4lsn77hlI3wMmW9xHQtAKZoAVHpZKcPj5fCC9sNxOMgIczZIDYNOjfEx
   uMGcNhY+VxjXSC0qL86cPEzca2WfjMDxToLJBofZHaW9pBDSVrm5GVJrT
   w==;
X-CSE-ConnectionGUID: beh4xEM6QhulizL5txD8+w==
X-CSE-MsgGUID: RhHJ5a8BRTiWaXaoKxXUFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="184048216"
X-IronPort-AV: E=Sophos;i="6.12,241,1728918000"; 
   d="scan'208";a="184048216"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 18:01:55 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2F4A6DBB80
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:52 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 01409D4BC2
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8FFF06B5DE
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:51 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2F1191A000B;
	Tue, 17 Dec 2024 17:01:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/17] python3-pybind11-json: upgrade 0.2.14 -> 0.2.15
Date: Tue, 17 Dec 2024 17:01:33 +0800
Message-Id: <1734426096-18300-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734426096-18300-1-git-send-email-wangmy@fujitsu.com>
References: <1734426096-18300-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28864.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28864.006
X-TMASE-Result: 10-1.723000-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrg55m5RSwLMI8a+/GjoiAqr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3LRPJs/q8vyUrBh
	yv2DtHP/i8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFGW2H/r5xBx+2hefsYv6mhxKug
	OeBniTAI1LY4x6RIX0vOYSBUrPihoeONtVwBT9Nzyp8SAJ1EidzT0+y4SwV6H62PCYKNbDkOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 09:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114363

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Avoid crash when converting dict with circular reference
- ci: use pixi in CI
- Mention nanobind's solution

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...-pybind11-json_0.2.14.bb => python3-pybind11-json_0.2.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pybind11-json_0.2.14.bb => python3-pybind11-json_0.2.15.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.14.bb b/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.15.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pybind11-json_0.2.14.bb
rename to meta-python/recipes-devtools/python/python3-pybind11-json_0.2.15.bb
index 8211e06dce..3667ba872c 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.14.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.15.bb
@@ -2,7 +2,7 @@ SUMMARY = "Using nlohmann::json with pybind11"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0e25ff0ec476d06d366439e1120cce98"
 
-SRCREV = "1399451fde59f4d931c72213f209b3e83a07290b"
+SRCREV = "32043f433ed987b2c2ce99d689ec337bcbd4ba95"
 SRC_URI = "git://github.com/pybind/pybind11_json;branch=master;protocol=https"
 
 DEPENDS += "nlohmann-json python3-pybind11"
-- 
2.43.0


