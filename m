Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 414687704D
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Sep 2015 00:29:03 +0000 (UTC)
Received: by igcpb10 with SMTP id pb10so27780760igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Sep 2015 17:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MW0fKKBXG9adBNcsdN3hUzZVgXr8IZOKsTBesCuwd1M=;
	b=rfXGNxG9jt9twuM4Nw6U1t7yqVU81IV75iwzutS4/JZPAcSotzEBJrX+7bQ1nZnt3i
	IAKF8bANgBh21zoBcHnlHgJqB5xKNp6Bdjs+e1JBUcgJiSl6RMPI1OjagSmyhGx8K20g
	n8epCHfvQyE0mdIaE5MxODkGd01jPjI1H8TIGooVubp+Z0ef9zqvcxqLkxBc+qL+lLDF
	tFpFgaWxJBUdDtLP6qBSwtkQ1+yUOUW7fhCDfypHSINTh5O7mssxw4WHMs2BX6Uw5Xaw
	akvpZ9vB/J2f41FfcIG9W9lYDN5SItcyMzZpa5JKVQy1beJeIaqamnTeLYijk2Y2O18h
	at7A==
X-Received: by 10.50.30.106 with SMTP id r10mr12252301igh.69.1441412943929;
	Fri, 04 Sep 2015 17:29:03 -0700 (PDT)
Received: from localhost.localdomain (s206-116-3-180.bc.hsia.telus.net.
	[206.116.3.180]) by smtp.gmail.com with ESMTPSA id
	c64sm2541968ioc.13.2015.09.04.17.29.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 Sep 2015 17:29:03 -0700 (PDT)
From: Adam YH Lee <adam.yh.lee@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Sep 2015 17:28:31 -0700
Message-Id: <1441412911-29933-3-git-send-email-adam.yh.lee@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1441412911-29933-1-git-send-email-adam.yh.lee@gmail.com>
References: <1441412911-29933-1-git-send-email-adam.yh.lee@gmail.com>
Subject: [meta-qt5 2/2] Use `mkdir -p` when creating `/usr/bin`
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
X-List-Received-Date: Sat, 05 Sep 2015 00:29:05 -0000

When QT_DIR_NAME is altered, /usr/bin` is checked. This directory
is more often than not already created. Hence `mkdir` with `-p` should
be used. Currently it results in a build failure since the directory
already exists.

Signed-off-by: Adam YH Lee <adam.yh.lee@gmail.com>
---
 recipes-qt/qt5/qtbase_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 284b7b9..62690c3 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -172,7 +172,7 @@ do_configure() {
     # we need symlink in path relative to source, because
     # EffectivePaths:Prefix is relative to qmake location
     if [ ! -e ${B}/bin/qmake ]; then
-        mkdir ${B}/bin
+        mkdir -p ${B}/bin
         ln -sf ${OE_QMAKE_QMAKE_ORIG} ${B}/bin/qmake
     fi
 
-- 
2.1.4


