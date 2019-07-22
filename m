Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 848287E97A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 21:18:23 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id 4so12711381pld.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 14:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AIaLrf4mSDBJwDXQMwoumKcNwb02kzaZOj3JkjAf9tQ=;
	b=JVJyZ4U+uBlkkvQhqll/TX1OxyqxLNtopWgEKe7NgkQf5jQkYHvvZvKtpgnG9VsCkB
	URIGF3gDf6hL/lQZ+u12vihE1AeIqaYdV4JwNqrRofcTJ215ICyAzEPw0MvKw1Fk51Y6
	lme6iqZhWI/YZhXeLJZz8+JmaX8opWRGmD4bByvApy0LPLoxJAzIP5mhcLV1BXPOC6Gj
	gEutDHu8uSDbhV+vKgZOaIrc6G/aiyNROYGdpRlZUSQPG437ev2wY7us5NTWCnWJ02sl
	oJlPtTaQOER5+QgQIPIw+YbqrVQm5aT2nOZ8Fa+cfOlmcqMfMkOQS6Xtd4Xy4y7rkMWD
	B9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AIaLrf4mSDBJwDXQMwoumKcNwb02kzaZOj3JkjAf9tQ=;
	b=RhJIbogcZ5DNjfXct7l/OT2JE2X6ZKBCxlbDYxxCOHkNaEMmymg4rqm4A5nYy3qtQV
	NwOT41ayz0/F1cU6DgbRooBpoSWts0NVZD2sIUNSippEm2ObKS8BUlPPIeEaK3QUcECZ
	rheee4Wr2u3ZRW/znM670+d5JnMuTdjLNyEdak3V1xiEYPvMxOPR7CmewMam3XkdlBV8
	2jNohqRybaGblABr+YBk8bpR8xeSl4ebUB21OgCJ+jmekD9WBzEnLUj95sJmkKH8BHK4
	aDY+3mUEUZ69y7uMBF7VPEC37nfBwM3VIETsrDkGr6OyiJF3BFH/0FQ8Xnm24dPSV7cW
	4jmA==
X-Gm-Message-State: APjAAAWdF7TzF8lA5jTJSi/1JgwEBb3fM/lqOmVaYhbTkdh0UEUfXgJw
	arfYiRiic+7BhO9K2XEYvObCDV+YrCM=
X-Google-Smtp-Source: APXvYqywZqEzyITcfKXOoA3pAVXZVrrwez5nb/yC7txEPoxTqupbqGeh34RcM90Q1Vxo4LFnUZQsgg==
X-Received: by 2002:a17:902:9346:: with SMTP id
	g6mr76903305plp.61.1563830304027; 
	Mon, 22 Jul 2019 14:18:24 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	a3sm36347816pfl.145.2019.07.22.14.18.23
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 22 Jul 2019 14:18:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Jul 2019 14:18:13 -0700
Message-Id: <20190722211814.14237-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Cc: sangelovic <angelovic.s@gmail.com>
Subject: [meta-oe][PATCH] Introduce recipes for sdbus-c++ library and its tools
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
X-List-Received-Date: Mon, 22 Jul 2019 21:18:23 -0000
Content-Transfer-Encoding: 8bit

From: sangelovic <angelovic.s@gmail.com>

