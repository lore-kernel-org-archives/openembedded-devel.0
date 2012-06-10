Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sdq3R-0001fo-Ju
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jun 2012 23:52:13 +0200
Received: by mail-wi0-f177.google.com with SMTP id hm14so2039672wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2012 14:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=tckquuSrFSdwH7BOdohv6STDyyhdDVfb5qrdhrksPbM=;
	b=qeLN9JFqJBWfksIW+YbiZO6aX94tix6YOq8dT/c2/4bxw7SdfGr8NAFWbDBhDiR44P
	7/fHmjvJNx9uxU7KcNxSljzATEAcacSEHTTNoIooiJ8ileEaG/Kst/s3lQzMibzfeeu2
	2e+Tue7dISo26VX5AbxvjowMKTBlRlJaRd1j5/rwjIfVvvv10s9f7G2HYpVWpG9wZqF2
	uv64Pby/Tx315oltkhBpDnAQKwAvIBYs7K61ovJ77wXf/C86ohkYe6X44s4gV0V5jzG0
	tvzIRQ1Sj8USfa6ORGaujwVvAVABBYliUN10S7LLCFvRcAN2dwhWCWFJloHnw9+YjTAS
	dmeg==
Received: by 10.216.193.129 with SMTP id k1mr5021526wen.201.1339364503272;
	Sun, 10 Jun 2012 14:41:43 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2104.dip.t-dialin.net. [91.10.33.4])
	by mx.google.com with ESMTPS id gc6sm19758306wib.0.2012.06.10.14.41.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Jun 2012 14:41:42 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2012 23:46:40 +0200
Message-Id: <1339364820-2880-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
References: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [RFC, meta-oe 07/27] ntp: move systemd support to meta-systemd
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
X-List-Received-Date: Sun, 10 Jun 2012 21:52:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Additionaly ntpdate.service was moved to a new package ntpdate-systemd

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb         |   17 +---------------
 .../meta-oe/recipes-support/ntp/ntp}/ntpd.service  |    0
 .../recipes-support/ntp/ntp}/ntpdate.service       |    0
 .../recipes-support/ntp/ntp_4.2.6p3.bbappend       |   21 ++++++++++++++++++++
 4 files changed, 22 insertions(+), 16 deletions(-)
 rename {meta-oe/recipes-support/ntp/files => meta-systemd/meta-oe/recipes-support/ntp/ntp}/ntpd.service (100%)
 rename {meta-oe/recipes-support/ntp/files => meta-systemd/meta-oe/recipes-support/ntp/ntp}/ntpdate.service (100%)
 create mode 100644 meta-systemd/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bbappend

diff --git a/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb b/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb
index ece8720..7c26e94 100644
--- a/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb
+++ b/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb
@@ -1,11 +1,6 @@
 require ntp.inc
 
-PR = "r5"
-
-inherit systemd
-
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE_${PN}-systemd = "ntpd.service"
+PR = "r6"
 
 SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/${P}.tar.gz \
         file://tickadj.c.patch \
@@ -13,8 +8,6 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/${P}.tar.gz \
         file://ntpd \
         file://ntp.conf \
         file://ntpdate \
-        file://ntpdate.service \
-        file://ntpd.service \
 "
 
 SRC_URI[md5sum] = "59876a9009b098ff59767ee45a88ebd2"
@@ -29,16 +22,8 @@ do_install_append() {
 	install -d ${D}/${sysconfdir}/network/if-up.d
 	install -m 755 ${WORKDIR}/ntpdate ${D}/${sysconfdir}/network/if-up.d
 
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/ntpdate.service ${D}${systemd_unitdir}/system/
-	install -m 0644 ${WORKDIR}/ntpd.service ${D}${systemd_unitdir}/system/
 }
 
-PACKAGES =+ "${PN}-systemd"
-
-FILES_${PN}-systemd = "${systemd_unitdir}/system/"
-RDEPENDS_${PN}-systemd = "${PN}"
-
 FILES_${PN}-bin = "${bindir}/ntp-wait ${bindir}/ntpdc ${bindir}/ntpq ${bindir}/ntptime ${bindir}/ntptrace"
 FILES_${PN} = "${bindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/ntpd"
 FILES_${PN}-tickadj = "${bindir}/tickadj"
diff --git a/meta-oe/recipes-support/ntp/files/ntpd.service b/meta-systemd/meta-oe/recipes-support/ntp/ntp/ntpd.service
similarity index 100%
rename from meta-oe/recipes-support/ntp/files/ntpd.service
rename to meta-systemd/meta-oe/recipes-support/ntp/ntp/ntpd.service
diff --git a/meta-oe/recipes-support/ntp/files/ntpdate.service b/meta-systemd/meta-oe/recipes-support/ntp/ntp/ntpdate.service
similarity index 100%
rename from meta-oe/recipes-support/ntp/files/ntpdate.service
rename to meta-systemd/meta-oe/recipes-support/ntp/ntp/ntpdate.service
diff --git a/meta-systemd/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bbappend b/meta-systemd/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bbappend
new file mode 100644
index 0000000..a53d5bb
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bbappend
@@ -0,0 +1,21 @@
+inherit systemd
+
+PRINC := "${@int(PRINC) + 1}"
+
+# look for files in the layer first
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SYSTEMD_PACKAGES = "${PN}-systemd ntpdate-systemd"
+SYSTEMD_SERVICE_${PN}-systemd = "ntpd.service"
+SYSTEMD_SERVICE_ntpdate-systemd = "ntpdate.service"
+
+SRC_URI += " \
+	file://ntpdate.service \
+        file://ntpd.service \
+"
+
+do_install_append() {
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/ntpdate.service ${D}${systemd_unitdir}/system/
+	install -m 0644 ${WORKDIR}/ntpd.service ${D}${systemd_unitdir}/system/
+}
-- 
1.7.4.4



