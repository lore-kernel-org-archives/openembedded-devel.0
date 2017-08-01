Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6E87C78355
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Aug 2017 14:16:08 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id d67so8442513pfc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Aug 2017 07:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=vm2PVjL6ACqwObvRA18jrXfhxU4FavDqLIaAt/emqq0=;
	b=KlRF1sgXksHSVZEFMUr31a8qZ+jz2ghI0YY7lzMb+/o3lRlA0+NIe4B7JRUJVbB7JR
	XbXyYEmEZJMTCThO6j372z6m7T490kzs8/gwjnJZDgAEfIOJB0cgSo4lHn0j784SpBg4
	iz+KLuoX0IIM6BybqZlT5t4gQ4DuDo+aZyqUsZ5OE9NYud5Y6+4pSvXrCQjKT3/LOU16
	LtXJeZFzneZYc5Cunz98sXWGu0c9GJP/F6uRg2MlFd4fPpOGKNcYI8QAhSIoVHH+caAQ
	RBeikNK11LFevKVYnX6rkyo+2THwz+OF6AB0uD2lSj76MovLH2gYGSuscI2HvBY+Y4z8
	OkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vm2PVjL6ACqwObvRA18jrXfhxU4FavDqLIaAt/emqq0=;
	b=iB10YN+30g18GluNOsXca1oDYv21E6qqcJeD8MSKr1qLjUrYoZHCaAzhWg+lokcn9s
	BduUSGsCdhFEFSYpismqvd2hAI8IJCZI4u2P6tmMLrYT/o5OhiROFyhJVi6UUicDwBR4
	oR6VscTEKai/S76cSGEh4wMHE0X4GeIyadtJdsOInuvgHIKgX4O6rMzy2ul/nr5Z0lL8
	G9nAXJPYN9+LvlX0TTU2gaVFUNB6aq4ajguknAqHuj5lcHLAaCZLsHSDfCIsBrTSgCvO
	OZHijYDYi9aIGqqwKhkkgnnKYQcZhhKhqSDBu4X8HEzOBOEqnKdRnszxE3kSzu8SG2JH
	bHFw==
X-Gm-Message-State: AIVw112YVgLtSW6TgkWt2JjySfi5Wpq4lHxoOGkAWnurmi4T5Ib3Ac+P
	iw7RjUJBTHdv6EhM
X-Received: by 10.98.152.155 with SMTP id d27mr19075996pfk.245.1501596969336; 
	Tue, 01 Aug 2017 07:16:09 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f6f])
	by smtp.gmail.com with ESMTPSA id
	l17sm58510561pfk.146.2017.08.01.07.16.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Aug 2017 07:16:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Aug 2017 07:15:57 -0700
Message-Id: <20170801141559.17067-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170801141559.17067-1-raj.khem@gmail.com>
References: <20170801141559.17067-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/4] ninja,re2c: Remove
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
X-List-Received-Date: Tue, 01 Aug 2017 14:16:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Moved to OE-Core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/ninja/ninja_1.7.2.bb     | 30 -----------------------
 meta-oe/recipes-support/re2c/re2c/configure.patch | 18 --------------
 meta-oe/recipes-support/re2c/re2c_0.13.5.bb       | 15 ------------
 3 files changed, 63 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/ninja/ninja_1.7.2.bb
 delete mode 100644 meta-oe/recipes-support/re2c/re2c/configure.patch
 delete mode 100644 meta-oe/recipes-support/re2c/re2c_0.13.5.bb

diff --git a/meta-oe/recipes-devtools/ninja/ninja_1.7.2.bb b/meta-oe/recipes-devtools/ninja/ninja_1.7.2.bb
deleted file mode 100644
index 932e3a6ed..000000000
--- a/meta-oe/recipes-devtools/ninja/ninja_1.7.2.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY = "Ninja is a small build system with a focus on speed."
-HOMEPAGE = "http://martine.github.com/ninja/"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
-
-DEPENDS = "re2c-native ninja-native"
-
-SRCREV = "717b7b4a31db6027207588c0fb89c3ead384747b"
-
-SRC_URI = "git://github.com/martine/ninja.git;branch=release"
-
-S = "${WORKDIR}/git"
-
-do_configure[noexec] = "1"
-
-do_compile_class-native() {
-    ./configure.py --bootstrap
-}
-
-do_compile() {
-    ./configure.py
-    ninja
-}
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 0755 ${S}/ninja ${D}${bindir}/
-}
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-support/re2c/re2c/configure.patch b/meta-oe/recipes-support/re2c/re2c/configure.patch
deleted file mode 100644
index 8ca0969ad..000000000
--- a/meta-oe/recipes-support/re2c/re2c/configure.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Modernise configure to work with modern automake.
-
-RP 2014/7/14
-
-Upstream-Status: Pending
-
-Index: re2c-0.13.5/configure.in
-===================================================================
---- re2c-0.13.5.orig/configure.in	2008-05-25 14:42:34.000000000 +0000
-+++ re2c-0.13.5/configure.in	2014-07-17 14:10:40.595821292 +0000
-@@ -1,6 +1,6 @@
- AC_PREREQ([2.57])
- AC_INIT(re2c, 0.13.5, re2c-general@lists.sourceforge.net)
--AM_INIT_AUTOMAKE(re2c, $PACKAGE_VERSION)
-+AM_INIT_AUTOMAKE([foreign])
- AC_CONFIG_SRCDIR(actions.cc)
- AM_CONFIG_HEADER(config.h)
- 
diff --git a/meta-oe/recipes-support/re2c/re2c_0.13.5.bb b/meta-oe/recipes-support/re2c/re2c_0.13.5.bb
deleted file mode 100644
index dcac940f8..000000000
--- a/meta-oe/recipes-support/re2c/re2c_0.13.5.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Tool for writing very fast and very flexible scanners"
-HOMEPAGE = "http://re2c.sourceforge.net/"
-AUTHOR = "Marcus Börger <helly@users.sourceforge.net>"
-SECTION = "devel"
-LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://README;beginline=180;md5=822830a2204aef353f2c489f62e02089"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
-           file://configure.patch"
-SRC_URI[md5sum] = "4a97d8f77ed6d2c76c8bd840a43f5633"
-SRC_URI[sha256sum] = "f3a995139af475e80a30207d02728b1e0065b0caade7375e974cb1b14861668c"
-
-BBCLASSEXTEND = "native"
-
-inherit autotools
-- 
2.13.3


