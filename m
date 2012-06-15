Received: from smtpi4.ngi.it ([88.149.128.104])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sbabic@denx.de>) id 1SfUlx-00080j-LN
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jun 2012 13:33:01 +0200
Received: from paperina.lan (unknown [88.149.182.160])
	by smtpi4.ngi.it (Postfix) with ESMTP id B22B442523;
	Fri, 15 Jun 2012 13:17:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by paperina.lan (Postfix) with ESMTP id 8DFAA140A0FA;
	Fri, 15 Jun 2012 13:17:13 +0200 (CEST)
Received: from paperina.lan ([127.0.0.1])
	by localhost (paperina.lan [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eMN8oRw+jjbo; Fri, 15 Jun 2012 13:17:10 +0200 (CEST)
Received: from papero.lan (papero.lan [192.168.2.247])
	by paperina.lan (Postfix) with ESMTP id AFE37140A0D0;
	Fri, 15 Jun 2012 13:17:10 +0200 (CEST)
From: Stefano Babic <sbabic@denx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jun 2012 13:16:57 +0200
Message-Id: <1339759019-3272-1-git-send-email-sbabic@denx.de>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH V2] Added recipe for libconfig
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Jun 2012 11:33:01 -0000

libconfig can be used to parse a configuration file
in a structured language, but still compact and more
suitable for embedded devices compared to XML.

Signed-off-by: Stefano Babic <sbabic@denx.de>
---

- V1 was sent to oe-core, comments redirect it as right place to meta-oe
- Drop PR to use the default value

 .../recipes-support/libconfig/libconfig_1.4.8.bb   |   13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-oe/recipes-support/libconfig/libconfig_1.4.8.bb

diff --git a/meta-oe/recipes-support/libconfig/libconfig_1.4.8.bb b/meta-oe/recipes-support/libconfig/libconfig_1.4.8.bb
new file mode 100644
index 0000000..ffde91f
--- /dev/null
+++ b/meta-oe/recipes-support/libconfig/libconfig_1.4.8.bb
@@ -0,0 +1,13 @@
+SUMMARY = "C/C++ Configuration File Library"
+DESCRIPTION = "processing of structured configuration files"
+SECTION = "libs"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fad9b3332be894bab9bc501572864b29"
+
+SRC_URI = "http://www.hyperrealm.com/libconfig/libconfig-1.4.8.tar.gz \
+"
+
+SRC_URI[md5sum] = "36788da452e9fcfc8efb7661ef5d31ef"
+SRC_URI[sha256sum] = "18b1509fbf438a8c7f9b0af32284e458189b5f6dfd044f898926109f3c3c01ed"
+
+inherit autotools
-- 
1.7.9.5



