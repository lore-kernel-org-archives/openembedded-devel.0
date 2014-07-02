Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id CA8596AC73
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Jul 2014 15:35:33 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id n3so749309wiv.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jul 2014 08:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=xzkoMbmxURgLTDQjjxrW5PG+8ZFZ8jO9safWoOH6lTA=;
	b=il/e9BxDrWKBA/oHnbpvlPxwhd52n4h1MDzE3PnbvQPAYRDqAQWMIhoMTGZKCjtp+n
	+X5wEUcRaWnFFhgnBoe427fqYYLXiNTaLtNHqqpuR4kIg1neVfN8Zm0GKuXhuWdAw9P7
	odif/XoUrGfe30ddVsEKeD7BmqtPywbKTYu161FrN8WDy9+sO79A/DlQgWhVLkGtc7ZR
	QJfwdpt/0pg/W/WDLNdE+sH5RpKHmeyoHL3Gzm5jlTIFvzW0866BuSG12wAcASZw+Vs1
	xVLg0k0CFFL7GauDpRyGm8xZ7AKhed51YWe0VHCqWuk40JWX1kQKeAej9DKPJmoAeYJj
	UfHw==
X-Received: by 10.194.60.240 with SMTP id k16mr18125593wjr.0.1404315333155;
	Wed, 02 Jul 2014 08:35:33 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ek3sm55776503wjd.17.2014.07.02.08.35.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Jul 2014 08:35:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jul 2014 17:35:42 +0200
Message-Id: <1404315342-2913-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-qt5][WIP][PATCH] qtbase: fix 0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Jul 2014 15:35:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* again resolves this kind of warnings:
  WARNING: QA Issue: qtxmlpatterns: The compile log indicates that host
    include and/or library paths were used. Please check the log
    '/OE/qtxmlpatterns/5.3.1-r0/temp/log.do_compile'
    for more information.
---
 ...le-Fix-pkgconfig-and-libtool-replacements.patch | 45 +++++++++++++++++-----
 ...le-Fix-pkgconfig-and-libtool-replacements.patch | 45 +++++++++++++++++-----
 2 files changed, 72 insertions(+), 18 deletions(-)

diff --git a/recipes-qt/qt5/qtbase-git/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch b/recipes-qt/qt5/qtbase-git/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
index 29108cd..022f561 100644
--- a/recipes-qt/qt5/qtbase-git/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
+++ b/recipes-qt/qt5/qtbase-git/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
@@ -40,18 +40,50 @@ Content-Transfer-Encoding: 8bit
   Change-Id: Id0d38715673b8a1c0c034e9c15783eb255c4315b
   Reviewed-by: Joerg Bornemann <joerg.bornemann@digia.com>
 
+* to debug this, rebuild qtbase and read build/src/corelib/Makefile
+* this is example of broken install_target rule (added line feeds):
+  -$(SED) -e s,/OE/5.3.1-r0/build/lib,/usr/lib,g
+          -e 's,/OE/5.3.1-r0/build/include,$$\{includedir},g'
+          -e 's,/OE/5.3.1-r0/build/lib,$$\{libdir},g'
+     "../../lib/pkgconfig/Qt5Core.pc"
+     >"$(INSTALL_ROOT)/usr/lib/pkgconfig/Qt5Core.pc"
+  change .prf files, create copy of WORKDIR, re-excecute only
+  do_configure task and compare generated Makefile, repeat until
+  replace in generated Makefile works ok, then refresh patch and
+  try complete rebuild for qtbase
+* if everything is ok, then try:
+  image $ grep -R "\-L/usr" .
+  image $ grep -R "\-I/usr" .
+  and it should return only few cases of
+  qmake.conf:QMAKE_LFLAGS_THREAD     = -L/usr/lib/threads
+  for aix* platformas
+
 Change-Id: Ie1c94b15f2a4e736b65b4d0924d99eb2a7d92a6c
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
- mkspecs/features/qt_module.prf | 14 ++++++++++++++
- 1 file changed, 14 insertions(+)
+ mkspecs/features/qt_common.prf | 2 +-
+ mkspecs/features/qt_module.prf | 9 +++++++++
+ 2 files changed, 10 insertions(+), 1 deletion(-)
 
+diff --git a/mkspecs/features/qt_common.prf b/mkspecs/features/qt_common.prf
+index 4dcabe9..d04bc3e 100644
+--- a/mkspecs/features/qt_common.prf
++++ b/mkspecs/features/qt_common.prf
+@@ -33,7 +33,7 @@ contains(TEMPLATE, .*lib) {
+         lib_replace.replace =
+     } else {
+         lib_replace.match = $$rplbase/lib
+-        lib_replace.replace = $$qt_libdir
++        lib_replace.replace = "\$$\\{libdir}"
+     }
+     lib_replace.CONFIG = path
+     QMAKE_PRL_INSTALL_REPLACE += lib_replace
 diff --git a/mkspecs/features/qt_module.prf b/mkspecs/features/qt_module.prf
-index 8bf4c92..9737f8c 100644
+index 8bf4c92..fec6543 100644
 --- a/mkspecs/features/qt_module.prf
 +++ b/mkspecs/features/qt_module.prf
