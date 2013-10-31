Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id A6D446AA20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2013 11:22:09 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id b45so1599213eek.15
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2013 04:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=8iJ2oRqwqwCascU3pmAn7bL4UH0TjTGcgiKhtS8+7us=;
	b=r8kpKeU10xt1UltUhdhRILdpge01fB8LiVRrMToGnHRVH0Hs4/0kMZ+uAaSBiC3rgE
	xsTELi38tFZ9AARcjXaA2gWN+nXPA3c8FvJl5WHJEIduyfhS7I6GmpwOn7g5WQjFCr+u
	X97gTEgE85ygPHq4ovHm8zjXWzOBr6ZG7/+wHOfUVo0h6UXzTiBl89X1t/vf7mkphw0U
	HmTu1HznJVMr+Dp2T0O/wAVq+G+OimC+P7Zt9B+mBwEsUIDPzfTNis02Oamw3V7+O6MS
	8wYFgdSQkQ7ISnvznKXnguroLGgwOccuiJXCNJym5LeFwOAffNI0OztNKHZqv3/YY0V8
	9RBw==
X-Received: by 10.15.44.8 with SMTP id y8mr2523649eev.38.1383218531185;
	Thu, 31 Oct 2013 04:22:11 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id e13sm7338335eeu.4.2013.10.31.04.22.10
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Oct 2013 04:22:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Oct 2013 12:22:08 +0100
Message-Id: <1383218529-12713-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.2
Subject: [meta-oe][PATCH 1/2] log4cplus: Fix LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 31 Oct 2013 11:22:10 -0000

* was probably broken since it was added in:
  commit a506a9efc86cda9dbf36cd916dbbfb1ae2162c45
  Author: Maxin B. John <maxin.john@enea.com>
  Date:   Tue Aug 27 07:55:14 2013 +0000
  Subject: log4cplus: add recipe

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/log4cplus/log4cplus_1.1.1.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/log4cplus/log4cplus_1.1.1.bb b/meta-oe/recipes-devtools/log4cplus/log4cplus_1.1.1.bb
index e0ae1e6..9e08a64 100644
--- a/meta-oe/recipes-devtools/log4cplus/log4cplus_1.1.1.bb
+++ b/meta-oe/recipes-devtools/log4cplus/log4cplus_1.1.1.bb
@@ -4,9 +4,7 @@ HOMEPAGE = "http://sourceforge.net/projects/log4cplus/"
 BUGTRACKER = "http://sourceforge.net/p/log4cplus/bugs/"
 
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://INSTALL;md5=fd3fffde3e364ca1fb46c81b741a766a"
-
-PR = "r0"
+LIC_FILES_CHKSUM = "file://INSTALL;md5=0278479fa183a2ff8ab216669424b764"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/log4cplus/log4cplus-stable/${PV}/log4cplus-${PV}.tar.gz"
 
-- 
1.8.4.2


