Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54FD3CF64A5
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:44:09 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.49306.1727682240233710259
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:44:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=E8B7hDYH;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682241; x=1759218241;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=BXDgDgA8ETcP2QFJP4kx/bZYXlzuaqIjWvPgTI+JRCE=;
  b=E8B7hDYHqGvf/982vlKhGCmCjCWRNAti+8tgzJ4ZsJfKk2zg+0IzRG6E
   QhRlPiZLoLxBVYlVv00O5cMN1F7azaZLfGxotOYeTp2BP/0dhkKL6ujgo
   yPUmKTXbiUeqoHSAAu3sqvwVRXnIPCqA3bUO7x3nMrHFGYMzkn4vatTfc
   tluTxQsI/QqPiRyI4CiQKfeh2+rKtjJ9tlK1VaYsFpwtuabSFTQKvNMEz
   7+CoVPuYbJAHe4izgiOTo2frgUSxZNJbbOCsByyojyqUXQTHi8HUYbpYN
   NfYYzyX4qb8jWIPW3wlvHkj2SYlAfHxz+Rg1rlFbJD/1XtKMKCyeTBZot
   w==;
X-CSE-ConnectionGUID: 6GA3ZydPQEC+dngNOzF10g==
X-CSE-MsgGUID: 2FE5i9MASKS2eKf2YfRFkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="163217085"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="163217085"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:43:54 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C376D2AA6
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:52 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4AC6CD774C
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C775020076D01
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:50 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 798841A000A;
	Mon, 30 Sep 2024 15:43:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/40] python3-redis: upgrade 5.0.8 -> 5.1.0
Date: Mon, 30 Sep 2024 15:42:54 +0800
Message-Id: <1727682185-12664-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10--7.657000-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrlHLUcNM85dqudK6ZkaOfBHtC
	owv/AitKjDVMw6TJvuF3/qnzWxv5YMfdkIlEiI2k4YQJNsiCNvlr2qJoNIuCje4fWlX5Wiobe0Q
	UacIGnqUPNxz2EvpSIBJwcdfSstcE7VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5BEGD
	rWRIrgOIGQRIwjTl3i6HYZwFeOLZ6fLxf8NKOlfOUwVfQtlDNxfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTtCx9qoxmS2x2q5mTSZqhAYN8WPG4CNTWsRAQn8Vp8mVAnxVtT3OY7qA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:44:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112591

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Client-side caching
- Timeseries insertion filters for close samples
- Enhanced classes string representation
- Partial clean up of Python 3.7 compatibility
- Handle RESP3 sets as Python lists
- Prevent async ClusterPipeline instances from becoming "false-y"
- Add hostname field to _parse_node_line
- Delete the first-defined (and thus "duplicate") Script class
- Catch a known DeprecationWarning when calling .close()
- Add missed redismod at test_commands.py
- Update README.md - mentioning redis 7.4 support
- Update PyPy 3.8 to 3.10 in CI
- Updated commands from docker-compose to docker compose
- Added version restrictions for pytest-asyncio
- Documentation examples

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-redis_5.0.8.bb => python3-redis_5.1.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-redis_5.0.8.bb => python3-redis_5.1.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-redis_5.0.8.bb b/meta-python/recipes-devtools/python/python3-redis_5.1.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-redis_5.0.8.bb
rename to meta-python/recipes-devtools/python/python3-redis_5.1.0.bb
index 1dddd04bc..d9ae98ddc 100644
--- a/meta-python/recipes-devtools/python/python3-redis_5.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_5.1.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=609ded3add9111c4c6e102f1d421d3f8"
 # Prefix archive to avoid clashing with the main redis archives
 PYPI_ARCHIVE_NAME_PREFIX="pypi-"
 
-SRC_URI[sha256sum] = "0c5b10d387568dfe0698c6fad6615750c24170e548ca2deac10c649d463e9870"
+SRC_URI[sha256sum] = "b756df1e4a3858fcc0ef861f3fc53623a96c41e2b1f5304e09e0fe758d333d40"
 
 inherit pypi setuptools3
 
-- 
2.34.1


