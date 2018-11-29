Return-Path: <Fang.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 52A056D45C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Nov 2018 10:45:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wATAj3UP023301
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Nov 2018 02:45:04 -0800 (PST)
Received: from pek-fjia-d2.wrs.com (128.224.155.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Thu, 29 Nov 2018 02:45:03 -0800
From: Fang Jia <fang.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 29 Nov 2018 18:48:24 +0800
Message-ID: <1543488504-15595-2-git-send-email-fang.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1543488504-15595-1-git-send-email-fang.jia@windriver.com>
References: <1543488504-15595-1-git-send-email-fang.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-java][PATCH 2/2] openjdk-common: Define JAVA_HOME by default
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
X-List-Received-Date: Thu, 29 Nov 2018 10:45:03 -0000
Content-Type: text/plain

Use postinst script to set the JAVA_HOME by default.

Signed-off-by: Fang Jia <fang.jia@windriver.com>
---
 recipes-core/openjdk/openjdk-common.inc | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/recipes-core/openjdk/openjdk-common.inc b/recipes-core/openjdk/openjdk-common.inc
index 01a0a2a..aaf81f6 100644
--- a/recipes-core/openjdk/openjdk-common.inc
+++ b/recipes-core/openjdk/openjdk-common.inc
@@ -5,3 +5,17 @@ JDK_ARCH = "${@openjdk_build_helper_get_jdk_arch(d)}"
 
 # Provides the target architecture to the configure script.
 export LLVM_CONFIGURE_ARCH="${@openjdk_build_helper_get_llvm_configure_arch(d)}"
+
+pkg_postinst_${PN}() {
+	cat >> $D${sysconfdir}/profile << EOT
+JAVA_HOME=""
+for dir in ${libdir}/jvm/*; do
+        if [ -x "\${dir}/bin/java" ]; then
+                [ -z "\${JAVA_HOME}" ] && JAVA_HOME="\${dir}"
+        fi
+done
+if [ -n "\${JAVA_HOME}" ]; then
+        export JAVA_HOME=\${JAVA_HOME}
+fi
+EOT
+}
-- 
2.7.4