-@@ -188,10 +188,24 @@ unix|mingw {
+@@ -188,10 +188,19 @@ unix|mingw {
          QMAKE_PKGCONFIG_DESCRIPTION = $$replace(TARGET, ^Qt, "Qt ") module
      QMAKE_PKGCONFIG_INSTALL_REPLACE += lib_replace
  
@@ -60,11 +92,6 @@ index 8bf4c92..9737f8c 100644
 +    pkgconfig_include_replace.CONFIG = path
 +    QMAKE_PKGCONFIG_INSTALL_REPLACE += pkgconfig_include_replace
 +
-+    pkgconfig_lib_replace.match = $$rplbase/lib
-+    pkgconfig_lib_replace.replace = "\$$\\{libdir}"
-+    pkgconfig_lib_replace.CONFIG = path
-+    QMAKE_PKGCONFIG_INSTALL_REPLACE += pkgconfig_lib_replace
-+
      unix {
          CONFIG += create_libtool explicitlib
          QMAKE_LIBTOOL_LIBDIR = $$qt_libdir
diff --git a/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch b/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
index 6a7d714..4b13549 100644
--- a/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
+++ b/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
@@ -40,18 +40,50 @@ Content-Transfer-Encoding: 8bit
   Change-Id: Id0d38715673b8a1c0c034e9c15783eb255c4315b
   Reviewed-by: Joerg Bornemann <joerg.bornemann@digia.com>
 
+* to debug this, rebuild qtbase and read build/src/corelib/Makefile
+* this is example of broken install_target rule (added line feeds):
+  -$(SED) -e s,/OE/5.3.1-r0/build/lib,/usr/lib,g
+          -e 's,/OE/5.3.1-r0/build/include,$$\{includedir},g'
+          -e 's,/OE/5.3.1-r0/build/lib,$$\{libdir},g'
+     "../../lib/pkgconfig/Qt5Core.pc"
+     >"$(INSTALL_ROOT)/usr/lib/pkgconfig/Qt5Core.pc"
+  change .prf files, create copy of WORKDIR, re-excecute only
+  do_configure task and compare generated Makefile, repeat until
+  replace in generated Makefile works ok, then refresh patch and
+  try complete rebuild for qtbase
+* if everything is ok, then try:
+  image $ grep -R "\-L/usr" .
+  image $ grep -R "\-I/usr" .
+  and it should return only few cases of
+  qmake.conf:QMAKE_LFLAGS_THREAD     = -L/usr/lib/threads
+  for aix* platformas
+
 Change-Id: Ie1c94b15f2a4e736b65b4d0924d99eb2a7d92a6c
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
- mkspecs/features/qt_module.prf | 14 ++++++++++++++
- 1 file changed, 14 insertions(+)
+ mkspecs/features/qt_common.prf | 2 +-
+ mkspecs/features/qt_module.prf | 9 +++++++++
+ 2 files changed, 10 insertions(+), 1 deletion(-)
 
+diff --git a/mkspecs/features/qt_common.prf b/mkspecs/features/qt_common.prf
+index 4dcabe9..d04bc3e 100644
+--- a/mkspecs/features/qt_common.prf
++++ b/mkspecs/features/qt_common.prf
+@@ -33,7 +33,7 @@ contains(TEMPLATE, .*lib) {
+         lib_replace.replace =
+     } else {
+         lib_replace.match = $$rplbase/lib
+-        lib_replace.replace = $$qt_libdir
++        lib_replace.replace = "\$$\\{libdir}"
+     }
+     lib_replace.CONFIG = path
+     QMAKE_PRL_INSTALL_REPLACE += lib_replace
 diff --git a/mkspecs/features/qt_module.prf b/mkspecs/features/qt_module.prf
-index 8bf4c92..9737f8c 100644
+index 8bf4c92..fec6543 100644
 --- a/mkspecs/features/qt_module.prf
 +++ b/mkspecs/features/qt_module.prf
-@@ -188,10 +188,24 @@ unix|mingw {
+@@ -188,10 +188,19 @@ unix|mingw {
          QMAKE_PKGCONFIG_DESCRIPTION = $$replace(TARGET, ^Qt, "Qt ") module
      QMAKE_PKGCONFIG_INSTALL_REPLACE += lib_replace
  
@@ -60,11 +92,6 @@ index 8bf4c92..9737f8c 100644
 +    pkgconfig_include_replace.CONFIG = path
 +    QMAKE_PKGCONFIG_INSTALL_REPLACE += pkgconfig_include_replace
 +
-+    pkgconfig_lib_replace.match = $$rplbase/lib
-+    pkgconfig_lib_replace.replace = "\$$\\{libdir}"
-+    pkgconfig_lib_replace.CONFIG = path
-+    QMAKE_PKGCONFIG_INSTALL_REPLACE += pkgconfig_lib_replace
-+
      unix {
          CONFIG += create_libtool explicitlib
          QMAKE_LIBTOOL_LIBDIR = $$qt_libdir
-- 
2.0.0


