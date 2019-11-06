Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1F25B7F96F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 11:12:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,274,1569254400"; d="scan'208";a="77949539"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Nov 2019 19:12:44 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id F0DCE4CE151A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 19:04:40 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 6 Nov 2019 19:12:44 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Nov 2019 22:52:30 +0800
Message-ID: <1573051950-45551-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: F0DCE4CE151A.AA0B3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] libpeas: upgrade 1.22.0 -> 1.24.0
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
X-List-Received-Date: Wed, 06 Nov 2019 11:12:45 -0000
Content-Type: text/plain

Change buildtool from autotools to meson with version upgrade.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../libpeas/{libpeas_1.22.0.bb => libpeas_1.24.0.bb}          | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-gnome/libpeas/{libpeas_1.22.0.bb => libpeas_1.24.0.bb} (58%)

diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_1.22.0.bb b/meta-oe/recipes-gnome/libpeas/libpeas_1.24.0.bb
similarity index 58%
rename from meta-oe/recipes-gnome/libpeas/libpeas_1.22.0.bb
rename to meta-oe/recipes-gnome/libpeas/libpeas_1.24.0.bb
index dd1b53e..33c5fbb 100644
--- a/meta-oe/recipes-gnome/libpeas/libpeas_1.22.0.bb
+++ b/meta-oe/recipes-gnome/libpeas/libpeas_1.24.0.bb
@@ -5,16 +5,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4b54a1fd55a448865a0b32d41598759d"
 
 DEPENDS = "gnome-common gtk+3 intltool-native"
 
+GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gobject-introspection gtk-doc gtk-icon-cache distro_features_check
 
-# gobject-introspection is mandatory and cannot be configured
-REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection --disable-introspection"
+GTKDOC_MESON_OPTION = "gtk_doc"
 
-SRC_URI[archive.md5sum] = "a20dc55c3f88ad06da9491cfd7de7558"
-SRC_URI[archive.sha256sum] = "5b2fc0f53962b25bca131a5ec0139e6fef8e254481b6e777975f7a1d2702a962"
+SRC_URI[archive.md5sum] = "7a136eea60930012deff2f7bfa3673be"
+SRC_URI[archive.sha256sum] = "0b9a00138c129a663de3eef5569b00ace03ce31d345f7af783768e9f35c8e6f9"
 
-PACKAGECONFIG[python3] = "--enable-python3,--disable-python3,python3-pygobject"
+PACKAGECONFIG[python3] = "-Dpython3=true,-Dpython3=false,python3-pygobject"
 
 export GIR_EXTRA_LIBS_PATH = "${B}/libpeas/.libs"
 
-- 
2.7.4




