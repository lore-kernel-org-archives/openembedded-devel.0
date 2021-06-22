Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web09.110.1624402948047849137
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Jun 2021 16:02:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mM3zIizP;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id g4so356706pjk.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jun 2021 16:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SXcVvUw918a980uk6DNUBwFeLVsubZPGJbeWX0V63LY=;
        b=mM3zIizPSOqbJ0u6rn7maC3bo2osnQHGeklFI2LudIzF0jxtkNw5+PoM+uodMPK1jx
         HrhrF2hThcQPaAq7YrWZUzaXaEYQhJ/02h3dmlzLgXbE4G+pIW6VV1N4uaU5qXrTQmjy
         4jS9HVR79ps+MNzCkZizvHhZFSU+x5TU6RUVpMgCuhPJUeW4QY07WR8aPHeEaWv6koD2
         nIQHk+zotbAO9p2hXxKUnkvo8leR57i4DkXCHkERT0qDaUw9XozV32HoH2sMSmFkt9x1
         umvvRTA4lFVMPdSpbSbmcEt21Stets5LMavvssD86YztUJBc/dKalmakr/tLEt0gMaJr
         2CEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SXcVvUw918a980uk6DNUBwFeLVsubZPGJbeWX0V63LY=;
        b=kYwaWl6/chLWMo4wTYYeZB+cnRemKZ31pVZW9bzPjDlx5Haqr55YpaXe0ZFwpNaa5B
         kzwnfaLTvpymBi95M/qvR4oFLgNT1CgA/Sc/mHNRsH6/fcMEbKSnLNHHl38U2R4Pdsyl
         u3fwc4xqM7lkAs7ol07N7L0YU4/T6LNZVBGvlnjmaowblbczKTtjOtcKozQsQyp6wRvx
         1rydvqWaqjIhuI3giRnJoDUss1xxd5y6n3GMnmiqNiCJcPfhgjJNBD5wzZjwfwASDhAH
         wDmQxTZk8mldh/VnHw92L/CYNmtsU0aGiWkBduOnPNM/fYMW2EkUjDPkhUiJMkMk1/eT
         AJWQ==
X-Gm-Message-State: AOAM532S2+2GlMwOhotEL+3ECdejbgpNkx/L5w017Gz8h0npw81OleRs
	XOVSd87o0VmlztAhMNofzr6Lk4z0VRlHVw==
X-Google-Smtp-Source: ABdhPJxkNkRymxYpZ328YSZOQvrDKkq8hi4MnmAFau4mj2gaEfNtIpftaK2/ioKKTAMX96+tYiEoJw==
X-Received: by 2002:a17:90a:4a83:: with SMTP id f3mr2217679pjh.133.1624402947234;
        Tue, 22 Jun 2021 16:02:27 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bfd0])
        by smtp.gmail.com with ESMTPSA id r134sm332240pfc.68.2021.06.22.16.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 16:02:26 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/2] meta-python: Add python3-fastjsonschema and its dependencies
Date: Tue, 22 Jun 2021 16:02:21 -0700
Message-Id: <20210622230222.1754031-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

python3-fastjsonschema claims to be fastest Python implementation of JSON schema
it however needs additional packages which are also added here, since
they are all dependent, its added in single commit so backporting is
simpler

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-aspectlib_1.5.2.bb         | 15 ++++++++
 .../python/python3-execnet_1.9.0.bb           | 19 ++++++++++
 .../python/python3-fastjsonschema/run-ptest   |  3 ++
 .../python/python3-fastjsonschema_2.15.1.bb   | 38 +++++++++++++++++++
 .../python/python3-fields_5.0.0.bb            | 15 ++++++++
 .../python/python3-py-cpuinfo_8.0.0.bb        | 20 ++++++++++
 .../python/python3-pytest-benchmark_3.4.1.bb  | 15 ++++++++
 .../python/python3-pytest-cache_1.0.bb        | 15 ++++++++
 8 files changed, 140 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aspectlib_1.5.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-execnet_1.9.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-fastjsonschema/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-fastjsonschema_2.15.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-fields_5.0.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-py-cpuinfo_8.0.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-benchmark_3.4.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-cache_1.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-aspectlib_1.5.2.bb b/meta-python/recipes-devtools/python/python3-aspectlib_1.5.2.bb
