Return-Path: <pirobk@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id A374765DFC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Apr 2014 16:25:15 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id b15so4307101eek.20
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Apr 2014 09:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=ZXUiiYqth9d97Qvs1WIeR2qlVhYTElWyG2PIVM0EbKE=;
	b=fIOzac+8XqqDjOagDcgB+DZoepJzf7uTGEgPCPnKGWul8IECK1yn9SFlCgGUVqOmQ7
	7IoomjFuM4qN8h7Gw5f3djniANaqul8+yoyNCItqRAmwACybKZisYKM8sB1gJRXda/Eh
	UbaeHz/hZO/InSM7dKTnLjzHD0dVXNIQAx0F/QfeWlpUn5fAal6RdGez858U9MEGTy1F
	+6+khIUkYSamSwlIDWRCK5LCoWV2OAv8CO7tVINz/yI+gVmE1fuhK+nInWsou065yN4g
	mIGzU4s9gbopL92oxEqHLnZVTB9ym+0pWQZVUWAcrNxeEdTlc5HhHKbG3vLDGgiBJUBJ
	9N0g==
X-Received: by 10.14.211.66 with SMTP id v42mr29896000eeo.31.1397233516639;
	Fri, 11 Apr 2014 09:25:16 -0700 (PDT)
Received: from lx.fritz.box (p5DCFD2E5.dip0.t-ipconnect.de. [93.207.210.229])
	by mx.google.com with ESMTPSA id
	4sm18685066eeq.33.2014.04.11.09.25.15 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 11 Apr 2014 09:25:16 -0700 (PDT)
From: =?UTF-8?q?Bj=C3=B6rn=20Krombholz?= <b.krombholz@pironex.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Apr 2014 18:23:43 +0200
Message-Id: <1397233423-26218-1-git-send-email-b.krombholz@pironex.de>
X-Mailer: git-send-email 1.9.2
MIME-Version: 1.0
Cc: =?UTF-8?q?Bj=C3=B6rn=20Krombholz?= <b.krombholz@pironex.de>
Subject: [meta-oe][PATCH 1/1] qwt-e: qwt 6.1.0 FTBFS fix for qt-embedded targets
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
X-List-Received-Date: Fri, 11 Apr 2014 16:25:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- qwt 6.1.0 changed the handling of the QT_INFIX variable. Builds with any
  QT_INFIX defined will fail as the generated qmake TARGET is always
  libqwt.* ignoring the INFIX, but sub-projects like designer respect the
  INFIX variable.
- add PR/INC_PR to force recompile.

Signed-off-by: Björn Krombholz <b.krombholz@pironex.de>
---
for yocto-1.4 branch, 1.5 is still on qwt 6.0.1
 meta-oe/recipes-qt/qwt/files/qwt-e_qt_infix.patch | 13 +++++++++++++
 meta-oe/recipes-qt/qwt/qwt-e_6.1.0.bb             |  2 ++
 meta-oe/recipes-qt/qwt/qwt.inc                    |  5 ++++-
 meta-oe/recipes-qt/qwt/qwt_6.1.0.bb               |  2 ++
 4 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-qt/qwt/files/qwt-e_qt_infix.patch

diff --git a/meta-oe/recipes-qt/qwt/files/qwt-e_qt_infix.patch b/meta-oe/recipes-qt/qwt/files/qwt-e_qt_infix.patch
new file mode 100644
index 0000000..3a6fb64
--- /dev/null
+++ b/meta-oe/recipes-qt/qwt/files/qwt-e_qt_infix.patch
@@ -0,0 +1,13 @@
+Index: qwt-6.1.0/qwtfunctions.pri
+===================================================================
+--- qwt-6.1.0.orig/qwtfunctions.pri	2014-04-11 16:25:59.291152505 +0200
++++ qwt-6.1.0/qwtfunctions.pri	2014-04-11 16:26:25.749892402 +0200
+@@ -12,7 +12,7 @@
+ defineReplace(qwtLibraryTarget) {
+ 
+     unset(LIBRARY_NAME)
+-    LIBRARY_NAME = $$1
++    LIBRARY_NAME = $$1$${QT_LIBINFIX}
+ 
+     mac:contains(QWT_CONFIG, QwtFramework) {
+ 
diff --git a/meta-oe/recipes-qt/qwt/qwt-e_6.1.0.bb b/meta-oe/recipes-qt/qwt/qwt-e_6.1.0.bb
index 7694514..3d46a7a 100644
--- a/meta-oe/recipes-qt/qwt/qwt-e_6.1.0.bb
+++ b/meta-oe/recipes-qt/qwt/qwt-e_6.1.0.bb
@@ -2,6 +2,8 @@ inherit qt4e
 
 require qwt.inc
 
+PR = "${INC_PR}.0"
+
 SRC_URI[qwt.md5sum] = "aef0437b37f191067a6a9dc01c30ba64"
 SRC_URI[qwt.sha256sum] = "a7e3d9f1db917d186a973c5f04a316bc9607c7c35794d7a16de323aba5e17402"
 
diff --git a/meta-oe/recipes-qt/qwt/qwt.inc b/meta-oe/recipes-qt/qwt/qwt.inc
index 0ac71bf..bc65db6 100644
--- a/meta-oe/recipes-qt/qwt/qwt.inc
+++ b/meta-oe/recipes-qt/qwt/qwt.inc
@@ -5,8 +5,11 @@ SECTION = "libs"
 LICENSE = "QWTv1.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dac2743472b0462ff3cfb4af42051c88"
 
+INC_PR = "r1"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/qwt/qwt/6.1.0/qwt-${PV}.tar.bz2;name=qwt \
-           file://qwt6-fix-linking-with-ld-gold.patch"
+           file://qwt6-fix-linking-with-ld-gold.patch \
+           file://qwt-e_qt_infix.patch "
 
 S = "${WORKDIR}/qwt-${PV}"
 
diff --git a/meta-oe/recipes-qt/qwt/qwt_6.1.0.bb b/meta-oe/recipes-qt/qwt/qwt_6.1.0.bb
index 97a53a8..eb12c1a 100644
--- a/meta-oe/recipes-qt/qwt/qwt_6.1.0.bb
+++ b/meta-oe/recipes-qt/qwt/qwt_6.1.0.bb
@@ -2,6 +2,8 @@ inherit qt4x11
 
 require qwt.inc
 
+PR = "${INC_PR}.0"
+
 SRC_URI[qwt.md5sum] = "aef0437b37f191067a6a9dc01c30ba64"
 SRC_URI[qwt.sha256sum] = "a7e3d9f1db917d186a973c5f04a316bc9607c7c35794d7a16de323aba5e17402"
 
-- 
1.9.2


