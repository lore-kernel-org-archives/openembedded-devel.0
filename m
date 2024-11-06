Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DDCAD29F98
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:34 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.40140.1730874690637803184
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jdYtDnn/;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874691; x=1762410691;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=tbIRQtuVvMS4KUm2qvI/wS+BUXpaScSL9MTTONWHEoQ=;
  b=jdYtDnn/FV6YhsSzNvi4qZZfR0GVLsPkM3WzXevaWzBciQ9P1uiR3nnc
   8VupXuKBoKkRZBCiUwJi9Y01yhpB1L4k6dDvZOVHHt3+3iukK4PTi473y
   oT+YzcIyA5j5Ep/PHAhk10DNJy8XUrV+dlcFh7JJEv+9/TxqjtBC67TTn
   dXsxD646Tv1672D+JOdVe9lN8g4fmEltT1OOFdOM0lxC2J1akdaQIpwQ/
   lIPwbcsTG9ceSX1NxsGClFHAJ8ui5e+f4uehZi06twDytpSIP+lvbfE6f
   CcTVRsiBAazRtAYv4OnIj9sgVpm8xAk2oCZ6GMhK3BztzIp/Gisekr5TG
   A==;
X-CSE-ConnectionGUID: gP1eulKvT1Sihxl+4/uaew==
X-CSE-MsgGUID: Mpt6UKdLSFeiF7a5Gk/AgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="179341292"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="179341292"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:28 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4FFA3D8008
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:26 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8F6FBD5B3F
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2489920071A01
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:25 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C8C4E1A000A;
	Wed,  6 Nov 2024 14:31:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/46] python3-pymodbus: upgrade 3.7.3 -> 3.7.4
Date: Wed,  6 Nov 2024 14:30:47 +0800
Message-Id: <1730874660-2364-33-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10--7.010600-10.000000
X-TMASE-MatchedRID: PWXwJQp0B9ujz0nOeth/yUIIxwDaU5mrmrN4LT7y8+DebsVFPGXfZCDv
	6zn31UzgFpv4ALYwneyJwy8DMYqNPdFMBnmJRh/JjhXy0Khej9KX2rvknNYlEx2dnS9wqrcnwMM
	U7J9V4673VVtM5mLDM+4u4m8fVt/5tkEL1EmUpaPjpxdo/JwVm0nOIkO1Q+DNvZYGJWvckItLUB
	nwMP/28dufy4+0gFFL/ZPxQQwIKag62rYwKf4Ple91BBofnvHGe7Z0UyQO5TPu/CkuBxhlAL6px
	bTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIGAN6i+va16uaRFw
	Ds8G7THi8zVgXoAltsIJ+4gwXrEtIAcCikR3vq9O4UuQAgcUgyesj+iIMsOhaHD2InatfkuVkIP
	LAwecI13SscmQBpGL
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113717

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Clean PDU init
- Wrong close, when transaction do not match
- Remove unmaintained (not working) example contributions
- All pdu (incl. function code) tests to pdu directory
- Add no_response_expected argument to requests
- Resubmit: Don't close/reopen tcp connection on single modbus message timeout
- 100% test coverage for PDU
- Type DecodePDU
- Update to use DecodePDU
- Client/Server decoder renamed and moved to pdu
- Move client/server decoder to pdu
- Introducing PyModbus Guru on Gurubase.io
- Remove IllegalFunctionRequest
- remove ModbusResponse
- Add typing to pdu base classes
- Updated roadmap.
- remove databuffer from framer
- Improve retries for sync client
- Move process test to framer tests
- Framer do not check ids
- Remove callback from framer
- Auto fill device ids for clients
- Reenable multidrop tests
- write_register/s accept bytes or int
- roadmap corrections.
- Added roadmap (not written in stone)
- Update README to show python 3.13.
- Test on Python 3.13
- Use @AbstractMethod
- Corrected smaller documentation bugs
- README as landing page in readthedocs.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymodbus_3.7.3.bb => python3-pymodbus_3.7.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.7.3.bb => python3-pymodbus_3.7.4.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.7.3.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.7.4.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.7.3.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.7.4.bb
index 9e4c80ebf..b38cdfb23 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.7.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.7.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/riptideio/pymodbus/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eba8057aa82c058d2042b4b0a0e9cc63"
 
-SRC_URI[sha256sum] = "603490162382fe34258992e3b8fe8d2da573a08aa49257ee7ab7b5b1d1a6653c"
+SRC_URI[sha256sum] = "573c370aea04523403eea1e159616a583cd7b93cfc5c81b07340d3cccd52c99f"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


