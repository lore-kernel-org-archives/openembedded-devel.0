Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id A582D60111
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jun 2019 08:50:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45YcF85L64z23
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jun 2019 10:50:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561539052;
	bh=XmXcGnR4SZthe37SSOe8++p12bY0MrcE5baW0aNFlQI=;
	h=From:To:Subject:Date:From;
	b=HGk9zdNymzyB+miWBad4qSAlWElSwWHK8PMm2jD3Aa9R7fF4J0ri/LVct7jgfwli5
	GrRJerHrV9JdvAIyJhJZ+5rKV6kT+rMfmTS67Un+/vMQrrtJoWtqpLWzsktALq/LcO
	Tp9PSTUuDUBnki/2kR0w9aF0fUWtuNz8gHThY3VV8eCaVpJBleZMePwCGUJ2zfabzq
	HmxZZuAG8Bd13yqNI0JWnYIDMtBVMwoBKk3Z5K0zW8fujX9uZSixfL4mbtHdT06Otx
	j/N78yl4CixqcOxQoniIAfkzhe1Y6FpIXcvDtVqpfnwqq0GzC2HMU6JG1e19BOtQv0
	lh/OWWRuWQQ2cRRV5g46WMlovyH1oqatUJ5AdKybZgCisf6bhM1rPyVeT5Yuryq6Vx
	v48cPkXMm9PHqS5HE08ix7cykNExTFfWfbymLEGfh9rfae557MoXwr9IwU8Yi6b0L9
	8/zKos4jdT4ZJw6aB38JnXuurjfhJ8c/U8dymCOYiWY48kVgbCVIm6XDQaxuvwD0YS
	ENewuOGFAbE6YuXYtWKK2Vy6gkOxJcX4RrEvM96llP5/tMoAdGYAIDYQTryQdUe8hO
	irB56W5SnlRHQVl18hb80vBiXNgUQblePfuSnDC/TqstfyZ55rmnI0BKNVevd6Gj0K
	+oo6/hAE19Ano8rprxJzKnAI=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Jun 2019 11:50:51 +0300
Message-Id: <20190626085052.5193-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-multimedia][PATCH] gssdp: Merge inc
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
X-List-Received-Date: Wed, 26 Jun 2019 08:50:53 -0000

This recipe stopped having multiple versions in 2014.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../recipes-connectivity/gupnp/gssdp.inc      | 20 ---------------
 .../recipes-connectivity/gupnp/gssdp_1.0.2.bb | 25 +++++++++++++++----
 2 files changed, 20 insertions(+), 25 deletions(-)
 delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/gssdp.inc

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp.inc b/meta-multimedia/recipes-connectivity/gupnp/gssdp.inc
deleted file mode 100644
index 23f17eddf..000000000
--- a/meta-multimedia/recipes-connectivity/gupnp/gssdp.inc
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Resource discovery and announcement over SSDP"
-DESCRIPTION = "GSSDP implements resource discovery and announcement over SSDP (Simpe Service Discovery Protocol)."
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
-DEPENDS = "glib-2.0 libsoup-2.4"
-
-inherit autotools pkgconfig gobject-introspection vala
-
-# Copy vapigen.m4 so that it doesn't get removed by vala class
-# (normally this would be the right thing to do, but in gssdp the vapigen.m4 has only a custom macro)
-do_configure_prepend() {
-        cp -f ${S}/m4/vapigen.m4 ${S}/m4/vapigen-custom.m4 || true
-}
-
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)}"
-PACKAGECONFIG[gtk] = "--with-gtk,--without-gtk,gtk+"
-
-PACKAGES =+ "gssdp-tools"
-
-FILES_gssdp-tools = "${bindir}/gssdp* ${datadir}/gssdp/*.glade"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.0.2.bb b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.0.2.bb
index b60d1ea44..6088ef195 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.0.2.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.0.2.bb
@@ -1,9 +1,24 @@
-require gssdp.inc
-
-inherit gtk-doc
-
-PACKAGECONFIG[gtk] = "--with-gtk,--without-gtk,gtk+3"
+SUMMARY = "Resource discovery and announcement over SSDP"
+DESCRIPTION = "GSSDP implements resource discovery and announcement over SSDP (Simpe Service Discovery Protocol)."
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
+DEPENDS = "glib-2.0 libsoup-2.4"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/1.0/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "b30c9a406853c6a3a012d151d6e7ad2c"
 SRC_URI[sha256sum] = "a1e17c09c7e1a185b0bd84fd6ff3794045a3cd729b707c23e422ff66471535dc"
+
+inherit autotools pkgconfig gobject-introspection vala gtk-doc
+
+# Copy vapigen.m4 so that it doesn't get removed by vala class
+# (normally this would be the right thing to do, but in gssdp the vapigen.m4 has only a custom macro)
+do_configure_prepend() {
+        cp -f ${S}/m4/vapigen.m4 ${S}/m4/vapigen-custom.m4 || true
+}
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)}"
+PACKAGECONFIG[gtk] = "--with-gtk,--without-gtk,gtk+3"
+
+PACKAGES =+ "gssdp-tools"
+
+FILES_gssdp-tools = "${bindir}/gssdp* ${datadir}/gssdp/*.glade"
-- 
2.17.1


