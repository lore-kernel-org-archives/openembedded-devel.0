Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D7FF57FCE9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 13:19:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,429,1571673600"; d="scan'208";a="81744434"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Jan 2020 21:19:46 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 92B5F4CE1CBC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 21:10:36 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 13 Jan 2020 21:19:44 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 13 Jan 2020 21:19:45 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 13 Jan 2020 09:09:41 -0800
Message-ID: <1578935381-39920-5-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578935381-39920-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1578935381-39920-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 92B5F4CE1CBC.A58D3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python-pyconnman: 0.1.0 -> 0.2.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Jan 2020 13:19:45 -0000
Content-Type: text/plain

0001-Import-local-modules-by-relative-path-for-python3-su.patch
Removed since it is included in 0.2.0.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python-pyconnman/python-pyconnman.inc     |  4 +-
 ...man_0.1.0.bb => python-pyconnman_0.2.0.bb} |  0
 ...ules-by-relative-path-for-python3-su.patch | 74 -------------------
 .../python3-pyconnman_0.1.0.bb                |  9 ---
 .../python3-pyconnman_0.2.0.bb                |  5 ++
 5 files changed, 7 insertions(+), 85 deletions(-)
 rename meta-python/recipes-connectivity/python-pyconnman/{python-pyconnman_0.1.0.bb => python-pyconnman_0.2.0.bb} (100%)
 delete mode 100644 meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman/0001-Import-local-modules-by-relative-path-for-python3-su.patch
 delete mode 100644 meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.1.0.bb
 create mode 100644 meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.2.0.bb

diff --git a/meta-python/recipes-connectivity/python-pyconnman/python-pyconnman.inc b/meta-python/recipes-connectivity/python-pyconnman/python-pyconnman.inc
index beb2baf83..8517079bf 100644
--- a/meta-python/recipes-connectivity/python-pyconnman/python-pyconnman.inc
+++ b/meta-python/recipes-connectivity/python-pyconnman/python-pyconnman.inc
@@ -4,8 +4,8 @@ LICENSE = "Apache-2.0"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "b7fa82034b1c0e1fb1b518ffe3bb4fc0"
-SRC_URI[sha256sum] = "46c64c0692063fd0c9fb0216d49f7884bec9fa9760d8473db4b1e2f8162fab4a"
+SRC_URI[md5sum] = "d60bdffbd9c920f005fdc5e05a8b94cd"
+SRC_URI[sha256sum] = "d3a63a039c82b08a1171b003eafa62c6f128aa4eaa1ce7a55a9401b48f9ad926"
 
 inherit pypi
 
diff --git a/meta-python/recipes-connectivity/python-pyconnman/python-pyconnman_0.1.0.bb b/meta-python/recipes-connectivity/python-pyconnman/python-pyconnman_0.2.0.bb
similarity index 100%
rename from meta-python/recipes-connectivity/python-pyconnman/python-pyconnman_0.1.0.bb
rename to meta-python/recipes-connectivity/python-pyconnman/python-pyconnman_0.2.0.bb
diff --git a/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman/0001-Import-local-modules-by-relative-path-for-python3-su.patch b/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman/0001-Import-local-modules-by-relative-path-for-python3-su.patch
deleted file mode 100644
index 977b4aacd..000000000
--- a/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman/0001-Import-local-modules-by-relative-path-for-python3-su.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 2e84adb042bfb742eb328220b97f79ddb28db44b Mon Sep 17 00:00:00 2001
-From: Haris Okanovic <haris.okanovic@ni.com>
-Date: Tue, 23 Oct 2018 21:39:56 +0000
-Subject: [PATCH] Import local modules by relative path for python3 support
-
-Upstream-Status: Submitted
----
- pyconnman/agent.py      | 2 +-
- pyconnman/interface.py  | 2 +-
- pyconnman/manager.py    | 2 +-
- pyconnman/service.py    | 2 +-
- pyconnman/technology.py | 2 +-
- 5 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/pyconnman/agent.py b/pyconnman/agent.py
-index f72de8d..453d783 100644
---- a/pyconnman/agent.py
-+++ b/pyconnman/agent.py
-@@ -1,5 +1,5 @@
- from __future__ import unicode_literals
--from exceptions import ConnCanceledException
-+from .exceptions import ConnCanceledException
- 
- import dbus.service
- 
-diff --git a/pyconnman/interface.py b/pyconnman/interface.py
-index 7d82e04..d540c81 100644
---- a/pyconnman/interface.py
-+++ b/pyconnman/interface.py
-@@ -4,7 +4,7 @@ import dbus
- import types
- import pprint
- 
--from exceptions import ConnSignalNameNotRecognisedException
-+from .exceptions import ConnSignalNameNotRecognisedException
- 
- 
- def translate_to_dbus_type(typeof, value):
-diff --git a/pyconnman/manager.py b/pyconnman/manager.py
-index f6f40a8..03244cc 100644
---- a/pyconnman/manager.py
-+++ b/pyconnman/manager.py
-@@ -1,6 +1,6 @@
- from __future__ import unicode_literals
- 
--from interface import ConnInterface
-+from .interface import ConnInterface
- 
- 
- class ConnManager(ConnInterface):
-diff --git a/pyconnman/service.py b/pyconnman/service.py
-index bbccced..c6b9241 100644
---- a/pyconnman/service.py
-+++ b/pyconnman/service.py
-@@ -1,6 +1,6 @@
- from __future__ import unicode_literals
- 
--from interface import ConnInterface
-+from .interface import ConnInterface
- 
- 
- class ConnService(ConnInterface):
-diff --git a/pyconnman/technology.py b/pyconnman/technology.py
-index 4777229..d25bad6 100644
---- a/pyconnman/technology.py
-+++ b/pyconnman/technology.py
-@@ -1,6 +1,6 @@
- from __future__ import unicode_literals
- 
--from interface import ConnInterface
-+from .interface import ConnInterface
- 
- 
- class ConnTechnology(ConnInterface):
diff --git a/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.1.0.bb b/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.1.0.bb
deleted file mode 100644
index 32bbe8b80..000000000
--- a/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.1.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require python-pyconnman.inc
-
-inherit setuptools3
-
-SRC_URI_append = " \
-    file://0001-Import-local-modules-by-relative-path-for-python3-su.patch \
-"
-
-RDEPENDS_${PN} += "python3-dbus python3-pprint"
diff --git a/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.2.0.bb b/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.2.0.bb
new file mode 100644
index 000000000..e0f3fdd75
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.2.0.bb
@@ -0,0 +1,5 @@
+require python-pyconnman.inc
+
+inherit setuptools3
+
+RDEPENDS_${PN} += "python3-dbus python3-pprint"
-- 
2.17.1




