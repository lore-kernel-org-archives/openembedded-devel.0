Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.7254.1591091388256721197
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2020 02:49:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41014 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jg3YE-0000dl-Pk; Tue, 02 Jun 2020 12:49:43 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-automat: Upgrade 0.8.0 -> 20.2.0
Date: Tue,  2 Jun 2020 12:49:01 +0300
Message-Id: <20200602094901.29564-1-leon.anavi@konsulko.com>
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

Upgrade to release 20.2.0. Rebase the patch that removes
dependency on on m2r for the new release.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../0001-setup.py-remove-the-dependency-on-m2r.patch  | 11 +++++++----
 ...on3-automat_0.8.0.bb => python3-automat_20.2.0.bb} |  4 ++--
 2 files changed, 9 insertions(+), 6 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-automat_0.8.0.bb => python3-automat_20.2.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-automat/0001-setup.py-remove-the-dependency-on-m2r.patch b/meta-python/recipes-devtools/python/python3-automat/0001-setup.py-remove-the-dependency-on-m2r.patch
index c29b659bc..b83b7f380 100644
--- a/meta-python/recipes-devtools/python/python3-automat/0001-setup.py-remove-the-dependency-on-m2r.patch
+++ b/meta-python/recipes-devtools/python/python3-automat/0001-setup.py-remove-the-dependency-on-m2r.patch
@@ -1,4 +1,4 @@
-From 33b70266930c9093712173c4e0c419815b55e313 Mon Sep 17 00:00:00 2001
+From 4fb6bbfbc53428fe5d38ec3e04bb4fd187b2fd45 Mon Sep 17 00:00:00 2001
 From: Derek Straka <derek@asterius.io>
 Date: Fri, 22 Dec 2017 09:07:00 -0500
 Subject: [PATCH] setup.py: remove the dependency on m2r
@@ -11,13 +11,13 @@ value in this case
 Upstream-Status: Inappropriate (OE specific)
 
 Signed-off-by: Derek Straka <derek@asterius.io>
-
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
  setup.py | 10 ----------
  1 file changed, 10 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index d360c64..7b4180a 100644
+index 3fb7fdb..245d69a 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -4,14 +4,6 @@ Setup file for automat
@@ -47,4 +47,7 @@ index d360c64..7b4180a 100644
 -        'm2r',
      ],
      install_requires=[
-         "attrs>=16.1.0",
+         "attrs>=19.2.0",
+-- 
+2.17.1
+
diff --git a/meta-python/recipes-devtools/python/python3-automat_0.8.0.bb b/meta-python/recipes-devtools/python/python3-automat_20.2.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-automat_0.8.0.bb
rename to meta-python/recipes-devtools/python/python3-automat_20.2.0.bb
index f8981bcb1..bddc5be69 100644
--- a/meta-python/recipes-devtools/python/python3-automat_0.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-automat_20.2.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/glyph/Automat"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4ad213bcca81688e94593e5f60c87477"
 
-SRC_URI[md5sum] = "47e980a48201a1dabe37fa11f0187013"
-SRC_URI[sha256sum] = "269a09dfb063a3b078983f4976d83f0a0d3e6e7aaf8e27d8df1095e09dc4a484"
+SRC_URI[md5sum] = "d6cef9886b037b8857bfbc686f3ae30a"
+SRC_URI[sha256sum] = "7979803c74610e11ef0c0d68a2942b152df52da55336e0c9d58daf1831cbdf33"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.17.1

