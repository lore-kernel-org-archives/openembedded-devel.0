Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.6.1611940625129965698
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jan 2021 09:17:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58070 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l5XOI-0008H1-0W; Fri, 29 Jan 2021 19:17:03 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-prctl: Upgrade 1.7 -> 1.8.1
Date: Fri, 29 Jan 2021 19:16:55 +0200
Message-Id: <20210129171655.20687-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.8.1:

- Master was renamed to main
- Backwards compatibility fixes
- Install dependencies before trying to build/publish

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../0001-support-cross-complication.patch             | 11 ++++++-----
 .../{python3-prctl_1.7.bb => python3-prctl_1.8.1.bb}  |  8 ++++----
 2 files changed, 10 insertions(+), 9 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-prctl_1.7.bb => python3-prctl_1.8.1.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-prctl/0001-support-cross-complication.patch b/meta-python/recipes-devtools/python/python3-prctl/0001-support-cross-complication.patch
index 775ae1b2e..98d250c74 100644
--- a/meta-python/recipes-devtools/python/python3-prctl/0001-support-cross-complication.patch
+++ b/meta-python/recipes-devtools/python/python3-prctl/0001-support-cross-complication.patch
@@ -1,4 +1,4 @@
-From 9a16800738547d117284354bbcad7dd77d9d0344 Mon Sep 17 00:00:00 2001
+From 5f3911737c63a098caf73f1365320fe1b3a7638b Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 21 Apr 2016 03:05:57 -0400
 Subject: [PATCH] support cross-complication
@@ -6,12 +6,13 @@ Subject: [PATCH] support cross-complication
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
  setup.py | 35 -----------------------------------
  1 file changed, 35 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index 658d1a5..e8be7eb 100755
+index eb83cfe..3f9567b 100755
 --- a/setup.py
 +++ b/setup.py
 @@ -13,41 +13,6 @@ import sys
@@ -38,13 +39,13 @@ index 658d1a5..e8be7eb 100755
 -    sys.stderr.write("You need to install gcc to build this module\n")
 -    sys.exit(1)
 -
--sp = subprocess.Popen(['cpp'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+-sp = subprocess.Popen(['cpp'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, env=os.environ)
 -sp.communicate('#include <sys/prctl.h>\n'.encode())
 -if sp.returncode:
 -    sys.stderr.write("You need to install libc development headers to build this module\n")
 -    exit = True
 -
--sp = subprocess.Popen(['cpp'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+-sp = subprocess.Popen(['cpp'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, env=os.environ)
 -sp.communicate('#include <sys/capability.h>\n'.encode())
 -if sp.returncode:
 -    sys.stderr.write("You need to install libcap development headers to build this module\n")
@@ -57,5 +58,5 @@ index 658d1a5..e8be7eb 100755
                     sources = ['_prctlmodule.c'],
                     depends = ['securebits.h'],
 -- 
-2.8.1
+2.17.1
 
diff --git a/meta-python/recipes-devtools/python/python3-prctl_1.7.bb b/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-prctl_1.7.bb
rename to meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
index 54620a066..b87a470b4 100644
--- a/meta-python/recipes-devtools/python/python3-prctl_1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
@@ -5,15 +5,15 @@ limitations in C and linux. This module provides a nice non-messy python(ic) \
 interface."
 SECTION = "devel/python"
 LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=23ff9f50449d4bd0e513df16e4d9755f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1475481f9ec754d758859bd2c75f6f6f"
 
 S = "${WORKDIR}/git"
 B = "${S}"
 
-SRCREV = "57cd0a7cad76e8f8792eea22ee5b5d17bae0a90f"
-PV = "1.7+git${SRCPV}"
+SRCREV = "5e12e398eb5c4e30d7b29b02458c76d2cc780700"
+PV = "1.8.1+git${SRCPV}"
 
-SRC_URI = "git://github.com/seveas/python-prctl;branch=master \
+SRC_URI = "git://github.com/seveas/python-prctl;branch=main\
            file://0001-support-cross-complication.patch \
 "
 inherit setuptools3 python3native
-- 
2.17.1

