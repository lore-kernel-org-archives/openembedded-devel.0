Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tm398-0002K5-LZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2012 15:00:18 +0100
Received: from mail-ee0-f70.google.com ([74.125.83.70])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 21 Dec 2012 05:45:31 -0800
Received: by mail-ee0-f70.google.com with SMTP id b47so3996235eek.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Dec 2012 05:45:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=6vcpQnMXD+bD9znYXl3pHOg5nEEi9hNdkS58c4bDLiE=;
	b=iqpnm/nnbiaH5OT4RNAFMlrc/Z8gf09mCoh/ktAOGIMA2527j9Xfn9JmmAlWxj9uZG
	phtxL6PXvFBeVplE8oPC9GEFqio9y7v0f5naYUsAgaVUkwL9ogf5CR5nrTc6qf2yMvLy
	OsorQIwFwO5GNV78Am8LpxKJ+mk+ymglYW610KJZm8r2Dy9HQEHmbfnbbsLwV8rdZmR8
	cMVFS1tBR1OQFYuPOjPG2TCKzMgtlh4/rSY3p2HyOsHCR5fgj8MOc44b8ZplloSxjPVD
	8hAh+z372TampoQEKJfPosPYWnIyXtTutZlfmrKsBlGOPmFFF2nEwcI9HHPg6XfyPSbq
	q5fw==
X-Received: by 10.180.85.103 with SMTP id g7mr15935373wiz.29.1356097528714;
	Fri, 21 Dec 2012 05:45:28 -0800 (PST)
X-Received: by 10.180.85.103 with SMTP id g7mr15935366wiz.29.1356097528631;
	Fri, 21 Dec 2012 05:45:28 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id df2sm20701213wib.0.2012.12.21.05.45.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Dec 2012 05:45:27 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Dec 2012 13:43:38 +0000
Message-Id: <1356097422-11920-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1356097422-11920-1-git-send-email-ross.burton@intel.com>
References: <1356097422-11920-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnREtIDAAOCqt7rFeHhpLdsCvWw1w9YNdcrJX9tc4CRcAm3MCxxIHFVL81jCEzwH3XHrI2eIZmU7lvoOp7X1v4ABDq97MFAGGd8QTbjf7pEs1OBq/x7megLeB1SDWRLCuaA9e5DP4bPTjQMwlpXLF+r5PRVJacpqPRZMCJQWp9ebod/erIUyCAcv0bRNZfih3+ExDHs
Subject: [meta-multimedia PATCH V2 2/6] gupnp: add 0.18.4 and 0.19.3
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
X-List-Received-Date: Fri, 21 Dec 2012 14:00:19 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-connectivity/gupnp/gupnp.inc           |   21 ++++++++++++++++++++
 .../recipes-connectivity/gupnp/gupnp_0.18.4.bb     |    8 ++++++++
 .../recipes-connectivity/gupnp/gupnp_0.19.3.bb     |   10 ++++++++++
 3 files changed, 39 insertions(+)
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp.inc
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp_0.18.4.bb
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp_0.19.3.bb

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc b/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc
new file mode 100644
index 0000000..81db3ea
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc
@@ -0,0 +1,21 @@
+SUMMARY = "UPnP framework"
+DESCRIPTION = "GUPnP is an elegant, object-oriented open source framework for creating UPnP  devices and control points, written in C using GObject and libsoup. The GUPnP API is intended to be easy to use, efficient and flexible. It provides the same set of features as libupnp, but shields the developer from most of UPnP's internals."
+LICENSE = "LGPLv2+"
+
+DEPENDS = "e2fsprogs gssdp libsoup-2.4 libxml2 gnome-icon-theme gobject-introspection-stub"
+
+require no-vala.inc
+
+EXTRA_OECONF = "--disable-introspection"
+
+inherit autotools pkgconfig
+
+FILES_${PN} = "${libdir}/*.so.*"
+FILES_${PN}-dev += "${bindir}/gupnp-binding-tool"
+
+SYSROOT_PREPROCESS_FUNCS += "gupnp_sysroot_preprocess"
+
+gupnp_sysroot_preprocess () {
+	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+	install -m 755 ${D}${bindir}/gupnp-binding-tool ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+}
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.18.4.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.18.4.bb
new file mode 100644
index 0000000..4fb1d05
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.18.4.bb
@@ -0,0 +1,8 @@
+require gupnp.inc
+
+SRC_URI = "http://download.gnome.org/sources/${BPN}/0.18/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "0e15fa26be7b1a0255e6dec07c285527"
+SRC_URI[sha256sum] = "6b437d5711b212292c6080626b97480268310da636a6cf937ad6119291af78a1"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
+                    file://libgupnp/gupnp.h;beginline=1;endline=20;md5=28c49b17d623afc3335efc2e511879e1"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.19.3.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.19.3.bb
new file mode 100644
index 0000000..bab74b8
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.19.3.bb
@@ -0,0 +1,10 @@
+require gupnp.inc
+
+SRC_URI = "http://download.gnome.org/sources/${BPN}/0.19/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "8165c3ad3d16576a0a99250b75df23f8"
+SRC_URI[sha256sum] = "0d3097c419e1f8af0ff8ee91318d75e8896b3b92924cb1a5cf93010795a7118b"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
+                    file://libgupnp/gupnp.h;beginline=1;endline=20;md5=d78a69d9b6e63ee2dc72e7b674d97520"
+
+DEFAULT_PREFERENCE = "-1"
-- 
1.7.10



