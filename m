Received: from [209.85.221.124] (helo=mail-qy0-f124.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1Llf9a-00008s-5T
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Mar 2009 09:05:02 +0100
Received: by qyk30 with SMTP id 30so2338435qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Mar 2009 01:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=979z41l/VI7cB+iA4B8C/IF9pmUD8oq80j2FgUm/ils=;
	b=fiyNv5VKCH737i3mzD2Aqj3jp/kE8jFaMdGJk0CQNLfZs6MI0GnHJIzviUvuYI2K6d
	4r2lOb23ezUgMIf1iXWRNi5Kl+wHIQwd0KkVCD6QXKV8hdntrArgVDWx/SdpobfW8R6f
	KbHITRb0V0p6Eo6Ry0oQT9nIyQOg1YNn5ygTw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=xsgTZM01eV1EcKBPCtzLWbpYg3ZcOuC4EJ3bTehBSX7m5d71HnoWghsiP9FxUAd7+e
	hz52lcWn/VSk7VwF64tXiPhr8uFnwA/ByGmwTqOltRkptSybvyWX6Wt2san/kMsgby3a
	unAXhq7JQvo7VIJ+LTCcj4sj3yQCx2xrwk2M8=
Received: by 10.224.37.70 with SMTP id w6mr8473041qad.39.1237795418421;
	Mon, 23 Mar 2009 01:03:38 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 9sm8987966ywf.16.2009.03.23.01.03.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 23 Mar 2009 01:03:38 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 1DEA06100E0; Mon, 23 Mar 2009 05:03:35 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Mar 2009 05:03:29 -0300
Message-Id: <1237795409-8884-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.2.1.303.g63699
In-Reply-To: <1237795409-8884-3-git-send-email-otavio@ossystems.com.br>
References: <1237795409-8884-1-git-send-email-otavio@ossystems.com.br>
	<1237795409-8884-2-git-send-email-otavio@ossystems.com.br>
	<1237795409-8884-3-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 3/3] firefox-l10n-pt-br: add
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
X-List-Received-Date: Mon, 23 Mar 2009 08:05:04 -0000

---
 recipes/mozilla/firefox-l10n-pt-br_3.0.4.bb |    6 +++
 recipes/mozilla/firefox-l10n.inc            |   46 +++++++++++++++++++++++++++
 2 files changed, 52 insertions(+), 0 deletions(-)
 create mode 100644 recipes/mozilla/firefox-l10n-pt-br_3.0.4.bb
 create mode 100644 recipes/mozilla/firefox-l10n.inc

diff --git a/recipes/mozilla/firefox-l10n-pt-br_3.0.4.bb b/recipes/mozilla/firefox-l10n-pt-br_3.0.4.bb
new file mode 100644
index 0000000..a79c96d
--- /dev/null
+++ b/recipes/mozilla/firefox-l10n-pt-br_3.0.4.bb
@@ -0,0 +1,6 @@
+# Copyright (C) 2009, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}.1"
diff --git a/recipes/mozilla/firefox-l10n.inc b/recipes/mozilla/firefox-l10n.inc
new file mode 100644
index 0000000..31555e3
--- /dev/null
+++ b/recipes/mozilla/firefox-l10n.inc
@@ -0,0 +1,46 @@
+# Copyright (C) 2009, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+def get_language_name(package):
+    lang = package.replace('firefox-l10n-', '')
+
+    if lang.find('-'):
+        lang = lang.split('-')
+        lang[1] = lang[1].upper()
+        lang = '-'.join(lang)
+
+    return lang
+
+DEPENDS = "unzip-native"
+RDEPENDS = "firefox"
+LANGUAGE = "${@get_language_name('${PN}')}"
+
+SRC_URI = "http://releases.mozilla.org/pub/mozilla.org/firefox/releases/${PV}/linux-i686/xpi/${LANGUAGE}.xpi"
+S = "${WORKDIR}"
+
+do_configure() {
+	unzip -o -q -d ${LANGUAGE} ${LANGUAGE}.xpi
+}
+
+INC_PR = "r1"
+
+do_install() {
+	cd ${S}/${LANGUAGE}
+
+	# Get extension UUID
+	EXTENSION=`cat install.rdf | sed --posix '/em:id=/!d;s/[ ]*em:id="//;s/".*//'`
+
+	mkdir -p ${D}/usr/lib/firefox-${PV}/extensions/${EXTENSION}/chrome
+	mkdir -p ${D}/usr/lib/firefox-${PV}/extensions/${EXTENSION}/uninstall
+	install -m 644 chrome/*.jar ${D}/usr/lib/firefox-${PV}/extensions/${EXTENSION}/chrome
+	install -m 644 install.rdf ${D}/usr/lib/firefox-${PV}/extensions/${EXTENSION}
+	install -m 644 chrome.manifest ${D}/usr/lib/firefox-${PV}/extensions/${EXTENSION}
+
+	cat install.rdf \
+	   | sed --posix '/<em:locale>/!d' \
+	   | sed --posix "s/.*/register      global  locale  ${LANGUAGE}/" \
+	   > ${D}/usr/lib/firefox-${PV}/extensions/${EXTENSION}/uninstall/Uninstall
+}
+
+FILES_${PN} += "/usr/lib/firefox-${PV}"
+PACKAGE_ARCH = "all"
-- 
1.6.2.1.303.g63699