new file mode 100644
index 0000000000..415a430672
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aspectlib_1.5.2.bb
@@ -0,0 +1,15 @@
+# Copyright (C) 2021 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "``aspectlib`` is an aspect-oriented programming, monkey-patch and decorators library. It is useful when changing"
+HOMEPAGE = "https://github.com/ionelmc/python-aspectlib"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d58b3f20fd10347a9458b8a03793b62e"
+
+SRC_URI[sha256sum] = "d275ec82c4c2712e564bb760e4accff8f061f648e38774feabeb8b241cf3a4aa"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "python3-core python3-fields"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-execnet_1.9.0.bb b/meta-python/recipes-devtools/python/python3-execnet_1.9.0.bb
new file mode 100644
index 0000000000..ec16e8884e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-execnet_1.9.0.bb
@@ -0,0 +1,19 @@
+# Copyright (C) 2021 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "execnet: rapid multi-Python deployment"
+HOMEPAGE = "https://execnet.readthedocs.io/en/latest/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=772fcdaca14b378878d05c7d857e6c3e"
+
+SRC_URI[sha256sum] = "8f694f3ba9cc92cab508b152dcfe322153975c29bda272e2fd7f3f00f36e47c5"
+
+DEPENDS += "python3-pip-native"
+
+inherit pypi setuptools3
+
+PACKAGECONFIG[testing] = ",,,python3-pre-commit"
+
+RDEPENDS_${PN} += "python3-core python3-crypt python3-ctypes python3-fcntl python3-io python3-shell python3-threading"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-fastjsonschema/run-ptest b/meta-python/recipes-devtools/python/python3-fastjsonschema/run-ptest
new file mode 100644
index 0000000000..b63c4de0d9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-fastjsonschema/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-fastjsonschema_2.15.1.bb b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.15.1.bb
new file mode 100644
index 0000000000..d901fcb2e0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.15.1.bb
@@ -0,0 +1,38 @@
+# Copyright (C) 2021 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "Fastest Python implementation of JSON schema"
+HOMEPAGE = "https://github.com/seznam/python-fastjsonschema"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=18950e8362b69c0c617b42b8bd8e7532"
+
+SRCREV = "1e214911fe83dbaeea3d50dfb3a539118de8a442"
+PYPI_SRC_URI = "git://github.com/horejsek/python-fastjsonschema;protocol=https;branch=master"
+
+SRC_URI += "file://run-ptest"
+
+inherit ptest pypi setuptools3
+
+S = "${WORKDIR}/git"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+RDEPENDS_${PN}-ptest += "\
+    python3-colorama \
+    python3-jsonschema \
+    python3-pylint \
+    python3-pytest \
+    python3-pytest-benchmark \
+    python3-pytest-cache \
+"
+RDEPENDS_${PN} += "\
+    python3-core \
+    python3-urllib3 \
+    python3-numbers \
+    python3-pickle \
+    "
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-fields_5.0.0.bb b/meta-python/recipes-devtools/python/python3-fields_5.0.0.bb
new file mode 100644
index 0000000000..9c22b920d2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-fields_5.0.0.bb
@@ -0,0 +1,15 @@
+# Copyright (C) 2021 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "Container class boilerplate killer."
+HOMEPAGE = "https://github.com/ionelmc/python-fields"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e32c6705498713d9c904a9f565953a2c"
+
+SRC_URI[sha256sum] = "31d4aa03d8d44e35df13c431de35136997f047a924a597d84f7bc209e1be5727"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "python3-core"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-py-cpuinfo_8.0.0.bb b/meta-python/recipes-devtools/python/python3-py-cpuinfo_8.0.0.bb
new file mode 100644
index 0000000000..1f81a83230
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-py-cpuinfo_8.0.0.bb
@@ -0,0 +1,20 @@
+# Copyright (C) 2021 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "Get CPU info with pure Python 2 & 3"
+HOMEPAGE = "https://github.com/workhorsy/py-cpuinfo"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b0b97c022f12b14d9e02de0b283ee9e9"
+
+SRC_URI[sha256sum] = "5f269be0e08e33fd959de96b34cd4aeeeacac014dd8305f70eb28d06de2345c5"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "python3-core python3-ctypes python3-datetime python3-json python3-mmap python3-multiprocessing python3-netclient python3-pickle python3-pprint python3-shell"
+
+# WARNING: We were unable to map the following python package/module
+# dependencies to the bitbake packages which include them:
+#    _winreg
+#    cStringIO
+#    winreg
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-benchmark_3.4.1.bb b/meta-python/recipes-devtools/python/python3-pytest-benchmark_3.4.1.bb
new file mode 100644
index 0000000000..5fb11ddb7f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-benchmark_3.4.1.bb
@@ -0,0 +1,15 @@
+# Copyright (C) 2021 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "A ``pytest`` fixture for benchmarking code. It will group the tests into rounds that are calibrated to the chosen timer."
+HOMEPAGE = "https://github.com/ionelmc/pytest-benchmark"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9c5c2c74370826468065c5702b8a1fcf"
+
+SRC_URI[sha256sum] = "40e263f912de5a81d891619032983557d62a3d85843f9a9f30b98baea0cd7b47"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "python3-core python3-py-cpuinfo python3-pytest python3-aspectlib"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-cache_1.0.bb b/meta-python/recipes-devtools/python/python3-pytest-cache_1.0.bb
new file mode 100644
index 0000000000..4ce91dd982
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-cache_1.0.bb
@@ -0,0 +1,15 @@
+# Copyright (C) 2021 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "pytest plugin with mechanisms for caching across test runs"
+HOMEPAGE = "http://bitbucket.org/hpk42/pytest-cache/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
+
+SRC_URI[sha256sum] = "be7468edd4d3d83f1e844959fd6e3fd28e77a481440a7118d430130ea31b07a9"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "python3-core python3-execnet python3-pprint python3-py python3-pytest"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.32.0

