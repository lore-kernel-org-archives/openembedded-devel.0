Received: from [85.17.141.90] (helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcolz@zlo.nu>) id 1N7nPs-0005C3-5y
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 10:53:40 +0100
Received: by mzh.zlo.nu (Postfix, from userid 1000)
	id 5242114030; Tue, 10 Nov 2009 10:52:19 +0100 (CET)
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Nov 2009 10:33:38 +0100
Message-Id: <20091110095219.5242114030@mzh.zlo.nu>
X-SA-Exim-Connect-IP: 85.17.141.90
X-SA-Exim-Mail-From: marcolz@zlo.nu
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 1/3] Move 3.0.2 to a .inc and use INC_PR (to avoid useless duplication).
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
X-List-Received-Date: Tue, 10 Nov 2009 09:53:40 -0000

---
 recipes/dhcp/dhcp3.inc     |   62 ++++++++++++++++++++++++++++++++++++++++++++
 recipes/dhcp/dhcp_3.0.2.bb |   58 +++--------------------------------------
 2 files changed, 66 insertions(+), 54 deletions(-)
 create mode 100644 recipes/dhcp/dhcp3.inc

diff --git a/recipes/dhcp/dhcp3.inc b/recipes/dhcp/dhcp3.inc
new file mode 100644
index 0000000..f099003
--- /dev/null
+++ b/recipes/dhcp/dhcp3.inc
@@ -0,0 +1,62 @@
+SECTION = "console/network"
+DESCRIPTION = "Internet Software Consortium DHCP package"
+HOMEPAGE = "http://www.isc.org/"
+LICENSE = "BSD"
+INC_PR = "r11"
+
+SRC_URI = "ftp://ftp.isc.org/isc/dhcp/dhcp-3.1-history/dhcp-${PV}.tar.gz \
+	   file://fixincludes.patch;patch=1 \
+	   file://useless-use-of-bash.patch;patch=1 \
+           file://dhclient-script-exit-status.dpatch;patch=1 \
+	   file://dhcp-3.0.3-dhclient-dbus.patch;patch=1;pnum=0 \
+	   file://init-relay file://default-relay \
+	   file://init-server file://default-server \
+	   file://dhclient.conf file://dhcpd.conf"
+
+
+inherit update-rc.d
+
+INITSCRIPT_PACKAGES = "dhcp-server"
+INITSCRIPT_NAME_dhcp-server = dhcp-server
+INITSCRIPT_PARAMS_dhcp-server = "start 30 2 3 4 5 . stop 30 0 1 6 ."
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+do_configure() {
+	./configure
+}
+
+do_compile() {
+	make RANLIB=${RANLIB} PREDEFINES='-D_PATH_DHCPD_DB=\"/var/lib/dhcp/dhcpd.leases\" \
+        -D_PATH_DHCLIENT_DB=\"/var/lib/dhcp/dhclient.leases\" \
+        -D_PATH_DHCLIENT_SCRIPT=\"/sbin/dhclient-script\" \
+        -D_PATH_DHCPD_CONF=\"/etc/dhcp/dhcpd.conf\" \
+        -D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"'
+}
+
+do_install() {
+	make -e DESTDIR=${D} USRMANDIR=${mandir}/man1 ADMMANDIR=${mandir}/man8 FFMANDIR=${mandir}/man5 LIBMANDIR=${mandir}/man3 LIBDIR=${libdir} INCDIR=${includedir} install
+	install -d ${D}${sysconfdir}/init.d
+	install -d ${D}${sysconfdir}/default
+	install -d ${D}${sysconfdir}/dhcp
+	install -m 0755 ${WORKDIR}/init-relay ${D}${sysconfdir}/init.d/dhcp-relay
+	install -m 0644 ${WORKDIR}/default-relay ${D}${sysconfdir}/default/dhcp-relay
+	install -m 0755 ${WORKDIR}/init-server ${D}${sysconfdir}/init.d/dhcp-server
+	install -m 0644 ${WORKDIR}/default-server ${D}${sysconfdir}/default/dhcp-server
+	install -m 0644 ${WORKDIR}/dhclient.conf ${D}${sysconfdir}/dhcp/dhclient.conf
+	install -m 0644 ${WORKDIR}/dhcpd.conf ${D}${sysconfdir}/dhcp/dhcpd.conf
+	install -d ${D}/var/lib/dhcp3
+}
+
+PACKAGES += "dhcp-server dhcp-client dhcp-relay dhcp-omshell"
+FILES_${PN} = ""
+FILES_dhcp-server = "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-server ${sysconfdir}/default/dhcp-server ${sysconfdir}/dhcp/dhcpd.conf"
+FILES_dhcp-relay = "${sbindir}/dhcrelay ${sysconfdir}/init.d/dhcp-relay ${sysconfdir}/default/dhcp-relay"
+
+FILES_dhcp-client = "${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf /var/lib/dhcp3"
+
+FILES_dhcp-omshell = "${bindir}/omshell"
+
+CONFFILES_dhcp-server_nylon = "/etc/dhcp/dhcpd.conf"
+CONFFILES_dhcp-relay_nylon = "/etc/default/dhcp-relay"
+CONFFILES_dhcp-client_nylon = "/etc/dhcp/dhclient.conf"
diff --git a/recipes/dhcp/dhcp_3.0.2.bb b/recipes/dhcp/dhcp_3.0.2.bb
index 052fa7e..9934590 100644
--- a/recipes/dhcp/dhcp_3.0.2.bb
+++ b/recipes/dhcp/dhcp_3.0.2.bb
@@ -1,62 +1,12 @@
-SECTION = "console/network"
-DESCRIPTION = "Internet Software Consortium DHCP package"
-HOMEPAGE = "http://www.isc.org/"
-LICENSE = "BSD"
-PR = "r10"
+require dhcp3.inc
+
 SRC_URI = "ftp://ftp.isc.org/isc/dhcp/dhcp-3.0-history/dhcp-${PV}.tar.gz \
 	   file://noattrmode.patch;patch=1 \
 	   file://fixincludes.patch;patch=1 \
-           file://dhclient-script-exit-status.dpatch;patch=1 \
+	   file://dhclient-script-exit-status.dpatch;patch=1 \
 	   file://dhcp-3.0.3-dhclient-dbus.patch;patch=1;pnum=0 \
 	   file://init-relay file://default-relay \
 	   file://init-server file://default-server \
 	   file://dhclient.conf file://dhcpd.conf"
 
