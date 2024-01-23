Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BECCAC46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:31:34 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.1179.1705973491445464000
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:31:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="146939951"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="146939951"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:31:30 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4FBC9D624E
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:31:27 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8BE2DD96CC
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:31:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 230E020078977
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:31:26 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C9BA31A006A;
	Tue, 23 Jan 2024 09:31:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-absl: upgrade 2.0.0 -> 2.1.0
Date: Tue, 23 Jan 2024 09:31:06 +0800
Message-Id: <1705973466-25412-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.003
X-TMASE-Result: 10--4.584600-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yUIIxwDaU5mrelWD1+Z2pWfT+1Zj+w66+pHn
	G194oCm2jZ0LyiiUYkay30IXTXvfRqceJlSdtw9EOIQ9GP2P2u+ycrvYxo9Kpy2is8s1ivBkm1e
	F/h1wsllwDol7UJy18AIMVcXiaJGvPXdZx1sZHpA/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bqSdDmDK09MpLqFIS4y0oOPc+HB+YVvemDsKXyzHgcEbrixttRG+E/OBbptjxI6rdaPFj
	JEFr+olwXCBO/GKkVqOhzOa6g8KrUeopUHkiOPYZx8/PLEc+CWwNAcQaNNy9TTttV5IiJ1HGmXf
	p154dupfpgPne8LzWIyWsSvo0RKZhcLpyVN6kWZpMFXQpIK+/R0m4Rm5hspVxSSu8i52URmXTt0
	OuyJi/IIuEVM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108401

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
-Added absl.flags.override_value function to provide FlagHolder with a construct
 to modify values.
-Added a new method absltest.TestCase.assertDataclassEqual that tests equality
 of dataclass.dataclass objects with better error messages when the assert fails.
-absl.flags.argparse_flags.ArgumentParser now correctly inherits an empty
 instance of FlagValues to ensure that absl flags, such as --flagfile, --undefok
 are supported.
-Do not exit 5 if tests were skipped on Python 3.12. This follows the CPython
 change in python/cpython#113856.
-The flag foo no longer retains the value bar after FLAGS.foo = bar fails due to
 a validation error.
-Fixed an issue caused by this Python 3.12.1 change where the test reporter
 crashes when all tests are skipped.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-absl_2.0.0.bb => python3-absl_2.1.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-absl_2.0.0.bb => python3-absl_2.1.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-absl_2.0.0.bb b/meta-python/recipes-devtools/python/python3-absl_2.1.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-absl_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-absl_2.1.0.bb
index 42c7f3f84..5bdb83175 100644
--- a/meta-python/recipes-devtools/python/python3-absl_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-absl_2.1.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "d9690211c5fcfefcdd1a45470ac2b5c5acd45241c3af71eed96bc5441746c0d5"
+SRC_URI[sha256sum] = "7820790efbb316739cde8b4e19357243fc3608a152024288513dd968d7d959ff"
 
 PYPI_PACKAGE = "absl-py"
 
-- 
2.34.1


