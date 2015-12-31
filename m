Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4869060796
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Dec 2015 09:26:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBV9QIRr028175
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Dec 2015 01:26:19 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 31 Dec 2015 01:26:17 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Dec 2015 17:26:34 +0800
Message-ID: <1451553994-28930-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-java][PATCH] classpath: fix invalid options
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
X-List-Received-Date: Thu, 31 Dec 2015 09:26:19 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

After updated to version 0.99, the following options
became invalid:

* --with-ecj: use JAVAC env variable instead
* --with-fastjar: change to --with-jar
* --with-vm: uae JAVA env variable instead
* --disable-qt4-peer: invalid even in 0.93, just drop it.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 recipes-core/classpath/classpath.inc | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/recipes-core/classpath/classpath.inc b/recipes-core/classpath/classpath.inc
index 1bdfd78..2be849b 100644
--- a/recipes-core/classpath/classpath.inc
+++ b/recipes-core/classpath/classpath.inc
@@ -28,24 +28,21 @@ SRC_URI = "${GNU_MIRROR}/classpath/classpath-${PV}.tar.gz"
 S = "${WORKDIR}/${PBN}-${PV}"
 
 export JAVA = "java"
+export JAVAC = "javac"
 
 EXTRA_OECONF = "\
   --with-glibj \
-  --with-ecj=javac \
-  --with-fastjar=fastjar \
+  --with-jar=${STAGING_BINDIR_NATIVE}/fastjar \
   --includedir=${includedir}/classpath \
-  --with-vm=java \
   --disable-Werror \
   --with-antlr-jar=${STAGING_DATADIR_JAVA_NATIVE}/antlr.jar \
   --with-gmp=${STAGING_LIBDIR}/.. \
   --disable-alsa \
   --disable-dssi \
-  --disable-qt4-peer \
   --disable-plugin \
   --enable-gconf-peer \
   --enable-gtk-peer \
   --enable-local-sockets \
-  --with-vm=java \
   "
 
 
-- 
1.9.1


