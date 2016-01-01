Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 603CE6AC37
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jan 2016 23:13:26 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id f206so146013474wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jan 2016 15:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=0d4bkSurWdyOPiE1fLGwhzDXhLplOj5r9lMnwgMVosk=;
	b=CRfJYHYsgEpE5vyDqXAeeF47cgRZZ6fi9vQWsTbFuiDoa3kwgL2gl0cxYkzDnmKOc/
	Y5nSkBlSZVmu8Jv91wl8o3JaNgCem1hS42EdnFsjm9Qd2UY9fyRaCCl2QEueJXCMNYXP
	V1ES3ICA41vTSOm8sYW7lI7n8LaqX9zovhxRTz1V4/06WiJ/3uqF2L0sb+wQh85BCRQM
	iB68Xfxchj12qeVAfm9gdNN7o80cXWUlMUQggkdeNXAeKW0hQ2NyksvXPfpXX+famDUE
	2PUgJ2SeEssfnZfF5fZ3VCTgE0z3gL0hLc32yWl8mGpsq+vkBGhpgC63onaHnjPPJJBC
	vb/Q==
X-Received: by 10.28.216.72 with SMTP id p69mr90778767wmg.14.1451690007208;
	Fri, 01 Jan 2016 15:13:27 -0800 (PST)
Received: from localhost.localdomain (p4FDF0FE4.dip0.t-ipconnect.de.
	[79.223.15.228]) by smtp.googlemail.com with ESMTPSA id
	s129sm22130308wmf.18.2016.01.01.15.13.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Jan 2016 15:13:26 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Jan 2016 00:13:10 +0100
Message-Id: <1451689992-28225-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH 1/3] xfce4-sensors-plugin: initial add 1.2.6
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
X-List-Received-Date: Fri, 01 Jan 2016 23:13:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../sensors/xfce4-sensors-plugin_1.2.6.bb          | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.2.6.bb

diff --git a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.2.6.bb b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.2.6.bb
new file mode 100644
index 0000000..c2e0ed9
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.2.6.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Sensors plugin for the Xfce Panel"
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-sensors-plugin"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b94789bed9aec03b9656a9cc5398c706"
+
+inherit xfce-panel-plugin
+
+SRC_URI[md5sum] = "33c2e343c1224d9c4ae757a70cbe08eb"
+SRC_URI[sha256sum] = "235ef842bd45e701bceebb21a384ab09f21afceea8ed95f91bb4c6cf3abe1bc0"
+
+EXTRA_OECONF = " \
+    --disable-procacpi \
+    --disable-sysfsacpi \
+    --disable-xnvctrl \
+"
+
+do_configure_prepend() {
+    sed -i 's:LIBSENSORS_CFLAGS=.*:LIBSENSORS_CFLAGS=-I${STAGING_INCDIR}:g' ${S}/configure.ac
+}
+
+PACKAGECONFIG ??= "libsensors"
+PACKAGECONFIG[libsensors] = "--enable-libsensors,--disable-libsensors, lmsensors"
+PACKAGECONFIG[hddtemp]    = "--enable-hddtemp,--disable-hddtemp, hddtemp"
+PACKAGECONFIG[netcat]     = "--enable-netcat,--disable-netcat, netcat"
+PACKAGECONFIG[libnotify]  = "--enable-notification,--disable-notification, libnotify"
+
+FILES_SOLIBSDEV = "${libdir}/xfce4/modules/lib*${SOLIBSDEV}"
-- 
2.5.0


