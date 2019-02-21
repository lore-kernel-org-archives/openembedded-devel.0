Return-Path: <Fang.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EFF927CB5A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Feb 2019 03:23:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1L3Mw94023777
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Feb 2019 19:23:19 -0800
Received: from pek-fjia-d1.wrs.com (128.224.155.95) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.435.0;
	Wed, 20 Feb 2019 19:23:09 -0800
From: Fang Jia <fang.jia@windriver.com>
To: <git@andred.net>, <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Feb 2019 11:23:07 +0800
Message-ID: <1550719388-9980-1-git-send-email-fang.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/2] Revert "base-files: Define JAVA_HOME by default"
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
X-List-Received-Date: Thu, 21 Feb 2019 03:23:54 -0000
Content-Type: text/plain

This reverts commit ada652564f09756a81f54495cbc2091125239625.

When enable multilib on a 64-bit system, probably both base-file and
lib32-base-files are installed.
Then both packages want to modify the file "profile", there will be
an error like:
"
Error: Transaction check error:
file /etc/profile conflicts between attempted installs of
lib32-base-files-3.0.14-r148.gpb_virt and
base-files-3.0.14-r148.gpb_virt
"

The task can be added by adding a file to ${sysconfdir}/profile.d/.

Signed-off-by: Fang Jia <fang.jia@windriver.com>
---
 recipes-core/base-files/base-files_3.0.14.bbappend | 13 -------------
 1 file changed, 13 deletions(-)
 delete mode 100644 recipes-core/base-files/base-files_3.0.14.bbappend

diff --git a/recipes-core/base-files/base-files_3.0.14.bbappend b/recipes-core/base-files/base-files_3.0.14.bbappend
deleted file mode 100644
index 4651185..0000000
--- a/recipes-core/base-files/base-files_3.0.14.bbappend
+++ /dev/null
@@ -1,13 +0,0 @@
-do_install_append() {
-	cat >> ${D}${sysconfdir}/profile << EOT
-JAVA_HOME=""
-for dir in ${libdir}/jvm/*; do
-	if [ -x "\${dir}/bin/java" ]; then
-		[ -z "\${JAVA_HOME}" ] && JAVA_HOME="\${dir}"
-	fi
-done
-if [ -n "\${JAVA_HOME}" ]; then
-	export JAVA_HOME=\${JAVA_HOME}
-fi
-EOT
-}
-- 
2.7.4


