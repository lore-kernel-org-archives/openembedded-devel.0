Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tm396-0002Jx-5p
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2012 15:00:16 +0100
Received: from mail-ea0-f200.google.com ([209.85.215.200])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 21 Dec 2012 05:44:35 -0800
Received: by mail-ea0-f200.google.com with SMTP id j13so3702446eaa.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Dec 2012 05:45:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=IrxudzP3oOkDHdBJJueyNLDyuVV1ve03R081+SSuZGw=;
	b=TC/D/m/kqiJHOGOPM/+kREPXwEuaji/A/ecsbw41u1oWnYMIPdY/YgUkZp5WPsBx+5
	oWvZElWXYIlUBEv6SgyHatB0TyaeqNtodRkVNYUjEE3PgXTG8G+WuHOp5RjVocggI0zj
	zu+ziMkdYhb5YzLPrNveMWo2yV5LtxNYWeYpkIxnR1X5ktg9Zikv+PW23wZcTbOoy9KZ
	7ksSpLfvmespzgRKDpX2XVAPcW7V74n0gMz1Iou443orsg8RN/jcz1LcIUuMtzuJ8JrP
	oyxQdhIxI9IC3J2ynjwegk9glTpOB7AWaiWSTL25UZtk7/MAtKKiSLsMaIefscALqpmf
	55Gw==
X-Received: by 10.180.109.195 with SMTP id hu3mr15655216wib.31.1356097527265; 
	Fri, 21 Dec 2012 05:45:27 -0800 (PST)
X-Received: by 10.180.109.195 with SMTP id hu3mr15655206wib.31.1356097527085; 
	Fri, 21 Dec 2012 05:45:27 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id df2sm20701213wib.0.2012.12.21.05.45.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Dec 2012 05:45:26 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Dec 2012 13:43:37 +0000
Message-Id: <1356097422-11920-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQknkKI7Zz8JBYM12KpD/yspKzehu4iGwYasqi+3RLW1PhoTzQpfLiAXcU8reI5TpLBQd1iA9i7zF59be1BYJmKOaOIVDDjpzM4O1FllQGpd+hA/sx+phVVgdtTGiM8Z5T4PTTcIGNhsYx/shhQu8X6ghaoAISnTs/Kc25cIs1VvUh59vvOV4m1m73BcuFqA5dVfUcmi
Subject: [meta-multimedia PATCH V2 1/6] gssdp: add 0.12.2.1 and 0.13.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Dec 2012 14:00:17 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-multimedia/recipes-connectivity/gupnp/gssdp.inc |   18 ++++++++++++++++++
 .../recipes-connectivity/gupnp/gssdp_0.12.2.1.bb     |    5 +++++
 .../recipes-connectivity/gupnp/gssdp_0.13.2.bb       |    8 ++++++++
 .../recipes-connectivity/gupnp/no-vala.inc           |    5 +++++
 4 files changed, 36 insertions(+)
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gssdp.inc
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gssdp_0.12.2.1.bb
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gssdp_0.13.2.bb
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/no-vala.inc

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp.inc b/meta-multimedia/recipes-connectivity/gupnp/gssdp.inc
new file mode 100644
index 0000000..ae965b9
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp.inc
@@ -0,0 +1,18 @@
+SUMMARY = "Resource discovery and announcement over SSDP"
+DESCRIPTION = "GSSDP implements resource discovery and announcement over SSDP (Simpe Service Discovery Protocol)."
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
+DEPENDS = "glib-2.0 libsoup-2.4 gobject-introspection-stub"
+
+inherit autotools pkgconfig
+
+require no-vala.inc
+
+EXTRA_OECONF = "--disable-introspection"
+
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)}"
+PACKAGECONFIG[gtk] = "--with-gtk,--without-gtk,gtk+"
+
+PACKAGES =+ "gssdp-tools"
+
+FILES_gssdp-tools = "${bindir}/gssdp* ${datadir}/gssdp/*.glade"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_0.12.2.1.bb b/meta-multimedia/recipes-connectivity/gupnp/gssdp_0.12.2.1.bb
new file mode 100644
index 0000000..29cc721
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp_0.12.2.1.bb
@@ -0,0 +1,5 @@
+require gssdp.inc
+
+SRC_URI = "http://download.gnome.org/sources/${BPN}/0.12/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "8ac3a544ef0dcf8caaf7c249d2a50dc2"
+SRC_URI[sha256sum] = "928aa257815d044fdbfc740f5799530d41897947b5d7854173f636b36d728414"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_0.13.2.bb b/meta-multimedia/recipes-connectivity/gupnp/gssdp_0.13.2.bb
new file mode 100644
index 0000000..c308fa0
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp_0.13.2.bb
@@ -0,0 +1,8 @@
+require gssdp.inc
+
+SRC_URI = "http://download.gnome.org/sources/${BPN}/0.13/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "758ed423cdd258a9a22d59c321b535ed"
+SRC_URI[sha256sum] = "8f663f8a72b66254f5c20a3610ff853ac8d00bf6f253828e37e51579caa34dce"
+
+# This is a development release so don't prefer it
+DEFAULT_PREFERENCE = "-1"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/no-vala.inc b/meta-multimedia/recipes-connectivity/gupnp/no-vala.inc
new file mode 100644
index 0000000..a4f3fb6
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/no-vala.inc
@@ -0,0 +1,5 @@
+do_configure_prepend () {
+	# Vala needs gobject-introspection so won't work. Instead of depending
+	# on vala-native just to run configure, comment out the Vala macro.
+	sed -i -e 's/\(^[ \t]*VALA_PROG_VAPIGEN\)/dnl \1/g' ${S}/configure.ac
+}
-- 
1.7.10



