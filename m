Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.7035.1586161920469566505
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2020 01:32:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=42224 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jLNAj-0004FY-RR; Mon, 06 Apr 2020 11:31:58 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCHv2 2/3] python-luma-core: add new recipe
Date: Mon,  6 Apr 2020 11:31:49 +0300
Message-Id: <1586161910-31315-2-git-send-email-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586161910-31315-1-git-send-email-leon.anavi@konsulko.com>
References: <1586161910-31315-1-git-send-email-leon.anavi@konsulko.com>
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

Component library providing a Pillow-compatible drawing canvas,
and other functionality to support drawing primitives and
text-rendering capabilities for small displays on the Raspberry Pi
and other single board computers.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-luma-core_1.12.0.bb               | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-luma-core_1.12.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-luma-core_1.12.0.bb b/meta-python/recipes-devtools/python/python3-luma-core_1.12.0.bb
new file mode 100644
index 0000000..cdb1ac8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-luma-core_1.12.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "A component library to support SBC display drivers"
+DESCRIPTION = "A component library to support SBC display drivers"
+HOMEPAGE = "https://github.com/rm-hull/luma.core"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "4378edb99cd12540b4e4a588969567ee"
+SRC_URI[sha256sum] = "864a427de78bcc16758f4f4402a9e61f31cc8857bfae9aba8041159aaec3a491"
+
+CLEANBROKEN = "1"
+
+PYPI_PACKAGE = "luma.core"
+
+RDEPENDS_${PN} += " \
+	${PYTHON_PN}-pillow \
+	${PYTHON_PN}-threading \
+	${PYTHON_PN}-smbus2 \
+"
-- 
2.7.4

