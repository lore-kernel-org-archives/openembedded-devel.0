Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.10425.1614351369858207222
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:56:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=54554 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lFeXG-00056X-JT; Fri, 26 Feb 2021 16:56:07 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-semantic-version: Add recipe
Date: Fri, 26 Feb 2021 16:55:55 +0200
Message-Id: <20210226145555.11205-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Add semantic_version - a library implementing the 'SemVer' scheme.
Version 2.8.5 brings:

- Properly handle wildcards in SimpleSpec (e.g. ==1.2.*)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-semantic-version_2.8.5.bb         | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-semantic-version_2.8.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-semantic-version_2.8.5.bb b/meta-python/recipes-devtools/python/python3-semantic-version_2.8.5.bb
new file mode 100644
index 0000000000..b8541ff570
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-semantic-version_2.8.5.bb
@@ -0,0 +1,12 @@
+SUMMARY  = "A library implementing the 'SemVer' scheme."
+DESCRIPTION = "Semantic version comparison for Python (see http://semver.org/)"
+HOMEPAGE = "https://github.com/rbarrois/python-semanticversion"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4fb31e3c1c7eeb8b5e8c07657cdd54e2"
+
+SRC_URI[sha256sum] = "d2cb2de0558762934679b9a104e82eca7af448c9f4974d1f3eeccff651df8a54"
+
+PYPI_PACKAGE = "semantic_version"
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

