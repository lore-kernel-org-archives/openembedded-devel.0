Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id B4F4F73D59
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Apr 2015 14:16:23 +0000 (UTC)
Received: by widdi4 with SMTP id di4so22074781wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Apr 2015 07:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=x27hEVjcpbyLM6yoy3AUJyaIzDFaxzlm5J8GqkuqfWU=;
	b=WRblZPF96lJOdHUUfZAR+thVGse+WixBPubreRCSSEDFTZWKFcAdQDSvIO+WdevNSm
	oIxs2KFsjgwtZf8hS8/pVAfc3WCsMBvM+BmMb0fC6KOqq8QLBf9NJ9ulNqUCM8E+gObT
	Hc6I0PyoCi5rSX/3jqcT9BcIukF0n6soQKQTDRofcYAUEeD/PPxkyRpNmiT9mD2814Qd
	/ZijenMrHKKpKnxfaquR89ZGOGaFl2jeZVf7icznWnRTIvhStkTq/GJJK88yHt/29DBp
	jcXuABAVw53/9C4HsCTin8kRQLFX9SVmA/QmdqE5ufwjNqlg4P6NfpJcESPf5v8nKapS
	flbA==
X-Received: by 10.194.81.104 with SMTP id z8mr6386742wjx.45.1429280184150;
	Fri, 17 Apr 2015 07:16:24 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id gi17sm4660596wjc.8.2015.04.17.07.16.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Apr 2015 07:16:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Apr 2015 16:16:42 +0200
Message-Id: <1429280204-27191-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-qt5][WIP][PATCH 1/3] licenses: Add LGPL_Exception texts and reference them from LICENSE
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
X-List-Received-Date: Fri, 17 Apr 2015 14:16:27 -0000

* add the license text as they appear in qtbase 5.4 and 5.5
* The-Qt-Company-Qt-LGPL-Exception-1.1 will be used in 5.5 beta recipes
  I'll introduce shortly
* based on patch from Herb Kuta

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 licenses/Digia-Qt-LGPL-Exception-1.1          | 22 ++++++++++++++++++++++
 licenses/The-Qt-Company-Qt-LGPL-Exception-1.1 | 22 ++++++++++++++++++++++
 recipes-qt/qt5/qt5-5.4.1.inc                  |  2 +-
 recipes-qt/qt5/qt5-git.inc                    |  2 +-
 recipes-qt/qt5/qtbase.inc                     |  4 ++++
 recipes-qt/qt5/qtdeclarative.inc              |  2 ++
 recipes-qt/qt5/qtenginio.inc                  |  2 +-
 recipes-qt/qt5/qtgraphicaleffects.inc         |  3 ++-
 recipes-qt/qt5/qtmultimedia.inc               |  2 ++
 recipes-qt/qt5/qtquick1.inc                   |  4 +++-
 recipes-qt/qt5/qtscript.inc                   |  2 ++
 recipes-qt/qt5/qtsensors.inc                  |  3 ++-
 recipes-qt/qt5/qtsvg.inc                      |  1 +
 recipes-qt/qt5/qttranslations.inc             |  2 +-
 recipes-qt/qt5/qtwayland-native.inc           |  3 ++-
 recipes-qt/qt5/qtwayland.inc                  |  3 ++-
 recipes-qt/qt5/qtwebchannel.inc               |  5 +++--
 recipes-qt/qt5/qtwebkit-examples.inc          |  5 ++++-
 recipes-qt/qt5/qtwebsockets.inc               |  7 +++++--
 recipes-qt/qt5/qtxmlpatterns.inc              |  1 +
 20 files changed, 83 insertions(+), 14 deletions(-)
 create mode 100644 licenses/Digia-Qt-LGPL-Exception-1.1
 create mode 100644 licenses/The-Qt-Company-Qt-LGPL-Exception-1.1

