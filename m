Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1CF3971A6F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Oct 2016 11:17:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u9KBHx9b019527
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Oct 2016 04:18:00 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 20 Oct 2016 04:17:59 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 20 Oct 2016 07:17:58 -0400
Message-ID: <1476962278-254723-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] rsnapshot: update to 1.4.2
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
X-List-Received-Date: Thu, 20 Oct 2016 11:18:02 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

* update rsnapshot from 1.3.1 to 1.4.2
* fix configure error:
  configure.ac:302: file 't/include.ac' does not exist

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb b/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
index d680511..1ebbb40 100644
--- a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
+++ b/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
@@ -20,8 +20,8 @@ RDEPENDS_${PN} = "rsync \
                   perl-module-overloading \
                  "
 
-SRCREV = "1047cbb57937c29233388e2fcd847fecd3babe74"
-PV = "1.3.1+git${SRCPV}"
+SRCREV = "27209563f924a22f510698ea225f53ea52f07cb4"
+PV = "1.4.2+git${SRCPV}"
 
 SRC_URI = "git://github.com/DrHyde/${BPN};branch=master;protocol=git \
            file://configure-fix-cmd_rsync.patch \
@@ -41,3 +41,11 @@ EXTRA_OECONF += "--without-cp \
                  --without-rsync \
                  ac_cv_path_PERL=${bindir}/perl \
                 "
+
+# Create 't/include.ac' before starting the autoreconf to fix configure
+# error: configure.ac:302: file 't/include.ac' does not exist
+do_configure_prepend(){
+	saved_dir=`pwd`
+	cd ${S}; ./autogen.sh
+	cd ${saved_dir}
+}
-- 
2.8.1


