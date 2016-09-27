Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 02DEA607B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 05:55:55 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id s64so700583lfs.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 22:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Vb5Yu71Rr1lVfUypMMmom/11JcVpWE3Gu5mq9v1gmvE=;
	b=ImzKJPWjyi04FQ34wzajOFSQg2anEyOLelM67R/bez9k/Vi7OBHPi/MYCezAMSfk7i
	BSbF1Uq7oE6GdWvHSHYFpDO24tHBTmGZXSKkrurbGw+5fuXz0mKn5zkO1qpSNNyqEomG
	k7vQXqzXHLguENfFpD2Tzn5DNSAhST5EyerXoX/SVH9iNcIg14MTECGfsKV49fvUipC2
	lTf+QDnCSurgUgPv50r8dcrI8pN7A1KcF4W6ZhzfC619wb1JzedyzuG1xULj+SaPbuls
	5UhzjOmr9xEZrCVulp4Mq/8dzeKSCcYetQTUhBLfh+NnbNq6nXJKquoyGCryvtmBkj42
	rlMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Vb5Yu71Rr1lVfUypMMmom/11JcVpWE3Gu5mq9v1gmvE=;
	b=RjdCCXeOQmyuTTXK29ab63kSK3soULjFZHRz+XHw5UshI+ewWlyqXkZYO3i5LLY6IM
	JsVWgv+VFlqjEmE4+SXvgm0qF485tfr1SVgC8D/ckQg6LBdOHTtgKxz/CcjYYghQBZnL
	CLUog8hQYP163TjQ296I2bh3NVGn9yfNC0Za0MDCFYrcR45LXKHF0Jz+Lr7n7fzU6EYq
	SaXWdQFd0RpsyGYEn3bujTC8XnEPSLjGxiKvK0jcsRWuevKSXicth//jyrr84Mq9jB8Q
	xZVo32WvktvGqVtlU7PX8FH6/74CAEdquLLNs3KCAbhBrBBdXjTeDhDO76XA+RgOJgzo
	herw==
X-Gm-Message-State: AE9vXwPoPEzkZ1+6MAKKlE58qhTiwyG6VBvLNwPVGlIEa1vHP3TIeNRRXPercOLTshAH+w==
X-Received: by 10.194.161.166 with SMTP id xt6mr24238656wjb.165.1474955756364; 
	Mon, 26 Sep 2016 22:55:56 -0700 (PDT)
Received: from localhost.localdomain (p4FDF068E.dip0.t-ipconnect.de.
	[79.223.6.142]) by smtp.googlemail.com with ESMTPSA id
	f15sm1156668wmf.8.2016.09.26.22.55.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Sep 2016 22:55:55 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Sep 2016 07:55:32 +0200
Message-Id: <1474955733-30185-9-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1474955733-30185-1-git-send-email-schnitzeltony@googlemail.com>
References: <1474955733-30185-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 8/9] poppler: update to 0.47.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Sep 2016 05:55:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../0001-add-manadatory-options-to-find-qt4-qt5-moc.patch  | 14 +++++++-------
 .../poppler/{poppler_0.43.0.bb => poppler_0.47.0.bb}       |  4 ++--
 2 files changed, 9 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler_0.43.0.bb => poppler_0.47.0.bb} (93%)

diff --git a/meta-oe/recipes-support/poppler/poppler/0001-add-manadatory-options-to-find-qt4-qt5-moc.patch b/meta-oe/recipes-support/poppler/poppler/0001-add-manadatory-options-to-find-qt4-qt5-moc.patch
index 560b073..4e80d24 100644
--- a/meta-oe/recipes-support/poppler/poppler/0001-add-manadatory-options-to-find-qt4-qt5-moc.patch
+++ b/meta-oe/recipes-support/poppler/poppler/0001-add-manadatory-options-to-find-qt4-qt5-moc.patch
@@ -14,10 +14,10 @@ Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
  1 file changed, 8 insertions(+), 47 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 67599c0..40fa596 100644
