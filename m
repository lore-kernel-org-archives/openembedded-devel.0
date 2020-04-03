Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.6665.1585901758037025777
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 01:15:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45474 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jKHUZ-0006Wi-Q9; Fri, 03 Apr 2020 11:15:56 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python-luma-core: add new recipe
Date: Fri,  3 Apr 2020 11:15:47 +0300
Message-Id: <1585901748-16446-2-git-send-email-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585901748-16446-1-git-send-email-leon.anavi@konsulko.com>
References: <1585901748-16446-1-git-send-email-leon.anavi@konsulko.com>
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
 .../recipes-devtools/python/python-luma-core.inc       | 18 ++++++++++++++++++
 .../python/python3-luma-core_1.12.0.bb                 |  2 ++
 2 files changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-luma-core.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-luma-core_1.12.0.bb

diff --git a/meta-python/recipes-devtools/python/python-luma-core.inc b/meta-python/recipes-devtools/python/python-luma-core.inc
new file mode 100644
index 0000000..65350ef
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-luma-core.inc
@@ -0,0 +1,18 @@
+SUMMARY = "A component library to support SBC display drivers"
+DESCRIPTION = "A component library to support SBC display drivers"
+HOMEPAGE = "https://github.com/rm-hull/luma.core"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7"
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
diff --git a/meta-python/recipes-devtools/python/python3-luma-core_1.12.0.bb b/meta-python/recipes-devtools/python/python3-luma-core_1.12.0.bb
new file mode 100644
index 0000000..6e34f81
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-luma-core_1.12.0.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-luma-core.inc
-- 
2.7.4

