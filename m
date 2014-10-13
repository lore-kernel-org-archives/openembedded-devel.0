Return-Path: <net147@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id EDC9165D56
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Oct 2014 02:18:58 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id y10so4823287pdj.37
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Oct 2014 19:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=C9CkQXwHk36LbMaLIb4gPBTl03JgzPSCFbJUHp2KqVE=;
	b=hGeNuFEap0oC7rzG74Ydsx83MugUVuNT2NcREU+khzWl9C6p7txYIz2vubp0AX/L3b
	Qxm2WcQHqi696BtUQtHeXYRQkvtsq2PFfBfOmvZO9EkoXUnF45bmcz91sCZ0RBQEVJeM
	fo/ldkNyRAMevd1ytI7AYx1QedULeoAvzEnH2Se2qd5Pz4WXbFTyFKZ3Whpv+OymL231
	1kBWZESZ4b7Sn/2TZgdaIQofUgf/XktGL6g+qcbHyyy4164a2Jcs4oBpjtCZnh3LKkKm
	lN40HjtaQsGjlOkdTGuE9bDxQNGSLQhas3eGg2PMPNmKU6LiXjesbYB09f1w3j8NfD88
	B76Q==
X-Received: by 10.68.131.101 with SMTP id ol5mr544223pbb.128.1413166739499;
	Sun, 12 Oct 2014 19:18:59 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id ll4sm9729165pab.25.2014.10.12.19.18.58
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 12 Oct 2014 19:18:58 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Oct 2014 13:31:34 +1100
Message-Id: <1413167494-26584-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.1.2
Subject: [meta-qt5][PATCH] qtbase: fix path to external hostbindir binaries
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
X-List-Received-Date: Mon, 13 Oct 2014 02:18:59 -0000

This fixes syncqt.pl not being included in qtbase-tools.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../qt5/qtbase-git/0003-Add-external-hostbindir-option.patch       | 7 +++----
 recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch    | 7 +++----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch
index 88bb484..8723b79 100644
--- a/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch
@@ -149,7 +149,7 @@ diff --git a/qtbase.pro b/qtbase.pro
 index d6861cf..7fb58a3 100644
 --- a/qtbase.pro
 +++ b/qtbase.pro
-@@ -69,18 +69,26 @@ CONFIG -= qt
+@@ -69,18 +69,25 @@ CONFIG -= qt
  
  ### installations ####
  
@@ -159,7 +159,7 @@ index d6861cf..7fb58a3 100644
  qmake.path = $$[QT_HOST_BINS]
 +qmake.files = $$OUT_PWD/bin/qmake
 +!isEmpty(QT_EXTERNAL_HOST_BINS) {
-+   qmake.files = $$[QT_EXTERNAL_HOST_BINS]/bin/qmake
++   qmake.files = $$[QT_EXTERNAL_HOST_BINS]/qmake
 +}
  equals(QMAKE_HOST.os, Windows) {
 -   qmake.files = $$OUT_PWD/bin/qmake.exe
@@ -172,9 +172,8 @@ index d6861cf..7fb58a3 100644
  #syncqt
  syncqt.path = $$[QT_HOST_BINS]
  syncqt.files = $$PWD/bin/syncqt.pl
-+syncqt.files = $$PWD/bin/syncqt.pl
 +!isEmpty(QT_EXTERNAL_HOST_BINS) {
-+   syncqt.files = $$[QT_EXTERNAL_HOST_BINS]/bin/syncqt.pl
++   syncqt.files = $$[QT_EXTERNAL_HOST_BINS]/syncqt.pl
 +}
  INSTALLS += syncqt
  
diff --git a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
index d5df4f6..01d1e45 100644
--- a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
@@ -149,7 +149,7 @@ diff --git a/qtbase.pro b/qtbase.pro
 index d6861cf..7fb58a3 100644
 --- a/qtbase.pro
 +++ b/qtbase.pro
-@@ -69,18 +69,26 @@ CONFIG -= qt
+@@ -69,18 +69,25 @@ CONFIG -= qt
  
  ### installations ####
  
@@ -159,7 +159,7 @@ index d6861cf..7fb58a3 100644
  qmake.path = $$[QT_HOST_BINS]
 +qmake.files = $$OUT_PWD/bin/qmake
 +!isEmpty(QT_EXTERNAL_HOST_BINS) {
-+   qmake.files = $$[QT_EXTERNAL_HOST_BINS]/bin/qmake
++   qmake.files = $$[QT_EXTERNAL_HOST_BINS]/qmake
 +}
  equals(QMAKE_HOST.os, Windows) {
 -   qmake.files = $$OUT_PWD/bin/qmake.exe
@@ -172,9 +172,8 @@ index d6861cf..7fb58a3 100644
  #syncqt
  syncqt.path = $$[QT_HOST_BINS]
  syncqt.files = $$PWD/bin/syncqt.pl
-+syncqt.files = $$PWD/bin/syncqt.pl
 +!isEmpty(QT_EXTERNAL_HOST_BINS) {
-+   syncqt.files = $$[QT_EXTERNAL_HOST_BINS]/bin/syncqt.pl
++   syncqt.files = $$[QT_EXTERNAL_HOST_BINS]/syncqt.pl
 +}
  INSTALLS += syncqt
  
-- 
2.1.2


