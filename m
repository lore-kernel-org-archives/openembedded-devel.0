Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AFF767ECBF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2019 14:13:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6GED4ju015353
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Jul 2019 07:13:04 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 16 Jul 2019 07:13:04 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 16 Jul 2019 10:12:20 -0400
Message-ID: <20190716141231.77957-5-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190716141231.77957-1-kai.kang@windriver.com>
References: <20190716141231.77957-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 04/15] xfconf: 4.13.7 -> 4.13.8
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
X-List-Received-Date: Tue, 16 Jul 2019 14:13:05 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

* remove dbus-glib from DEPENDS that it has been replaced by gdbus.
  glib-2.0 provides gdbus and has been imported to DEPENDS by libxfce4util.
* inherit class gobject-introspection which has been supported by xfconf
  4.13.8

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../xfconf/{xfconf_4.13.7.bb => xfconf_4.13.8.bb}         | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.13.7.bb => xfconf_4.13.8.bb} (69%)

diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.7.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.8.bb
similarity index 69%
rename from meta-xfce/recipes-xfce/xfconf/xfconf_4.13.7.bb
rename to meta-xfce/recipes-xfce/xfconf/xfconf_4.13.8.bb
index 9f08f74ed..54d051c6f 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.7.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.8.bb
@@ -2,14 +2,14 @@ SUMMARY = "Xfce configuration daemon and utilities"
 SECTION = "x11/wm"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-DEPENDS = "dbus-glib libxfce4util perl intltool-native xfce4-dev-tools-native"
+DEPENDS = "libxfce4util perl intltool-native xfce4-dev-tools-native"
 
-inherit xfce gtk-doc
+inherit xfce gtk-doc gobject-introspection
 
 EXTRA_OECONF += "PERL=${STAGING_DIR_TARGET}/usr/bin/perl"
 
-SRC_URI[md5sum] = "ea4c070c4ed8387e6435b56d0e871559"
-SRC_URI[sha256sum] = "5deb13fc48a4116f5ebdee5c21d0fd3deb85bec2f69602beb3c3adb4f85e5bde"
+SRC_URI[md5sum] = "5d48e8d50f7bfadd31e804ce602a5cf3"
+SRC_URI[sha256sum] = "55e2441c4ff78a7006fabb59647f7bc1f190cbb82327b93ba063ff624a896591"
 
 FILES_${PN} += "${libdir}/xfce4/xfconf/xfconfd \
                 ${libdir}/gio/modules/libxfconfgsettingsbackend.so \
-- 
2.20.0


