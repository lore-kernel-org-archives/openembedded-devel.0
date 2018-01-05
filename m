Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id DC20260721
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jan 2018 01:49:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="35011964"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Jan 2018 09:49:16 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id BB637486A76D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jan 2018 09:49:16 +0800 (CST)
Received: from localhost.localdomain (10.167.225.152) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Tue, 9 Jan 2018 09:49:17 +0800
From: zhengrq <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 5 Jan 2018 12:20:19 +0800
Message-ID: <1515126019-117327-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.152]
X-yoursite-MailScanner-ID: BB637486A76D.A8E49
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH]nautilus: new add
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Jan 2018 01:49:17 -0000
Content-Type: text/plain

Add a new recipe nautilus.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-gnome/nautilus/nautilus_3.18.5.bb       | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus_3.18.5.bb

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_3.18.5.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_3.18.5.bb
new file mode 100644
index 0000000..a7774fa
--- /dev/null
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_3.18.5.bb
@@ -0,0 +1,21 @@
+SUMMARY = "File manager for GNOME"
+SECTION = "x11/gnome"
+
+LICENSE="GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=36cf660aea2b8beffba7945f44a7e748 \
+                    file://COPYING.EXTENSIONS;md5=7579d6678402a1868631bf82c93ff0d4 \
+                    file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
+
+SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/nautilus/3.18/nautilus-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "0f578bda5655c0ce204befafca5803d7"
+SRC_URI[sha256sum] = "60a927c0522b4cced9d8f62baed2ee5e2fd4305be4523eb5bc44805971a6cc15"
+
+DEPENDS = "gtk+3 gnome-desktop3 gsettings-desktop-schemas glib-2.0-native intltool-native pango"
+
+inherit distro_features_check autotools pkgconfig
+REQUIRED_DISTRO_FEATURES = "x11"
+
+EXTRA_OECONF = " --disable-gtk-doc  --disable-update-mimedb --disable-nst-extension --enable-tracker=no --disable-schemas-compile --enable-xmp=no --disable-nls --enable-libexif=no --enable-introspection=no"
+
+FILES_${PN} += "${datadir}/*"
-- 
2.7.4




