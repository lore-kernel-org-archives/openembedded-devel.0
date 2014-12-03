Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 986D760169
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Dec 2014 06:08:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="44398278"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Dec 2014 14:05:11 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sB3687DH014457
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 3 Dec 2014 14:08:07 +0800
Received: from localhost.localdomain (10.167.226.35) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 3 Dec 2014 14:08:32 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 3 Dec 2014 14:07:29 +0800
Message-ID: <1417586849-4678-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <20141202210216.GG12784@mentor.com>
References: <20141202210216.GG12784@mentor.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.35]
Subject: [meta-networking][PATCH v2] ncftp : add new recipe
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
X-List-Received-Date: Wed, 03 Dec 2014 06:08:34 -0000
Content-Type: text/plain

ncftp is a sophisticated console ftp client.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../recipes-daemons/ncftp/ncftp_3.2.5.bb           | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/ncftp/ncftp_3.2.5.bb

diff --git a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.5.bb b/meta-networking/recipes-daemons/ncftp/ncftp_3.2.5.bb
new file mode 100644
index 0000000..fb9eb94
--- /dev/null
+++ b/meta-networking/recipes-daemons/ncftp/ncftp_3.2.5.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "A sophisticated console ftp client"
+HOMEPAGE = "http://ncftp.com/"
+SECTION = "console/network"
+PRIORITY = "optional"
+LICENSE = "ClArtistic"
+LIC_FILES_CHKSUM = "file://ncftp/cmds.c;beginline=3;endline=4;md5=9de76faeaedc4f908082e3f8142715f4"
+
+SRC_URI = "${DEBIAN_MIRROR}/main/n/${PN}/${PN}_${PV}.orig.tar.gz"
+SRC_URI[md5sum] = "685e45f60ac11c89442c572c28af4228"
+SRC_URI[sha256sum] = "ac111b71112382853b2835c42ebe7bd59acb7f85dd00d44b2c19fbd074a436c4"
+
+inherit autotools-brokensep pkgconfig
+
+DEPENDS = "ncurses"
+
+do_configure() {
+   oe_runconf
+}
+do_install () {
+    install -d ${D}${bindir} ${D}${sysconfdir} ${D}${mandir}
+    oe_runmake 'prefix=${D}${prefix}' 'BINDIR=${D}${bindir}' \
+        'SYSCONFDIR=${D}${sysconfdir}' 'mandir=${D}${mandir}' \
+        install
+}
-- 
1.8.4.2


