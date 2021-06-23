Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.5101.1624439172372215567
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Jun 2021 02:06:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=54240 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lvypj-0008WN-Nk; Wed, 23 Jun 2021 12:06:09 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-send2trash: Upgrade 1.5.0 -> 1.7.1
Date: Wed, 23 Jun 2021 12:06:00 +0300
Message-Id: <20210623090602.27496-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 1.7.1:

- Changed conditional for when to try to use pyobjc version
- Add console_script entry point
- Increased python CI versions
- Fix minor issue in setup.py
- Fix issue with windows tests importing modules on non-windows
- Unit test cleanups, rewrites, and flake8 cleanups
- Windows: Fix legacy windows platform for multi-byte unicode and
  add tests
- macOS: Add alternative pyobjc version to potentially improve
  compatibility
- Add main method which allows calling via python -m send2trash
  somefile
- Windows: Add support for using IFileOperation when pywin32 is
  present on Vista and newer
- Add support for passing multiple files at once in a list
- Windows: Batch multi-file calls to improve performance
- Windows: Fix issue with SHFileOperation failing silently when
  path is not found

License-Update: License remains BSD-3-Clause License

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../send2trash/python3-send2trash_1.5.0.bb               | 9 ---------
 .../send2trash/python3-send2trash_1.7.1.bb               | 9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 meta-python/recipes-extended/send2trash/python3-send2trash_1.5.0.bb
 create mode 100644 meta-python/recipes-extended/send2trash/python3-send2trash_1.7.1.bb

diff --git a/meta-python/recipes-extended/send2trash/python3-send2trash_1.5.0.bb b/meta-python/recipes-extended/send2trash/python3-send2trash_1.5.0.bb
deleted file mode 100644
index d906c0b9e3..0000000000
--- a/meta-python/recipes-extended/send2trash/python3-send2trash_1.5.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = "Send file to trash natively under Mac OS X, Windows and Linux"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=05faa35ba1ca10b723f19d286c9d5237"
-
-inherit pypi setuptools3
-
-SRC_URI[sha256sum] = "60001cc07d707fe247c94f74ca6ac0d3255aabcb930529690897ca2a39db28b2"
-
-PYPI_PACKAGE = "Send2Trash"
diff --git a/meta-python/recipes-extended/send2trash/python3-send2trash_1.7.1.bb b/meta-python/recipes-extended/send2trash/python3-send2trash_1.7.1.bb
new file mode 100644
index 0000000000..d3554c8031
--- /dev/null
+++ b/meta-python/recipes-extended/send2trash/python3-send2trash_1.7.1.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Send file to trash natively under Mac OS X, Windows and Linux"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a02659c2d5f4cc626e4dcf6504b865eb"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "17730aa0a33ab82ed6ca76be3bb25f0433d0014f1ccf63c979bab13a5b9db2b2"
+
+PYPI_PACKAGE = "Send2Trash"
-- 
2.17.1

