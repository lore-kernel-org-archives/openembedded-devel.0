Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5BE626F8B6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Mar 2014 04:35:58 +0000 (UTC)
Received: by mail-pd0-f173.google.com with SMTP id z10so6512662pdj.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Mar 2014 21:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=S7evoIoPw1nRAHSpYZq5ecHegSG/6MbOr8L/wPVwEpQ=;
	b=LAXSSHJSQfX88jGYoRgg60xrZHB0xcNSjYd3Uck/uPaZ5d09RTwXJ+ds9zqu6FCx6X
	/j0J+vp4mo1PhCreQKujYrF0vZaNNFb4j6/yBNA7iNQPJkKnFJnxF5rRGnyBYbQtjFW/
	jHsj0u3+G0MY4gcXTjmVcArh2gSPeMJk62mRcPpruIEeXsy2IJCUL3hRT2nC0o7Xq5g8
	l6rGLK+Iw2RlohibXyMcn16lluVDD7iFSZRmS/gcb2QIGJBgGcq8OVD/7vSZLTJdmK4Q
	olR5ViTsVeSZRQE20MAO73GHQEyQb2MXyD5FHBqdhe4JpnFoHEo7ziYYxzwiQsBU+2TI
	PBog==
X-Received: by 10.68.180.66 with SMTP id dm2mr7718280pbc.143.1395117358982;
	Mon, 17 Mar 2014 21:35:58 -0700 (PDT)
Received: from archimedes.arnolds.bogus
	(dsl-66-59-252-223.static.linkline.com. [66.59.252.223])
	by mx.google.com with ESMTPSA id e6sm48325263pbg.4.2014.03.17.21.35.57
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Mar 2014 21:35:58 -0700 (PDT)
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Mar 2014 21:34:44 -0700
Message-Id: <1395117284-22655-1-git-send-email-stephen.arnold42@gmail.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [meta-xfce][PATCH v3] recipes-xfce/libxfce4ui: depends and autotools fixes
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
X-List-Received-Date: Tue, 18 Mar 2014 04:36:01 -0000

Note: this patch (v3) obseletes previous versions

libxfce4ui_4.10.0.bb: Upstream changes required autotools and gettext (intl) 
fixes, as well as moving the autogen stuff to a separate task.  Full depends 
were also added (2 were converted to PACKAGECONFIG options) along with a 
vendor config option.

Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>

---
 meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
index cc63a9f..1e141c4 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "Xfce4 Widget library and X Window System interaction"
 SECTION = "x11/libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
-DEPENDS = "gtk+ intltool libxfce4util startup-notification xfconf glade3"
+DEPENDS = "perl-native glib-2.0 gtk+ intltool libxfce4util xfconf xfce4-dev-tools virtual/libx11 libsm libice"
 
-inherit xfce
+inherit autotools gettext xfce
 
 SRC_URI = " \
     git://git.xfce.org/xfce/libxfce4ui;protocol=git \
@@ -15,9 +15,13 @@ SRCREV = "530b72f50fcbd8cb4b970fcc97be0321bf78183e"
 PV = "4.10.0+git${SRCPV}"
 S = "${WORKDIR}/git"
 
-EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
+EXTRA_OECONF += "--enable-maintainer-mode --disable-debug  --with-vendor-info=${DISTRO}"
 
-do_configure_prepend() {
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[gladeui] = "--enable-gladeui,--disable-gladeui,glade3"
+PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
+
+do_src_prepare() {
        NOCONFIGURE=yes ./autogen.sh
 }
 
@@ -27,3 +31,5 @@ FILES_${PN}-dev += "${libdir}/glade3/modules/*.la \
 PACKAGES += "${PN}-glade"
 FILES_${PN}-glade = "${libdir}/glade3 \
                      ${datadir}/glade3"
+
+addtask do_src_prepare before do_configure after do_patch
-- 
1.8.5.3


