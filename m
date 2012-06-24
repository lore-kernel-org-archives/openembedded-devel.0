Received: from smtpi3.ngi.it ([88.149.128.33])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sbabic@denx.de>) id 1SijoQ-0006M3-0R
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jun 2012 12:12:58 +0200
Received: from paperina.lan (unknown [88.149.182.160])
	by smtpi3.ngi.it (Postfix) with ESMTP id BFA7931850E;
	Sun, 24 Jun 2012 12:02:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by paperina.lan (Postfix) with ESMTP id 88F46140A12E;
	Sun, 24 Jun 2012 12:02:10 +0200 (CEST)
Received: from paperina.lan ([127.0.0.1])
	by localhost (paperina.lan [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DhlyTjB+iL0L; Sun, 24 Jun 2012 12:02:08 +0200 (CEST)
Received: from papero.lan (papero.lan [192.168.2.247])
	by paperina.lan (Postfix) with ESMTP id 267DD140A102;
	Sun, 24 Jun 2012 12:02:08 +0200 (CEST)
From: Stefano Babic <sbabic@denx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jun 2012 12:01:56 +0200
Message-Id: <1340532116-6940-2-git-send-email-sbabic@denx.de>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1340532116-6940-1-git-send-email-sbabic@denx.de>
References: <1339759019-3272-1-git-send-email-sbabic@denx.de>
	<1340532116-6940-1-git-send-email-sbabic@denx.de>
Subject: [PATCH] Added recipe for libconfig
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
X-List-Received-Date: Sun, 24 Jun 2012 10:12:58 -0000

libconfig can be used to parse a configuration file
in a structured language, but still compact and more
suitable for embedded devices compared to XML.

Signed-off-by: Stefano Babic <sbabic@denx.de>
---
 .../recipes-support/libconfig/libconfig_1.4.8.bb   |   13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-oe/recipes-support/libconfig/libconfig_1.4.8.bb

diff --git a/meta-oe/recipes-support/libconfig/libconfig_1.4.8.bb b/meta-oe/recipes-support/libconfig/libconfig_1.4.8.bb
new file mode 100644
index 0000000..56e1356
--- /dev/null
+++ b/meta-oe/recipes-support/libconfig/libconfig_1.4.8.bb
@@ -0,0 +1,13 @@
+SUMMARY = "C/C++ Configuration File Library"
+DESCRIPTION = "processing of structured configuration files"
+SECTION = "libs"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fad9b3332be894bab9bc501572864b29"
+
+SRC_URI = "http://www.hyperrealm.com/${BPN}/${BP}.tar.gz \
+"
+
+SRC_URI[md5sum] = "36788da452e9fcfc8efb7661ef5d31ef"
+SRC_URI[sha256sum] = "18b1509fbf438a8c7f9b0af32284e458189b5f6dfd044f898926109f3c3c01ed"
+
+inherit autotools
-- 
1.7.9.5



