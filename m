Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.3976.1626427288265586151
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jul 2021 02:21:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59848 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1m4K27-0008Em-Kn; Fri, 16 Jul 2021 12:21:24 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-requests: Upgrade 2.25.1 -> 2.26.0
Date: Fri, 16 Jul 2021 12:21:16 +0300
Message-Id: <20210716092117.31730-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.5
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrade to release 2.26.0:

- Requests now supports Brotli compression, if either the `brotli`
  or￼ `brotlicffi` package is installed
- `Session.send` now correctly resolves proxy configurations from
  both the Session and Request. Behavior now matches
  `Session.request`.
- Fixed a race condition in zip extraction when using Requests in
  parallel from zip archive.
- Requests now supports `idna` 3.x on Python 3. `idna` 2.x will
  continue to be used on Python 2 installations

Drop setup.py-Support-idna-version-3.1.patch because the issue
with idna version has been solved in the upstream for Python 3.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../setup.py-Support-idna-version-3.1.patch   | 40 -------------------
 ...s_2.25.1.bb => python3-requests_2.26.0.bb} |  4 +-
 2 files changed, 1 insertion(+), 43 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-requests/setup.py-Support-idna-version-3.1.patch
 rename meta-python/recipes-devtools/python/{python3-requests_2.25.1.bb => python3-requests_2.26.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-requests/setup.py-Support-idna-version-3.1.patch b/meta-python/recipes-devtools/python/python3-requests/setup.py-Support-idna-version-3.1.patch
deleted file mode 100644
index 26332249da..0000000000
--- a/meta-python/recipes-devtools/python/python3-requests/setup.py-Support-idna-version-3.1.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From fc45beed40a86c8fc38fc430765c1c5d2c9961c2 Mon Sep 17 00:00:00 2001
-From: Fabio Berton <fabio.berton@ossystems.com.br>
-Date: Thu, 4 Mar 2021 09:26:48 -0300
-Subject: [PATCH] setup.py: Support idna version 3.1
-Organization: O.S. Systems Software LTDA.
-
-Change idna required version to use python3-idna recipe that currently
-is on version 3.1.
-
-Without this change python-request doesn't work as the idna version
-doesn't match the required versions. When bump python-request recipe,
-verify if the upstream project bumped the idna version and drop this
-patch.
-
-As this recipe was tested with python3-idna_3.1 don't allow higher
-versions.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
----
- setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 7ba4b2a2..9d3b973e 100755
---- a/setup.py
-+++ b/setup.py
-@@ -43,7 +43,7 @@ packages = ['requests']
- 
- requires = [
-     'chardet>=3.0.2,<5',
--    'idna>=2.5,<3',
-+    'idna>=2.5,<3.2',
-     'urllib3>=1.21.1,<1.27',
-     'certifi>=2017.4.17'
- 
--- 
-2.30.1
-
diff --git a/meta-python/recipes-devtools/python/python3-requests_2.25.1.bb b/meta-python/recipes-devtools/python/python3-requests_2.26.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-requests_2.25.1.bb
rename to meta-python/recipes-devtools/python/python3-requests_2.26.0.bb
index cea8fd5178..95e6e1a6b6 100644
--- a/meta-python/recipes-devtools/python/python3-requests_2.25.1.bb
+++ b/meta-python/recipes-devtools/python/python3-requests_2.26.0.bb
@@ -3,9 +3,7 @@ HOMEPAGE = "http://python-requests.org"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI += "file://setup.py-Support-idna-version-3.1.patch"
-
-SRC_URI[sha256sum] = "27973dd4a904a4f13b263a19c866c13b92a39ed1c964655f025f3f8d3d75b804"
+SRC_URI[sha256sum] = "b8aa58f8cf793ffd8782d3d8cb19e66ef36f7aba4353eec859e74678b01b07a7"
 
 inherit pypi setuptools3
 
-- 
2.17.1

