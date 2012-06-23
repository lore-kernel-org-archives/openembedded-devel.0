Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SiXqw-0004Jh-UE
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jun 2012 23:26:46 +0200
Received: by wibhq4 with SMTP id hq4so1541547wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jun 2012 14:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=49lT8kr9QxlgNMq76dsayBl5hcwMpNhAF5rbD9nnvkg=;
	b=Bfr/5EMlpVjFYyHip2yH3FBdeoOL1fvTUqsTHPrSsAMX6fkIUGE+FJRIfWSYs2lJqm
	aexiTthuXrsSe3aIZq7ABXUBjWLLhYAGzC26JRMEWOc9kcnBc4jwNq+i9lU/dY1CfBHy
	J0E+2ay5sx+cmz1Ac++G6C4dNceFZUSzFH+CBeYm7xk+oxdt+KPUtAMPzjGxYupLTQmk
	3bKIEHWeoeU0chzo0T8mxmftFL5t8Lxtx9ojNVVhGlYAFkK8BppUxKEqc0kwmycXBh6v
	mFbgN/XN+ySsPzFNpJ9zwKiny4MYuxNVM6F/iPNZtyY5Ubs/aRh8XqnRIifpC/oQJq8h
	/3YA==
Received: by 10.216.193.129 with SMTP id k1mr3191181wen.201.1340486158099;
	Sat, 23 Jun 2012 14:15:58 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bc2sm14106840wib.0.2012.06.23.14.15.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 23 Jun 2012 14:15:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jun 2012 23:15:33 +0200
Message-Id: <8c9358c7a968a359f066048c483f74997c3dceac.1340486086.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1340486086.git.Martin.Jansa@gmail.com>
References: <cover.1340486086.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1340486086.git.Martin.Jansa@gmail.com>
References: <cover.1340486086.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/5] navit: bump SRCREV and add patch from debian to fix build with gcc-4.7.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 23 Jun 2012 21:26:47 -0000

* COPYING was updated in
  http://navit.svn.sourceforge.net/viewvc/navit/trunk/navit/COPYING?r1=5023&r2=5022&pathrev=5023
  just 2 more files listed in GPLv2, rest is in LGPL

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/navit/navit.inc         |    2 +-
 .../navit/taking-address-of-temporary-array.patch  |   76 ++++++++++++++++++++
 meta-oe/recipes-navigation/navit/navit_svn.bb      |    6 +-
 3 files changed, 81 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-navigation/navit/navit/taking-address-of-temporary-array.patch

diff --git a/meta-oe/recipes-navigation/navit/navit.inc b/meta-oe/recipes-navigation/navit/navit.inc
index b2b89e5..dc2370b 100644
--- a/meta-oe/recipes-navigation/navit/navit.inc
+++ b/meta-oe/recipes-navigation/navit/navit.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Navit is a car navigation system with routing engine."
 LICENSE = "GPLv2 LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a4c51733b63d82df87995454bdc4b654 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=ed539d099d6ce08de6ea0dfed9ecb333 \
                     file://LGPL-2;md5=3214f080875748938ba060314b4f727d \
                     file://GPL-2;md5=751419260aa954499f7abaabaa882bbe \
 "
diff --git a/meta-oe/recipes-navigation/navit/navit/taking-address-of-temporary-array.patch b/meta-oe/recipes-navigation/navit/navit/taking-address-of-temporary-array.patch
new file mode 100644
index 0000000..8d3a416
--- /dev/null
+++ b/meta-oe/recipes-navigation/navit/navit/taking-address-of-temporary-array.patch
@@ -0,0 +1,76 @@
+Upstream-Status: Pending
+
+Description: Fix g++ error "taking address of temporary array"
+Author: Gilles Filippini <pini@debian.org>
+Forwarded: no
+Bug-Debian: http://bugs.debian.org/676006
+Last-Update: 2012-06-05
+Index: navit/navit/graphics/qt_qpainter/RenderArea.cpp
+===================================================================
+--- navit.orig/navit/graphics/qt_qpainter/RenderArea.cpp	2012-06-05 23:16:42.000000000 +0200
++++ navit/navit/graphics/qt_qpainter/RenderArea.cpp	2012-06-05 23:15:47.000000000 +0200
+@@ -239,13 +239,14 @@
+ #else
+ 	const char *text=str.toUtf8().constData();
+ #endif
++	char text1[2] = { '\0', '\0' };
+ 	dbg(0,"enter text='%s' 0x%x (%d) key=%d\n", text, text[0], strlen(text), event->key());
+ 	if (!text || !text[0] || text[0] == 0x7f) {
+ 		dbg(0,"special key\n");
+ 		switch (event->key()) {
+ 		case 4099:
+ 			{
+-				text=(char []){NAVIT_KEY_BACKSPACE,'\0'};
++				text1[0] = NAVIT_KEY_BACKSPACE;
+ 			}
+ 			break;
+ 		case 4101:
+@@ -253,7 +254,7 @@
+ 		QT_QPAINTER_CUSTOM_RETURN
+ #endif
+ 			{
+-				text=(char []){NAVIT_KEY_RETURN,'\0'};
++				text1[0] = NAVIT_KEY_RETURN;
+ 			}
+ 			break;
+ 		case 4114:
+@@ -261,7 +262,7 @@
+ 		QT_QPAINTER_CUSTOM_LEFT
+ #endif
+ 			{
+-				text=(char []){NAVIT_KEY_LEFT,'\0'};
++				text1[0] = NAVIT_KEY_LEFT;
+ 			}
+ 			break;
+ 		case 4115:
+@@ -269,7 +270,7 @@
+ 		QT_QPAINTER_CUSTOM_UP
+ #endif
+ 			{
+-				text=(char []){NAVIT_KEY_UP,'\0'};
++				text1[0] = NAVIT_KEY_UP;
+ 			}
+ 			break;
+ 		case 4116:
+@@ -277,7 +278,7 @@
+ 		QT_QPAINTER_CUSTOM_RIGHT
+ #endif
+ 			{
+-				text=(char []){NAVIT_KEY_RIGHT,'\0'};
++				text1[0] = NAVIT_KEY_RIGHT;
+ 			}
+ 			break;
+ 		case 4117:
+@@ -285,10 +286,11 @@
+ 		QT_QPAINTER_CUSTOM_DOWN
+ #endif
+ 			{
+-				text=(char []){NAVIT_KEY_DOWN,'\0'};
++				text1[0] = NAVIT_KEY_DOWN;
+ 			}
+ 			break;
+ 		}
++		if (text1[0]) text = text1;
+ 	}
+ 	callback_list_call_attr_1(this->cbl, attr_keypress, (void *)text);
+ 	event->accept();
diff --git a/meta-oe/recipes-navigation/navit/navit_svn.bb b/meta-oe/recipes-navigation/navit/navit_svn.bb
index 6d0b152..b3057b5 100644
--- a/meta-oe/recipes-navigation/navit/navit_svn.bb
+++ b/meta-oe/recipes-navigation/navit/navit_svn.bb
@@ -1,8 +1,10 @@
 require navit.inc
 
-SRCREV = "4841"
+SRCREV = "5159"
 PV = "0.2.0+svnr${SRCPV}"
 PR = "${INC_PR}.2"
 
 S = "${WORKDIR}/${PN}"
-SRC_URI += "svn://anonymous@navit.svn.sourceforge.net/svnroot/navit/trunk;module=navit;proto=http "
+SRC_URI += "svn://anonymous@navit.svn.sourceforge.net/svnroot/navit/trunk;module=navit;proto=http \
+  file://taking-address-of-temporary-array.patch \
+"
-- 
1.7.8.6



