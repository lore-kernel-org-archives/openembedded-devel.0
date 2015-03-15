Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 03C607391D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 23:34:04 +0000 (UTC)
Received: by wgbcc7 with SMTP id cc7so27056807wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 16:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=G5qAgbxc8YNCusRGFs4DMh/xcW99hrD3ES+LLvm3Vj8=;
	b=NvfzmpYVELKFLW2I8idTU1pF4P+HgxRca2GBO8+EfmPJ9ebSPuOBVfn+O1tyBj5Ydo
	zT9iq4lWpiXbgEFvOLZ1UstJdGIJjD9ax3amJ5kdk5QTnxKAYXUkWCFl+tWIzv40wQwq
	D3Ds5NxiJdY1JVTNHtbsP2OWBJbzzNFR2xN6XBkrxlM0SYv3NnmVBcR9Q7hbiyIE25+r
	MOHbYIHQHTPUmhmWM+6aAAtWnMPPK38f/rYtFA3cpffofQEsgnVgMBJBsDpeg7Y4i6pj
	omicSDjlO9vU3AKOaS9NHo66ELVjGgU9Y+h57gS7N3mT4asamUj+N4thp7n1LLPxJjNz
	J17w==
X-Received: by 10.194.11.40 with SMTP id n8mr119239577wjb.43.1426462445934;
	Sun, 15 Mar 2015 16:34:05 -0700 (PDT)
Received: from localhost.localdomain (p54AA52CC.dip0.t-ipconnect.de.
	[84.170.82.204]) by mx.google.com with ESMTPSA id
	r14sm12804945wiv.13.2015.03.15.16.34.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 16:34:05 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2015 00:33:18 +0100
Message-Id: <1426462419-10173-10-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
References: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce 09/30] xfce4-session: update to 4.12.0
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
X-List-Received-Date: Sun, 15 Mar 2015 23:34:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

consolekit support is gone

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xfce4-session/xfce4-session_4.10.1.bb          | 31 ----------------------
 .../xfce4-session/xfce4-session_4.12.0.bb          | 28 +++++++++++++++++++
 2 files changed, 28 insertions(+), 31 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb
 create mode 100644 meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.0.bb

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb
deleted file mode 100644
index aa82a7c..0000000
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY = "xfce4-session is a session manager for Xfce 4 Desktop Environment"
-SECTION = "x11"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
-DEPENDS = "virtual/libx11 libsm libxfce4util libxfce4ui gtk+ libwnck dbus dbus-glib xfconf"
-RDEPENDS_${PN} = "netbase xinit dbus-x11 iceauth upower"
-
-inherit xfce update-alternatives
-
-SRC_URI[md5sum] = "1757657c1d590aa6274b7b7cbba33352"
-SRC_URI[sha256sum] = "0154fabdc398798c3445374ccc52a2f5bcb2d867fc94bc54114395b24f9cfc83"
-SRC_URI += " \
-    file://0001-configure.in-hard-code-path-to-iceauth.patch \
-"
-
-ALTERNATIVE_${PN} = "x-session-manager"
-ALTERNATIVE_TARGET[x-session-manager] = "${bindir}/xfce4-session"
-ALTERNATIVE_PRIORITY_${PN} = "100"
-
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES','systemd','systemd','consolekit',d)}"
-PACKAGECONFIG[systemd] = "--enable-systemd, --disable-systemd, polkit, systemd"
-PACKAGECONFIG[consolekit] = ",,,consolekit"
-
-FILES_${PN} += "${libdir}/xfce4/*/*/*.so \
-                ${libdir}/xfce4/session/*-*-* \
-                ${datadir}/xsessions \
-                ${datadir}/themes/Default/balou/*"
-
-FILES_${PN}-dbg += "${libdir}/xfce4/*/*/.debug"
-
-FILES_${PN}-staticdev += "${libdir}/xfce4/*/*/*.*a"
diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.0.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.0.bb
new file mode 100644
index 0000000..eaef4c6
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.0.bb
@@ -0,0 +1,28 @@
+SUMMARY = "xfce4-session is a session manager for Xfce 4 Desktop Environment"
+SECTION = "x11"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
+DEPENDS = "virtual/libx11 libsm libxfce4util libxfce4ui gtk+ libwnck dbus dbus-glib xfconf polkit"
+RDEPENDS_${PN} = "netbase xinit dbus-x11 iceauth upower"
+
+inherit xfce update-alternatives
+
+SRC_URI[md5sum] = "d75b257bc0954c238d3c82ce498525aa"
+SRC_URI[sha256sum] = "68c85453b097d3ada573dcb7e72acd06e0fc34531996122c10d20096405b7b06"
+SRC_URI += " \
+    file://0001-configure.in-hard-code-path-to-iceauth.patch \
+"
+
+ALTERNATIVE_${PN} = "x-session-manager"
+ALTERNATIVE_TARGET[x-session-manager] = "${bindir}/xfce4-session"
+ALTERNATIVE_PRIORITY_${PN} = "100"
+
+FILES_${PN} += " \
+    ${libdir}/xfce4/*/*/*.so \
+    ${libdir}/xfce4/session/*-*-* \
+    ${datadir}/xsessions \
+    ${datadir}/themes/Default/balou/* \
+    ${datadir}/polkit-1 \
+"
+
+FILES_${PN}-dbg += "${libdir}/xfce4/*/*/.debug"
-- 
1.9.3


