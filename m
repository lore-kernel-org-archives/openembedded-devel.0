Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PyUVK-0004iz-RC
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 20:29:35 +0100
Received: by mail-yx0-f175.google.com with SMTP id 22so1614087yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Mar 2011 11:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=zu5QwAjCj9ADXbOIl7Rvuh/oO/jtqOmaCRMeSQZ+mrU=;
	b=uD0jBDdE3EkPwXoNWVwxEhs64TNmHNiBRG06iychq1n1/C3Wkaq4tPwS7KmOVa2nIw
	ZyoTgLfOd7AcXiGbWcfD5hwPlDPR3A9/VEv3hrHOknF8cf1kNsogpcqX5mjU8NZ62QVG
	BpdykSVv1kCh1HqY1/kK6qRH4OYeKNwzArPT4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=YlEONfIvW7AdneUQTn+D2foBxIhnVEhM/NleoHCTJiKIaksuessMugj1Z3pLuYVjRm
	BsqsG7NA9OpNLF/Tvmg5Xz+UpjdBX0ouibx/AxKg056MneuI0ZKXu1ik5ZQScoJbNzzy
	MvqxXumg3N/+dVNRRakCeGGKIfxdZV/nhCUoI=
Received: by 10.90.187.7 with SMTP id k7mr1431199agf.151.1299958077457;
	Sat, 12 Mar 2011 11:27:57 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id c38sm4812832anc.38.2011.03.12.11.27.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Mar 2011 11:27:56 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Mar 2011 19:27:18 +0000
Message-Id: <1299958038-25216-12-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1299958038-25216-1-git-send-email-otavio@ossystems.com.br>
References: <1299958038-25216-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 11/11] p910nd: update to 0.95 and improve packaging
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
X-List-Received-Date: Sat, 12 Mar 2011 19:29:35 -0000

 * fix SRC_URI to use SOURCEFORGE_MIRROR;
 * use LDFLAGS to include GNU_HASH info;
 * move avahi support to p910nd-avahi package;

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/p910nd/p910nd_0.92.bb |   45 -------------------------------------
 recipes/p910nd/p910nd_0.95.bb |   49 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+), 45 deletions(-)
 delete mode 100644 recipes/p910nd/p910nd_0.92.bb
 create mode 100644 recipes/p910nd/p910nd_0.95.bb

diff --git a/recipes/p910nd/p910nd_0.92.bb b/recipes/p910nd/p910nd_0.92.bb
deleted file mode 100644
index 4d90df1..0000000
--- a/recipes/p910nd/p910nd_0.92.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-DESCRIPTION = "A small network printer daemon for embedded situations that passes the job directly to the printer."
-SECTION = "console/utils"
-HOMEPAGE = "http://p910nd.sourceforge.net/"
-LICENSE = "GPLv2"
-SECTION = "console/utils"
-PR = "r1"
-RRECOMMENDS_${PN} = "avahi"
-
-inherit update-rc.d
-
-INITSCRIPT_NAME = "p910nd"
-INITSCRIPT_PARAMS = "defaults 60 "
-
-SRC_URI = "http://internap.dl.sourceforge.net/sourceforge/p910nd/p910nd-0.92.tar.bz2 \
-           file://p910nd.init \
-           file://avahi"
-
-do_compile () {
-	${CC} -o p910nd p910nd.c 
-}
-
-# The avahi stuff makes it work with bonjour printing
-do_install () {
-	install -D -m 0755 ${S}/p910nd ${D}${sbindir}/p910nd
-	install -D -m 0644 ${S}/p910nd.conf ${D}${sysconfdir}/p910nd.conf
-	install -D -m 0755 ${WORKDIR}/p910nd.init ${D}${sysconfdir}/init.d/p910nd
-	install -D -m 0755 ${WORKDIR}/avahi ${D}${sysconfdir}/avahi/services/p910nd.service
-}
-
-pkg_postinst_append() {
-#!/bin/sh
-           
-if [ "x$D" != "x" ] ; then
-        exit 1
-fi
-
-# If avahi is already running reload it to pickup the p910nd config
-PAV=`pidof avahi-daemon`
-if [ "x$PAV" != "x" ] ; then
-        /etc/init.d/avahi-daemon reload
-fi
-}
-
-SRC_URI[md5sum] = "94a43d28794f2445cd5f9c8b970898c4"
-SRC_URI[sha256sum] = "a2295e525febfc3a1a93ad21c0843021e2b22e6720f148bf1c4822a83aea2b8c"
diff --git a/recipes/p910nd/p910nd_0.95.bb b/recipes/p910nd/p910nd_0.95.bb
new file mode 100644
index 0000000..faa095a
--- /dev/null
+++ b/recipes/p910nd/p910nd_0.95.bb
@@ -0,0 +1,49 @@
+DESCRIPTION = "A small network printer daemon for embedded situations that passes the job directly to the printer."
+SECTION = "console/utils"
+HOMEPAGE = "http://p910nd.sourceforge.net/"
+LICENSE = "GPLv2"
+SECTION = "console/utils"
+PR = "r1"
+RDEPENDS_${PN}-avahi = "avahi"
+
+inherit update-rc.d
+
+INITSCRIPT_NAME = "p910nd"
+INITSCRIPT_PARAMS = "defaults 60 "
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/p910nd/p910nd-${PV}.tar.bz2 \
+           file://p910nd.init \
+           file://avahi"
+
+SRC_URI[md5sum] = "c7ac6afdf7730ac8387a8e87198d4491"
+SRC_URI[sha256sum] = "7d78642c86dc247fbdef1ff85c56629dcdc6b2a457c786420299e284fffcb029"
+
+PACKAGES_prepend = "${PN}-avahi "
+
+FILES_${PN}-avahi += "${sysconfdir}/avahi/services/p910nd.service"
+
+do_compile () {
+	${CC} ${LDFLAGS} -o p910nd p910nd.c
+}
+
+# The avahi stuff makes it work with bonjour printing
+do_install () {
+	install -D -m 0755 ${S}/p910nd ${D}${sbindir}/p910nd
+	install -D -m 0644 ${S}/p910nd.conf ${D}${sysconfdir}/p910nd.conf
+	install -D -m 0755 ${WORKDIR}/p910nd.init ${D}${sysconfdir}/init.d/p910nd
+	install -D -m 0755 ${WORKDIR}/avahi ${D}${sysconfdir}/avahi/services/p910nd.service
+}
+
+pkg_postinst_${PN}-avahi_append() {
+#!/bin/sh
+
+if [ "x$D" != "x" ] ; then
+        exit 1
+fi
+
+# If avahi is already running reload it to pickup the p910nd config
+PAV=`pidof avahi-daemon`
+if [ "x$PAV" != "x" ] ; then
+        /etc/init.d/avahi-daemon reload
+fi
+}
-- 
1.7.2.3



