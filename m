Return-Path: <amy.fong@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 406FD61037
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2013 15:23:03 +0000 (UTC)
Received: from yow-afong-lx2.ottawa.windriver.com (yow-afong-lx2.wrs.com
	[128.224.146.164])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7DFN35m001049
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Tue, 13 Aug 2013 08:23:03 -0700 (PDT)
Received: from afong by yow-afong-lx2.ottawa.windriver.com with local (Exim
	4.80) (envelope-from <amy.fong@windriver.com>)
	id 1V9GR4-0003u7-Mj; Tue, 13 Aug 2013 11:23:02 -0400
Date: Tue, 13 Aug 2013 11:23:02 -0400
From: Amy Fong <amy.fong@windriver.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130813152302.GA15003@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [meta-java] junit4 needs license file
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
X-List-Received-Date: Tue, 13 Aug 2013 15:23:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From 932e117d09a685ad567d36a1f2f48b2f265e62e2 Mon Sep 17 00:00:00 2001
From: Amy Fong <amy.fong@windriver.com>
Date: Tue, 13 Aug 2013 11:17:43 -0400
Subject: [PATCH] junit4 needs license file

Updating the license to CPL-1.0 to reflect one of the files under
common-licenses.

We add LIC_FILES_CHKSUM as the default configure rule requires this.

Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 recipes-core/junit/junit4_4.3.1.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-core/junit/junit4_4.3.1.bb b/recipes-core/junit/junit4_4.3.1.bb
index 6b4d158..d04a0bc 100644
--- a/recipes-core/junit/junit4_4.3.1.bb
+++ b/recipes-core/junit/junit4_4.3.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "JUnit is a testing framework for Java"
-LICENSE = "CPL"
+LICENSE = "CPL-1.0"
 AUTHOR = "junit.org"
 HOMEPAGE = "http://www.junit.org"
 
@@ -26,3 +26,5 @@ SRC_URI[md5sum] = "170f9645a41398388e8553b32ff5f630"
 SRC_URI[sha256sum] = "57d1e49ee3fd0dbdc0a68a852925c973af5c30b1725b6aa63bfb42df6f7c3349"
 
 BBCLASSEXTEND = "native"
+
+LIC_FILES_CHKSUM = "file://junit/runner/logo.gif;md5=893431c33109e8bbf736065d58841162"
-- 
1.7.10.4


