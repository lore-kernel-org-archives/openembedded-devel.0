Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8C48C54E7A
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:57 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.8159.1710827206450089136
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=F2xfLJR6;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827211; x=1742363211;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ChLQ9AAHzxwJSicc6X4oY5KrVVxI+b1VWlb76F3r9zI=;
  b=F2xfLJR6DDncr+5M51aGOVTvjhVHaSctDuXbmVk8bQs5x5ZXpbtuLLH+
   8Nz1RUp0fcai5cgg8O3YZStLiGQjseEVbKZ1WYMr9f88dsbc18Ybuwi7d
   iwOrTRnTMxlpdXquA3llu4ZzSvCj2OYh/m/+d6X06i1+TIQ6u0S2jnV80
   ShOuDsM7Fj9AvXgJmTPRB0Y8IfodGwJD3/BrebO4AVq9gcYEeiNt8qQaG
   rsIT1OJSYSdYwAvwILPAwpSaE5pkoVMDxDtfuNhZQrvQS+D9ont75/Ay+
   auN75aiafYZU6aCGPJ82qLPha03V6v2DMUgTsprExSc7rYxpo7rGws+Os
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="152674084"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="152674084"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:50 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2018BD480B
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:47 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 43B4AB8910
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id CF79122891A
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 726821A006D;
	Tue, 19 Mar 2024 13:46:45 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 37/50] python3-pymodbus: upgrade 3.6.4 -> 3.6.6
Date: Tue, 19 Mar 2024 13:45:26 +0800
Message-Id: <1710827139-30056-37-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10-0.859100-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yUIIxwDaU5mruT19j/a3VsGSa52iu6/jhhsk
	AdaEfeQKjDVMw6TJvuFeLJlBpnd2+D9ETA4D04a1N2BkxNbZkKPYUDvAr2Y/1920KhkCTcTU0EF
	5bRA2V8ptxBbPR3Y/lo6dTMeQ961wyflsEtNhYDIIoUOTWQl7EithirXYhZk5eGHkpR2WBaJdxv
	G5XI6NmOArY2JkKW9pBdRHP6FCEZVaQiLka9EcSk7nLUqYrlslFIuBIWrdOeMR34ro7k23ndb2e
	7N2CFQyenlAY4xvwSB5OPD8XJFfpB8TzIzimOwPC24oEZ6SpSmcfuxsiY4QFAxWMlJMYVQoAnox
	LOvGJee1PWDmDANMy6Er18U6yorwrSLvft6XY+nC7lDlq6hhLV55rksic3DzrBeDaiX6OtTOv9+
	CD+Ut9Ox9n1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109454

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Solve transport close() as not inherited method.
-enable mypy --check-untyped-defs
-Add get_expected_response_length to transaction.
-Remove control encode in framersRemove control encode in framers.
-Bump codeql in CI to v3.
-Improve server types
-Remove pointless try/except
-Improve transport types
-Use explicit ValueError when called with incorrect function code
-update message tests (incorporate all old tests).
-Improve simulator type hints
-Cleanup dead resetFrame code
-integrate message.encode() into framer.buildPacket.
-Repair client close() (intern= is needed for ModbusProtocol).
-Updated Message_Parser example
-Fix #2069 use released repl from pypi
-Fix field encoding of Read File Record Response
-Improve simulator types
-Bump actions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymodbus_3.6.4.bb => python3-pymodbus_3.6.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.6.4.bb => python3-pymodbus_3.6.6.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.6.4.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.6.6.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.6.4.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.6.6.bb
index 4f53d01f3..8e181640b 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.6.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.6.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/riptideio/pymodbus/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eba8057aa82c058d2042b4b0a0e9cc63"
 
-SRC_URI[sha256sum] = "6eee2c7eedb794317784c967096fa1fe42200357e9b5a349d838ee9159624fe2"
+SRC_URI[sha256sum] = "c4d556a0954d00a9e1c8f1d0de03f41c4800336e6d785e820f2917eeb4ee7736"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


