Received: from mail-ea0-f176.google.com ([209.85.215.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tmkqn-0001rD-Qy
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 13:40:40 +0100
Received: by mail-ea0-f176.google.com with SMTP id d13so2495906eaa.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 04:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=HQRk+R5Nb1HqoYAA0pHPdc6vC5r4JlRDfi6OGGAeK4o=;
	b=PYgPfecSYCBT61Gw38WBOTKO920nwiNCQIseiBTFCbFcWEq9+piEWDvOdnTjBKnoGn
	Gv4hKHzE3F8tvWPzVXKgpyzWrctcw0ZGaJgDNHPD1ATpFSC5pRMnru6lZqiVmI8dqBY4
	hNOA5GC2q966X4vMTeuhv64QPQHEPtGLp8DJKK7vjlZ9hznD3U/L0d+YXhsOqjHDcpS1
	REjUEDXvHdsZmC0n+Q8HUP7a1MmT8pLi073mcxt7+p9mpbXGoV/zJ7LI00GJD4mLmXQz
	wiKc12NQ+d7dzqPFTezYut0evT4HIkh9+ucTqkwOF7b0kOpj8yJZVo1KIP68V6c5nGPa
	zs6w==
X-Received: by 10.14.223.200 with SMTP id v48mr48028759eep.24.1356265529511;
	Sun, 23 Dec 2012 04:25:29 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id l3sm34573314eem.14.2012.12.23.04.25.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 04:25:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 13:21:49 +0100
Message-Id: <c012d759c305b3e4f9ef5954cf3a80143c1fe55f.1356264861.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 24/30] navit: bump SRCREV to latest
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
X-List-Received-Date: Sun, 23 Dec 2012 12:40:50 -0000

* taking-address-of-temporary-array.patch was fixed in upstream r5243

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../navit/taking-address-of-temporary-array.patch  | 76 ----------------------
 meta-oe/recipes-navigation/navit/navit_svn.bb      |  3 +-
 2 files changed, 1 insertion(+), 78 deletions(-)
 delete mode 100644 meta-oe/recipes-navigation/navit/navit/taking-address-of-temporary-array.patch

diff --git a/meta-oe/recipes-navigation/navit/navit/taking-address-of-temporary-array.patch b/meta-oe/recipes-navigation/navit/navit/taking-address-of-temporary-array.patch
deleted file mode 100644
index 8d3a416..0000000
--- a/meta-oe/recipes-navigation/navit/navit/taking-address-of-temporary-array.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-Upstream-Status: Pending
-
-Description: Fix g++ error "taking address of temporary array"
-Author: Gilles Filippini <pini@debian.org>
-Forwarded: no
-Bug-Debian: http://bugs.debian.org/676006
-Last-Update: 2012-06-05
-Index: navit/navit/graphics/qt_qpainter/RenderArea.cpp
-===================================================================
---- navit.orig/navit/graphics/qt_qpainter/RenderArea.cpp	2012-06-05 23:16:42.000000000 +0200
-+++ navit/navit/graphics/qt_qpainter/RenderArea.cpp	2012-06-05 23:15:47.000000000 +0200
-@@ -239,13 +239,14 @@
- #else
- 	const char *text=str.toUtf8().constData();
- #endif
-+	char text1[2] = { '\0', '\0' };
- 	dbg(0,"enter text='%s' 0x%x (%d) key=%d\n", text, text[0], strlen(text), event->key());
- 	if (!text || !text[0] || text[0] == 0x7f) {
- 		dbg(0,"special key\n");
- 		switch (event->key()) {
- 		case 4099:
- 			{
--				text=(char []){NAVIT_KEY_BACKSPACE,'\0'};
-+				text1[0] = NAVIT_KEY_BACKSPACE;
- 			}
- 			break;
- 		case 4101:
-@@ -253,7 +254,7 @@
- 		QT_QPAINTER_CUSTOM_RETURN
- #endif
- 			{
--				text=(char []){NAVIT_KEY_RETURN,'\0'};
-+				text1[0] = NAVIT_KEY_RETURN;
- 			}
- 			break;
- 		case 4114:
-@@ -261,7 +262,7 @@
- 		QT_QPAINTER_CUSTOM_LEFT
- #endif
- 			{
--				text=(char []){NAVIT_KEY_LEFT,'\0'};
-+				text1[0] = NAVIT_KEY_LEFT;
- 			}
- 			break;
- 		case 4115:
-@@ -269,7 +270,7 @@
- 		QT_QPAINTER_CUSTOM_UP
- #endif
- 			{
--				text=(char []){NAVIT_KEY_UP,'\0'};
-+				text1[0] = NAVIT_KEY_UP;
- 			}
- 			break;
- 		case 4116:
-@@ -277,7 +278,7 @@
- 		QT_QPAINTER_CUSTOM_RIGHT
- #endif
- 			{
--				text=(char []){NAVIT_KEY_RIGHT,'\0'};
-+				text1[0] = NAVIT_KEY_RIGHT;
- 			}
- 			break;
- 		case 4117:
-@@ -285,10 +286,11 @@
- 		QT_QPAINTER_CUSTOM_DOWN
- #endif
- 			{
--				text=(char []){NAVIT_KEY_DOWN,'\0'};
-+				text1[0] = NAVIT_KEY_DOWN;
- 			}
- 			break;
- 		}
-+		if (text1[0]) text = text1;
- 	}
- 	callback_list_call_attr_1(this->cbl, attr_keypress, (void *)text);
- 	event->accept();
diff --git a/meta-oe/recipes-navigation/navit/navit_svn.bb b/meta-oe/recipes-navigation/navit/navit_svn.bb
index a8df317..6e81a4b 100644
--- a/meta-oe/recipes-navigation/navit/navit_svn.bb
+++ b/meta-oe/recipes-navigation/navit/navit_svn.bb
@@ -1,10 +1,9 @@
 require navit.inc
 
-SRCREV = "5159"
+SRCREV = "5310"
 PV = "0.2.0+svnr${SRCPV}"
 PR = "${INC_PR}.3"
 
 S = "${WORKDIR}/${PN}"
 SRC_URI += "svn://anonymous@navit.svn.sourceforge.net/svnroot/navit/trunk;module=navit;protocol=http \
-  file://taking-address-of-temporary-array.patch \
 "
-- 
1.8.0.2



