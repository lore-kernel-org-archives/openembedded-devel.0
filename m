Return-Path: <paul.betafive@gmail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5BBF165ED4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Apr 2014 19:14:17 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id t61so6712609wes.17
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Apr 2014 12:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=esCsjsZERR+lhHfMzGgg64ru/k3YPxVIxnGO+vvXRXE=;
	b=DrxkUNoObO3J3WICWNyk5g78fC6MjS2MUIeu39cnlMYwldzxzCboJ1Uk15CFbKinyd
	aej1+gE7cW75mEEgxd+9yzPWVlVn08lErPZZR/7NKBAa2UZ3AczabZ+FrhcvIz1IcDNW
	nGrFVVnjKhIVLzy+Llt/zNF1U+C7yv3dMZeBKBD2vXERAWHH2FzFs5Oso++WZdsA/TCz
	rbIaEC4JJB0yopJjFi4rOQj4ZcBmMpBe4xDxnWRecBjr9DmYjN2zZXb1tPUrjWgQCjXm
	2Bxh50/rgdV5DqJO8tuQlWvgd3NkmP/8Zoebeviu0p3szYsrPdtqndy+OutcVlDUh7Vq
	e62g==
X-Received: by 10.180.14.199 with SMTP id r7mr3389511wic.0.1397330058051;
	Sat, 12 Apr 2014 12:14:18 -0700 (PDT)
Received: from desktop.betafive.co.uk
	(cpc66027-shep11-2-0-cust140.8-3.cable.virginm.net. [81.110.75.141])
	by mx.google.com with ESMTPSA id r4sm16930245wjz.28.2014.04.12.12.14.16
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 12 Apr 2014 12:14:16 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Apr 2014 20:14:09 +0100
Message-Id: <1397330049-20282-2-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <1397330049-20282-1-git-send-email-paul@paulbarker.me.uk>
References: <1397330049-20282-1-git-send-email-paul@paulbarker.me.uk>
Subject: [PATCH] vim: Upgrade to v7.4.258
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
X-List-Received-Date: Sat, 12 Apr 2014 19:14:18 -0000

The patch against configure.in was resubmitted to the vim mailing list and was
merged into the upstream sources so is no longer needed.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 .../vim/files/configure.in_remove_CC_quotes.patch       | 17 -----------------
 .../vim/{vim_7.4.155.bb => vim_7.4.258.bb}              |  5 ++---
 2 files changed, 2 insertions(+), 20 deletions(-)
 delete mode 100644 meta-oe/recipes-support/vim/files/configure.in_remove_CC_quotes.patch
 rename meta-oe/recipes-support/vim/{vim_7.4.155.bb => vim_7.4.258.bb} (96%)

diff --git a/meta-oe/recipes-support/vim/files/configure.in_remove_CC_quotes.patch b/meta-oe/recipes-support/vim/files/configure.in_remove_CC_quotes.patch
deleted file mode 100644
index c8cfe8e..0000000
--- a/meta-oe/recipes-support/vim/files/configure.in_remove_CC_quotes.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-upstream: http://groups.google.com/group/vim_dev/browse_thread/thread/5685c3b859e3c793# 
-status: reported upstream
---- vim72-orig/src/configure.in	2010-09-29 19:13:33.000000000 +0200
-+++ vim72/src/configure.in	2010-09-29 19:17:07.000000000 +0200
-@@ -35,10 +35,10 @@
- fi
- if test "$GCC" = yes; then
-   dnl method that should work for nearly all versions
--  gccversion=`"$CC" -dumpversion`
-+  gccversion=`$CC -dumpversion`
-   if test "x$gccversion" = "x"; then
-     dnl old method; fall-back for when -dumpversion doesn't work
--    gccversion=`"$CC" --version | sed -e '2,$d' -e 's/darwin.//' -e 's/^[[^0-9]]*\([[0-9]]\.[[0-9.]]*\).*$/\1/g'`
-+    gccversion=`$CC --version | sed -e '2,$d' -e 's/darwin.//' -e 's/^[[^0-9]]*\([[0-9]]\.[[0-9.]]*\).*$/\1/g'`
-   fi
-   dnl version 4.0.1 was reported to cause trouble on Macintosh by Marcin Dalecki
-   if test "$gccversion" = "3.0.1" -o "$gccversion" = "3.0.2" -o "$gccversion" = "4.0.1"; then
diff --git a/meta-oe/recipes-support/vim/vim_7.4.155.bb b/meta-oe/recipes-support/vim/vim_7.4.258.bb
similarity index 96%
rename from meta-oe/recipes-support/vim/vim_7.4.155.bb
rename to meta-oe/recipes-support/vim/vim_7.4.258.bb
index 0d98e7a..878c79e 100644
--- a/meta-oe/recipes-support/vim/vim_7.4.155.bb
+++ b/meta-oe/recipes-support/vim/vim_7.4.258.bb
@@ -6,9 +6,8 @@ RSUGGESTS_${PN} = "diffutils"
 LICENSE = "vim"
 LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;md5=b779e18be6ed77facc770691c967b8f8"
 
-SRC_URI = "hg://vim.googlecode.com/hg/;protocol=https;module=vim \
-	   file://configure.in_remove_CC_quotes.patch;patchdir=.."
-SRCREV = "v7-4-155"
+SRC_URI = "hg://vim.googlecode.com/hg/;protocol=https;module=vim"
+SRCREV = "v7-4-258"
 
 S = "${WORKDIR}/${PN}/src"
 
-- 
1.9.2


