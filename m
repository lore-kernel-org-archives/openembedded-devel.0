Return-Path: <Fang.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 68DB87CB2A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Feb 2019 03:23:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x1L3NQBW003817
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Feb 2019 19:23:26 -0800 (PST)
Received: from pek-fjia-d1.wrs.com (128.224.155.95) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.435.0;
	Wed, 20 Feb 2019 19:23:26 -0800
From: Fang Jia <fang.jia@windriver.com>
To: <git@andred.net>, <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Feb 2019 11:23:08 +0800
Message-ID: <1550719388-9980-2-git-send-email-fang.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1550719388-9980-1-git-send-email-fang.jia@windriver.com>
References: <1550719388-9980-1-git-send-email-fang.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] openjdk: add openjdk-config
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
X-List-Received-Date: Thu, 21 Feb 2019 03:23:36 -0000
Content-Type: text/plain

* Create a new package openjdk-config which used to set variable value
  for openjdk.
* The LICENSE file of openjdk-config is COPYING.MIT.
* Allow JAVA_HOME to be configured via a variable of the same name.
* Define JAVA_HOME by default in openjdk-config.sh file.

Signed-off-by: Fang Jia <fang.jia@windriver.com>
---
 recipes-core/openjdk/openjdk-config.bb             | 24 ++++++++++++++++++++++
 recipes-core/openjdk/openjdk-config/COPYING.MIT    | 17 +++++++++++++++
 .../openjdk/openjdk-config/openjdk-config.sh       | 11 ++++++++++
 3 files changed, 52 insertions(+)
 create mode 100644 recipes-core/openjdk/openjdk-config.bb
 create mode 100644 recipes-core/openjdk/openjdk-config/COPYING.MIT
 create mode 100644 recipes-core/openjdk/openjdk-config/openjdk-config.sh

diff --git a/recipes-core/openjdk/openjdk-config.bb b/recipes-core/openjdk/openjdk-config.bb
new file mode 100644
index 0000000..34f9356
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-config.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Configuration script to set variables"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+PR = "r1"
+
+SRC_URI = "file://COPYING.MIT \
+	   file://openjdk-config.sh \
+"
+
+S = "${WORKDIR}"
+
+# Set the default value
+JAVA_HOME ?= ""
+
+do_configure() {
+	sed -i "s%@JAVA_HOME@%${JAVA_HOME}%" openjdk-config.sh
+	sed -i "s%@libdir@%${libdir}%" openjdk-config.sh
+}
+
+do_install() {
+	install -d ${D}${sysconfdir}/profile.d
+	install -m 0755 openjdk-config.sh ${D}${sysconfdir}/profile.d/
+}
diff --git a/recipes-core/openjdk/openjdk-config/COPYING.MIT b/recipes-core/openjdk/openjdk-config/COPYING.MIT
new file mode 100644
index 0000000..fb950dc
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-config/COPYING.MIT
@@ -0,0 +1,17 @@
+Permission is hereby granted, free of charge, to any person obtaining a copy 
+of this software and associated documentation files (the "Software"), to deal 
+in the Software without restriction, including without limitation the rights 
+to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
+copies of the Software, and to permit persons to whom the Software is 
+furnished to do so, subject to the following conditions:
+
+The above copyright notice and this permission notice shall be included in 
+all copies or substantial portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
+IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
+FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
+AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
+LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
+OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
+THE SOFTWARE.
diff --git a/recipes-core/openjdk/openjdk-config/openjdk-config.sh b/recipes-core/openjdk/openjdk-config/openjdk-config.sh
new file mode 100644
index 0000000..34b49d6
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-config/openjdk-config.sh
@@ -0,0 +1,11 @@
+JAVA_HOME="@JAVA_HOME@"
+libdir="@libdir@"
+
+for dir in ${libdir}/jvm/*; do
+	if [ -x "${dir}/bin/java" ]; then
+		[ -z "${JAVA_HOME}" ] && JAVA_HOME="${dir}"
+	fi
+done
+if [ -n "${JAVA_HOME}" ]; then
+	export JAVA_HOME=${JAVA_HOME}
+fi
-- 
2.7.4


