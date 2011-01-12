Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1PcwmC-0002DU-Ol
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 10:13:56 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1Pcwlg-00012I-AE by authid <stefan@sostec.de> with cram_md5;
	Wed, 12 Jan 2011 10:13:27 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>)
	id 1Pcwle-0000ig-DP; Wed, 12 Jan 2011 10:13:22 +0100
From: Stefan Schmidt <stefan@buglabs.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Jan 2011 10:13:17 +0100
Message-Id: <1294823599-2669-1-git-send-email-stefan@buglabs.net>
X-Mailer: git-send-email 1.7.2.3
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Cc: Stefan Schmidt <stefan@buglabs.net>
Subject: [PATCH 1/3] bug-java-library.bbclass: Add a class to install jar files without symlinks
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
X-List-Received-Date: Wed, 12 Jan 2011 09:13:56 -0000


Signed-off-by: Stefan Schmidt <stefan@buglabs.net>
---
 classes/bug-java-library.bbclass |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 classes/bug-java-library.bbclass

diff --git a/classes/bug-java-library.bbclass b/classes/bug-java-library.bbclass
new file mode 100644
index 0000000..3a76a55
--- /dev/null
+++ b/classes/bug-java-library.bbclass
@@ -0,0 +1,17 @@
+# We do not want to have symlinks for jar files
+
+inherit java-library
+
+# File name of the libraries' main Jar file (no version in name)
+JARFILENAME = "${BPN}.jar"
+
+# We do not want symlinks for jar files
+ALTJARFILENAMES = ""
+
+java_install() {
+  oe_jarinstall ${JARFILENAME}
+}
+
+java_stage() {
+  oe_jarinstall -s ${JARFILENAME}
+}
-- 
1.7.2.3



