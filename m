Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id BCE9F7F225
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 08:36:22 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id c20so12422948wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2019 00:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=c1RA5pNuF89djl7JRoT9K56j/fmXR+o7Gq+MwiJ5Oys=;
	b=rtxbiNAMUL/okDg8aU3cIY9jLAD07OfG8DpzyNaSU7dMyd3dHfquu8hW6Fmtpg4OqX
	ukpuJGCmWuFqtgHxEStBRGDVraSZ2wtD3NwpYsO4mPXzTGpc04lp1/tNn3gvTETd2F/w
	ELQEkkx0nUwlfukyoOmsjtIloOoRTGSvs2VrjwRVnbLujuhH4k7Ej0y7qorsEPIeuyso
	sPjPWMAc2KBfZfv8Sqh+b/i1qmHQH/ATavqzYlg5LukUXduYnIgGtbUDrCVCvpkAv6NF
	yIdnLI1lOKKbwpraD+6ilE67dMo26KhYPaOy+JZG/EN+8VFL/5BrkPLAaTjW94PIr+r2
	hSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=c1RA5pNuF89djl7JRoT9K56j/fmXR+o7Gq+MwiJ5Oys=;
	b=pfSVINV/FhW7b9yPbuZaOWoo7pD0f8md5+fdqrz4GEZ7rWd9/LCokQDi3TEASxO9zW
	73JoxSpjJeJnYlgpCupcofHIh9LWDaRCB8dPC1Cc+ElOt+iGy/KYD9V3Hbh+5maCg4Yn
	SSVXJ0TWvoA/979POomhoQ/bgn88Q1+tGfICG1jXulII0eyAqxYbOfWl2h4TXNVFG8QL
	WijZMVKvzc6aYmeL0x+5pzpjKx4K6xGnPaIFLaPp+YJ9pbPDbfgwM5TeiXObyvariZtL
	G+cSZPoo6nHBMyk4T3XBgZ43beqfGpAnYIanmgDBsjHjRfvinf9q9WD+Hb6040gQyNMF
	Xn8Q==
X-Gm-Message-State: APjAAAUesWUBndX9LWYL1AEfKqyFBPJaxs3T7AGTl+maVlWFe+AeJHkV
	/tZYv0O9UKenBzE1Yl7imUajQUN3
X-Google-Smtp-Source: APXvYqwkJ4hnf6VmKCDCH39OkqkwqImI96eAW5d3+qMZTYnHzdIoPwlqPisEy6rR2drQA28RwbeB7w==
X-Received: by 2002:a05:600c:54b:: with SMTP id
	k11mr23275138wmc.63.1575880583073; 
	Mon, 09 Dec 2019 00:36:23 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F05A251D39764436B44384E.dip0.t-ipconnect.de.
	[2003:f0:7f05:a251:d397:6443:6b44:384e])
	by smtp.gmail.com with ESMTPSA id
	e18sm29450149wrw.70.2019.12.09.00.36.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 00:36:22 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 09:35:53 +0100
Message-Id: <20191209083612.23922-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209083612.23922-1-schnitzeltony@gmail.com>
References: <20191209083612.23922-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v3 01/20] gjs: initial add 1.58.3
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
X-List-Received-Date: Mon, 09 Dec 2019 08:36:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* it is a dependency for upcoming gnome shell
* this is the latest stable version currently [1]

[1] http://ftp.gnome.org/pub/gnome/sources/gjs/1.63/gjs-1.63.1.news

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gjs/gjs/0001-Disable-tests-on-host.patch  | 33 +++++++++++++++++
 meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb    | 37 +++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gjs/gjs/0001-Disable-tests-on-host.patch
 create mode 100644 meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb

diff --git a/meta-gnome/recipes-gnome/gjs/gjs/0001-Disable-tests-on-host.patch b/meta-gnome/recipes-gnome/gjs/gjs/0001-Disable-tests-on-host.patch
new file mode 100644
index 000000000..0953214fb
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gjs/gjs/0001-Disable-tests-on-host.patch
@@ -0,0 +1,33 @@
+From 95379de2132786f855e8caec1fd5869225774d02 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Sat, 18 May 2019 01:14:07 +0200
+Subject: [PATCH] Disable tests on host
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ configure.ac | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index fa4e136..056e96e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -335,9 +335,7 @@ AS_IF([test "x$with_dbus_tests" != "xno"], [
+ ])
+ AM_CONDITIONAL([DBUS_TESTS], [test "x$with_dbus_tests" != "xno"])
+ 
+-AC_MSG_CHECKING([for a suitable UTF-8 locale to run the tests in])
+-TESTS_LOCALE=$($srcdir/build/choose-tests-locale.sh)
+-AC_MSG_RESULT([$TESTS_LOCALE])
++TESTS_LOCALE=C
+ AC_SUBST([TESTS_LOCALE])
+ 
+ AC_SUBST([gjsjsdir], [\${datadir}/gjs-1.0])
+-- 
+2.20.1
+
diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb
new file mode 100644
index 000000000..ddd5196b2
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb
@@ -0,0 +1,37 @@
+SUMMARY = "Javascript bindings for GNOME"
+LICENSE = "MIT & LGPLv2+"
+LIC_FILES_CHKSUM = " \
+    file://COPYING;md5=beb29cf17fabe736f0639b09ee6e76fa \
+    file://COPYING.LGPL;md5=3bf50002aefd002f49e7bb854063f7e7 \
+"
+
+GNOMEBASEBUILDCLASS = "autotools"
+
+DEPENDS = "mozjs gtk+3"
+
+inherit gnomebase gsettings gobject-introspection vala gettext features_check upstream-version-is-even
+
+SRC_URI[archive.md5sum] = "bce6dea9a6583a8b3c6af5854df76aaf"
+SRC_URI[archive.sha256sum] = "ca9fcd47b95ab0fc445301b2595e51fcea24d6f3cd87c190fe07006146d773ae"
+SRC_URI += "file://0001-Disable-tests-on-host.patch"
+
+# gobject-introspection is mandatory and cannot be configured
+REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
+UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection --disable-introspection"
+
+EXTRA_OECONF = " \
+    --without-dbus-tests \
+    --disable-installed-tests \
+"
+
+do_configure_prepend() {
+    # make configure find gobject-introspection test code. Although we set
+    # --disable-installed-tests gjs builds them
+    sed -i 's|:$GI_DATADIR|:${STAGING_DIR_NATIVE}$GI_DATADIR|g' ${S}/configure.ac
+}
+
+FILES_${PN} += "${datadir}/gjs-1.0/lsan"
+
+PACKAGES =+ "${PN}-valgrind"
+FILES_${PN}-valgrind = "${datadir}/gjs-1.0/valgrind"
+RSEPENDS_${PN}-valgrind += "valgrind"
-- 
2.21.0


