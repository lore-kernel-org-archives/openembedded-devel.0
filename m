Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 637C673167
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Dec 2015 07:56:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBP7uUUC005307
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2015 23:56:30 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 24 Dec 2015 23:56:30 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 25 Dec 2015 15:56:25 +0800
Message-ID: <5bd7495feb1eb5876c419b9f41e52b7c52234118.1451029460.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1451029460.git.jackie.huang@windriver.com>
References: <cover.1451029460.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-java][PATCH 05/15] base-files: Define JAVA_HOME by default
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
X-List-Received-Date: Fri, 25 Dec 2015 07:56:29 -0000
Content-Type: text/plain

From: Amy Fong <amy.fong@windriver.com>

In the default /etc/profile, search for and define JAVA_HOME
in the environment variables.

Signed-off-by: Amy Fong <amy.fong@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 recipes-core/base-files/base-files_3.0.14.bbappend | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 recipes-core/base-files/base-files_3.0.14.bbappend

diff --git a/recipes-core/base-files/base-files_3.0.14.bbappend b/recipes-core/base-files/base-files_3.0.14.bbappend
new file mode 100644
index 0000000..4651185
--- /dev/null
+++ b/recipes-core/base-files/base-files_3.0.14.bbappend
@@ -0,0 +1,13 @@
+do_install_append() {
+	cat >> ${D}${sysconfdir}/profile << EOT
+JAVA_HOME=""
+for dir in ${libdir}/jvm/*; do
+	if [ -x "\${dir}/bin/java" ]; then
+		[ -z "\${JAVA_HOME}" ] && JAVA_HOME="\${dir}"
+	fi
+done
+if [ -n "\${JAVA_HOME}" ]; then
+	export JAVA_HOME=\${JAVA_HOME}
+fi
+EOT
+}
-- 
1.9.1


