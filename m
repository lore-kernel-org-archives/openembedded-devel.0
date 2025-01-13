Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9BA2E7719E
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 06:31:54 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.11232.1736749908112787010
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jan 2025 22:31:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ao4nE4cw;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736749908; x=1768285908;
  h=from:to:cc:subject:date:message-id;
  bh=/9WOTtGKGCM2y6SLHKGF8ED1IRK1hb4H6ycCevXkulc=;
  b=ao4nE4cwP47mWRVBeYZqRMTvoQWlDDOTZUUtQG12OvEEClUOExzfXBJD
   /mheAGo6AA/+WSWOdcjNcf/C022O6Q43FdItQZ1Lpw7vmaCSvtGBQ1j9V
   mQkq/U1DOM9OVCby8l8/z3i65ktV8sU5WxWA4qEDgzWVdfUz2cdHjxwVk
   lUeAHZBT0siSxrAXzbSUWI2irUW7GcmWD62dHIe+ShmBx0pyB4v+nCKin
   BQk2n9PExSEg2ZLBfNo1Jm9yuh+XXkgm4RjfqbGUhscIc1sDDwzvHBiWs
   VZESSq54apNWv5NRb45j+s5POKx9VxUmfdzvEhyXUUH6TXSE+SBgjGVey
   Q==;
X-CSE-ConnectionGUID: N0Cnx01tR+abc+HYwpHEHg==
X-CSE-MsgGUID: 3kXlBxFeQeicO7wCOWjBUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="165282792"
X-IronPort-AV: E=Sophos;i="6.12,310,1728918000"; 
   d="scan'208";a="165282792"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 15:31:45 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7D73EE3E19
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 15:31:43 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4D5FDCFB6D
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 15:31:43 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id BEF4D20071A01
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 15:31:42 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0AB171A006C;
	Mon, 13 Jan 2025 14:31:41 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] mariadb: Enable network during do_compile
Date: Mon, 13 Jan 2025 14:31:37 +0800
Message-Id: <1736749897-27279-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28920.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28920.005
X-TMASE-Result: 10--6.214700-10.000000
X-TMASE-MatchedRID: zhUgrjUmACy7xhJnFx1wJh1kSRHxj+Z505SDu2UGfe9GXh0VnXIBtsK4
	1wCZ4lrXZfQGdwv+OGtpq7ZCUQfbTKgZIrutfM9NowvZ4t/MYW43l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5/XjpbSJS7a8wlgPRpEXRFSId5c1ojSONZNYSHk3Zr0XMnLbOdLVk/fgudYcwEFs+jxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0Q7AFczfjr/7Dl6TFWi/uxFVUW25IJhlrh/KpUT7hwMzaHOq
	QF9mTNx7pkBq2XDJFA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 06:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114826

From: Wang Mingyu <wangmy@fujitsu.com>

fix the error when do_compile:
CMake Error at libfmt-stamp/download-libfmt.cmake:163 (message):
  Each download failed!

    error: downloading 'https://github.com/fmtlib/fmt/releases/download/11.0.1/fmt-11.0.1.zip' failed
          status_code: 6
          status_string: "Could not resolve hostname"
          log:
          --- LOG BEGIN ---
          timeout on name lookup is not supported

  getaddrinfo(3) failed for github.com:443

  Could not resolve host: github.com 

  closing connection #0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index d3192cc59c..982c82cd59 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -31,6 +31,9 @@ SRC_URI[sha256sum] = "0a00180864cd016187c986faab8010de23a117b9a75f91d6456421f894
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/tags"
 
+# network is required by go to get dependent packages
+do_compile[network] = "1"
+
 BINCONFIG_GLOB = "mysql_config"
 
 inherit cmake gettext binconfig update-rc.d systemd multilib_script multilib_header pkgconfig
-- 
2.43.0


