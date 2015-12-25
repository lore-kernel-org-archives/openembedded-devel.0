Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 289A7607A4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Dec 2015 07:56:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBP7uOdM014086
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2015 23:56:24 -0800
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 24 Dec 2015 23:56:24 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 25 Dec 2015 15:56:21 +0800
Message-ID: <e34a2ce6857f737cc71b220259ff251447a4f507.1451029460.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1451029460.git.jackie.huang@windriver.com>
References: <cover.1451029460.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-java][PATCH 01/15] java.bbclass: java missing classes during compile
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
X-List-Received-Date: Fri, 25 Dec 2015 07:56:26 -0000
Content-Type: text/plain

From: Amy Fong <amy.fong@windriver.com>

oe_makeclasspath is used to define the classpath argument passed to
javac for a number of packages. The current behaviour takes a number
args specifying jar files to look for and if the files exist, it adds
it to a specified variable.

On some builds, oe_makeclasspath cannot find the jar file.

oe_makeclasspath used an invalid test to see the package is native.
(testing if the build arch and package arch are the same, if so, native)
We test to see if PN matches *-native or *-nativesdk instead.

Signed-off-by: Amy Fong <amy.fong@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 classes/java.bbclass | 9 ++++++---
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
1.9.1


