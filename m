Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id CC7967FA24
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 00:09:28 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id b11so5964105wmj.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Dec 2019 16:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=A7pmMcPvLZ0nz+He4m1+1Uh31r/4wA86LblAAKV2juw=;
	b=YnmniLuQ6lMdYxbqNU9UEVTIeuXB/Nky15AWDYeLsWdC9YuOma+S2kAcjbP8w3HUYB
	EDAQwMDfFCwiKcKKTZ4AdpFXRaNhaCqTpnO/yVhfkfyHdbE+2s7V0XWgigcHfhHG4Y2V
	Dpts4zkkzJ+c97y9Exqj/IchnZxCORcrcWo2U3AVZpVUGULUBE1EcW2JUbnGvR2Ds/tn
	yRT9/CIBrC4cszDcPN+hdPropvbmRUcWyDnrR/8vJXnOqILSZqVqrbmZhyg4/dwkWCw9
	9byv5ofbAEbqgp0jAkX+FEqj0iCBpiZiueQGXXmsCFDo4nWlCHtghAaK22XfMVvgAS/y
	pr6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=A7pmMcPvLZ0nz+He4m1+1Uh31r/4wA86LblAAKV2juw=;
	b=qqpEptrkLLkKIoG+3B/STFldQAwCRux1k2jHZew2sfubdgnmEiRsqS2S8INrBAoOuL
	BGrwnsFG+6xYnl60p90LoumeGv2ovLbfxPQshbB3W7wKPk9tNOzjebA43+BtNewk+pgK
	ZrNwQqzr1bzfpAsx+uW9nD52rw0lrL4J1lEvL+Uw8OV/cWl2I6Wnp8E+A15NKU64oyJz
	cVw7q/6pFHOzjo8aDsTML8p9nnTkhJPmHF4J5dPqdWeUKCNsY2gM2dCOXz0+BdXWSdqM
	6z3MB1tPkj3qvs1Hce9TpHa3B56rtoJroTEIURjU5+0x4+YMy+UuJxnRxsUS/7wok7Yo
	jlBA==
X-Gm-Message-State: APjAAAXs40Ay3N0Dj8H4h1xxx9Rekzv0j0fDVy7hO6q3KZYCUCtS4WtX
	pzFutBxGZRgytpNuGApmx3pIu9g+
X-Google-Smtp-Source: APXvYqw/fB4s+RYeWsh+HdBwoz6p4zLrvPcAxhrI/w5t0mRnrk40ZKXIT/XnVVrsSFQU7kdNLfURwA==
X-Received: by 2002:a1c:6086:: with SMTP id u128mr7489690wmb.131.1575590969085;
	Thu, 05 Dec 2019 16:09:29 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9017AA4DD0060EAA1509.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9017:aa4d:d006:eaa:1509])
	by smtp.gmail.com with ESMTPSA id
	b10sm14252762wrt.90.2019.12.05.16.09.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 16:09:28 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Dec 2019 01:08:56 +0100
Message-Id: <20191206000912.19841-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191206000912.19841-1-schnitzeltony@gmail.com>
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 05/21] gjs: initial add 1.58.1
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
X-List-Received-Date: Fri, 06 Dec 2019 00:09:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* it is a dependency for upcoming gnome shell
* this is currently tha latest stable version [1]

[1] http://ftp.gnome.org/pub/gnome/sources/gjs/1.63/gjs-1.63.1.news

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gjs/gjs/0001-Disable-tests-on-host.patch  | 33 +++++++++++++++++
 meta-gnome/recipes-gnome/gjs/gjs_1.58.1.bb    | 37 +++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gjs/gjs/0001-Disable-tests-on-host.patch
 create mode 100644 meta-gnome/recipes-gnome/gjs/gjs_1.58.1.bb

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
diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.58.1.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.58.1.bb
new file mode 100644
index 000000000..85730c742
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.58.1.bb
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
+SRC_URI[archive.md5sum] = "49ae54cccbf212e2f80fa1726d5f974c"
+SRC_URI[archive.sha256sum] = "b4df16ea87dc78c0df5412f9134efb14f7c510773aee117d5ad4cda75646c6f5"
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


