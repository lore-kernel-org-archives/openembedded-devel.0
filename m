Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1853D734B8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 09:19:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="98672918"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Jul 2015 17:22:56 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6L9HRPV007821
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 17:17:27 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 21 Jul 2015 17:19:14 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Jul 2015 17:19:03 +0800
Message-ID: <1437470344-1669-2-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1437470344-1669-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1437470344-1669-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-oe][PATCH] corosync: upgrade 2.3.4 -> 2.3.5
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
X-List-Received-Date: Tue, 21 Jul 2015 09:19:15 -0000
Content-Type: text/plain

Drop "--enable-nss" configure option because it is not be supported any more.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../corosync/{corosync_2.3.4.bb => corosync_2.3.5.bb}       | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-extended/corosync/{corosync_2.3.4.bb => corosync_2.3.5.bb} (88%)

diff --git a/meta-oe/recipes-extended/corosync/corosync_2.3.4.bb b/meta-oe/recipes-extended/corosync/corosync_2.3.5.bb
similarity index 88%
rename from meta-oe/recipes-extended/corosync/corosync_2.3.4.bb
rename to meta-oe/recipes-extended/corosync/corosync_2.3.5.bb
index b84257f..08c0893 100644
--- a/meta-oe/recipes-extended/corosync/corosync_2.3.4.bb
+++ b/meta-oe/recipes-extended/corosync/corosync_2.3.5.bb
@@ -7,11 +7,9 @@ SECTION = "base"
 
 inherit autotools pkgconfig systemd
 
-SRC_URI = "http://build.clusterlabs.org/corosync/releases/${BP}.tar.gz \
-	   "
-
-SRC_URI[md5sum] = "4b0f36a1dc014527e5b192265dbd7e70"
-SRC_URI[sha256sum] = "3dae93fb1cf5c560295253b0560cbc25421ed053ee373852864f3a60c03247d4"
+SRC_URI = "http://build.clusterlabs.org/corosync/releases/${BP}.tar.gz"
+SRC_URI[md5sum] = "8894f00d499e0755467b381e6346f9ff"
+SRC_URI[sha256sum] = "1d48cdfa224b0ceb02e27fe9d56b738fb2a92262b04b15bb3a67e1c4248da8e2"
 
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a85eb4ce24033adb6088dd1d6ffc5e5d"
@@ -27,10 +25,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd',
 
 PACKAGECONFIG[systemd] = "--enable-systemd --with-systemddir=${systemd_unitdir}/system/,--with-systemddir="
 
-EXTRA_OECONF = "--disable-nss \
-                --with-upstartdir=%{_sysconfdir}/init \
-"
-EXTRA_OECONF += " --enable-nss "
+EXTRA_OECONF = "--with-upstartdir=%{_sysconfdir}/init"
 
 do_configure_prepend() {
     ( cd ${S}
-- 
1.8.4.2


