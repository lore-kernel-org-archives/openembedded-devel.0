Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@mate.hex>) id 1Nx3F1-0007zj-CO
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Mar 2010 21:06:16 +0200
Received: by mate.hex (Postfix, from userid 1000)
	id 0216B2DBDD; Wed, 31 Mar 2010 22:59:38 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Mar 2010 22:59:31 +0400
Message-Id: <1270061972-5564-2-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <1270061972-5564-1-git-send-email-khimov@altell.ru>
References: <1270061972-5564-1-git-send-email-khimov@altell.ru>
X-SA-Exim-Connect-IP: 93.100.16.104
X-SA-Exim-Mail-From: rik@mate.hex
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,NO_DNS_FOR_FROM,
	RCVD_IN_PBL,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/3] postfix: convert to BBCLASSEXTEND and new staging for native
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
X-List-Received-Date: Wed, 31 Mar 2010 19:06:16 -0000

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/postfix/postfix-native_2.0.20.bb |   10 ----------
 recipes/postfix/postfix-native_2.2.12.bb |   10 ----------
 recipes/postfix/postfix.inc              |   25 ++++++++++++++++++++++---
 3 files changed, 22 insertions(+), 23 deletions(-)
 delete mode 100644 recipes/postfix/postfix-native_2.0.20.bb
 delete mode 100644 recipes/postfix/postfix-native_2.2.12.bb

diff --git a/recipes/postfix/postfix-native_2.0.20.bb b/recipes/postfix/postfix-native_2.0.20.bb
deleted file mode 100644
index 66ff65d..0000000
--- a/recipes/postfix/postfix-native_2.0.20.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require postfix_${PV}.bb
-
-inherit native
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/postfix-${PV}"
-DEPENDS = "virtual/db-native libpcre-native"
-export DIRS = "src/util src/global src/postconf"
-
-do_stage () {
-	install -m 0755 src/postconf/postconf ${STAGING_BINDIR}/
-}
diff --git a/recipes/postfix/postfix-native_2.2.12.bb b/recipes/postfix/postfix-native_2.2.12.bb
deleted file mode 100644
index 66ff65d..0000000
--- a/recipes/postfix/postfix-native_2.2.12.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require postfix_${PV}.bb
-
-inherit native
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/postfix-${PV}"
-DEPENDS = "virtual/db-native libpcre-native"
-export DIRS = "src/util src/global src/postconf"
-
-do_stage () {
-	install -m 0755 src/postconf/postconf ${STAGING_BINDIR}/
-}
diff --git a/recipes/postfix/postfix.inc b/recipes/postfix/postfix.inc
index 6a5f9bb..5b18cef 100644
--- a/recipes/postfix/postfix.inc
+++ b/recipes/postfix/postfix.inc
@@ -1,5 +1,6 @@
 SECTION = "console/network"
 DEPENDS = "virtual/db libpcre postfix-native"
+DEPENDS_virtclass-native = "virtual/db-native libpcre-native"
 LICENSE = "IPL"
 
 INC_PR = "r13"
@@ -15,6 +16,8 @@ SRC_URI = "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${PV
 
 S = "${WORKDIR}/postfix-${PV}"
 
+BBCLASSEXTEND = "native"
+
 inherit update-rc.d
 
 INITSCRIPT_NAME = "postfix"
@@ -31,7 +34,7 @@ export SYSLIBS = "-lpcre -ldb ${LIBBDB_EXTRA} -lnsl -lresolv ${LDFLAGS}"
 export EXPORT = "AUXLIBS='-lpcre' CCARGS='-DHAS_PCRE ${CFLAGS}' OPT='' DEBUG='-g'"
 export CC_append = " -DHAS_PCRE ${CFLAGS}"
 export EXTRA_OEMAKE = "-e"
-export POSTCONF = "${STAGING_BINDIR_NATIVE}/postconf"
+export POSTCONF = "${STAGING_SBINDIR_NATIVE}/postconf"
 
 do_compile () {
 	unset CFLAGS CPPFLAGS CXXFLAGS
@@ -39,8 +42,23 @@ do_compile () {
 	oe_runmake
 }
 
+do_install_prepend_virtclass-native() {
+	export POSTCONF="bin/postconf"
+}
+
 do_install () {
-	sh ./postfix-install 'install_root=${D}' -non-interactive
+	sh ./postfix-install 'install_root=${D}' \
+		'config_directory=${sysconfdir}/postfix' \
+		'daemon_directory=${libexecdir}/postfix' \
+		'command_directory=${sbindir}' \
+		'queue_directory=${localstatedir}/spool/postfix' \
+		'sendmail_path=${sbindir}/sendmail.postfix' \
+		'newaliases_path=${bindir}/newaliases' \
+		'mailq_path=${bindir}/mailq' \
+		'manpage_directory=${mandir}' \
+		'readme_directory=${datadir}/doc/postfix' \
+		'data_directory=${localstatedir}/lib/postfix' \
+		-non-interactive
 	rm -rf ${D}${localstatedir}/spool/postfix
         mv ${D}${sysconfdir}/postfix/main.cf ${D}${sysconfdir}/postfix/sample-main.cf
 	install -d ${D}${localstatedir}/tmp
@@ -50,9 +68,10 @@ do_install () {
         install -m 644 ${WORKDIR}/volatiles ${D}${sysconfdir}/default/volatiles/01_postfix
         install -m 755 ${WORKDIR}/postfix ${D}${sysconfdir}/init.d/postfix
         install -m 644 ${WORKDIR}/internal_recipient ${D}${sysconfdir}/postfix/internal_recipient
-	mv ${D}${sbindir}/sendmail ${D}${sbindir}/sendmail.${PN}
 }
 
+NATIVE_INSTALL_WORKS = "1"
+
 pkg_postinst () {
 	update-alternatives --install ${sbindir}/sendmail sendmail sendmail.${PN} 40
         grep postfix /etc/group || addgroup postfix
-- 
1.6.4.2