diff --git a/licenses/Digia-Qt-LGPL-Exception-1.1 b/licenses/Digia-Qt-LGPL-Exception-1.1
new file mode 100644
index 0000000..7e2e30f
--- /dev/null
+++ b/licenses/Digia-Qt-LGPL-Exception-1.1
@@ -0,0 +1,22 @@
+Digia Qt LGPL Exception version 1.1
+
+As an additional permission to the GNU Lesser General Public License version
+2.1, the object code form of a "work that uses the Library" may incorporate
+material from a header file that is part of the Library.  You may distribute
+such object code under terms of your choice, provided that:
+    (i)   the header files of the Library have not been modified; and 
+    (ii)  the incorporated material is limited to numerical parameters, data
+          structure layouts, accessors, macros, inline functions and
+          templates; and
+    (iii) you comply with the terms of Section 6 of the GNU Lesser General
+          Public License version 2.1.
+
+Moreover, you may apply this exception to a modified version of the Library,
+provided that such modification does not involve copying material from the
+Library into the modified Library's header files unless such material is
+limited to (i) numerical parameters; (ii) data structure layouts;
+(iii) accessors; and (iv) small macros, templates and inline functions of
+five lines or less in length.
+
+Furthermore, you are not required to apply this additional permission to a
+modified version of the Library.
diff --git a/licenses/The-Qt-Company-Qt-LGPL-Exception-1.1 b/licenses/The-Qt-Company-Qt-LGPL-Exception-1.1
new file mode 100644
index 0000000..5cdacb9
--- /dev/null
+++ b/licenses/The-Qt-Company-Qt-LGPL-Exception-1.1
@@ -0,0 +1,22 @@
+The Qt Company Qt LGPL Exception version 1.1
+
+As an additional permission to the GNU Lesser General Public License version
+2.1, the object code form of a "work that uses the Library" may incorporate
+material from a header file that is part of the Library.  You may distribute
+such object code under terms of your choice, provided that:
+    (i)   the header files of the Library have not been modified; and 
+    (ii)  the incorporated material is limited to numerical parameters, data
+          structure layouts, accessors, macros, inline functions and
+          templates; and
+    (iii) you comply with the terms of Section 6 of the GNU Lesser General
+          Public License version 2.1.
+
+Moreover, you may apply this exception to a modified version of the Library,
+provided that such modification does not involve copying material from the
+Library into the modified Library's header files unless such material is
+limited to (i) numerical parameters; (ii) data structure layouts;
+(iii) accessors; and (iv) small macros, templates and inline functions of
+five lines or less in length.
+
+Furthermore, you are not required to apply this additional permission to a
+modified version of the Library.
diff --git a/recipes-qt/qt5/qt5-5.4.1.inc b/recipes-qt/qt5/qt5-5.4.1.inc
index c06b792..495551f 100644
--- a/recipes-qt/qt5/qt5-5.4.1.inc
+++ b/recipes-qt/qt5/qt5-5.4.1.inc
@@ -12,7 +12,7 @@ SRC_URI += " \
 
 S = "${WORKDIR}/${QT_MODULE}-opensource-src-${QT_VERSION}"
 
-LICENSE = "GFDL-1.3 & LGPL-2.1 | LGPL-3.0"
+LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=d87ae0d200af76dca730d911474cbe5b \
                     file://LICENSE.LGPLv3;md5=ffcfac38a32c9ebdb8ff768fa1702478 \
                     file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index c878998..e90256e 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -16,7 +16,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/${BPN}-git:"
 
 DEFAULT_PREFERENCE = "-1"
 
-LICENSE = "GFDL-1.3 & LGPL-2.1 | LGPL-3.0"
+LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
                     file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
                     file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 93edb53..a5687ea 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -22,6 +22,10 @@ SRC_URI += "\
 
 DEPENDS += "qtbase-native"
 
+# Used for examples and tests
+# LGPL-3.0 is used only in src/plugins/platforms/android/extract.cpp
+LICENSE += "& BSD"
+
 # for syncqt
 RDEPENDS_${PN}-tools += "perl"
 
diff --git a/recipes-qt/qt5/qtdeclarative.inc b/recipes-qt/qt5/qtdeclarative.inc
index 4a186fd..10487ca 100644
--- a/recipes-qt/qt5/qtdeclarative.inc
+++ b/recipes-qt/qt5/qtdeclarative.inc
@@ -4,6 +4,8 @@ SRC_URI += " \
     file://0001-qmltestexample-fix-link.patch \
 "
 
