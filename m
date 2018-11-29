Return-Path: <Fang.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 854C36C117
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Nov 2018 10:45:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wATAj1Lf017125
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Nov 2018 02:45:02 -0800 (PST)
Received: from pek-fjia-d2.wrs.com (128.224.155.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Thu, 29 Nov 2018 02:45:01 -0800
From: Fang Jia <fang.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 29 Nov 2018 18:48:23 +0800
Message-ID: <1543488504-15595-1-git-send-email-fang.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-java][PATCH 1/2] Revert "base-files: Define JAVA_HOME by default"
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
X-List-Received-Date: Thu, 29 Nov 2018 10:45:01 -0000
Content-Type: text/plain

This reverts commit ada652564f09756a81f54495cbc2091125239625.

When enable multilib on 64bit system, probably both base-file and
lib32-base-files are installed.
Since both packages want to modify the file "profile", then there
will be an error like:
"
Error: Transaction check error:
file /etc/profile conflicts between attempted installs of
lib32-base-files-3.0.14-r148.gpb_virt and
base-files-3.0.14-r148.gpb_virt
"
The task should be added into openjdk pacakge as postinst script.

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


