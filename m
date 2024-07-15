Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D30C3DA6F
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:05 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.33829.1721034180490857910
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:03:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dUYqtwCL;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034181; x=1752570181;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Scl2oHN2bnzROkzs48RAw6bSE88LD6h6UmKANW6F0IE=;
  b=dUYqtwCLYrqFD7xKPYWI5+6zHfc03O1uwcvrMKEM9eO0aG+4mKAzQoI9
   mxgYF9pt3HR7qaDTabL7mTKFIGJ8ibGZ0+CE9NTkW7WRhWT6neDYtf74l
   XaYOUoVKBkaZ6J8SajVH+TFnR0dW2Myy0sBTA8Efp0Bipnr3U9rvxZWG6
   UNVIaOFT4jPzrperhaqv/y+8pYUC2APW4Q+iDCFytL/5PE1jPWzA5iaAP
   RCCkeQ/5W0eDl3gyvboEz/bWsOydRZ0bTlEnRBLXwlE2Ziqoj0Ls+x7gv
   v6U0hJKb/GCebtciBuu1OGkb1kvMH3NRT3NyS3paC/4TpWN6s6KCj2U43
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="154321098"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="154321098"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:02:59 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 07070DAD30
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:57 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 44FF3D5042
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A3B8020071A3C
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 701261A000D;
	Mon, 15 Jul 2024 17:02:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/38] python3-coverage: upgrade 7.5.4 -> 7.6.0
Date: Mon, 15 Jul 2024 17:02:11 +0800
Message-Id: <1721034151-540-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.006
X-TMASE-Result: 10-0.353700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrBPY4SegK3jxf0yVReoVM7RK/
	YHn6tY3P4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbedlNc
	WZ7137CiBkESMI05d4uuLFZZYlisfHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5yU0
	RZAPXHtIQdM+gm4foZ6YliOM9x7C+mOx2+t5CkuSJjQ4Mwhyuv+LOVkzcWAlUQW2MBGUjtqEA2v
	n3+T9r2N0zcGrza67OCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111342

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Exclusion patterns can now be multi-line
- The JSON report now includes per-function and per-class coverage information.
- Fixed an incorrect calculation of "(no class)" lines in the HTML classes report.
- Python 3.13.0b3 is supported.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.5.4.bb => python3-coverage_7.6.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.5.4.bb => python3-coverage_7.6.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.5.4.bb b/meta-python/recipes-devtools/python/python3-coverage_7.6.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.5.4.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.6.0.bb
index 559639564..f0dece4ac 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.5.4.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.6.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "a44963520b069e12789d0faea4e9fdb1e410cdc4aab89d94f7f55cbb7fef0353"
+SRC_URI[sha256sum] = "289cc803fa1dc901f84701ac10c9ee873619320f2f9aff38794db4a4a0268d51"
 
 inherit pypi setuptools3
 
-- 
2.34.1


