Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QR3vI-0008Lf-CN
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 16:58:28 +0200
Received: by mail-gx0-f175.google.com with SMTP id 3so353578gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2011 07:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=0YZkEIua0xGu0RyOg/36270gmTE7o5Y4fCms8P5w3G8=;
	b=QSocyG71fyCnhsxAXEKPh6qUGAK3VDraBUny/fkfJoXpQXPef3SULojb3bTHXB7xyf
	kMkhiB4/+AOKpX6Kd56Gs2KnrwU8rbtU1tQ8PdcQr6/ojSCcidf2CHDqbMl/PesVIkRK
	fOZM7s8MWdCG5eDfZgJc6WcWs1CwH82f+pXOQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=sGNfb6ulKeznzmWF8FZloNZS5jU+BDLXfp3jlcil6AHj20GhRduMwxRzX2Adq7Hazx
	KfvxBd87CUVUDQbkxIwGFEQ5IBz1tnqQ58x/68uRGy6mlCT8AdwyVMPYZtPuEEUv+UUO
	crrRbEOFPriN3BYu89R/b1AKGx2f6MYTv9w20=
Received: by 10.236.144.230 with SMTP id n66mr5957395yhj.17.1306767319399;
	Mon, 30 May 2011 07:55:19 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id e48sm2530494yhk.56.2011.05.30.07.55.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 May 2011 07:55:18 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 May 2011 14:54:23 +0000
Message-Id: <1306767263-29895-18-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1306767263-29895-1-git-send-email-otavio@ossystems.com.br>
References: <1306767263-29895-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 17/17] firefox-l10n-pt-br: update to 3.6.8 and sync with O.S. Systems tree
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
X-List-Received-Date: Mon, 30 May 2011 14:58:28 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/mozilla/firefox-l10n-pt-br_3.0.4.bb |    9 --------
 recipes/mozilla/firefox-l10n-pt-br_3.6.8.bb |    9 ++++++++
 recipes/mozilla/firefox-l10n.inc            |   29 +++++++++++++--------------
 3 files changed, 23 insertions(+), 24 deletions(-)
 delete mode 100644 recipes/mozilla/firefox-l10n-pt-br_3.0.4.bb
 create mode 100644 recipes/mozilla/firefox-l10n-pt-br_3.6.8.bb

diff --git a/recipes/mozilla/firefox-l10n-pt-br_3.0.4.bb b/recipes/mozilla/firefox-l10n-pt-br_3.0.4.bb
deleted file mode 100644
index e354f05..0000000
--- a/recipes/mozilla/firefox-l10n-pt-br_3.0.4.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "29c672886aa9ca41428ba04196938545"
-SRC_URI[sha256sum] = "1474828a58f893bed20f0e0cd26bc310c7472d69bf7a1ae01c00a371de256b1a"
diff --git a/recipes/mozilla/firefox-l10n-pt-br_3.6.8.bb b/recipes/mozilla/firefox-l10n-pt-br_3.6.8.bb
new file mode 100644
index 0000000..7151bb8
--- /dev/null
+++ b/recipes/mozilla/firefox-l10n-pt-br_3.6.8.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009, 2011, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}.1"
+
+SRC_URI[md5sum] = "fa333ab8c9c108f9714827d517191d0a"
+SRC_URI[sha256sum] = "759dccbe0ce21abe1ecb6b76fccb777c23422370a8aec2b5cccf25745ab0cb9b"
diff --git a/recipes/mozilla/firefox-l10n.inc b/recipes/mozilla/firefox-l10n.inc
index 4ab8873..57b90f6 100644
--- a/recipes/mozilla/firefox-l10n.inc
+++ b/recipes/mozilla/firefox-l10n.inc
@@ -1,10 +1,9 @@
-# Copyright (C) 2009, O.S. Systems Software Ltda. All Rights Reserved
+# Copyright (C) 2009, 2011, O.S. Systems Software Ltda. All Rights Reserved
 # Released under the MIT license (see packages/COPYING)
 
 def get_language_name(package):
     lang = package.replace('firefox-l10n-', '')
-
-    if lang.find('-'):
+    if lang.find('-') != -1:
         lang = lang.split('-')
         lang[1] = lang[1].upper()
         lang = '-'.join(lang)
@@ -12,35 +11,35 @@ def get_language_name(package):
     return lang
 
 DEPENDS = "unzip-native"
-RDEPENDS_${PN} = "firefox"
+RDEPENDS = "firefox"
 LANGUAGE = "${@get_language_name('${PN}')}"
+FIREFOX_PV = "${PV}"
+INC_PR = "r3"
 
 SRC_URI = "http://releases.mozilla.org/pub/mozilla.org/firefox/releases/${PV}/linux-i686/xpi/${LANGUAGE}.xpi"
 S = "${WORKDIR}"
 
 do_configure() {
-	unzip -o -q -d ${LANGUAGE} ${LANGUAGE}.xpi
+	unzip -o -q -d ${LANGUAGE} *.xpi
 }
 
-INC_PR = "r2"
-
 do_install() {
 	cd ${S}/${LANGUAGE}
 
 	# Get extension UUID
-	EXTENSION=`cat install.rdf | sed --posix '/em:id=/!d;s/[ ]*em:id="//;s/".*//'`
+	EXTENSION=`cat install.rdf | sed --posix '/em:id[=>]/!d;s/[[:space:]]*<*em:id[=>]"*//;s/["<].*//' | head -n 1`
 
-	mkdir -p ${D}/usr/lib/firefox-${PV}/extensions/${EXTENSION}/chrome
-	mkdir -p ${D}/usr/lib/firefox-${PV}/extensions/${EXTENSION}/uninstall
-	install -m 644 chrome/*.jar ${D}/usr/lib/firefox-${PV}/extensions/${EXTENSION}/chrome
-	install -m 644 install.rdf ${D}/usr/lib/firefox-${PV}/extensions/${EXTENSION}
-	install -m 644 chrome.manifest ${D}/usr/lib/firefox-${PV}/extensions/${EXTENSION}
+	mkdir -p ${D}/usr/lib/firefox-${FIREFOX_PV}/extensions/${EXTENSION}/chrome
+	mkdir -p ${D}/usr/lib/firefox-${FIREFOX_PV}/extensions/${EXTENSION}/uninstall
+	cp -R chrome ${D}/usr/lib/firefox-${FIREFOX_PV}/extensions/${EXTENSION}/
+	install -m 644 install.rdf ${D}/usr/lib/firefox-${FIREFOX_PV}/extensions/${EXTENSION}
+	install -m 644 chrome.manifest ${D}/usr/lib/firefox-${FIREFOX_PV}/extensions/${EXTENSION}
 
 	cat install.rdf \
 	   | sed --posix '/<em:locale>/!d' \
 	   | sed --posix "s/.*/register      global  locale  ${LANGUAGE}/" \
-	   > ${D}/usr/lib/firefox-${PV}/extensions/${EXTENSION}/uninstall/Uninstall
+	   > ${D}/usr/lib/firefox-${FIREFOX_PV}/extensions/${EXTENSION}/uninstall/Uninstall
 }
 
-FILES_${PN} += "/usr/lib/firefox-${PV}"
+FILES_${PN} += "/usr/lib/firefox-${FIREFOX_PV}"
 PACKAGE_ARCH = "all"
-- 
1.7.1



