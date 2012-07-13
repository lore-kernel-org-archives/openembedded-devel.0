Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SpbSQ-000812-BJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 10:42:39 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2247550bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 01:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=G7HbjadBHGTgVorYYXPr0YxEV1EK1h9Xk1J9ExNxG/I=;
	b=Mkbx1ukvmuuzqtH9hmXokgGLF9xDrJ762u5iuASwGLn4y13r36oXv0V28eMm2tf5EC
	ZtSEewtxKXmQJ371vL9vAuCxWMyqg/3kkBk/IWkHl4J5LNX+nDOGytmHO0tS3YFav1jN
	fuGBquj9hjSz/VmbSBat8/Qf9WAh7amrA9OgSPSq0jlGPIawYeygkdT1Xm+RR4lVfqXS
	AUWYOATWnlO+v6qkYeCO35XanAI8WlOyRtlgbscunkMZKWwUAVx2BV706+AYtvGr8483
	WzDJjj3XZinwp+3jRD/CM5vePNm9cKAkWz+k/OgNrXhaWVebvpD7N8n6vBeawnFKIzpk
	ji2g==
Received: by 10.205.132.12 with SMTP id hs12mr157903bkc.47.1342168286494;
	Fri, 13 Jul 2012 01:31:26 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id fu8sm4214355bkc.5.2012.07.13.01.31.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 01:31:25 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 10:30:21 +0200
Message-Id: <1342168240-7760-14-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, V2 13/32] syslog-ng: move systemd support to meta-systemd
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
X-List-Received-Date: Fri, 13 Jul 2012 08:42:56 -0000
X-List-Received-Date: Fri, 13 Jul 2012 08:42:56 -0000
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
1.7.6.5



