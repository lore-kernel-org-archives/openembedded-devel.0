Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.9229.1621002230656978378
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 May 2021 07:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38054 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lhYjD-0005Cr-8M; Fri, 14 May 2021 17:23:49 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/7] python3-deprecated: Add recipe
Date: Fri, 14 May 2021 17:23:36 +0300
Message-Id: <20210514142341.22666-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210514142341.22666-1-leon.anavi@konsulko.com>
References: <20210514142341.22666-1-leon.anavi@konsulko.com>
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

Python @deprecated decorator to deprecate old python classes,
functions or methods.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-deprecated_1.2.12.bb | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-deprecated_1.2.12.bb

diff --git a/meta-python/recipes-devtools/python/python3-deprecated_1.2.12.bb b/meta-python/recipes-devtools/python/python3-deprecated_1.2.12.bb
new file mode 100644
index 0000000000..4651a8ae35
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-deprecated_1.2.12.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Python @deprecated decorator to deprecate old python classes, functions or methods."
+HOMEPAGE = "https://deprecated.readthedocs.io/en/latest/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=44288e26f4896bdab14072d4fa35ff01"
+
+PYPI_PACKAGE = "Deprecated"
+SRC_URI[sha256sum] = "6d2de2de7931a968874481ef30208fd4e08da39177d61d3d4ebdf4366e7dbca1"
+
+inherit pypi setuptools3
-- 
2.17.1

