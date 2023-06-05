Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4499DC7EE23
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 07:53:31 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.2113.1685951608827785697
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jun 2023 00:53:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="120638930"
X-IronPort-AV: E=Sophos;i="6.00,217,1681138800"; 
   d="scan'208";a="120638930"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 16:53:28 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id EC1DADDC65
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Jun 2023 16:53:25 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E8600BF3C7
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Jun 2023 16:53:24 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 151152FC85E5;
	Mon,  5 Jun 2023 16:53:24 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] pamela: upgrade 1.0.0 -> 1.1.0
Date: Mon,  5 Jun 2023 15:53:01 +0800
Message-Id: <1685951589-29920-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685951589-29920-1-git-send-email-wangmy@fujitsu.com>
References: <1685951589-29920-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27672.004
X-TMASE-Result: 10--3.331900-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yQPZZctd3P4BRzUPAqhCjtiY5nVpihxiw5Uh
	t+myr0XM28kKXD7bCdn/tdOuViNvuC/7QU2czuUNGYJhRh6ssesYH39vFLryE6Y5ZGw7wyeHs8W
	7VNomNMPVuPnsbKmJlg1UuEJlsPFUu2PzD0SpTPUK3Ma88LL+bq4sbbURvhPzgW6bY8SOq3WjxY
	yRBa/qJShNCXvA0fw+jaPj0W1qn0TGVuWouVipcgA4hBs+pxYHH80VDRjWOilP/OStRTunHBDvL
	nHbRj69ak2Qu6K9sTsM6VHWle1BJ59lnjqeiP1fIgANZFKUJS0mgWf0G2NLKv6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jun 2023 07:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103118

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/python/pamela_1.0.0.bb       | 15 ---------------
 .../recipes-devtools/python/pamela_1.1.0.bb       | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/pamela_1.0.0.bb
 create mode 100644 meta-python/recipes-devtools/python/pamela_1.1.0.bb

diff --git a/meta-python/recipes-devtools/python/pamela_1.0.0.bb b/meta-python/recipes-devtools/python/pamela_1.0.0.bb
deleted file mode 100644
index 369ed78ca7..0000000000
--- a/meta-python/recipes-devtools/python/pamela_1.0.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "Pamela: yet another Python wrapper for PAM"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=3f9b78307cdde4e6a4976bfd82a0e7f3"
-
-SRC_URI[md5sum] = "5fc14f5275383ed8bdd509007af0323d"
-SRC_URI[sha256sum] = "65c9389bef7d1bb0b168813b6be21964df32016923aac7515bdf05366acbab6c"
-
-PYPI_PACKAGE = "pamela"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} = "libpam"
-
-inherit features_check
-REQUIRED_DISTRO_FEATURES = "pam"
diff --git a/meta-python/recipes-devtools/python/pamela_1.1.0.bb b/meta-python/recipes-devtools/python/pamela_1.1.0.bb
new file mode 100644
index 0000000000..3573de551d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/pamela_1.1.0.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Pamela: yet another Python wrapper for PAM"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=6b706db92112b8384848de3e5c6adaa3"
+
+SRC_URI[sha256sum] = "d4b139fe600e192e176a2a368059207a6bffa0e7879879b13f4fcba0163481be"
+
+PYPI_PACKAGE = "pamela"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} = "libpam"
+
+inherit features_check
+REQUIRED_DISTRO_FEATURES = "pam"
-- 
2.34.1


