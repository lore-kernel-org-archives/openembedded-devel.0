Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A82B6C54E68
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 02:58:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.34930.1710903538262772999
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Mar 2024 19:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cioBkGDi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3809ffff90=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42K2PLSB017403
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 19:58:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=4twhm
	QWIhGc+IO569V9VbnurbapQet0dZ8fSJt4yfgE=; b=cioBkGDiFu6v6DhXjxWAV
	tVxb99pp0L9iwJlKvjZvy02WR36vAhGi2X4nFBr7ArlQinYLIlPFGwZpLFAthSw6
	CbII7w6M3lhq8wKNvu6fUUJIMJpeQoUiu2VzCMWZyOTpzsKAgFNQIK/rbI9QeV5b
	BSULXspWZTHKdZgjNU5lfx5w6Tayqac7pluwcTg/E7by9ZT3oQ/tNmSeLbRVsVh7
	9A+MzfyvYTNdrLemHl38BOvlW1inMzqeRG0IBLImXJQpfnKiFOVHEbRZzR2Qq2kh
	bAPrLpjvlRGC3VUW54Anelu36ESwjwlC+vWahmfk8jVymwXLsJFI7HhIMlezaC9o
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wwaxgb7f0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 19:58:57 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Tue, 19 Mar 2024 19:58:49 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Tue, 19 Mar 2024 19:58:48 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] Packages depends on libadwaita should require distro feature opengl
Date: Wed, 20 Mar 2024 10:58:45 +0800
Message-ID: <20240320025845.1643620-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: PNUrZtZdsemBCXbPbInYyIVZbFhysNPv
X-Proofpoint-ORIG-GUID: PNUrZtZdsemBCXbPbInYyIVZbFhysNPv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-19_10,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 clxscore=1011 bulkscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2403140001
 definitions=main-2403200022
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Mar 2024 02:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109481

From: Kai Kang <kai.kang@windriver.com>

libadwaita requires distro feature 'opengl', so packages depends on it
either directly or indirectly should require distro feature 'opengl'
too.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../network-manager-applet/network-manager-applet_1.36.0.bb    | 1 +
 meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.5.bb            | 2 +-
 meta-gnome/recipes-gnome/ghex/ghex_45.1.bb                     | 2 ++
 meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb   | 1 +
 .../gnome-online-accounts/gnome-online-accounts_3.48.0.bb      | 1 +
 meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb           | 1 +
 meta-gnome/recipes-gnome/rest/rest_0.9.1.bb                    | 3 ++-
 meta-gnome/recipes-gnome/zenity/zenity_4.0.1.bb                | 1 +
 8 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.36.0.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.36.0.bb
index 5f1f05cb2c..10e514775a 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.36.0.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.36.0.bb
@@ -7,6 +7,7 @@ DEPENDS = "gtk+3 libnma libnotify libsecret libgudev networkmanager iso-codes ns
 inherit features_check gnomebase gsettings gtk-icon-cache gettext pkgconfig
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI:append:libc-musl = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patch', '', d)}"
 
diff --git a/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.5.bb b/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.5.bb
index e9ee434add..9b1a02bb09 100644
--- a/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.5.bb
+++ b/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.5.bb
@@ -14,7 +14,7 @@ GNOMEBASEBUILDCLASS = "autotools"
 inherit gnomebase gtk-doc gobject-introspection pkgconfig features_check
 
 # for gnome-online-accounts
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 #SRC_URI += " file://0001-Update-rest-requirement-to-rest-1.0.patch"
 SRC_URI[archive.sha256sum] = "9cb381b3f78ba1136df97af3f06e3b11dcc2ab339ac08f74eda0f8057d6603e3"
diff --git a/meta-gnome/recipes-gnome/ghex/ghex_45.1.bb b/meta-gnome/recipes-gnome/ghex/ghex_45.1.bb
index 2b6adaf91c..5901e3c093 100644
--- a/meta-gnome/recipes-gnome/ghex/ghex_45.1.bb
+++ b/meta-gnome/recipes-gnome/ghex/ghex_45.1.bb
@@ -17,4 +17,6 @@ inherit gnomebase gsettings gtk-icon-cache gnome-help gettext gobject-introspect
 
 SRC_URI[archive.sha256sum] = "fb2b0823cd16249edbeaee8302f9bd5005e0150368b35f1e47c26680cacac2fa"
 
+REQUIRED_DISTRO_FEATURES = "opengl"
+
 FILES:${PN} += "${libdir} ${datadir}/metainfo"
diff --git a/meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb b/meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb
index 9669e337a8..d03b5fe04d 100644
--- a/meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
 
 GTKIC_VERSION = "4"
 inherit gnomebase gsettings pkgconfig gtk-icon-cache
+REQUIRED_DISTRO_FEATURES = "opengl"
 
 DEPENDS = " \
     desktop-file-utils-native \
diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb
index 47b234e235..5742e8e964 100644
--- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=34c88b124db5fb2762c1676be7dadd36"
 
 
 inherit gnomebase gsettings gobject-introspection gtk-icon-cache vala features_check
+REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'goabackend', 'opengl', '', d)}"
 
 DEPENDS = "gdk-pixbuf dbus glib-2.0"
 
diff --git a/meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb b/meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb
index 15e3d889f5..a65fc61feb 100644
--- a/meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb
+++ b/meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb
@@ -14,6 +14,7 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 inherit gnomebase pkgconfig gettext gtk-doc vala gobject-introspection manpages features_check
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'goa', 'opengl', '', d)}"
 
 do_compile:prepend() {
     export GIR_EXTRA_LIBS_PATH="${B}/gdata/.libs"
diff --git a/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb b/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
index 738b07e8cd..3b22fdfea2 100644
--- a/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
+++ b/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
@@ -14,7 +14,8 @@ DEPENDS = " \
     libxml2-native \
 "
 
-inherit gnomebase gobject-introspection vala pkgconfig gi-docgen
+inherit gnomebase gobject-introspection vala pkgconfig gi-docgen features_check
+REQUIRED_DISTRO_FEATURES = "opengl"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[examples] = "-Dexamples=true,-Dexamples=false"
diff --git a/meta-gnome/recipes-gnome/zenity/zenity_4.0.1.bb b/meta-gnome/recipes-gnome/zenity/zenity_4.0.1.bb
index 50e5eaa79f..88b4b5c86c 100644
--- a/meta-gnome/recipes-gnome/zenity/zenity_4.0.1.bb
+++ b/meta-gnome/recipes-gnome/zenity/zenity_4.0.1.bb
@@ -15,6 +15,7 @@ DEPENDS = " \
 "
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+REQUIRED_DISTRO_FEATURES = "opengl"
 GTKIC_VERSION = "4"
 
 SRC_URI[archive.sha256sum] = "0c2f537813b10f728470d9d05d6c95713db2512f9c95096e1e85b1a6739605e6"
-- 
2.34.1


