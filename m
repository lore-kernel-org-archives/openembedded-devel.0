Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E75C3065A
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:47 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.166875.1719305856497866875
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GiR5qOcM;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305856; x=1750841856;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=bZ01MaEN4VFiR0QyRKxxe8/0LFTAUvQ9G6Hn9zMfvnw=;
  b=GiR5qOcMVrOcKKtFKtV8LSiUXvjHrRfOLlMOtQt784u/GU975DUybOdh
   8aCUHhsfrg6R3cqQ11wZWbf/V3JsjkT/oFbS2YyO8MwINcPy73WgRnyoD
   GOa2BqY/7yzZOrdZpSZtDVOS2PCShER1GGVUGv0SsqKRaP4SiQsvx+xdp
   po3uCv/VLBiXhwDje3hH+4nOnXT/NpRckBAnqD2T3njchy1vMJiF0m/vM
   qpA60VNT3yH1VgBjVSteCguRpKbMI+k4smOnRjTr1MZXytHC6G69gLOM2
   tHCCzKKjGl+0g3OjriiZfzWic0XZgxg7GYag4KTMuNOYVjJxx4mCLopy2
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="152868295"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="152868295"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:34 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3CA55C2AA3
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:32 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7D1EACFAB1
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 055F72007CDD9
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C3CF91A0002;
	Tue, 25 Jun 2024 16:57:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 52/57] python3-tox: upgrade 4.15.0 -> 4.15.1
Date: Tue, 25 Jun 2024 16:56:25 +0800
Message-Id: <1719305790-11484-52-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10-2.532600-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvDZ+9HI5nLbOqO
	SOOdRR5az9y18sCNrZoKRuKRI67R4EabKAwppBdSA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYgB/8cibO8IYLxEFvMLiU987Cl8sx4HBG30tCKdnhB58I/9UW5M5dRMQpr
	Z/7WnuveTCMddcL/gjxlblqLlYqXKlBiv7IvrYWtDLRzI/SQjCdkYquEv0fkgKLIBDFIyFYXznS
	6OzGzq6czgIaG/wuAmExVzWMgMXFDG5DOIWu2alcoqqCM+3iTT+v9v52ZIoWjoAf389xF3XFSk9
	HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111065

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- fix skip with package = wheel
- Fixed typo in user guide.
- Fix broad build privileges @ GHA release workflow
- Allow ConfigSet.add_config to receive parameterized generics for of_type.
- Fix section substitution with setenv

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tox_4.15.0.bb => python3-tox_4.15.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.15.0.bb => python3-tox_4.15.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.15.0.bb b/meta-python/recipes-devtools/python/python3-tox_4.15.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.15.0.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.15.1.bb
index 4296738ec..367fafab4 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.15.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "7a0beeef166fbe566f54f795b4906c31b428eddafc0102ac00d20998dd1933f6"
+SRC_URI[sha256sum] = "53a092527d65e873e39213ebd4bd027a64623320b6b0326136384213f95b7076"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.34.1


