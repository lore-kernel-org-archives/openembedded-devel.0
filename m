Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web08.33029.1622389556320079530
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 May 2021 08:45:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HZmwtA5o;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id k7so338843pjf.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 May 2021 08:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SNrUnF31H+IvjBHUfbbzfL24A9S2LKyR9M+NqeEzGU8=;
        b=HZmwtA5oMCaF3Fa/s6TG2O2TGmC1/kufq9Uv+MNzUtEuWO16Fu9xx9kefrlHCNjST0
         RGkTBd2O/P8YmQq04embogWKbf8AEmJHd+FTp443fDDof5J73lQjIa1gpTrtFbJWoadU
         sVkTnYzi8F0LHbDVENhrwQgDXWMWQRTK648dl1qrmZHae6DGLOxqXehxczExYh1lMkGH
         QYvs6kiLeo0h7Hwe1p5fUYFiOzJbiEN+9VpNuLGFRw1X/psakgA4PnfNTRI7EjzJkouK
         y7snZm4J+g1dd5L9JfMT633Ypmt5TwVpvE/DMwgKHPZVSOQ8TPXM/11SWGlXJaXAxo2D
         xtAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SNrUnF31H+IvjBHUfbbzfL24A9S2LKyR9M+NqeEzGU8=;
        b=a6nVCS77TVay/FVf8ZXUIG6ffkZLU6LeaDHTjlhq8yUFVQw52w9c13hXcyMAfPZxfs
         lbYyJVXxNPx+CR+KEe9L9l6AzIwsgW6h8PCdtNOl4UBwu8bmwfOnKMOW5vS2QldY0doX
         AGY/gN6NJqDDwirNsaNraYq2unkAX8OY8Alb47nhunt6vw+5XhCfQxMi52771DgHvKb6
         eLhuORjT/v6ysFOq+FvaR9+s8lykrvvfDgzkIk0s60pop+d20Ygc6plRq0LL1JzhnSdZ
         mOlwildk2XZqMonM1Mv3RaAwBjaSZuIbJlVfCgP4cuFl2hFKBUumWsrrOPQuPOSKAIlI
         Tmeg==
X-Gm-Message-State: AOAM531USCYR4S7pDeHRYo7n7NkS37UeJXq02hucXi933t/ksIP0LZYa
	cRfWvnm3jCEJrKOUDgKFUkjT6RQfi8pA8w==
X-Google-Smtp-Source: ABdhPJzc+KccQ/BvUe/zAAdvjaxIMkZh8dbQYoDF4Aj2J4VF17Wxz+jYaVtrDM51YvdDrQDkEs1c8g==
X-Received: by 2002:a17:902:7043:b029:104:8fa9:7443 with SMTP id h3-20020a1709027043b02901048fa97443mr2087236plt.64.1622389555393;
        Sun, 30 May 2021 08:45:55 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from hilo.hsdl.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id q91sm1763099pja.50.2021.05.30.08.45.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 08:45:55 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-scapy: move from meta-security
Date: Sun, 30 May 2021 15:45:53 +0000
Message-Id: <20210530154553.434976-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.24.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update to the official 2.4.5 pkg
The original package has not been updated in years.
Include ptest

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/python3-scapy/run-ptest            |  4 ++
 .../python/python3-scapy_0.26.bb              | 13 ------
 .../python/python3-scapy_2.4.5.bb             | 41 +++++++++++++++++++
 3 files changed, 45 insertions(+), 13 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-scapy/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-scapy_0.26.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-scapy_2.4.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-scapy/run-ptest b/meta-python/recipes-devtools/python/python3-scapy/run-ptest
new file mode 100644
index 000000000..797d8ecf7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-scapy/run-ptest
@@ -0,0 +1,4 @@
+#!/bin/sh
+UTscapy3 -t regression.uts -f text -l -C \
+    -o @PTEST_PATH@/scapy_ptest_$(date +%Y%m%d-%H%M%S).log \
+    2>&1 | sed -e 's/^passed None/PASS:/' -e 's/^failed None/FAIL:/'
diff --git a/meta-python/recipes-devtools/python/python3-scapy_0.26.bb b/meta-python/recipes-devtools/python/python3-scapy_0.26.bb
deleted file mode 100644
index 31c88942d..000000000
--- a/meta-python/recipes-devtools/python/python3-scapy_0.26.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION = "Packet crafting/sending/sniffing, PCAP processing tool,\
-based on scapy with python3 compatibility"
-SECTION = "devel/python"
-HOMEPAGE = "https://github.com/phaethon/scapy"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a88f5c4e1c935f295ebeaf51fc8644ef"
-
-inherit pypi setuptools3
-
-PYPI_PACKAGE = "scapy-python3"
-
-SRC_URI[md5sum] = "513469447735a4a416d495f63e28aa4b"
-SRC_URI[sha256sum] = "81e4f5522d38c136fd3f1be4e35ffe4fd1f4c2091db3c021d95f8b9d5978b9eb"
diff --git a/meta-python/recipes-devtools/python/python3-scapy_2.4.5.bb b/meta-python/recipes-devtools/python/python3-scapy_2.4.5.bb
new file mode 100644
index 000000000..b1b9bcbd6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-scapy_2.4.5.bb
@@ -0,0 +1,41 @@
+SUMMARY = "Network scanning and manipulation tool"
+DESCRIPTION = "Scapy is a powerful interactive packet manipulation program. \
+It is able to forge or decode packets of a wide number of protocols, send them \
+on the wire, capture them, match requests and replies, and much more. It can \
+easily handle most classical tasks like scanning, tracerouting, probing, unit tests, \
+attacks or network discovery (it can replace hping, 85% of nmap, arpspoof, arp-sk, \
+arping, tcpdump, tethereal, p0f, etc.). It also performs very well at a lot of other \
+specific tasks that most other tools can't handle, like sending invalid frames, \
+injecting your own 802.11 frames, combining technics (VLAN hopping+ARP cache poisoning, \
+VOIP decoding on WEP encrypted channel, ...), etc."
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

