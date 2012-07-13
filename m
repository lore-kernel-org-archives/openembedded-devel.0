Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SpbSc-00085v-41
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 10:42:52 +0200
Received: by bkcik5 with SMTP id ik5so2247681bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 01:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=J6puqj7MZnHkENgbmzMPkXQECt2/uAS+GcvfbGPIVqY=;
	b=YsSXKi8WI/m73h4fUWmRj7z8jJar6halEOJCB+HEKftAc/yHKE9eC6k7axVTLdQmC0
	xCIJmgWcP9tTVZ0jvR4tVQ5FKwW05Cs44jUDytdN1BFe6SSONGBNY3Ce4vsJRwd8jt3v
	95V9je/H5QTIShz9dz7dfUNBghlEuV5PgXCH6sAEU+8GBtzUpoRWL9n2yi/raFKRtkAi
	rrnkbv2Q40nwrI3VU1jOAGd9UOSagPcT0IJUbQsEASlncZXIkb2Q3y0JbU6bGLCJM2LB
	R4f6ngReSWIN4nkIr8Cn5Ke+I1MSVZ3Kr7iHr6jfbbRMcbxmbQYULV7UFiIbcsdvzBHa
	EztA==
Received: by 10.204.152.4 with SMTP id e4mr170233bkw.2.1342168293675;
	Fri, 13 Jul 2012 01:31:33 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id fu8sm4214355bkc.5.2012.07.13.01.31.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 01:31:32 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 10:30:26 +0200
Message-Id: <1342168240-7760-19-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, V2 18/32] net-snmp: move systemd support to meta-systemd
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
X-List-Received-Date: Fri, 13 Jul 2012 08:42:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-extended/net-snmp/net-snmp_5.7.1.bb    |   17 ++---------------
 .../net-snmp/net-snmp}/snmpd.service               |    0
 .../net-snmp/net-snmp}/snmptrapd.service           |    0
 .../net-snmp/net-snmp}/systemd-support.patch       |    0
 .../net-snmp/net-snmp_5.7.1.bbappend               |   19 +++++++++++++++++++
 5 files changed, 21 insertions(+), 15 deletions(-)
 rename {meta-oe/recipes-extended/net-snmp/files => meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp}/snmpd.service (100%)
 rename {meta-oe/recipes-extended/net-snmp/files => meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp}/snmptrapd.service (100%)
 rename {meta-oe/recipes-extended/net-snmp/files => meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp}/systemd-support.patch (100%)
 create mode 100644 meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bbappend

diff --git a/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bb b/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bb
index 83df80a..f1e42b5 100644
--- a/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bb
+++ b/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bb
@@ -1,28 +1,18 @@
 require net-snmp.inc
-inherit systemd
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 LIC_FILES_CHKSUM = "file://README;beginline=3;endline=8;md5=7f7f00ba639ac8e8deb5a622ea24634e"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
         file://sync-with-5.7-branch.patch \
         file://libnl-3-support.patch \
-        file://systemd-support.patch \
-        file://snmpd.service \
-        file://snmptrapd.service \
         file://init \
         file://snmpd.conf \
         file://snmptrapd.conf"
 
-EXTRA_OECONF += "--disable-embedded-perl --with-perl-modules=no --with-systemd "
+EXTRA_OECONF += "--disable-embedded-perl --with-perl-modules=no"
 EXTRA_OEMAKE = "INSTALL_PREFIX=${D}"
 
-SYSTEMD_PACKAGES = "${PN}-server-snmpd-systemd \
-                    ${PN}-server-snmptrapd-systemd"
-
-SYSTEMD_SERVICE_${PN}-server-snmpd-systemd = "snmpd.service"
-SYSTEMD_SERVICE_${PN}-server-snmptrapd-systemd =  "snmptrapd.service"
-
 do_configure_prepend() {
         gnu-configize -f
         # We better change sources and re-autoconf here, but
@@ -37,6 +27,3 @@ CCACHE = ""
 
 SRC_URI[md5sum] = "c95d08fd5d93df0c11a2e1bdf0e01e0b"
 SRC_URI[sha256sum] = "7c71c9650c65b715356547e20ca2dbe6313944278af8cc19c32a5337f46b181f"
-
-RDEPENDS_${PN}-server-snmpd-systemd = "${PN}-server-snmpd"
-RDEPENDS_${PN}-server-snmptrapd-systemd = "${PN}-server-snmptrapd"
diff --git a/meta-oe/recipes-extended/net-snmp/files/snmpd.service b/meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp/snmpd.service
similarity index 100%
rename from meta-oe/recipes-extended/net-snmp/files/snmpd.service
rename to meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp/snmpd.service
diff --git a/meta-oe/recipes-extended/net-snmp/files/snmptrapd.service b/meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp/snmptrapd.service
similarity index 100%
rename from meta-oe/recipes-extended/net-snmp/files/snmptrapd.service
rename to meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp/snmptrapd.service
diff --git a/meta-oe/recipes-extended/net-snmp/files/systemd-support.patch b/meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp/systemd-support.patch
similarity index 100%
rename from meta-oe/recipes-extended/net-snmp/files/systemd-support.patch
rename to meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp/systemd-support.patch
diff --git a/meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bbappend b/meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bbappend
new file mode 100644
index 0000000..f221c1d
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bbappend
@@ -0,0 +1,19 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+PRINC := "${@int(PRINC) + 1}"
+
+inherit systemd
+
+SRC_URI += " \
+        file://systemd-support.patch \
+        file://snmpd.service \
+        file://snmptrapd.service \
+"
+
+EXTRA_OECONF += "--with-systemd"
+
+SYSTEMD_PACKAGES = "${PN}-server-snmpd-systemd \
+                    ${PN}-server-snmptrapd-systemd"
+
+SYSTEMD_SERVICE_${PN}-server-snmpd-systemd = "snmpd.service"
+SYSTEMD_SERVICE_${PN}-server-snmptrapd-systemd =  "snmptrapd.service"
-- 
1.7.6.5