+# There are no LGPLv3-only licensed files in this component.
+
 DEPENDS += "qtbase"
 
 PACKAGECONFIG ??= "qtxmlpatterns"
diff --git a/recipes-qt/qt5/qtenginio.inc b/recipes-qt/qt5/qtenginio.inc
index d66b253..687b414 100644
--- a/recipes-qt/qt5/qtenginio.inc
+++ b/recipes-qt/qt5/qtenginio.inc
@@ -5,4 +5,4 @@ DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
                     file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
                     file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6"
-LICENSE = "LGPL-2.1 | GPL-3.0"
+LICENSE = "BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
diff --git a/recipes-qt/qt5/qtgraphicaleffects.inc b/recipes-qt/qt5/qtgraphicaleffects.inc
index 89bda5e..9b862cf 100644
--- a/recipes-qt/qt5/qtgraphicaleffects.inc
+++ b/recipes-qt/qt5/qtgraphicaleffects.inc
@@ -4,5 +4,6 @@ DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
 
-LICENSE += "| GPL-2.0"
+# There are no LGPLv3-only licensed files in this component.
+# There are no GPLv2 licensed files in this component.
 LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtmultimedia.inc b/recipes-qt/qt5/qtmultimedia.inc
index 68ae33d..bb53b9c 100644
--- a/recipes-qt/qt5/qtmultimedia.inc
+++ b/recipes-qt/qt5/qtmultimedia.inc
@@ -1,5 +1,7 @@
 require qt5.inc
 
+# There are no LGPLv3-only licensed files in this component.
+
 DEPENDS += "qtdeclarative"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
diff --git a/recipes-qt/qt5/qtquick1.inc b/recipes-qt/qt5/qtquick1.inc
index e507636..c3ae7cf 100644
--- a/recipes-qt/qt5/qtquick1.inc
+++ b/recipes-qt/qt5/qtquick1.inc
@@ -3,5 +3,7 @@ require qt5.inc
 DEPENDS += "qtscript qtsvg qtxmlpatterns qtwebkit"
 # qttools
 
-LICENSE += "| GPL-2.0"
+# There are no LGPLv3-only licensed files in this component.
+# There are no GPLv2 licensed files in this component.
+# Note that some files are LGPL-2.1 only without Digia-Qt-LGPL-Exception-1.1.
 LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtscript.inc b/recipes-qt/qt5/qtscript.inc
index bbb05a6..e7b5d74 100644
--- a/recipes-qt/qt5/qtscript.inc
+++ b/recipes-qt/qt5/qtscript.inc
@@ -1,3 +1,5 @@
 require qt5.inc
 
+# There are no LGPLv3-only licensed files in this component.
+# Note that some files are LGPL-2.1 only without Digia-Qt-LGPL-Exception-1.1.
 DEPENDS += "qtbase"
diff --git a/recipes-qt/qt5/qtsensors.inc b/recipes-qt/qt5/qtsensors.inc
index 3bd9289..88c5e78 100644
--- a/recipes-qt/qt5/qtsensors.inc
+++ b/recipes-qt/qt5/qtsensors.inc
@@ -2,5 +2,6 @@ require qt5.inc
 
 DEPENDS += "qtbase qtdeclarative"
 
-LICENSE += "| GPL-2.0"
+# There are no LGPLv3-only licensed files in this component.
+# There are no GPLv2 licensed files in this component.
 LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtsvg.inc b/recipes-qt/qt5/qtsvg.inc
index bbb05a6..ce2eee4 100644
--- a/recipes-qt/qt5/qtsvg.inc
+++ b/recipes-qt/qt5/qtsvg.inc
@@ -1,3 +1,4 @@
 require qt5.inc
 
+# There are no LGPLv3-only licensed files in this component.
 DEPENDS += "qtbase"
diff --git a/recipes-qt/qt5/qttranslations.inc b/recipes-qt/qt5/qttranslations.inc
index c522694..45f7609 100644
--- a/recipes-qt/qt5/qttranslations.inc
+++ b/recipes-qt/qt5/qttranslations.inc
@@ -5,7 +5,7 @@ DEPENDS += "qtbase qttools-native"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
                     file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
                     file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6"
