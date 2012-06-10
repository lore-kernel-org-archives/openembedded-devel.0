Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sdq3a-0001fg-2T
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jun 2012 23:52:22 +0200
Received: by mail-we0-f175.google.com with SMTP id g55so1679484wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2012 14:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=Tdhf/UtpYHSVwRdkp6zUI4Qziiv0zctZ/mWy7X7LaZE=;
	b=MQI9N8/xEmQxMMI4Q90cMa0bQ6alzgD9CYUpPN6+4RFlgHCvG6yOvV8IA/NHjw5hpq
	GdJ+/4q4D8h1hLl/qmS5FRNcCj7Wh9EwdwmsjNvV9aOlq9Cx6XOHGWgtip5GgdezLfF6
	gmnzKK61sjEb9p8EwFNfEZnzh8ieA/dePe8bkLQjJHeG3SYcZgvGAxdiGCpo8khPziL7
	fb7h9WyyuGuVAyiC4vSGrvWiJZzCVbvshq3WtkKYrwSqD8MJqG1NxcbplSAfrp29F6v5
	ALcKsxlZ8CQM9QLg+7PaXNpGUdOPKRj6tUjsPJvfj3qbbqlbVh1JAhvvKu5nb5/BNEnm
	0FKg==
Received: by 10.180.102.228 with SMTP id fr4mr15711915wib.6.1339364511437;
	Sun, 10 Jun 2012 14:41:51 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2104.dip.t-dialin.net. [91.10.33.4])
	by mx.google.com with ESMTPS id gc6sm19758306wib.0.2012.06.10.14.41.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Jun 2012 14:41:50 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2012 23:46:46 +0200
Message-Id: <1339364820-2880-14-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
References: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [RFC, meta-oe 13/27] net-snmp: move systemd support to meta-systemd
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
X-List-Received-Date: Sun, 10 Jun 2012 21:52:22 -0000
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
index 0000000..a889859
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bbappend
@@ -0,0 +1,19 @@
+FILESEXTRAPATHS := "${THISDIR}/${PN}"
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
1.7.4.4



