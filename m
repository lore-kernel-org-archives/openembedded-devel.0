Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C20E7718F
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:30 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.30509.1735032445057522136
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kbHOBY1u;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032448; x=1766568448;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=NhY/NTLqPoV+8Byw3r0wB0XF+/A0T+1D3DWJvFa7i3E=;
  b=kbHOBY1uwWDODU+w95hDRt4ggmY+LTg/may297vEBAqU4t8hBMLzBQfk
   GO28yJcKAx5JItlHjWamQuPbN+AbGgwnFLesLiPTQCYibqTAQL6LK6ay1
   RyIgmKDLXe9LJkLaEzW8x+lyWAecaCqsgnUvl9sTMA+ual705t2h4oC3T
   CPQFMAJdloEHf1kUdhLzqcKoLgP1B3MBEgq7CTFNKKAcQ+Q1Pee0EcVWg
   wg+ZET6l9mEdBaPK7WQKYUuVVxMHrilzxFofjkeJpw32pQGJ97iIHC/Bh
   lfWaBM9gfkjKlt88lpPsrUHFKT8+Q6bQGGXVPxiWYfXjaMoKSLwj3lIP5
   w==;
X-CSE-ConnectionGUID: ZYbNqmGfSyapQpDeNzKiHw==
X-CSE-MsgGUID: IQJVJ38dROu/owSpWblV4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="163714079"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="163714079"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:27 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 45217DBB81
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:25 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1DB01D8CAD
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A2E336BB64
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:24 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6A2451A0073;
	Tue, 24 Dec 2024 17:27:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 47/67] python3-pymodbus: upgrade 3.7.4 -> 3.8.2
Date: Tue, 24 Dec 2024 17:26:41 +0800
Message-Id: <1735032421-13513-47-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10--7.764900-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrKQNhMboqZlqpTkI0HK8zpRHJ
	KJsIYHnFU8n7aQ3KnsDFRukUyjWDy0nhx5itBwM1jhXy0Khej9IxXH/dlhvLv63mz2QG6noYRtU
	L4XifTnsbHQ3Bjk505A3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXBX18z5X2O3vnAw
	8yp081LIGQRIwjTl3i64sVlliWKx8fE8yM4pjsDwtuKBGekqUpI/NGWt0UYPAZGK7fZj8Pw5Azi
	73tFCccRSDFbT6C6KX7l6yQojF7Sez1WcjGXmBn
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114519

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- new framer concept (utility class instead of direct)
- new much simpler transactionManager
- trace methods to trace/modify incoming/outgoing byte streams as well as PDUs
- Convert endianness
- Fix sync serial client, loop.
- Correct future.
- Correct #2501
- Raise exception on no response in async client.
- re-instatiate Future on reconnect
- Remove all trailing zeroes during string decoding
- Fix too many sync client log messages.
- Asyncio future removed from sync client.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymodbus_3.7.4.bb => python3-pymodbus_3.8.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.7.4.bb => python3-pymodbus_3.8.2.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.7.4.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.8.2.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.7.4.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.8.2.bb
index b38cdfb234..9793cea257 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.7.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.8.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/riptideio/pymodbus/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eba8057aa82c058d2042b4b0a0e9cc63"
 
-SRC_URI[sha256sum] = "573c370aea04523403eea1e159616a583cd7b93cfc5c81b07340d3cccd52c99f"
+SRC_URI[sha256sum] = "c57e41662cb7c26830f2f0e0166ffe2fe08ffd8749e0ce0a56f3d9f4bdc2a5c6"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