---
 .../sdbus-c++/sdbus-c++-0.7.2/run-ptest       | 15 ++++++
 .../sdbus-c++/sdbus-c++-tools-native_0.7.2.bb | 14 ++++++
 .../recipes-core/sdbus-c++/sdbus-c++_0.7.2.bb | 49 +++++++++++++++++++
 3 files changed, 78 insertions(+)
 create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.7.2/run-ptest
 create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools-native_0.7.2.bb
 create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.7.2.bb

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.7.2/run-ptest b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.7.2/run-ptest
new file mode 100644
index 0000000000..8fa9453e39
--- /dev/null
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.7.2/run-ptest
@@ -0,0 +1,15 @@
+#!/bin/sh
+set -e
+set -o pipefail
+
+logger "** Starting sdbus-c++-unit-tests"
+/opt/test/bin/sdbus-c++-unit-tests --gtest_output=xml:/data/ptest/sdbus-c++/sdbus-c++-unit-tests.xml |& \
+sed -r 's/^\[\s+OK\s+\] (.*) \([0-9]+\sms\)$/OK: \1 /' | \
+sed -r 's/^\[\s+FAILED\s+\] (.*) \([0-9]+\sms\)$/FAILED: \1 /' | \
+awk '{if ($1 == "OK:" || $1 == "FAILED:") {print $0}}'
+
+logger "** Starting sdbus-c++-integration-tests"
+/opt/test/bin/sdbus-c++-integration-tests --gtest_output=xml:/data/ptest/sdbus-c++/sdbus-c++-integration-tests.xml |& \
+sed -r 's/^\[\s+OK\s+\] (.*) \([0-9]+\sms\)$/OK: \1 /' | \
+sed -r 's/^\[\s+FAILED\s+\] (.*) \([0-9]+\sms\)$/FAILED: \1 /' | \
+awk '{if ($1 == "OK:" || $1 == "FAILED:") {print $0}}' 
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools-native_0.7.2.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools-native_0.7.2.bb
new file mode 100644
index 0000000000..e319404f49
--- /dev/null
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools-native_0.7.2.bb
@@ -0,0 +1,14 @@
+SUMMARY = "sdbus-c++ native tools"
+DESCRIPTION = "Native interface code generator for development with sdbus-c++"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git-tools/COPYING;md5=1803fa9c2c3ce8cb06b4861d75310742"
+
+inherit cmake native
+
+DEPENDS += "expat"
+
+SRCREV = "750dab39270f338181db8d841cd4b1a9a50ae4d7"
+SRC_URI = "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;destsuffix=git-tools;branch=master;subpath=tools"
+
+S = "${WORKDIR}/git-tools"
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.7.2.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.7.2.bb
new file mode 100644
index 0000000000..457f5d676a
--- /dev/null
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.7.2.bb
@@ -0,0 +1,49 @@
+SUMMARY = "sdbus-c++"
+DESCRIPTION = "High-level C++ D-Bus library designed to provide easy-to-use yet powerful API in modern C++"
+
+SECTION = "libs"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1803fa9c2c3ce8cb06b4861d75310742"
+
+inherit cmake pkgconfig systemd ptest python3native
+
+TEST_BIN_DIR = "/opt/test/bin"
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'with-external-libsystemd', 'with-builtin-libsystemd', d)} \
+                   ${@bb.utils.contains('PTEST_ENABLED', '1', 'with-tests', '', d)}"
+PACKAGECONFIG[with-builtin-libsystemd] = "-DBUILD_LIBSYSTEMD=ON,-DBUILD_LIBSYSTEMD=OFF,meson-native ninja-native git-native gperf-native gettext-native util-linux libcap,libcap"
+PACKAGECONFIG[with-external-libsystemd] = "-DBUILD_LIBSYSTEMD=OFF,-DBUILD_LIBSYSTEMD=ON,systemd,libsystemd"
+PACKAGECONFIG[with-tests] = "-DBUILD_TESTS=ON -DTESTS_INSTALL_PATH=${TEST_BIN_DIR},-DBUILD_TESTS=OFF"
+
+DEPENDS += "expat"
+
+SRCREV = "750dab39270f338181db8d841cd4b1a9a50ae4d7"
+SRC_URI = "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;destsuffix=sdbus-cpp-${PV};branch=master"
+SRC_URI += "file://run-ptest"
+
+# Allow CMake to use git on the host machine
+OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "BOTH"
+# Ninja is the default CMake generator in Yocto now, so let's set Unix Makefiles explicitly
+OECMAKE_GENERATOR = "Unix Makefiles"
+
+EXTRA_OECMAKE = "-DBUILD_CODE_GEN=ON \
+                 -DBUILD_DOC=ON \
+                 -DBUILD_DOXYGEN_DOC=OFF"
+
+S = "${WORKDIR}/sdbus-cpp-${PV}"
+
+PACKAGES += "${PN}-test"
+ALLOW_EMPTY_${PN}-test = "1"
+RDEPENDS_${PN}-test = "${PN}"
+RDEPENDS_${PN}-ptest = "${PN}-test"
+
+# Don't take org.sdbuscpp.integrationtests.conf file into the base package
+FILES_${PN} = "${libdir}/"
+
+FILES_${PN}-test += "${sysconfdir}/dbus-1/system.d/"
+FILES_${PN}-test += "${TEST_BIN_DIR}/"
+
+FILES_${PN}-dev += "${bindir}/sdbus-c++-xml2cpp"
+FILES_${PN}-dev += "${libdir}/cmake/sdbus-c++/sdbus-c++-config.cmake"
+FILES_${PN}-dev += "${libdir}/cmake/sdbus-c++/sdbus-c++-config-version.cmake"
-- 
2.22.0