-LICENSE = "LGPL-2.1 | GPL-3.0"
+LICENSE = "(LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 
 PACKAGES =. " \
     ${PN}-assistant \
diff --git a/recipes-qt/qt5/qtwayland-native.inc b/recipes-qt/qt5/qtwayland-native.inc
index 20aa72e..b6af19e 100644
--- a/recipes-qt/qt5/qtwayland-native.inc
+++ b/recipes-qt/qt5/qtwayland-native.inc
@@ -16,7 +16,8 @@ do_install() {
     oe_runmake install INSTALL_ROOT=${D}
 }
 
-LICENSE = "GFDL-1.3 & LGPL-2.1 | GPL-3.0"
+# There are no LGPLv3-only licensed files in this component.
+LICENSE = "BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
                     file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
                     file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
diff --git a/recipes-qt/qt5/qtwayland.inc b/recipes-qt/qt5/qtwayland.inc
index baadcf5..d126b04 100644
--- a/recipes-qt/qt5/qtwayland.inc
+++ b/recipes-qt/qt5/qtwayland.inc
@@ -23,7 +23,8 @@ FILES_${PN}-plugins-dbg += " \
     ${OE_QMAKE_PATH_PLUGINS}/*/*/.debug/* \
 "
 
-LICENSE = "GFDL-1.3 & LGPL-2.1 | GPL-3.0"
+# There are no LGPLv3-only licensed files in this component.
+LICENSE = "BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
                     file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
                     file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
diff --git a/recipes-qt/qt5/qtwebchannel.inc b/recipes-qt/qt5/qtwebchannel.inc
index 46c3c8a..3cd22cf 100644
--- a/recipes-qt/qt5/qtwebchannel.inc
+++ b/recipes-qt/qt5/qtwebchannel.inc
@@ -2,5 +2,6 @@ require qt5.inc
 
 DEPENDS += "qtdeclarative qtwebsockets"
 
-LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7"
-LICENSE = "LGPL-2.1"
+# There are no LGPLv3-only licensed files in this component.
+# There are no GPLv2 licensed files in this component.
+LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtwebkit-examples.inc b/recipes-qt/qt5/qtwebkit-examples.inc
index 5faf6f4..317fabb 100644
--- a/recipes-qt/qt5/qtwebkit-examples.inc
+++ b/recipes-qt/qt5/qtwebkit-examples.inc
@@ -1,7 +1,10 @@
 require qt5.inc
 
-LICENSE = "BSD & LGPLv2+ | GPL-2.0"
+# There are no LGPLv3-only licensed files in this component.
+# There are no GPLv2 licensed files in this component.
 LIC_FILES_CHKSUM = "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
+                    file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
                     file://examples/webkitwidgets/scroller/wheel/main.cpp;endline=112;md5=6f92d041824c63426993c8ce3ae0eb77 \
                     file://examples/webkitwidgets/imageanalyzer/imageanalyzer.cpp;endline=223;md5=13ffb472fefe4bdf6464954a22251f35"
 
diff --git a/recipes-qt/qt5/qtwebsockets.inc b/recipes-qt/qt5/qtwebsockets.inc
index 6eb8da2..1043a06 100644
--- a/recipes-qt/qt5/qtwebsockets.inc
+++ b/recipes-qt/qt5/qtwebsockets.inc
@@ -2,6 +2,9 @@ require qt5.inc
 
 DEPENDS += "qtbase qtdeclarative"
 
+LICENSE = "GFDL & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c \
-                    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
-LICENSE = "LGPL-2.1 | GPL-2.0"
+                    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+                    file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+"
diff --git a/recipes-qt/qt5/qtxmlpatterns.inc b/recipes-qt/qt5/qtxmlpatterns.inc
index bbb05a6..ce2eee4 100644
--- a/recipes-qt/qt5/qtxmlpatterns.inc
+++ b/recipes-qt/qt5/qtxmlpatterns.inc
@@ -1,3 +1,4 @@
 require qt5.inc
 
+# There are no LGPLv3-only licensed files in this component.
 DEPENDS += "qtbase"
-- 
2.3.5


