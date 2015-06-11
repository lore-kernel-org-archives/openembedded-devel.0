Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B599660089
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jun 2015 09:17:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5B9H5cI010660
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jun 2015 02:17:05 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 11 Jun 2015 02:17:04 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 11 Jun 2015 17:16:49 +0800
Message-ID: <72985bd1e0b4b017cf9f02de152ecc145c1d8128.1434013953.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1434013953.git.yi.zhao@windriver.com>
References: <cover.1434013953.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 2/9] pm-qa: fix PN -> BPN for multilib
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
X-List-Received-Date: Thu, 11 Jun 2015 09:17:03 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb b/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
index 66804dd..7322df8 100644
--- a/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
+++ b/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
@@ -28,7 +28,7 @@ do_compile () {
 
 do_install () {
     install -d ${D}${bindir}
-    install -d ${D}${libdir}/${PN}
+    install -d ${D}${libdir}/${BPN}
 
     # Install the compiled binaries that were built in the previous step
     for x in `find . -name "*.c"`
@@ -45,7 +45,7 @@ do_install () {
         sed -i -e 's#..\/utils\/##' ${script}
 
         script_basename=`basename ${script}`
-        install -m 0755 $script ${D}${libdir}/${PN}/${script_basename}
+        install -m 0755 $script ${D}${libdir}/${BPN}/${script_basename}
     done
 
     # Install the shell scripts NOT in the $libdir directory since those
@@ -55,7 +55,7 @@ do_install () {
         # if the script includes any helper scripts from the $libdir
         # directory then change the source path to the absolute path
         # to reflect the install location of the helper scripts.
-        sed -i -e "s#source ../include#source ${libdir}/${PN}#g" ${script}
+        sed -i -e "s#source ../include#source ${libdir}/${BPN}#g" ${script}
         # Remove hardcoded relative paths
         sed -i -e 's#..\/utils\/##' ${script}
 
-- 
1.7.9.5


