Received: from mail-out.m-online.net ([212.18.0.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mok@mnet-online.de>) id 1NBc0r-0002zW-VR
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 23:31:36 +0100
Received: from mail01.m-online.net (mail.m-online.net [192.168.3.149])
	by mail-out.m-online.net (Postfix) with ESMTP id A37861C160C4;
	Fri, 20 Nov 2009 23:21:44 +0100 (CET)
Received: from localhost (dynscan2.mnet-online.de [192.168.1.215])
	by mail.m-online.net (Postfix) with ESMTP id 9D444912F2;
	Fri, 20 Nov 2009 23:21:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.3.149])
	by localhost (dynscan2.mnet-online.de [192.168.1.215]) (amavisd-new,
	port 10024)
	with ESMTP id 2YFAwegK7GIl; Fri, 20 Nov 2009 23:21:43 +0100 (CET)
Received: from mrdenker.palutemo (ppp-82-135-69-249.dynamic.mnet-online.de
	[82.135.69.249]) by mail.mnet-online.de (Postfix) with SMTP;
	Fri, 20 Nov 2009 23:21:43 +0100 (CET)
Received: by mrdenker.palutemo (sSMTP sendmail emulation);
	Fri, 20 Nov 2009 23:21:43 +0100
From: mok@mnet-online.de
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Nov 2009 23:21:35 +0100
Message-Id: <1258755695-24978-4-git-send-email-mok@mnet-online.de>
X-Mailer: git-send-email 1.6.5.2
In-Reply-To: <1258755695-24978-3-git-send-email-mok@mnet-online.de>
References: <1258755695-24978-1-git-send-email-mok@mnet-online.de>
	<1258755695-24978-2-git-send-email-mok@mnet-online.de>
	<1258755695-24978-3-git-send-email-mok@mnet-online.de>
X-SA-Exim-Connect-IP: 212.18.0.9
X-SA-Exim-Mail-From: mok@mnet-online.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Klaus Kurzmann <mok@fluxnetz.de>
Subject: [PATCH 3/3] illume-keyboard-default: new recipe for default illume keyboards as e-wm does not install them anymore (via a patch to the makefile), we can put them in extra packages.
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
X-List-Received-Date: Fri, 20 Nov 2009 22:31:37 -0000

From: Klaus Kurzmann <mok@fluxnetz.de>

Signed-off-by: Klaus Kurzmann <mok@fluxnetz.de>
---
 conf/distro/include/sane-srcrevs.inc       |    3 ++
 recipes/e17/illume-keyboard-default_svn.bb |   43 ++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+), 0 deletions(-)
 create mode 100644 recipes/e17/illume-keyboard-default_svn.bb

diff --git a/conf/distro/include/sane-srcrevs.inc b/conf/distro/include/sane-srcrevs.inc
index f8e06ea..52c808f 100644
--- a/conf/distro/include/sane-srcrevs.inc
+++ b/conf/distro/include/sane-srcrevs.inc
@@ -412,6 +412,9 @@ SRCREV_pn-illume ?= "${EFL_SRCREV}"
 SRCREV_pn-illume-theme-illume ?= "${EFL_SRCREV}"
 SRCREV_pn-waker ?= "${EFL_SRCREV}"
 
+#illume default keyboards
+SRCREV_pn-illume-keyboard-default ?= "${EFL_SRCREV}"
+
 #exalt
 SRCREV_pn-exalt ?= "${EFL_SRCREV}"
 SRCREV_pn-exalt-client ?= "${EFL_SRCREV}"
diff --git a/recipes/e17/illume-keyboard-default_svn.bb b/recipes/e17/illume-keyboard-default_svn.bb
new file mode 100644
index 0000000..90b09b2
--- /dev/null
+++ b/recipes/e17/illume-keyboard-default_svn.bb
@@ -0,0 +1,43 @@
+DESCRIPTION = "The illume default keyboards"
+SECTION = "x11/data"
+SRCNAME = "e"
+PV = "0.16.999.060+svnr${SRCPV}"
+PR = "r0"
+
+SRC_URI = "svn://svn.enlightenment.org/svn/e/trunk;module=${SRCNAME};proto=http"
+S = "${WORKDIR}/${SRCNAME}"
+
+PACKAGE_ARCH = "all"
+
+BASEDIR = "modules/illume/keyboards"
+INSTFILES = "\
+Default.kbd \
+alpha.png \
+Numbers.kbd \
+numeric.png \
+Terminal.kbd \
+qwerty.png \
+"
+
+PACKAGES = "${PN}-alpha ${PN}-numeric ${PN}-terminal"
+
+FILES_${PN}-alpha = "\
+${libdir}/enlightenment/modules/illume/keyboards/Default.kbd \
+${libdir}/enlightenment/modules/illume/keyboards/alpha.png \
+"
+FILES_${PN}-numeric = "\
+${libdir}/enlightenment/modules/illume/keyboards/Numeric.kbd \
+${libdir}/enlightenment/modules/illume/keyboards/numeric.png \
+"
+FILES_${PN}-terminal = "\
+${libdir}/enlightenment/modules/illume/keyboards/Terminal.kbd \
+${libdir}/enlightenment/modules/illume/keyboards/qwerty.png \
+"
+
+do_install() {
+	install -d ${D}${libdir}/enlightenment/modules/illume/keyboards
+	for f in ${INSTFILES}; do
+		install -m 0644 ${S}/${BASEDIR}/${f} ${D}${libdir}/enlightenment/modules/illume/keyboards/
+	done
+}
+
-- 
1.6.5.2



