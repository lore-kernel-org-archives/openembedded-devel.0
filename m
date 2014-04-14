Return-Path: <pirobk@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9201165DE0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Apr 2014 09:54:56 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id d49so6346303eek.41
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Apr 2014 02:54:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=Ckbh/30GpNYBEBKeiAIO6E+jAc6hE+240WDIA2Qqpp0=;
	b=HiywiJR9WhimeCG5MDSjzcOx7LmBDlK+EqH/sDQkmTdQEh4k9gnW2OSVwIsdJQH2hB
	mFG7kuQYfi8wf7rBiVTgOi7STnAYQgEum6BTUDomZc8K8MDLOsIPql2mJ5qo9gl4VUHc
	2sZY0FFz5OCeMtumdj90nL/4yBlzCiT0bNbgTBq6ROsaPJffeO8QieyQRu6H9oq1XI/E
	vN2gfYzREb267LaNdNiVnC+vMMYw3CI2mly5Lw7kGxpcbMhrfDmf/+Wc3IZv/8t/+6Sm
	saGJpnKVqD7S0KefdHBYlQJzlgiPo09qAEAmuRHTSj1lX+mWqzOhBcnZ2fozLmV6nhVC
	fPFA==
X-Received: by 10.15.43.77 with SMTP id w53mr50446385eev.10.1397469296873;
	Mon, 14 Apr 2014 02:54:56 -0700 (PDT)
Received: from lx.fritz.box (p5DCFD29F.dip0.t-ipconnect.de. [93.207.210.159])
	by mx.google.com with ESMTPSA id
	l42sm39747685eew.19.2014.04.14.02.54.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Apr 2014 02:54:56 -0700 (PDT)
From: =?UTF-8?q?Bj=C3=B6rn=20Krombholz?= <b.krombholz@pironex.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Apr 2014 11:54:36 +0200
Message-Id: <1397469276-26939-1-git-send-email-b.krombholz@pironex.de>
X-Mailer: git-send-email 1.9.2
MIME-Version: 1.0
Cc: =?UTF-8?q?Bj=C3=B6rn=20Krombholz?= <b.krombholz@pironex.de>
Subject: [meta-oe][PATCH v2] qwt-e: qwt 6.1.0 FTBFS fix for qt-embedded targets
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
X-List-Received-Date: Mon, 14 Apr 2014 09:54:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

QWT 6.1.0 changed the handling of the QT_INFIX variable.
Builds with any QT_INFIX defined will fail as the generated qmake TARGET
is always libqwt.* ignoring the INFIX. Sub-projects like designer respect
the INFIX variable however and won't find the libqwtE*.so.

Signed-off-by: Björn Krombholz <b.krombholz@pironex.de>
---
For yocto-1.4 branch, no QWT 6.1.0 in 1.5+ yet.

v2: removed PR/INC_PR, moved the SRC_URI modification to the .bb file 
as it is only useful for qwt-e and the particular version 6.1.0.

 meta-oe/recipes-qt/qwt/files/qwt-e_qt_infix.patch | 13 +++++++++++++
 meta-oe/recipes-qt/qwt/qwt-e_6.1.0.bb             |  3 +++
 2 files changed, 16 insertions(+)
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
index 7694514..4d23bc0 100644
--- a/meta-oe/recipes-qt/qwt/qwt-e_6.1.0.bb
+++ b/meta-oe/recipes-qt/qwt/qwt-e_6.1.0.bb
@@ -2,6 +2,9 @@ inherit qt4e
 
 require qwt.inc
 
+SRC_URI += "file://qwt-e_qt_infix.patch \
+"
+
 SRC_URI[qwt.md5sum] = "aef0437b37f191067a6a9dc01c30ba64"
 SRC_URI[qwt.sha256sum] = "a7e3d9f1db917d186a973c5f04a316bc9607c7c35794d7a16de323aba5e17402"
 
-- 
1.9.2