-
-inherit update-rc.d
-
-INITSCRIPT_PACKAGES = "dhcp-server"
-INITSCRIPT_NAME_dhcp-server = dhcp-server
-INITSCRIPT_PARAMS_dhcp-server = "start 30 2 3 4 5 . stop 30 0 1 6 ."
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-do_configure() {
-	./configure
-}
-
-do_compile() {
-	make RANLIB=${RANLIB} PREDEFINES='-D_PATH_DHCPD_DB=\"/var/lib/dhcp/dhcpd.leases\" \
-        -D_PATH_DHCLIENT_DB=\"/var/lib/dhcp/dhclient.leases\" \
-        -D_PATH_DHCLIENT_SCRIPT=\"/sbin/dhclient-script\" \
-        -D_PATH_DHCPD_CONF=\"/etc/dhcp/dhcpd.conf\" \
-        -D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"'
-}
-
-do_install() {
-	make -e DESTDIR=${D} USRMANDIR=${mandir}/man1 ADMMANDIR=${mandir}/man8 FFMANDIR=${mandir}/man5 LIBMANDIR=${mandir}/man3 LIBDIR=${libdir} INCDIR=${includedir} install
-	install -d ${D}${sysconfdir}/init.d
-	install -d ${D}${sysconfdir}/default
-	install -d ${D}${sysconfdir}/dhcp
-	install -m 0755 ${WORKDIR}/init-relay ${D}${sysconfdir}/init.d/dhcp-relay
-	install -m 0644 ${WORKDIR}/default-relay ${D}${sysconfdir}/default/dhcp-relay
-	install -m 0755 ${WORKDIR}/init-server ${D}${sysconfdir}/init.d/dhcp-server
-	install -m 0644 ${WORKDIR}/default-server ${D}${sysconfdir}/default/dhcp-server
-	install -m 0644 ${WORKDIR}/dhclient.conf ${D}${sysconfdir}/dhcp/dhclient.conf
-	install -m 0644 ${WORKDIR}/dhcpd.conf ${D}${sysconfdir}/dhcp/dhcpd.conf
-	install -d ${D}/var/lib/dhcp3
-}
-
-PACKAGES += "dhcp-server dhcp-client dhcp-relay dhcp-omshell"
-FILES_${PN} = ""
-FILES_dhcp-server = "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-server ${sysconfdir}/default/dhcp-server ${sysconfdir}/dhcp/dhcpd.conf"
-FILES_dhcp-relay = "${sbindir}/dhcrelay ${sysconfdir}/init.d/dhcp-relay ${sysconfdir}/default/dhcp-relay"
-
-FILES_dhcp-client = "${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf /var/lib/dhcp3"
-RDEPENDS_dhcp-client = "bash"
-
-FILES_dhcp-omshell = "${bindir}/omshell"
-
-CONFFILES_dhcp-server_nylon = "/etc/dhcp/dhcpd.conf"
-CONFFILES_dhcp-relay_nylon = "/etc/default/dhcp-relay"
-CONFFILES_dhcp-client_nylon = "/etc/dhcp/dhclient.conf"
+PR = "${INC_PR}"
-- 
1.6.3.1



