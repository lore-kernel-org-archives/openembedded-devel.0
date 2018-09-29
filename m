Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id B2FB678E65
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 18:43:43 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id d4-v6so6470010pfn.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 11:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XR1JgwNwF7sGuOCZgSiJPTvfB/yFILFv8li2cGdU8ZI=;
	b=nI6XPAw2wKooSo9F+PykcGBWThGKBAPY1C1+MLRbNLvXAGjYjuPa3Kv8sW4gBNlKTk
	nyBC4WBFasHBysRGz3++OMtwL6eaz97bwyWVcCXAqc/AsvF0obmR4Y8pdpn7yWZlFY8f
	BxMf3XhaB+DfI1vkjYi0xpLm61riZJreqcOWEoMO7SLJe4jaKD5IZg6EG2RBXn4ak3JS
	6lwOKw/UTxnv6HtJMsg5oYUb5EMCrN0SkPk22b9njfDFlRSBQZcdyll3jnosOmulQ3dr
	se9Nwlh7HzVlt0hlvfaNZCb4CFPCAAJk9ZnD86Vb66Eq8XmIeUWl0gPMIYbJUk0Jlg0d
	7DbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XR1JgwNwF7sGuOCZgSiJPTvfB/yFILFv8li2cGdU8ZI=;
	b=tvKPA8YnXIKQTYLpJnEUjlYfO67CQEMqQLlD2Je3ZjSVpFVSGxiaBPicZU/lmI4PJa
	T0k88KX1Sx52/T8GlZs+XsPxLBCjlU8kfPi4M0NnwepyIanj66fhu3D+MA6cQdM7SbNI
	fR1r5ZuPQYcSPM7d38hgsVVWNH8CVUACCX5AN1C+3tII9lrmdL64IZumB6da6pmYSj5H
	9pbgJwlHMDfJWx8pPaycj0RWVP03dERJQ6KQqh87r0S8VyteA6xm8d+gHQd7y+BYdPkk
	Ccfz+oLlE237izSnkoebc3DIGdlzyzxz9A/dEaFHPYi8ejd8BHhH1CQHjha1xhJEll2q
	BWUw==
X-Gm-Message-State: ABuFfoijZMpwKE2r6szntVb/zYNTtqHor14SIpWywkNZWzV7tKWE/oY/
	JQh27Mumnqw8qltJQf8ebCD6v9tC
X-Google-Smtp-Source: ACcGV63eV3R2aEMjqLGJMhUBf3bQiSCmnOaSIycOWZhksEKGb3gfMUXB9Lzvip8lPlidc4/jN6zTmA==
X-Received: by 2002:a63:5b14:: with SMTP id
	p20-v6mr3857665pgb.56.1538246624163; 
	Sat, 29 Sep 2018 11:43:44 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::fd07])
	by smtp.gmail.com with ESMTPSA id
	g6-v6sm12276815pgg.7.2018.09.29.11.43.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Sep 2018 11:43:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 29 Sep 2018 11:43:34 -0700
Message-Id: <20180929184335.39059-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] botan: Add recipe
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
X-List-Received-Date: Sat, 29 Sep 2018 18:43:43 -0000
Content-Transfer-Encoding: 8bit

botan is a common crypto library used by various infrastructures e.g.
qtcreator chromium etc. Its beneficial to build it once for the system
and let apps use it if possible

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-crypto/botan/botan_2.7.0.bb | 55 +++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 meta-oe/recipes-crypto/botan/botan_2.7.0.bb

diff --git a/meta-oe/recipes-crypto/botan/botan_2.7.0.bb b/meta-oe/recipes-crypto/botan/botan_2.7.0.bb
new file mode 100644
index 0000000000..92853d00e8
--- /dev/null
+++ b/meta-oe/recipes-crypto/botan/botan_2.7.0.bb
@@ -0,0 +1,55 @@
+# Copyright (C) 2018 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "Crypto and TLS for C++11"
+HOMEPAGE = "https://botan.randombit.net"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://license.txt;md5=bf361fc63df3fa25652ee82c43b7601a"
+SECTION = "libs"
+
+
+#v2.7.0
+SRCREV = "5874000d42c338ec95a7ff24cdc0c64e70f967b5"
+SRC_URI = "git://github.com/randombit/botan.git"
+
+S = "${WORKDIR}/git"
+
+inherit python3native siteinfo lib_package
+
+CPU ?= "${TARGET_ARCH}"
+CPU_x86 = "x86_32"
+CPU_armv7a = "armv7"
+CPU_armv7ve = "armv7"
+
+do_configure() {
+	python3 ${S}/configure.py \
+	--prefix="${D}${prefix}" \
+	--cpu="${CPU}" \
+	--cc-bin="${CXX}" \
+	--cxxflags="${CXXFLAGS}" \
+	--ldflags="${LDFLAGS}" \
+	--with-endian=${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', 'little', 'big', d)} \
+	${@bb.utils.contains("TUNE_FEATURES","neon","","--disable-neon",d)} \
+	--with-sysroot-dir=${STAGING_DIR_TARGET} \
+	--with-build-dir="${B}" \
+	--optimize-for-size \
+	--with-stack-protector \
+	--enable-shared-library \
+	--with-python-versions=3 \
+	${EXTRA_OECONF}
+}
+
+do_compile() {
+	oe_runmake
+}
+do_install() {
+	oe_runmake install
+	sed -i -e "s|${D}||g" ${D}${libdir}/pkgconfig/botan-2.pc
+}
+
+PACKAGES += "${PN}-python3"
+
+FILES_${PN}-python3 = "${libdir}/python3"
+
+RDEPENDS_${PN}-python3 += "python3"
+
-- 
2.19.0


