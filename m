Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P1dd9-0005dL-KC
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Oct 2010 13:18:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 13B733148EF3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Oct 2010 13:18:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id q1NSuH3nUTwz; Fri,  1 Oct 2010 13:18:02 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id AAEA73148368;
	Fri,  1 Oct 2010 13:18:01 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Fri, 01 Oct 2010 11:18:01 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Oct 2010 11:17:32 +0000
Message-Id: <1285931854-17148-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1285931854-17148-1-git-send-email-obi@opendreambox.org>
References: <1285931854-17148-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/4] lib{ebml,matroska}-1.0.0: intitial recipes
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
X-List-Received-Date: Fri, 01 Oct 2010 11:18:26 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/matroska/libebml.inc          |    3 +++
 recipes/matroska/libebml_1.0.0.bb     |    4 ++++
 recipes/matroska/libmatroska.inc      |    4 ++++
 recipes/matroska/libmatroska_1.0.0.bb |    4 ++++
 recipes/matroska/matroska.inc         |   16 ++++++++++++++++
 5 files changed, 31 insertions(+), 0 deletions(-)
 create mode 100644 recipes/matroska/libebml.inc
 create mode 100644 recipes/matroska/libebml_1.0.0.bb
 create mode 100644 recipes/matroska/libmatroska.inc
 create mode 100644 recipes/matroska/libmatroska_1.0.0.bb
 create mode 100644 recipes/matroska/matroska.inc

diff --git a/recipes/matroska/libebml.inc b/recipes/matroska/libebml.inc
new file mode 100644
index 0000000..8472a11
--- /dev/null
+++ b/recipes/matroska/libebml.inc
@@ -0,0 +1,3 @@
+DESCRIPTION = "access library for the EBML format"
+
+require matroska.inc
diff --git a/recipes/matroska/libebml_1.0.0.bb b/recipes/matroska/libebml_1.0.0.bb
new file mode 100644
index 0000000..89bcad4
--- /dev/null
+++ b/recipes/matroska/libebml_1.0.0.bb
@@ -0,0 +1,4 @@
+require ${PN}.inc
+
+SRC_URI[md5sum] = "6d438f03d8928d83a2d120ed02705f03"
+SRC_URI[sha256sum] = "72480dec736cd5df5bc9e8c3864a58d17715542c83ff1b2095dca46cc1b8b178"
diff --git a/recipes/matroska/libmatroska.inc b/recipes/matroska/libmatroska.inc
new file mode 100644
index 0000000..4f1e2cc
--- /dev/null
+++ b/recipes/matroska/libmatroska.inc
@@ -0,0 +1,4 @@
+DESCRIPTION = "extensible open standard audio/video container format"
+DEPENDS = "libebml"
+
+require matroska.inc
diff --git a/recipes/matroska/libmatroska_1.0.0.bb b/recipes/matroska/libmatroska_1.0.0.bb
new file mode 100644
index 0000000..b0ee886
--- /dev/null
+++ b/recipes/matroska/libmatroska_1.0.0.bb
@@ -0,0 +1,4 @@
+require ${PN}.inc
+
+SRC_URI[md5sum] = "4efcf3945b17a6f0320cf1aaa326a4de"
+SRC_URI[sha256sum] = "dc000523df508e457ead6447b2d9a2c549fbff525783c13a96d19bbd61137b88"
diff --git a/recipes/matroska/matroska.inc b/recipes/matroska/matroska.inc
new file mode 100644
index 0000000..5ce8fa5
--- /dev/null
+++ b/recipes/matroska/matroska.inc
@@ -0,0 +1,16 @@
+HOMEPAGE = "http://www.matroska.org/"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "LGPLv2.1"
+
+SRC_URI = "http://dl.matroska.org/downloads/${PN}/${P}.tar.bz2"
+
+EXTRA_OEMAKE = "CROSS=${TARGET_PREFIX} prefix=${D}${prefix} -C make/linux"
+
+do_compile() {
+        oe_runmake
+}
+
+do_install() {
+        oe_runmake install
+}
-- 
1.7.1