+index c4cfc2c..8e961c7 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -622,25 +622,10 @@ AC_SUBST(POPPLER_QT4_LIBS)
+@@ -712,25 +712,10 @@ AC_SUBST(POPPLER_QT4_LIBS)
  AC_SUBST(POPPLER_QT4_TEST_LIBS)
  
  if test x$enable_poppler_qt4 = xyes; then
@@ -47,27 +47,27 @@ index 67599c0..40fa596 100644
    AC_SUBST(MOCQT4)
    AC_MSG_RESULT([$MOCQT4])
  fi
-@@ -679,34 +664,10 @@ AC_SUBST(POPPLER_QT5_LIBS)
+@@ -769,34 +754,10 @@ AC_SUBST(POPPLER_QT5_LIBS)
  AC_SUBST(POPPLER_QT5_TEST_LIBS)
  
  if test x$enable_poppler_qt5 = xyes; then
 -  AC_CHECK_TOOL(MOCQT5, moc)
 -  AC_MSG_CHECKING([for Qt5 moc])
 -  mocversion=`$MOCQT5 -v 2>&1`
--  mocversiongrep=`echo $mocversion | grep "Qt 5\|moc 5"`
+-  mocversiongrep=`echo $mocversion | grep -E "Qt 5|moc 5"`
 -  if test x"$mocversiongrep" != x"$mocversion"; then
 -    AC_MSG_RESULT([no])
 -    # moc was not the qt5 one, try with moc-qt5
 -    AC_CHECK_TOOL(MOCQT52, moc-qt5)
 -    AC_MSG_CHECKING([for Qt5 moc-qt5])
 -    mocversion=`$MOCQT52 -v 2>&1`
--    mocversiongrep=`echo $mocversion | grep "Qt 5\|moc-qt5 5\|moc 5"`
+-    mocversiongrep=`echo $mocversion | grep -E "Qt 5|moc-qt5 5|moc 5"`
 -    if test x"$mocversiongrep" != x"$mocversion"; then
 -      AC_CHECK_TOOL(QTCHOOSER, qtchooser)
 -      AC_MSG_CHECKING([for qtchooser])
 -      qt5tooldir=`QT_SELECT=qt5 qtchooser -print-env | grep QTTOOLDIR | cut -d '=' -f 2 | cut -d \" -f 2`
 -      mocversion=`$qt5tooldir/moc -v 2>&1`
--      mocversiongrep=`echo $mocversion | grep "Qt 5\|moc 5"`
+-      mocversiongrep=`echo $mocversion | grep -E "Qt 5|moc 5"`
 -      if test x"$mocversiongrep" != x"$mocversion"; then
 -        # no valid moc found
 -        enable_poppler_qt5=no;
@@ -87,5 +87,5 @@ index 67599c0..40fa596 100644
    AC_MSG_RESULT([$MOCQT5])
  fi
 -- 
-1.9.3
+2.5.5
 
diff --git a/meta-oe/recipes-support/poppler/poppler_0.43.0.bb b/meta-oe/recipes-support/poppler/poppler_0.47.0.bb
similarity index 93%
rename from meta-oe/recipes-support/poppler/poppler_0.43.0.bb
rename to meta-oe/recipes-support/poppler/poppler_0.47.0.bb
index 9abcd2c..071cfb2 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.43.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.47.0.bb
@@ -7,8 +7,8 @@ SRC_URI = " \
     file://0001-add-manadatory-options-to-find-qt4-qt5-moc.patch \
     file://0002-fix-gcc-6-math-ambiguous-errors.patch \
 "
-SRC_URI[md5sum] = "1d2b001663119855cdfbc0713dbfb9c6"
-SRC_URI[sha256sum] = "c720e26a26ee10b7ebc9e256d2ee7adcdb536cf85f9f1c4777a38f7f81fb2456"
+SRC_URI[md5sum] = "669b195ff24173d35cacf1d20b6fe4fa"
+SRC_URI[sha256sum] = "b872e7228fc34a71ce4b47a5aea2a57ae67528818fa846e1e0eda089319bd242"
 
 DEPENDS = "fontconfig zlib cairo lcms"
 
-- 
2.5.5


