Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.145140.1598053525305034817
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2020 16:45:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55236 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k9Gio-0003AI-KD; Sat, 22 Aug 2020 02:45:23 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 11/11] python3-pywbemtools: Add recipe
Date: Sat, 22 Aug 2020 02:45:04 +0300
Message-Id: <20200821234504.719-11-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200821234504.719-1-leon.anavi@konsulko.com>
References: <20200821234504.719-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Add release 0.7.1 of the python client tools to work with WBEM
Servers using the PyWBEM API:

- Pinned prompt-toolkit to <3.0 on Python 3.8 on Windows to avoid
  WinError 995
- Fixed exception when command entered in interactive mode, on
  Python 2
- Test: Default connection file does not get restored in some
  cases during test.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../pywbemtools/python3-pywbemtools_0.7.1.bb  | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.1.bb

diff --git a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.1.bb b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.1.bb
new file mode 100644
index 000000000..05f77288e
--- /dev/null
+++ b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.1.bb
@@ -0,0 +1,40 @@
+SUMMARY = "A set of tools using pywbem"
+DESCRIPTION = "A set of tools using pywbem to communicate with WBEM servers"
+HOMEPAGE = "https://pywbemtools.readthedocs.io/en/stable/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
+
+SRC_URI[md5sum] = "a789da735c04ddc08ba828cd8022243e"
+SRC_URI[sha256sum] = "d2fe776c78a740215142f4f033055093f2283fd9327440c59734716e51e19989"
+
+inherit pypi setuptools3
+
+DEPENDS += " \
+    ${PYTHON_PN}-pyyaml-native \
+    ${PYTHON_PN}-pywbem-native \
+    ${PYTHON_PN}-six-native \
+    ${PYTHON_PN}-click-native \
+"
+
+RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-ply \
+    ${PYTHON_PN}-pyyaml \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-pywbem \
+    ${PYTHON_PN}-click \
+    ${PYTHON_PN}-requests \
+    ${PYTHON_PN}-prompt-toolkit \
+    ${PYTHON_PN}-mock \
+    ${PYTHON_PN}-packaging \
+    ${PYTHON_PN}-nocasedict \
+    ${PYTHON_PN}-yamlloader \
+    ${PYTHON_PN}-click-repl \
+    ${PYTHON_PN}-click-spinner \
+    ${PYTHON_PN}-asciitree \
+    ${PYTHON_PN}-tabulate \
+    ${PYTHON_PN}-pydicti \
+    ${PYTHON_PN}-nocaselist \
+    ${PYTHON_PN}-custom-inherit \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.17.1

