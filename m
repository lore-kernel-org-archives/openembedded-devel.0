Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1NrY4X-0005gD-L7
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 15:48:49 +0100
Received: from localhost.localdomain (build2.altell.local [192.168.1.26])
	by mail.altell.local (Postfix) with ESMTP id DF957685D5;
	Tue, 16 Mar 2010 17:44:17 +0300 (MSK)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Mar 2010 17:41:52 +0300
Message-Id: <1268750512-11047-2-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1268750512-11047-1-git-send-email-khimov@altell.ru>
References: <1268750512-11047-1-git-send-email-khimov@altell.ru>
X-Altell-MailScanner-ID: DF957685D5.8339D
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] ipsec-tools: add version 0.7.2
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
X-List-Received-Date: Tue, 16 Mar 2010 14:48:49 -0000

Fixes CVE-2008-3651 and CVE-2008-3652.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/ipsec-tools/ipsec-tools.inc      |    6 ++----
 recipes/ipsec-tools/ipsec-tools_0.6.6.bb |    2 ++
 recipes/ipsec-tools/ipsec-tools_0.6.7.bb |    2 ++
 recipes/ipsec-tools/ipsec-tools_0.7.2.bb |    8 ++++++++
 4 files changed, 14 insertions(+), 4 deletions(-)
 create mode 100644 recipes/ipsec-tools/ipsec-tools_0.7.2.bb

diff --git a/recipes/ipsec-tools/ipsec-tools.inc b/recipes/ipsec-tools/ipsec-tools.inc
index f79210d..cb7b411 100644
--- a/recipes/ipsec-tools/ipsec-tools.inc
+++ b/recipes/ipsec-tools/ipsec-tools.inc
@@ -5,11 +5,9 @@ SECTION = "console/network"
 LICENSE = "BSD"
 DEPENDS = "virtual/kernel openssl readline flex"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/ipsec-tools/ipsec-tools-${PV}.tar.bz2 \
-           file://racoon-search-missing.patch;patch=1 \
-           file://gcc-4.2.patch;patch=1"
+SRC_URI = "${SOURCEFORGE_MIRROR}/ipsec-tools/ipsec-tools-${PV}.tar.bz2;name=ipsec-tools-${PV}"
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 inherit autotools
 
diff --git a/recipes/ipsec-tools/ipsec-tools_0.6.6.bb b/recipes/ipsec-tools/ipsec-tools_0.6.6.bb
index efac342..f989fbf 100644
--- a/recipes/ipsec-tools/ipsec-tools_0.6.6.bb
+++ b/recipes/ipsec-tools/ipsec-tools_0.6.6.bb
@@ -1,3 +1,5 @@
 PR = "${INC_PR}.0"
 
+SRC_URI += "file://racoon-search-missing.patch;patch=1 file://gcc-4.2.patch;patch=1"
+
 require ipsec-tools.inc
diff --git a/recipes/ipsec-tools/ipsec-tools_0.6.7.bb b/recipes/ipsec-tools/ipsec-tools_0.6.7.bb
index efac342..f989fbf 100644
--- a/recipes/ipsec-tools/ipsec-tools_0.6.7.bb
+++ b/recipes/ipsec-tools/ipsec-tools_0.6.7.bb
@@ -1,3 +1,5 @@
 PR = "${INC_PR}.0"
 
+SRC_URI += "file://racoon-search-missing.patch;patch=1 file://gcc-4.2.patch;patch=1"
+
 require ipsec-tools.inc
diff --git a/recipes/ipsec-tools/ipsec-tools_0.7.2.bb b/recipes/ipsec-tools/ipsec-tools_0.7.2.bb
new file mode 100644
index 0000000..4255598
--- /dev/null
+++ b/recipes/ipsec-tools/ipsec-tools_0.7.2.bb
@@ -0,0 +1,8 @@
+PR = "${INC_PR}.0"
+
+require ipsec-tools.inc
+
+SRC_URI[ipsec-tools-0.7.2.md5sum] = "72861f005746ee27984b2ee715ecc629"
+SRC_URI[ipsec-tools-0.7.2.sha256sum] = "08722ff6c62de3e042fef337454f03622a79053108d6dcc686c9c854f9f9e031"
+
+EXTRA_OECONF += " --disable-security-context"
\ No newline at end of file
-- 
1.5.6.5



