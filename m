Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web09.33837.1622393216742619748
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 May 2021 09:46:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rcXKW5z4;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id n12so3304854pgs.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 May 2021 09:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kii1qqNL8WwMg1hfi3eBjFlielcau/04Kx8nB3VVL0U=;
        b=rcXKW5z4yoDWhCVL8U+J+wnk2g6g8SXeSomjJWipsHwKLaPy/cYgt1J+62RLlBuYPi
         2LvMSPdt4BMXVVkjQgxoacupFXbtqqumI5QW6xbXOQPVjSEIIMw6wYrS+0lJ6AZQV+88
         TRCJfLWkutA28S6uuVyBCnxK1bp3EWHIe+v4Sd5h2jjcMnNgxsglpqAyBSRFrssFe1Ei
         R0KSgnkG/Ztuyp8b0cXcQJP/WO4yYz0slz2uzSZhmB5L9cvwAXgTjGc1Io3MI4elzmld
         w5fZ/Xqd1rYb4BnBzZHkyvmSdgleqjB3V7lCDBo4u2KwZ2REG4i/qbfRH6CfuuqraGYA
         v7vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kii1qqNL8WwMg1hfi3eBjFlielcau/04Kx8nB3VVL0U=;
        b=oSOlsv2jgICoosquZjB1WRdG70ELpruHneCUOYA6p8meoPlXKpkDECb+hr4Xyi33AC
         IXQmsTM4CN1s+ML//tGf4BkDc7oGHASFziPUVQIkk6nQ0Q0P0nAfMJhMYt+mgr9JXrjL
         utNSIIU2sXq9Q+7Uav7Ywr3v0kOLEOT9D76hly6W4hPGyGG+z+S1KG8m2nAhcSl5yKCz
         Ba2iYY4nwkmVQbMXwDeUmuz1q7pQrKF8ITgl4o7zZeUmz2UnMOH8DtX2N7fyHDhQwWw/
         ZlpDHeuIbjS3M6NwR1/yTzmKrcEo9UmgN5kNePiSYLHSVBqcoDDUZ8qfHBvsTnxwMixB
         DY7w==
X-Gm-Message-State: AOAM532tT7n8rSas2pFW2/ljGK0zK18HNgIeZc569I8zzKZ3JBNF6uwk
	xIjbSqAe/PQ6W/X0Vox9lz9InHblYqdDWg==
X-Google-Smtp-Source: ABdhPJz6i2lST4mCFN3Zfu/oYfK6R2TIKAM3sn7vsFHzveR/95XL+21l/ZIrtvVCQDNGjuaEwayaEw==
X-Received: by 2002:a62:ab10:0:b029:2e8:d5a8:d635 with SMTP id p16-20020a62ab100000b02902e8d5a8d635mr13221444pff.74.1622393215700;
        Sun, 30 May 2021 09:46:55 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from hilo.hsdl.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id p8sm8723905pfw.165.2021.05.30.09.46.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 09:46:55 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][v2][PATCH] python3-scapy: move from meta-security
Date: Sun, 30 May 2021 16:46:53 +0000
Message-Id: <20210530164653.546453-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.24.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This tracks the official scapy project.
includes ptest

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/python3-scapy/run-ptest            |  4 ++
 .../python/python3-scapy_2.4.5.bb             | 41 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta-networking/recipes-devtools/python/python3-scapy/run-ptest
 create mode 100644 meta-networking/recipes-devtools/python/python3-scapy_2.4.5.bb

diff --git a/meta-networking/recipes-devtools/python/python3-scapy/run-ptest b/meta-networking/recipes-devtools/python/python3-scapy/run-ptest
new file mode 100644
index 000000000..797d8ecf7
--- /dev/null
+++ b/meta-networking/recipes-devtools/python/python3-scapy/run-ptest
@@ -0,0 +1,4 @@
+#!/bin/sh
+UTscapy3 -t regression.uts -f text -l -C \
+    -o @PTEST_PATH@/scapy_ptest_$(date +%Y%m%d-%H%M%S).log \
+    2>&1 | sed -e 's/^passed None/PASS:/' -e 's/^failed None/FAIL:/'
diff --git a/meta-networking/recipes-devtools/python/python3-scapy_2.4.5.bb b/meta-networking/recipes-devtools/python/python3-scapy_2.4.5.bb
new file mode 100644
index 000000000..01ca63746
--- /dev/null
+++ b/meta-networking/recipes-devtools/python/python3-scapy_2.4.5.bb
@@ -0,0 +1,41 @@
+SUMMARY = "Network scanning and manipulation tool"
+DESCRIPTION = "Scapy is a powerful interactive packet manipulation program. \
+It is able to forge or decode packets of a wide number of protocols, send \
+them on the wire, capture them, match requests and replies, and much more. \
+It can easily handle most classical tasks like scanning, tracerouting, probing, \
+unit tests, attacks or network discovery (it can replace hping, 85% of nmap, \
+arpspoof, arp-sk, arping, tcpdump, tethereal, p0f, etc.). It also performs very \
+well at a lot of other specific tasks that most other tools can't handle, like \
+sending invalid frames, injecting your own 802.11 frames, combining technics \
+(VLAN hopping+ARP cache poisoning, VOIP decoding on WEP encrypted channel, ...), etc."
+SECTION = "security"
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+# If you want ptest support, use the git repo
+# UTscapy does not exist in the pypi pkg
+#
+SRCREV = "32cd7eb0f620d9adf171c48d55514e8326a538d7"
+SRC_URI = "git://github.com/secdev/scapy.git \
+           file://run-ptest"
+
+S = "${WORKDIR}/git"
+
+UPSTREAM_CHECK_COMMITS = "1"
+
+inherit setuptools3 ptest
+
+do_install_append() {
+        mv ${D}${bindir}/scapy ${D}${bindir}/scapy3
+        mv ${D}${bindir}/UTscapy ${D}${bindir}/UTscapy3
+}
+
+do_install_ptest() {
+    install -m 0644 ${S}/test/regression.uts ${D}${PTEST_PATH}
+    sed -i 's,@PTEST_PATH@,${PTEST_PATH},' ${D}${PTEST_PATH}/run-ptest
+}
+
+RDEPENDS_${PN} = "tcpdump ${PYTHON_PN}-compression ${PYTHON_PN}-cryptography ${PYTHON_PN}-netclient  \
+                  ${PYTHON_PN}-netserver ${PYTHON_PN}-pydoc ${PYTHON_PN}-pkgutil ${PYTHON_PN}-shell \
+                  ${PYTHON_PN}-threading ${PYTHON_PN}-numbers ${PYTHON_PN}-pycrypto"
-- 
2.24.3

