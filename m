Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.21641.1591972941582810984
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 07:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52426 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jjkst-0006Jj-Qt; Fri, 12 Jun 2020 17:42:20 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-twisted: Upgrade 19.10.0 -> 20.3.0
Date: Fri, 12 Jun 2020 17:42:01 +0300
Message-Id: <20200612144201.4536-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200612144201.4536-1-leon.anavi@konsulko.com>
References: <20200612144201.4536-1-leon.anavi@konsulko.com>
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

Upgrade to release 20.3.0. The year in file LICENSE has been
updated but the project remains available under MIT license.
The patch for test_runner.py is no longer needed because the same
fix has been already applied in the upstream. The new release
bring the following improvements:

- Bugfixes
- Improved documentation
- twisted.news is deprecated
- twisted.conch.ssh now supports the curve25519-sha256 key
  exchange algorithm
- twisted.conch.ssh.keys can now write private keys in the new
  "openssh-key-v1" format, introduced in OpenSSH 6.5 and made the
  default in OpenSSH 7.8. ckeygen has a corresponding new
  --private-key-subtype=v1 option.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...r-import-in-test_runner-to-be-from-t.patch | 38 -------------------
 ...d_19.10.0.bb => python3-twisted_20.3.0.bb} |  8 ++--
 2 files changed, 3 insertions(+), 43 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-twisted/0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch
 rename meta-python/recipes-devtools/python/{python3-twisted_19.10.0.bb => python3-twisted_20.3.0.bb} (97%)

diff --git a/meta-python/recipes-devtools/python/python3-twisted/0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch b/meta-python/recipes-devtools/python/python3-twisted/0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch
deleted file mode 100644
index 39fc7d43e..000000000
--- a/meta-python/recipes-devtools/python/python3-twisted/0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 754f21282ad2775db8ff501d40bbc497faeb17ba Mon Sep 17 00:00:00 2001
-From: Trevor Gamblin <trevor.gamblin@windriver.com>
-Date: Tue, 17 Dec 2019 15:09:22 -0500
-Subject: [PATCH] fix MemoryReactor import in test_runner to be from
- twisted.internet.testing
-
-Upstream-Status: Backport [https://github.com/twisted/twisted/commit/754f21282ad2775db8ff501d40bbc497faeb17ba]
-
-Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
----
- src/twisted/application/newsfragments/9746.misc    | 1 +
- src/twisted/application/runner/test/test_runner.py | 2 +-
- 2 files changed, 2 insertions(+), 1 deletion(-)
- create mode 100644 src/twisted/application/newsfragments/9746.misc
-
-diff --git a/src/twisted/application/newsfragments/9746.misc b/src/twisted/application/newsfragments/9746.misc
-new file mode 100644
-index 000000000..8b1378917
---- /dev/null
-+++ b/src/twisted/application/newsfragments/9746.misc
-@@ -0,0 +1 @@
-+
-diff --git a/src/twisted/application/runner/test/test_runner.py b/src/twisted/application/runner/test/test_runner.py
-index 9abc3449a..cce495b12 100644
---- a/src/twisted/application/runner/test/test_runner.py
-+++ b/src/twisted/application/runner/test/test_runner.py
-@@ -15,7 +15,7 @@ from twisted.logger import (
-     LogLevel, LogPublisher, LogBeginner,
-     FileLogObserver, FilteringLogObserver, LogLevelFilterPredicate,
- )
--from twisted.test.proto_helpers import MemoryReactor
-+from twisted.internet.testing import MemoryReactor
- 
- from ...runner import _runner
- from .._exit import ExitStatus
--- 
-2.24.1
-
diff --git a/meta-python/recipes-devtools/python/python3-twisted_19.10.0.bb b/meta-python/recipes-devtools/python/python3-twisted_20.3.0.bb
similarity index 97%
rename from meta-python/recipes-devtools/python/python3-twisted_19.10.0.bb
rename to meta-python/recipes-devtools/python/python3-twisted_20.3.0.bb
index f2fcd30b7..697725fd7 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_19.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_20.3.0.bb
@@ -5,12 +5,10 @@ HOMEPAGE = "http://www.twistedmatrix.com"
 
 #twisted/topfiles/NEWS:655: - Relicensed: Now under the MIT license, rather than LGPL.
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1743f12d8b8f5aec625c0569a058f0a6"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=27ac6d9597237e7e76282edd7a40cd68"
 
-SRC_URI += "file://0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch"
-
-SRC_URI[sha256sum] = "7394ba7f272ae722a74f3d969dcf599bc4ef093bc392038748a490f1724a515d"
-SRC_URI[md5sum] = "f2d70f7a66ecdf54152310164cceadfe"
+SRC_URI[sha256sum] = "d72c55b5d56e176563b91d11952d13b01af8725c623e498db5507b6614fc1e10"
+SRC_URI[md5sum] = "fc16d575730db7d0cddd09fc35af3eea"
 
 PYPI_PACKAGE = "Twisted"
 PYPI_PACKAGE_EXT = "tar.bz2"
-- 
2.17.1

