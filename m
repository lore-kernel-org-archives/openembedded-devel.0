Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AF4A878373
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 07:04:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6O74Fs0029144
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 24 Jul 2017 00:04:16 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 24 Jul 2017 00:04:15 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Jul 2017 03:04:06 -0400
Message-ID: <25fd08cb72c5edc7bbbdef9e3a21e5a51f434a30.1500878698.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1500878698.git.hongxu.jia@windriver.com>
References: <cover.1500878698.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 3/5] libtimezonemap: add recipe 0.4.5
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
X-List-Received-Date: Mon, 24 Jul 2017 07:04:15 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../libtimezonemap/libtimezonemap_0.4.5.bb         | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.5.bb

diff --git a/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.5.bb b/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.5.bb
new file mode 100644
index 0000000..d6aeed3
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.5.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Time zone map widget for Gtk+"
+HOMEPAGE = "https://launchpad.net/timezonemap"
+SECTION = "devel/lib"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/libt/${BPN}/${BPN}_${PV}.tar.gz \
+"
+SRC_URI[md5sum] = "054306fa998fe580f17b68aa1e16551b"
+SRC_URI[sha256sum] = "327e64a17c676c1bcda3b6ba3394d3d01250e5ac9a49222b9ff5737d90b15383"
+
+
+DEPENDS = "gtk+3 gdk-pixbuf libsoup-2.4 json-glib gnome-common-native \
+"
+
+B = "${S}"
+
+inherit autotools pkgconfig gobject-introspection
+
+do_configure_prepend() {
+	(cd ${S}; NOCONFIGURE="yes" . ${S}/autogen.sh)
+}
-- 
2.8.1


