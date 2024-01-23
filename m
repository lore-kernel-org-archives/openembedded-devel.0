Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00ED0C46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:52:05 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.1639.1705974722336006450
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:52:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="146930908"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="146930908"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:52:00 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C7691D618D
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:51:57 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 13A2BD219E
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:51:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8EA8D6B4C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:51:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 337B91A006A;
	Tue, 23 Jan 2024 09:51:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-ipython: upgrade 8.19.0 -> 8.20.0
Date: Tue, 23 Jan 2024 09:51:07 +0800
Message-Id: <1705974667-26112-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.004
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0Z3QqJN4m15UF9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrcMevonLZFXHEXghyuabqIDMhemprblfYUKQSjBNZaub6FCghHQvPFE1bV
	ofRRTtbd+lF1UvTWe9v+Q65zwinrzaA7SX/xON8h0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:52:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108417

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_8.19.0.bb => python3-ipython_8.20.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_8.19.0.bb => python3-ipython_8.20.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.19.0.bb b/meta-python/recipes-devtools/python/python3-ipython_8.20.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-ipython_8.19.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_8.20.0.bb
index 87474e4ed..239d7deea 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_8.19.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_8.20.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
-SRC_URI[sha256sum] = "ac4da4ecf0042fb4e0ce57c60430c2db3c719fa8bdf92f8631d6bd8a5785d1f0"
+SRC_URI[sha256sum] = "2f21bd3fc1d51550c89ee3944ae04bbc7bc79e129ea0937da6e6c68bfdbf117a"
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-setuptools \
-- 
2.34.1


