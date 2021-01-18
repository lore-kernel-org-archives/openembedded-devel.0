Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.37008.1610991018202205792
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jan 2021 09:30:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=42860 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l1YM1-0000AX-4M; Mon, 18 Jan 2021 19:30:15 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-greenlet: Upgrade 0.4.17 -> 1.0.0
Date: Mon, 18 Jan 2021 19:30:06 +0200
Message-Id: <20210118173007.20996-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 1.0.0:

- Add the ability to set a greenlet's PEP 567 contextvars context
  directly, by assigning to the greenlet's gr_context attribute.
  This restores support for some patterns of using greenlets atop
  an async environment that became more challenging in 0.4.17.
- The repr of greenlet objects now includes extra information
  about its state. This is purely informative and the details are
  subject to change.
- The greenlet module is now a package. There are no API changes,
  so all existing imports, including from C code, should continue
  to work.
- (C API) The undocumented GREENLET_VERSION macro that defined a
  string giving the greenlet version is now deprecated and will
  not be updated.
- Fix %s and %r formatting of a greenlet on Python 2. Previously
  it would result in a Unicode string instead of a native string.
- Move continuous integration from Travis CI to Github Actions.

License-Update: move to the src/ layout and this affects the note
in LICENSE about Stackless Python

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-greenlet_0.4.17.bb   | 9 ---------
 .../recipes-devtools/python/python3-greenlet_1.0.0.bb    | 8 ++++++++
 2 files changed, 8 insertions(+), 9 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-greenlet_0.4.17.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-greenlet_1.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_0.4.17.bb b/meta-python/recipes-devtools/python/python3-greenlet_0.4.17.bb
deleted file mode 100644
index 744265e1f..000000000
--- a/meta-python/recipes-devtools/python/python3-greenlet_0.4.17.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = "Python lightweight in-process concurrent programming"
-LICENSE = "MIT & PSF"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
-                    file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
-
-SRC_URI[md5sum] = "d964c95c2d2f0f02f36c75e158d8e3dc"
-SRC_URI[sha256sum] = "41d8835c69a78de718e466dd0e6bfd4b46125f21a67c3ff6d76d8d8059868d6b"
-
-inherit pypi distutils3
diff --git a/meta-python/recipes-devtools/python/python3-greenlet_1.0.0.bb b/meta-python/recipes-devtools/python/python3-greenlet_1.0.0.bb
new file mode 100644
index 000000000..32194dba7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-greenlet_1.0.0.bb
@@ -0,0 +1,8 @@
+SUMMARY = "Python lightweight in-process concurrent programming"
+LICENSE = "MIT & PSF"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
+                    file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
+
+SRC_URI[sha256sum] = "719e169c79255816cdcf6dccd9ed2d089a72a9f6c42273aae12d55e8d35bdcf8"
+
+inherit pypi distutils3 setuptools3
-- 
2.17.1

