Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1N3WmZ-0000nH-6r
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Oct 2009 16:19:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 2D60C5B1BC8;
	Thu, 29 Oct 2009 11:18:17 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 12530-07; Thu, 29 Oct 2009 11:18:17 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 0D4AF5B1BEE; Thu, 29 Oct 2009 11:18:16 -0400 (EDT)
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id BC8C3575631;
	Thu, 29 Oct 2009 11:18:15 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id 959AB40AA4; Thu, 29 Oct 2009 11:18:15 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Oct 2009 11:18:07 -0400
Message-Id: <1256829487-29628-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.ott.cti.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] fastjar 0.98: add non-native recipe
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
X-List-Received-Date: Thu, 29 Oct 2009 15:19:26 -0000

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/fastjar/fastjar-native.inc     |   12 +-----------
 recipes/fastjar/fastjar-native_0.95.bb |    1 +
 recipes/fastjar/fastjar-native_0.98.bb |    1 +
 recipes/fastjar/fastjar.inc            |   16 ++++++++++++++++
 recipes/fastjar/fastjar_0.98.bb        |    1 +
 5 files changed, 20 insertions(+), 11 deletions(-)
 create mode 100644 recipes/fastjar/fastjar.inc
 create mode 100644 recipes/fastjar/fastjar_0.98.bb

diff --git a/recipes/fastjar/fastjar-native.inc b/recipes/fastjar/fastjar-native.inc
index df4d260..e4d7084 100644
--- a/recipes/fastjar/fastjar-native.inc
+++ b/recipes/fastjar/fastjar-native.inc
@@ -1,18 +1,8 @@
-DESCRIPTION = "jar replacement written in C."
-HOMEPAGE = "http://savannah.nongnu.org/projects/fastjar/"
-SECTION = "devel"
-PRIORITY = "optional"
-LICENSE = "GPL"
-
-INC_PR = "r2"
-
 DEPENDS = "zlib-native"
 
-SRC_URI = "http://download.savannah.nongnu.org/releases/fastjar/fastjar-${PV}.tar.gz"
-
 S = "${WORKDIR}/fastjar-${PV}"
 
-inherit autotools native
+inherit native
 
 do_configure () {
 	gnu-configize || die "failure running gnu-configize"
diff --git a/recipes/fastjar/fastjar-native_0.95.bb b/recipes/fastjar/fastjar-native_0.95.bb
index 6d2cdb4..342bf7c 100644
--- a/recipes/fastjar/fastjar-native_0.95.bb
+++ b/recipes/fastjar/fastjar-native_0.95.bb
@@ -1,3 +1,4 @@
+require fastjar.inc
 require fastjar-native.inc
 
 PR = "${INC_PR}.1"
diff --git a/recipes/fastjar/fastjar-native_0.98.bb b/recipes/fastjar/fastjar-native_0.98.bb
index 6d2cdb4..342bf7c 100644
--- a/recipes/fastjar/fastjar-native_0.98.bb
+++ b/recipes/fastjar/fastjar-native_0.98.bb
@@ -1,3 +1,4 @@
+require fastjar.inc
 require fastjar-native.inc
 
 PR = "${INC_PR}.1"
diff --git a/recipes/fastjar/fastjar.inc b/recipes/fastjar/fastjar.inc
new file mode 100644
index 0000000..7c5439e
--- /dev/null
+++ b/recipes/fastjar/fastjar.inc
@@ -0,0 +1,16 @@
+DESCRIPTION = "jar replacement written in C."
+HOMEPAGE = "http://savannah.nongnu.org/projects/fastjar/"
+SECTION = "devel"
+PRIORITY = "optional"
+LICENSE = "GPL"
+
+DEPENDS = "zlib"
+
+INC_PR = "r3"
+
+SRC_URI = "http://download.savannah.nongnu.org/releases/fastjar/fastjar-${PV}.tar.gz"
+
+inherit autotools
+
+PACKAGES =+ "${PN}-grepjar"
+FILES_${PN}-grepjar = "${bindir}/grepjar"
diff --git a/recipes/fastjar/fastjar_0.98.bb b/recipes/fastjar/fastjar_0.98.bb
new file mode 100644
index 0000000..35392f2
--- /dev/null
+++ b/recipes/fastjar/fastjar_0.98.bb
@@ -0,0 +1 @@
+require fastjar.inc
-- 
1.6.3



