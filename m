Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1035D6157A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 06:23:44 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id z7so10423392pgk.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 22:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=pkNumoTb+7f6CO/vdT2Q7vGG1MakgVVacQzu7lbzMcA=;
	b=UJ4hVqZTTFpU+yZ8V0+vt6fbpHVABaqgd1GjxgmWTqKSECm9e55rSMQ58tFoES4r5V
	q76O0iTz3UmDOtV6oH5fKurvtyg/Q9HFvo3NV874/GAmoszcwOGaH8WHIFHWJs0lDOgF
	btl0Rv3FQ1tPg0cUlByfIpuPBFAMWUwsTmhD54NnpDrBHTzehRn/BzXq4ZpFmt6CAyGo
	T70dgJhAPGjSVj6dYnydXl7Jayv/d/CAGGIX7B/fi9IgHQ0M2b9yo1WP2uV9/WE2wp1v
	I3NU7DbGzSC5m1yAKAnqzd0T35w1yrtmFJVgLBm/t6XteMSscynredhUQHbiUf/8nnU/
	rrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=pkNumoTb+7f6CO/vdT2Q7vGG1MakgVVacQzu7lbzMcA=;
	b=IccDBG3y8oE3w4QdppRQC54hrCmTNlduOVDGPDZIeZROD94G8Rf0eGDlGhVmIxXSE2
	XOfXS2q/gi5suSZJFsgONN5FguKizQbRQIhyAZdY/4nEc3kqq/9h2wUJ4XHq7+9Kzwi7
	s8KGJ4hr6YxgMQ6oIm5kIGEme2agZsrtGvXAEO1djdEwlZ9Cuc1BtSW+ErRFM4NMgY/x
	qHvVTRynJLfwdOA6H3RwqF6iYzg+bOZnvJPRJdLzo7jGDxUgYb0dSLG+1yDwHU8uLzZM
	CdrEhIVyvz3QnODsg4YhDW+AZtorpaZ192HkOY2wTDMex1BM6eE27Z50vKP8+Diw4kp2
	PPCw==
X-Gm-Message-State: APjAAAXBJsocI6i9IL2HvAeroqJLZ7bmTc+zLnnKQGiaB8tIjJGgGK0r
	IiZ/EubGVk2II59fLSpWCt5rj3j7Y4U=
X-Google-Smtp-Source: APXvYqxKN7A5+DijMSMSTXhU8ksuVgWjqNz+O8DF4inFUskM2v74PznDlIo1etvh7rydKB4dvs88fQ==
X-Received: by 2002:a63:31d4:: with SMTP id
	x203mr20410757pgx.229.1582007025657; 
	Mon, 17 Feb 2020 22:23:45 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::98a3])
	by smtp.gmail.com with ESMTPSA id h26sm2573363pfr.9.2020.02.17.22.23.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 22:23:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Feb 2020 22:23:43 -0800
Message-Id: <20200218062348.3742529-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200218062348.3742529-1-raj.khem@gmail.com>
References: <20200218062348.3742529-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 3/8] gupnp: Upgrade to 1.2.2
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
X-List-Received-Date: Tue, 18 Feb 2020 06:23:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Switch to using meson
Depend on py3 since its now supported
Relax packaging to include version number in gupnp-binding-tool

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-connectivity/gupnp/gupnp.inc           | 14 ++++----------
 .../recipes-connectivity/gupnp/gupnp_1.0.2.bb      |  8 --------
 .../recipes-connectivity/gupnp/gupnp_1.2.2.bb      |  8 ++++++++
 3 files changed, 12 insertions(+), 18 deletions(-)
 delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp_1.0.2.bb
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.2.bb

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc b/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc
index 6ce9631616..2920581c51 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc
@@ -4,22 +4,16 @@ LICENSE = "LGPLv2+"
 
 DEPENDS = "e2fsprogs gssdp libsoup-2.4 libxml2"
 
-inherit autotools pkgconfig vala gobject-introspection
-
-# Copy vapigen.m4 so that it doesn't get removed by vala class
-# (normally this would be the right thing to do, but in gupnp the vapigen.m4 has only a custom macro)
-do_configure_prepend() {
-        cp -f ${S}/m4/vapigen.m4 ${S}/m4/vapigen-custom.m4 || true
-}
+inherit meson pkgconfig vala gobject-introspection
 
 FILES_${PN} = "${libdir}/*.so.*"
-FILES_${PN}-dev += "${bindir}/gupnp-binding-tool"
+FILES_${PN}-dev += "${bindir}/gupnp-binding-tool*"
 
-RDEPENDS_${PN}-dev = "python-textutils python-xml"
+RDEPENDS_${PN}-dev = "python3 python3-xml"
 
 SYSROOT_PREPROCESS_FUNCS += "gupnp_sysroot_preprocess"
 
 gupnp_sysroot_preprocess () {
     install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
-    install -m 755 ${D}${bindir}/gupnp-binding-tool ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+    install -m 755 ${D}${bindir}/gupnp-binding-tool* ${SYSROOT_DESTDIR}${bindir_crossscripts}/
 }
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.0.2.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.0.2.bb
deleted file mode 100644
index 1bdf7d79bc..0000000000
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.0.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require gupnp.inc
-
-SRC_URI = "${GNOME_MIRROR}/${BPN}/1.0/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "afd96fe73856b38aaf1baf7526e08edd"
-SRC_URI[sha256sum] = "5173fda779111c6b01cd4a5e41b594322be9d04f8c74d3361f0a0c2069c77610"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
-                    file://libgupnp/gupnp.h;beginline=1;endline=20;md5=d78a69d9b6e63ee2dc72e7b674d97520"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.2.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.2.bb
new file mode 100644
index 0000000000..e603497161
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.2.bb
@@ -0,0 +1,8 @@
+require gupnp.inc
+
+SRC_URI = "${GNOME_MIRROR}/${BPN}/1.2/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "2ade3d29c624ad98d70113e6e93908a5"
+SRC_URI[sha256sum] = "9a80bd953e5c8772ad26b72f8da01cbe7241a113edd6084903f413ce751c9989"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
+                    file://libgupnp/gupnp.h;beginline=1;endline=20;md5=d78a69d9b6e63ee2dc72e7b674d97520"
-- 
2.25.1


