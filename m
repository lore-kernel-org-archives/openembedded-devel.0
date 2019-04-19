Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 08ECC7CB25
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Apr 2019 23:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 56A26186E6;
	Sat, 20 Apr 2019 01:56:13 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 1fSPZvaMACV0; Sat, 20 Apr 2019 01:56:12 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id BE61B186E1;
	Sat, 20 Apr 2019 01:56:12 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A9F6D1A05E;
	Sat, 20 Apr 2019 01:56:12 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9E7C01A05C;
	Sat, 20 Apr 2019 01:56:12 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Sat, 20 Apr 2019 01:56:12 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 92BF41A75;
	Sat, 20 Apr 2019 01:56:12 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id x3JNuDkd003606;
	Sat, 20 Apr 2019 01:56:13 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id x3JNuDmk003605;
	Sat, 20 Apr 2019 01:56:13 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Apr 2019 01:56:02 +0200
Message-Id: <20190419235602.3553-2-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20190419235602.3553-1-pkj@axis.com>
References: <20190419235602.3553-1-pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [meta-webserver][PATCH 2/2] apache2: Correct packaging of build and doc related files
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
X-List-Received-Date: Fri, 19 Apr 2019 23:56:14 -0000

The build related files (${datadir}/${BPN}/build and ${bindir}/apxs)
belong in the -dev package, and the manual belong in the -doc package.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

No idea why these files were moved to the main package in the 2.4.39
update, but it makes no sense. The build files and apxs are only needed
if you build on target, and that's what -dev is for, and the manual
obviously belongs in the -doc package.

 meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb
index c6961ef9b..2bd21f7d1 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb
@@ -184,12 +184,17 @@ CONFFILES_${PN} = "${sysconfdir}/${BPN}/httpd.conf \
 
 # We override here rather than append so that .so links are
 # included in the runtime package rather than here (-dev)
-# and to get icons, error into the -dev package
-FILES_${PN}-dev = "${datadir}/${BPN}/icons \
+# and to get build, icons, error into the -dev package
+FILES_${PN}-dev = "${datadir}/${BPN}/build \
+                   ${datadir}/${BPN}/icons \
                    ${datadir}/${BPN}/error \
                    ${includedir}/${BPN} \
+                   ${bindir}/apxs \
                   "
 
+# Add the manual to -doc
+FILES_${PN}-doc += " ${datadir}/${BPN}/manual"
+
 FILES_${PN}-scripts += "${bindir}/dbmmanage"
 
 # Override this too - here is the default, less datadir
-- 
2.12.0


