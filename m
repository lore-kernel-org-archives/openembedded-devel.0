Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id C436776DE7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 09:26:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="100081179"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Aug 2015 17:29:33 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t7R9QIsJ008692
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 17:26:18 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 27 Aug 2015 17:26:24 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 27 Aug 2015 17:26:13 +0800
Message-ID: <1440667573-1822-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-oe][PATCH] networkmanager: disable service by default and WARNING Fix
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Aug 2015 09:26:32 -0000
Content-Type: text/plain

* Disable NetworkManager.service by default,otherwise,the
  Root file system using the method of NFS mount can't boot successfully.
  Also it is disabled on Fedora.

* WARNING Fix:
  WARNING: QA Issue: networkmanager: Files/directories were installed but not shipped in any package:
  /run
  /run/NetworkManager
  Please set FILES such that these items are packaged. Alternatively if they are unneeded,
  avoid installing them or delete them within do_install. [installed-vs-shipped]

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb
index 62debe9..4e2ca28 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb
@@ -58,6 +58,7 @@ FILES_${PN} += " \
     ${datadir}/dbus-1 \
     ${base_libdir}/udev/* \
     ${systemd_unitdir}/system \
+    /run \
 "
 
 RRECOMMENDS_${PN} += "iptables dnsmasq"
@@ -84,3 +85,4 @@ FILES_${PN}-tests = " \
 FILES_${PN}-bash-completion = "${datadir}/bash-completion"
 
 SYSTEMD_SERVICE_${PN} = "NetworkManager.service"
+SYSTEMD_AUTO_ENABLE = "disable"
-- 
1.8.4.2


