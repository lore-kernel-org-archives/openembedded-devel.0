Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SMm9N-0000nB-4X
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Apr 2012 22:15:49 +0200
Received: by vbbfr13 with SMTP id fr13so893620vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Apr 2012 13:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=Bi8ytV6IPATJ/Q1zAOQsCgks0LiA9bvMT3yn2yE5PRo=;
	b=fwN0OGBKTCAI8pIKKZyiW+d+3KsJyv9OMCzgX93kML1/PnZYsK9EhqoxLiIOG46dqb
	nq3kHbO3+2kNwBoUQvi4A8YclaxtSiB7PIdNdGQ7yHHftb5ntzTSYRIejH7W1h/547/U
	LnmV3UL5Rq6ka+ohywzgAzWSw28H2f97uj+jEyQEw6iwDg1u0wl3MngC7CcqVKi82tMo
	GRMFvAym8R4QmgutHkqU6zapk5FvtvwhmsQe/pi3VX2lrKMRmCGL+iA7/v6cz+AUaRv2
	fXkUp4ErN9F9sl/nkqqpz98EpsJFZzgKPw8wBn3TkMSVVameZCbQHhBXLWMRk1n9aqlk
	4zcA==
Received: by 10.52.33.35 with SMTP id o3mr17969947vdi.27.1335297973890;
	Tue, 24 Apr 2012 13:06:13 -0700 (PDT)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id i4sm33183810vdk.8.2012.04.24.13.06.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Apr 2012 13:06:13 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Apr 2012 17:06:00 -0300
Message-Id: <7b2af709f6973c8eda0ba4481cdbaaa75b583884.1335297926.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1335297926.git.otavio@ossystems.com.br>
References: <cover.1335297926.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1335297926.git.otavio@ossystems.com.br>
References: <cover.1335297926.git.otavio@ossystems.com.br>
Subject: [PATCH][meta-oe 1/2] net-snmp: split net-snmp-server
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
X-List-Received-Date: Tue, 24 Apr 2012 20:15:49 -0000

From: Mario Domenech Goulart <mario@ossystems.com.br>

net-snmp-server has been split into two packages:
net-snmp-server-snmpd and net-snmp-server-snmptrapd

net-snmp-server is now a "meta-package" which depends on
net-snmp-server-snmpd and net-snmp-server-snmptrapd.

net-snmpd-server-systemd in no longer generated.  It has been
split into net-snmp-server-snmpd-systemd and
net-snmp-server-snmptrapd-systemd.

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 meta-oe/recipes-extended/net-snmp/net-snmp.inc     |   16 ++++++++++------
 .../recipes-extended/net-snmp/net-snmp_5.7.1.bb    |   10 +++++++---
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-extended/net-snmp/net-snmp.inc b/meta-oe/recipes-extended/net-snmp/net-snmp.inc
index 1a51e75..40ee8b5 100644
--- a/meta-oe/recipes-extended/net-snmp/net-snmp.inc
+++ b/meta-oe/recipes-extended/net-snmp/net-snmp.inc
@@ -3,11 +3,13 @@ HOMEPAGE = "http://www.net-snmp.org/"
 LICENSE = "BSD"
 
 DEPENDS = "openssl libnl"
-RDEPENDS_${PN}-server += "net-snmp-mibs"
+RDEPENDS_${PN}-server-snmpd += "net-snmp-mibs"
+RDEPENDS_${PN}-server-snmptrapd += "net-snmp-server-snmpd"
+RDEPENDS_${PN}-server += "net-snmp-server-snmpd net-snmp-server-snmptrapd"
 RDEPENDS_${PN}-client += "net-snmp-mibs"
 RDEPENDS_${PN}-dev = "net-snmp-client (= ${EXTENDPV}) net-snmp-server (= ${EXTENDPV})"
 RRECOMMENDS_${PN}-dbg = "net-snmp-client (= ${EXTENDPV}) net-snmp-server (= ${EXTENDPV})"
-INC_PR = "r2"
+INC_PR = "r3"
 
 inherit autotools update-rc.d siteinfo
 
@@ -37,17 +39,19 @@ do_install_append() {
 }
 
 PACKAGES = "net-snmp-dbg net-snmp-doc net-snmp-dev net-snmp-staticdev net-snmp-static net-snmp-libs \
-            net-snmp-mibs net-snmp-server net-snmp-client"
+            net-snmp-mibs net-snmp-server net-snmp-client net-snmp-server-snmpd net-snmp-server-snmptrapd"
 
+ALLOW_EMPTY_${PN}-server = "1"
 FILES_${PN}-libs = "${libdir}/lib*${SOLIBS}"
 FILES_${PN}-mibs = "${datadir}/snmp/mibs"
-FILES_${PN}-server = "${sbindir}/* ${sysconfdir}"
+FILES_${PN}-server-snmpd = "${sbindir}/snmpd ${sysconfdir}/snmp/snmpd.conf ${sysconfdir}/init.d"
+FILES_${PN}-server-snmptrapd = "${sbindir}/snmptrapd ${sysconfdir}/snmp/snmptrapd.conf"
 FILES_${PN}-client = "${bindir}/* ${datadir}/snmp/"
 FILES_${PN}-dbg += "${libdir}/.debug/ ${sbindir}/.debug/ ${bindir}/.debug/"
 FILES_${PN}-dev += "${bindir}/net-snmp-config ${bindir}/mib2c ${bindir}/mib2c-update"
 
-CONFFILES_${PN}-server = "${sysconfdir}/snmp/snmpd.conf \
-                          ${sysconfdir}/snmp/snmptrapd.conf"
+CONFFILES_${PN}-server-snmpd = "${sysconfdir}/snmp/snmpd.conf"
+CONFFILES_${PN}-server-snmptrapd = "${sysconfdir}/snmp/snmptrapd.conf"
 
 INITSCRIPT_PACKAGES = "${PN}-server"
 INITSCRIPT_NAME_${PN}-server = "snmpd"
diff --git a/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bb b/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bb
index b2a9786..83df80a 100644
--- a/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bb
+++ b/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bb
@@ -17,8 +17,11 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
 EXTRA_OECONF += "--disable-embedded-perl --with-perl-modules=no --with-systemd "
 EXTRA_OEMAKE = "INSTALL_PREFIX=${D}"
 
-SYSTEMD_PACKAGES = "${PN}-server-systemd"
-SYSTEMD_SERVICE_${PN}-server-systemd = "snmpd.service snmptrapd.service"
+SYSTEMD_PACKAGES = "${PN}-server-snmpd-systemd \
+                    ${PN}-server-snmptrapd-systemd"
+
+SYSTEMD_SERVICE_${PN}-server-snmpd-systemd = "snmpd.service"
+SYSTEMD_SERVICE_${PN}-server-snmptrapd-systemd =  "snmptrapd.service"
 
 do_configure_prepend() {
         gnu-configize -f
@@ -35,4 +38,5 @@ CCACHE = ""
 SRC_URI[md5sum] = "c95d08fd5d93df0c11a2e1bdf0e01e0b"
 SRC_URI[sha256sum] = "7c71c9650c65b715356547e20ca2dbe6313944278af8cc19c32a5337f46b181f"
 
-RDEPENDS_${PN}-server-systemd = "${PN}-server"
+RDEPENDS_${PN}-server-snmpd-systemd = "${PN}-server-snmpd"
+RDEPENDS_${PN}-server-snmptrapd-systemd = "${PN}-server-snmptrapd"
-- 
1.7.2.5



