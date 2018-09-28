Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 71F477523B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Sep 2018 06:12:02 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id q19-v6so3646975pgn.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Sep 2018 23:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=x59oFnSpZwZUFKHLpll741a/rxqVmZoDZJuUpOwM3VI=;
	b=V3cBn9MJe6NaCq7R6z4QoKb1tkyShflmKl+1hFqQrkZ7ceD3QBG8Ih7LMy9Wi5cwOL
	Bt0N430gD0APJPuFBOtTE38PHr1D/59nCStJilkTNHD1G3SLUz5dAL250gSK+WOqqbzY
	/Xv54Enx2sCH6CNfUEcsX2RreFOALm90BY0fTn7axXLV67baV756DTUNxl53NFz5A8e1
	tlRod1/2ixODyKY51iHyeCgV+38ijgGeCxxxWhgzhYszmUJokMLDZXZ0BAZbD83Kj2Ku
	FUg8brtIUQhsBdoG232IUj5o1trmVj9JvVFpWdxG9j1M9xwPVE3kkRNYHpQONZlfgImR
	iIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=x59oFnSpZwZUFKHLpll741a/rxqVmZoDZJuUpOwM3VI=;
	b=NaXRHdtbakIcrsBF59j5PSym+uikVfgEv+oeRwCoATcgtkVG+QssInxhQ6d7f4P1Sz
	3xxjQ+5Py54LQ8PPU13Xo4QDX4n6mIrSJcaQI1mk5DZHQKlhEEzmSizI4HgbQMlOdSxQ
	PoZGzkyAn0xbMwpSHyiw9drJOXF4UCmkNT/znEhS8o+EjrqQ6sOBP4wKuZHciSiqmN+C
	rV3r4CHCW3Ss/ItGxH+T6aoHHG+8q7RGzB7VDl6zcrLLN2f/i/RMZJY8uQy6G4k5gB7f
	VYmOa60cP2dlbBe6rGlaZEiKwi0m1pZKzlezdEXhjbeYQ8cg9HQc4prJzYO7JNOHE2xB
	+txw==
X-Gm-Message-State: ABuFfog/1EtakqPyY8rrGw6sI6fhyoXV+77m1/e6IrgaiEm/X6OXHEBs
	2VB3CSOTaLlRKQX3FbEqSPGWtdw2
X-Google-Smtp-Source: ACcGV6230LBzFYPSZfngySyBeTUTMdsfwbRsbrZzw7pVLwnYSmBhaC29Zw3o35Y+U35o03vzaWJnVQ==
X-Received: by 2002:a63:6c04:: with SMTP id
	h4-v6mr13572000pgc.290.1538115122786; 
	Thu, 27 Sep 2018 23:12:02 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::b1b1])
	by smtp.gmail.com with ESMTPSA id
	z11-v6sm7361026pfi.4.2018.09.27.23.12.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Sep 2018 23:12:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Sep 2018 23:11:50 -0700
Message-Id: <20180928061151.20175-1-raj.khem@gmail.com>
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
X-List-Received-Date: Fri, 28 Sep 2018 06:12:02 -0000
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
index 0000000000..25bb881997
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
+	${@bb.utils.contains("TUNE_FEATURES","neon","--enable-neon","--disable-neon",d)} \
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


