Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B41C2BC81
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:57 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.2489.1718161122553454466
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=so+riwQN;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161128; x=1749697128;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=YdJTIfhnw28kzmxpZArE4EQKQZDO6Q0LIQb5owUFRKg=;
  b=so+riwQNQJ/wi6vKwmlYFx7fkE7dCUutG8XDKW7WGBgxZ+2POH5mlnlC
   xy/w8Z24KZiJLcfb5OlUNEygwygPOMAHshNDqNqZE/qwCnxtMweINN7mj
   5qhLtxLA1is9VXl2FNnFekS0HDjgzw6jAVJijA2tZUo9FGL/bwO0bJAU+
   eI8q2mUB1L41wz3OE3rNwRm1/WUGwK+Q2kRyysWIEv+pRqeDjkWtX9Bc8
   yzvXz3uGdLB5WQhxCYVsOfOoGVkgntSZomyA7t2ijZff6PV/xq8eNrXkq
   T5mmJvQELhpe7AvrLgWiScYvgysn5Qf/v98s1ZmJPwNtLFTk/UjdgAc2i
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="162710870"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="162710870"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:47 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 74372C9449
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:44 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B1EB7D3F1B
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:43 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 45877401E4
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:43 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 96F6D1A0002;
	Wed, 12 Jun 2024 10:58:42 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/43] python3-pybind11-json: upgrade 0.2.13 -> 0.2.14
Date: Wed, 12 Jun 2024 10:57:56 +0800
Message-Id: <1718161096-29710-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10-0.821200-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrwfXdYxXtxJlkDFfw8NSG/L6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3LRPJs/q8vyUrBh
	yv2DtHP/i8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFN0MF38AynRYbJspWtlrpBbW8Q
	nbgQoG0RiBCD8DzGCnZ2Gq+gZGJVLCm0nZAaNOoevCAkQCNzmQigGy8EChzukcYUqaF09plOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110859

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Require CMake 3.5 of higher
- refactor: remove redundant move

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-pybind11-json_0.2.13.bb => python3-pybind11-json_0.2.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pybind11-json_0.2.13.bb => python3-pybind11-json_0.2.14.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.13.bb b/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.14.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pybind11-json_0.2.13.bb
rename to meta-python/recipes-devtools/python/python3-pybind11-json_0.2.14.bb
index 67bd2a33a..8211e06dc 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.13.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.14.bb
@@ -2,7 +2,7 @@ SUMMARY = "Using nlohmann::json with pybind11"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0e25ff0ec476d06d366439e1120cce98"
 
-SRCREV = "b02a2ad597d224c3faee1f05a56d81d4c4453092"
+SRCREV = "1399451fde59f4d931c72213f209b3e83a07290b"
 SRC_URI = "git://github.com/pybind/pybind11_json;branch=master;protocol=https"
 
 DEPENDS += "nlohmann-json python3-pybind11"
-- 
2.34.1


