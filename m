Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1ReCBO-00043P-6Q
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Dec 2011 21:57:38 +0100
Received: by yenm12 with SMTP id m12so5675461yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2011 12:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=3DCnWBxB2xA6PwGQzLTaykLLCK3W0L/QpEu6K1RMyks=;
	b=beU2BsRdntpx/WCUP88eTzbeAiDJzYhyxnzfP6I8fAHMOonDLzyjkQUvWkGSjnlVwa
	cQnEJ4+FpT+qPeQa5P51TNO32KcTw7tiwz+FvnWu3rhgBooz01iNMxoni0AkZEy1w4zU
	FCmVNRR7txJP5XWt8tJ5o3/Z18LyhxT5DraiE=
Received: by 10.236.197.103 with SMTP id s67mr23991612yhn.5.1324673429888;
	Fri, 23 Dec 2011 12:50:29 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id i67sm22088802yhm.16.2011.12.23.12.50.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Dec 2011 12:50:28 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Dec 2011 20:50:18 +0000
Message-Id: <2da113ea26a5de8a56a21e8e292445ecb64313ee.1324673362.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1324673362.git.otavio@ossystems.com.br>
References: <cover.1324673362.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/1] dialog: add 1.1-20111020 recipe (dynamic and static)
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
X-List-Received-Date: Fri, 23 Dec 2011 20:57:38 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../dialog/dialog-static_1.1-20111020.bb           |    7 +++++
 meta-oe/recipes-extended/dialog/dialog.inc         |   24 ++++++++++++++++++++
 .../recipes-extended/dialog/dialog_1.1-20111020.bb |    5 ++++
 3 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-extended/dialog/dialog-static_1.1-20111020.bb
 create mode 100644 meta-oe/recipes-extended/dialog/dialog.inc
 create mode 100644 meta-oe/recipes-extended/dialog/dialog_1.1-20111020.bb

diff --git a/meta-oe/recipes-extended/dialog/dialog-static_1.1-20111020.bb b/meta-oe/recipes-extended/dialog/dialog-static_1.1-20111020.bb
new file mode 100644
index 0000000..e21a914
--- /dev/null
+++ b/meta-oe/recipes-extended/dialog/dialog-static_1.1-20111020.bb
@@ -0,0 +1,7 @@
+require dialog.inc
+PR = "${INC_PR}.0"
+
+LDFLAGS += "-static"
+
+SRC_URI[md5sum] = "15dd2ce9f537c0400f600d1a383aa0a3"
+SRC_URI[sha256sum] = "746bf18b8414985864835b61536cee826ac916e6827fbcad9faffb496cae8a7a"
diff --git a/meta-oe/recipes-extended/dialog/dialog.inc b/meta-oe/recipes-extended/dialog/dialog.inc
new file mode 100644
index 0000000..03b0aa7
--- /dev/null
+++ b/meta-oe/recipes-extended/dialog/dialog.inc
@@ -0,0 +1,24 @@
+DESCRIPTION = "Dialog lets you to present a variety of questions \
+or display messages using dialog boxes from a shell \
+script (or any scripting language)."
+SECTION = "console/utils"
+DEPENDS = "ncurses"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
+
+INC_PR = "r0"
+
+SRC_URI = "ftp://invisible-island.net/dialog/dialog-${PV}.tgz"
+
+# hardcoded here for use in dialog-static recipe
+S = "${WORKDIR}/dialog-${PV}"
+
+inherit autotools
+
+EXTRA_OECONF = "--with-ncurses \
+                --disable-rpath-hack"
+
+do_configure() {
+    sed -i 's,${cf_ncuconfig_root}6-config,${cf_ncuconfig_root}-config,g' -i configure
+    oe_runconf
+}
diff --git a/meta-oe/recipes-extended/dialog/dialog_1.1-20111020.bb b/meta-oe/recipes-extended/dialog/dialog_1.1-20111020.bb
new file mode 100644
index 0000000..73079a1
--- /dev/null
+++ b/meta-oe/recipes-extended/dialog/dialog_1.1-20111020.bb
@@ -0,0 +1,5 @@
+require dialog.inc
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "15dd2ce9f537c0400f600d1a383aa0a3"
+SRC_URI[sha256sum] = "746bf18b8414985864835b61536cee826ac916e6827fbcad9faffb496cae8a7a"
-- 
1.7.2.5



