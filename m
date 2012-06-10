Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sdq3S-0001fb-VK
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jun 2012 23:52:14 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so2267906wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2012 14:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=itLRONz3jy1gJ5NQbJ8oPpvQoX/U2vh2Mx8Tz5T1YjA=;
	b=dYMjae2lkyYO6rKCAWR4QLA1//f8H6Hc/Q5FA/bl53coXlMtPx+TVVU97XdaWfYTWp
	4haOAf+ZCGHFM5DJSChxGsXrlEPlFy4Wc+VZurhlvlC/Nvulyycv4RO4o9XCntawA2NY
	7F/el1hzsNbbasKygaVnGpJrHOHYfgpOMeP3vBGqNcJ1OhPU1Nq/LoW91hWYO1pVwe81
	RsY6jHVjnAwf8j8JWjFRNNoikQW+VLZuKz4y86wQ75m+rH3Zidf1RvjVX1Vcx8N1G66s
	DcbhjNpqLAWZ6E64UHFvTxkTlvXN8jP23nsvxtJts7b2QkbAuGDSOUyXw2yiMeKRcHs7
	9sJw==
Received: by 10.181.11.137 with SMTP id ei9mr15712083wid.21.1339364504679;
	Sun, 10 Jun 2012 14:41:44 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2104.dip.t-dialin.net. [91.10.33.4])
	by mx.google.com with ESMTPS id gc6sm19758306wib.0.2012.06.10.14.41.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Jun 2012 14:41:44 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2012 23:46:41 +0200
Message-Id: <1339364820-2880-9-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
References: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [RFC, meta-oe 08/27] syslog-ng: move systemd support to meta-systemd
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
X-List-Received-Date: Sun, 10 Jun 2012 21:52:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |    9 ++-------
 .../syslog-ng/syslog-ng_3.2.5.bbappend             |   11 +++++++++++
 2 files changed, 13 insertions(+), 7 deletions(-)
 create mode 100644 meta-systemd/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bbappend

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index 50ce4a4..584e4a4 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -7,9 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7ec1bcc46f28b11f4722e20d9b7dd4d5"
 # update-rc.d and update-alternatives is important
 RDEPENDS_${PN} += " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "update-rc.d", d)}"
 
-INC_PR = "r8"
+INC_PR = "r9"
 
-inherit autotools systemd
+inherit autotools
 
 SRC_URI = "http://www.balabit.com/downloads/files/syslog-ng/sources/${PV}/source/${PN}_${PV}.tar.gz"
 
@@ -25,8 +25,6 @@ EXTRA_OECONF = " \
   --disable-linux-caps \
   --disable-pcre \
   --disable-sql \
-  --enable-systemd \
-  --with-systemdsystemunitdir=${systemd_unitdir}/system \
 "
 
 do_configure_prepend() {
@@ -44,9 +42,6 @@ do_install_append() {
         install -m 755 ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/syslog.${PN}
 }
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "${PN}.service"
-
 FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS} \
             ${sysconfdir} ${sharedstatedir} ${localstatedir} \
             ${base_bindir}/* ${base_sbindir}/* \
diff --git a/meta-systemd/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bbappend b/meta-systemd/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bbappend
new file mode 100644
index 0000000..92c2e77
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bbappend
@@ -0,0 +1,11 @@
+inherit systemd
+
+PRINC := "${@int(PRINC) + 1}"
+
+EXTRA_OECONF += " \
+  --enable-systemd \
+  --with-systemdsystemunitdir=${systemd_unitdir}/system \
+"
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "${PN}.service"
-- 
1.7.4.4



