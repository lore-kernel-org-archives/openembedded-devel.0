Return-Path: <amy.fong@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BE29760F50
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 21:03:21 +0000 (UTC)
Received: from yow-afong-lx2.ottawa.windriver.com (yow-afong-lx2.wrs.com
	[128.224.146.164])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8OL3MvJ013822
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Tue, 24 Sep 2013 14:03:22 -0700 (PDT)
Received: from afong by yow-afong-lx2.ottawa.windriver.com with local (Exim
	4.80) (envelope-from <amy.fong@windriver.com>)
	id 1VOZlS-0003gU-29; Tue, 24 Sep 2013 17:03:22 -0400
Date: Tue, 24 Sep 2013 17:03:22 -0400
From: Amy Fong <amy.fong@windriver.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130924210322.GA14153@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [meta-java][PATCH] java missign classes during compile
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
X-List-Received-Date: Tue, 24 Sep 2013 21:03:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From 2182b6f32502ce3e614dafa0d1292ab728613211 Mon Sep 17 00:00:00 2001
From: Amy Fong <amy.fong@windriver.com>
Date: Tue, 24 Sep 2013 16:59:38 -0400
Subject: [PATCH] java missing classes during compile

oe_makeclasspath uses an invalid test to see the package is native.
(testing if the build arch and package arch are the same, if so, native)

Rather, we test to see if PN is *-native or *-nativesdk.

Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 classes/java.bbclass |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/classes/java.bbclass b/classes/java.bbclass
index 464d8a8..ab51787 100644
--- a/classes/java.bbclass
+++ b/classes/java.bbclass
@@ -98,11 +98,14 @@ oe_makeclasspath() {
       case "$1" in
           -s)
               # take jar files from native staging if this is a -native recipe
-              if [ ${PACKAGE_ARCH} = ${BUILD_ARCH} ]; then
+              case "$PN" in
+              *-native|*-nativesdk)
                   dir=${STAGING_DATADIR_JAVA_NATIVE}
-              else
+                  ;;
+              *)
                   dir=${STAGING_DATADIR_JAVA}
-              fi
+                  ;;
+              esac
               ;;
           -*)
               bbfatal "oe_makeclasspath: unknown option: $1"
-- 
1.7.10.4


