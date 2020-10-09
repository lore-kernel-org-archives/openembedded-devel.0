Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.10636.1602239746990758617
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2020 03:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59440 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kQpkW-0007Jc-L2; Fri, 09 Oct 2020 13:35:46 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-colorlog: Upgrade 4.2.1 -> 4.4.0
Date: Fri,  9 Oct 2020 13:35:33 +0300
Message-Id: <20201009103535.31339-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201009103535.31339-1-leon.anavi@konsulko.com>
References: <20201009103535.31339-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.2
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

Upgrade to release 4.4.0:

- Add parameters to basic config
- Update README
- Init colorama with strip=False to avoid unanticipated behavior
  differences dependent on whether or not colorama is installed.

License-Update: Use file LICENSE

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-colorlog_4.2.1.bb | 11 -----------
 .../recipes-devtools/python/python3-colorlog_4.4.0.bb | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-colorlog_4.2.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-colorlog_4.4.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-colorlog_4.2.1.bb b/meta-python/recipes-devtools/python/python3-colorlog_4.2.1.bb
deleted file mode 100644
index a4aaa3cb6c..0000000000
--- a/meta-python/recipes-devtools/python/python3-colorlog_4.2.1.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION = "A colored formatter for the python logging module"
-HOMEPAGE = "https://github.com/borntyping/python-colorlog"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://README.md;md5=05592f7a5b83bfc756f62dbd70a9b9b5"
-
-inherit pypi setuptools3
-
-PYPI_PACKAGE = "colorlog"
-
-SRC_URI[md5sum] = "a01336efc6f54e58e3ed4f331d76c2f0"
-SRC_URI[sha256sum] = "75e55822c3a3387d721579241e776de2cf089c9ef9528b1f09e8b04d403ad118"
diff --git a/meta-python/recipes-devtools/python/python3-colorlog_4.4.0.bb b/meta-python/recipes-devtools/python/python3-colorlog_4.4.0.bb
new file mode 100644
index 0000000000..4a40ef38cf
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-colorlog_4.4.0.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "A colored formatter for the python logging module"
+HOMEPAGE = "https://github.com/borntyping/python-colorlog"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=85a1d478cd35d62763a1419e948bdde4"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "colorlog"
+
+SRC_URI[md5sum] = "0997566a87c6fdec0baa88055adc06c3"
+SRC_URI[sha256sum] = "0272c537469ab1e63b9915535874d15b671963c9325db0c4891a2aeff97ce3d1"
-- 
2.17.1

