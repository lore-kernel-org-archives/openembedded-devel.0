Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7939A726C5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Dec 2014 13:54:41 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id ex7so24105482wid.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Dec 2014 05:54:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=cKYExu3JhTHNSIRjC4BMMVIG1NQshKVdFLyttb0QT0g=;
	b=fmN13nR47Oo2m0UT3PWkYm1n2hdshBM3/089q3QjfH18t2qcqQus6SnHEtRIsvU/Le
	bz1BqcI5NksdLAm8EsiPCE6v2ko+vLmwiHWL8asFvJnPYR3osTEUCCV6tZMlhizz5Sy4
	1iADfw8i7XsjbV14zc19p+ErWVSVdqhPoEETyJB5Kd6S8UZZqeH8u+FunR6GD5bLGwSq
	DxLUNWhTqP60qzU+WWhv0wJxMQWSY1E5czYhrQ9S3AlD7C9mOgfG92hjD6bK7xZxl4We
	nttnaIVz+KoPaisLJrLki3Nm8zwrw+6OrNv/8cbwlk7lQNIezikGwMyos9as4a2Cy6eQ
	WtVQ==
X-Gm-Message-State: ALoCoQlVFRpSoeCw2AgUi1dY2a/gaTp5BnowWsae+3j8NDB+TSxz8yS63pG20bjIYs8kUwwo/1Nf
X-Received: by 10.194.243.1 with SMTP id wu1mr35320751wjc.69.1419947680489;
	Tue, 30 Dec 2014 05:54:40 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	gb10sm28759925wjb.21.2014.12.30.05.54.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Dec 2014 05:54:39 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Dec 2014 13:53:31 +0000
Message-Id: <1419947615-27947-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/5] libtelepathy: add (moving from oe-core)
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
X-List-Received-Date: Tue, 30 Dec 2014 13:54:48 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../telepathy/libtelepathy/doublefix.patch         |   18 +++++++++++++++
 .../telepathy/libtelepathy/prefer_python_2.5.patch |   15 +++++++++++++
 .../telepathy/libtelepathy_0.3.3.bb                |   23 ++++++++++++++++++++
 3 files changed, 56 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/telepathy/libtelepathy/doublefix.patch
 create mode 100644 meta-oe/recipes-connectivity/telepathy/libtelepathy/prefer_python_2.5.patch
 create mode 100644 meta-oe/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb

diff --git a/meta-oe/recipes-connectivity/telepathy/libtelepathy/doublefix.patch b/meta-oe/recipes-connectivity/telepathy/libtelepathy/doublefix.patch
new file mode 100644
index 0000000..a7737fb
--- /dev/null
+++ b/meta-oe/recipes-connectivity/telepathy/libtelepathy/doublefix.patch
@@ -0,0 +1,18 @@
+Fix double reference to this file to work with recent autoconf+automake
+
+RP 1/2/10
+
+Upstream-Status: Inappropriate [configuration]
+
+Index: libtelepathy-0.3.3/src/Makefile.am
+===================================================================
+--- libtelepathy-0.3.3.orig/src/Makefile.am	2010-02-01 13:13:50.869038984 +0000
++++ libtelepathy-0.3.3/src/Makefile.am	2010-02-01 13:14:23.267789456 +0000
+@@ -27,7 +27,6 @@
+     tp-chan-type-text-gen.h \
+     tp-chan-type-tubes-gen.h \
+     tp-conn-iface-aliasing-gen.h \
+-    tp-conn-iface-avatars-gen.h \
+     tp-conn-iface-capabilities-gen.h \
+     tp-conn-iface-contact-info-gen.h \
+     tp-conn-iface-forwarding-gen.h \
diff --git a/meta-oe/recipes-connectivity/telepathy/libtelepathy/prefer_python_2.5.patch b/meta-oe/recipes-connectivity/telepathy/libtelepathy/prefer_python_2.5.patch
new file mode 100644
index 0000000..37679ab
--- /dev/null
+++ b/meta-oe/recipes-connectivity/telepathy/libtelepathy/prefer_python_2.5.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Inappropriate [configuration]
+
+Index: libtelepathy-0.3.1/configure.ac
+===================================================================
+--- libtelepathy-0.3.1.orig/configure.ac	2007-11-22 19:05:56.000000000 +0000
++++ libtelepathy-0.3.1/configure.ac	2008-01-04 12:07:28.000000000 +0000
+@@ -51,7 +51,7 @@
+   AC_MSG_ERROR([xsltproc (from the libxslt source package) is required])
+ fi
+ 
+-AC_CHECK_PROGS([PYTHON], [python2.3 python2.4 python2.5 python])
++AC_CHECK_PROGS([PYTHON], [python2.5 python2.4 python2.3 python])
+ if test -z "$PYTHON"; then
+   AC_MSG_ERROR([Python is required to compile this package])
+ fi
diff --git a/meta-oe/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb b/meta-oe/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
new file mode 100644
index 0000000..f13e709
--- /dev/null
+++ b/meta-oe/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Telepathy framework"
+DESCRIPTION = "Telepathy is a D-Bus framework for unifying real time \
+communication, including instant messaging, voice calls and video calls.  It \
+abstracts differences between protocols to provide a unified interface for \
+applications."
+HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
+DEPENDS = "glib-2.0 dbus dbus-glib telepathy-glib libxslt-native"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
+                    file://src/tp-conn.c;beginline=1;endline=19;md5=4c58069f77d601cc59200bce5396c7cb"
+PR = "r5"
+
+SRC_URI = "http://telepathy.freedesktop.org/releases/libtelepathy/libtelepathy-${PV}.tar.gz \
+           file://prefer_python_2.5.patch \
+           file://doublefix.patch"
+
+SRC_URI[md5sum] = "490ca1a0c614d4466394b72d43bf7370"
+SRC_URI[sha256sum] = "e0d230be855125163579743418203c6f6be2f10f98c4f065735c1dc9ed115878"
+
+inherit autotools pkgconfig pythonnative
+
+FILES_${PN} += "${datadir}/telepathy \
+		${datadir}/dbus-1"
-- 
1.7.10.4


