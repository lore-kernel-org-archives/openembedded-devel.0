Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id CB1517066B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2015 05:30:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="57429392"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Feb 2015 13:26:57 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t1B5TiYp009664
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2015 13:29:44 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 11 Feb 2015 13:30:33 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 11 Feb 2015 13:25:25 +0800
Message-ID: <1423632325-41448-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-networking][PATCH] openvpn: install /etc/tmpfiles.d/openvpn.conf
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
X-List-Received-Date: Wed, 11 Feb 2015 05:30:31 -0000
Content-Type: text/plain

 Directory /var/run/openvpn is required by service.

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 .../recipes-support/openvpn/openvpn/openvpn-volatile.conf           | 1 +
 meta-networking/recipes-support/openvpn/openvpn_2.3.6.bb            | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/openvpn/openvpn/openvpn-volatile.conf

diff --git a/meta-networking/recipes-support/openvpn/openvpn/openvpn-volatile.conf b/meta-networking/recipes-support/openvpn/openvpn/openvpn-volatile.conf
new file mode 100644
index 0000000..4a3dc4a
--- /dev/null
+++ b/meta-networking/recipes-support/openvpn/openvpn/openvpn-volatile.conf
@@ -0,0 +1 @@
+d /var/run/openvpn 0755 root root -
diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.3.6.bb b/meta-networking/recipes-support/openvpn/openvpn_2.3.6.bb
index 58ddcc8..08f30b5 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.3.6.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.3.6.bb
@@ -9,7 +9,8 @@ inherit autotools systemd
 
 SRC_URI = "http://swupdate.openvpn.org/community/releases/openvpn-${PV}.tar.gz \
            file://openvpn \
-           file://openvpn@.service "
+           file://openvpn@.service \
+           file://openvpn-volatile.conf"
 
 SRC_URI[md5sum] = "6ca03fe0fd093e0d01601abee808835c"
 SRC_URI[sha256sum] = "7baed2ff39c12e1a1a289ec0b46fcc49ff094ca58b8d8d5f29b36ac649ee5b26"
@@ -48,6 +49,9 @@ do_install_append() {
         install -d -m 710 ${D}/${localstatedir}/lib/openvpn
         install -d -m 755 ${D}/${localstatedir}/run/
         install -d -m 755 ${D}/${localstatedir}/run/openvpn
+
+        install -d ${D}${sysconfdir}/tmpfiles.d
+        install -m 0644 ${WORKDIR}/openvpn-volatile.conf ${D}${sysconfdir}/tmpfiles.d/openvpn.conf
     fi
 }
 
-- 
1.9.1


