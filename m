Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SpbSf-000869-Lq
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 10:42:53 +0200
Received: by bkcik5 with SMTP id ik5so2247718bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 01:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=T+K5ec7/W4rRvR5j8vcumtscOSbT2l720OtqtPzXJIw=;
	b=Apdv+L6rBmDiC8cXAGlyLMXIFcx10BuI6nSqtz12mlFzPhFHt1VDhHB8l3X1UqTdl0
	0qHsl73qxZT6dgY60fYo2jH4ctKmtyT+7adV5TRkUNfrGDajmBvp3IsS3KNkaKDYqwD+
	uNQEpgYE3mjYSo5NtT8lDquXkAQZfhuzp2yHyE5JHLiiEkuyRWrSIuArVr9YM8/6mXxd
	DB+6/YseExxsLSjS4iPLSWGKMuH4HotRH1GfP0+eG0AzFaDQgy3NXPonSz+qAyfN7MYI
	RgJ3a7S0krbFbH09yqszejGwaMEU0+Sbex8+Ko/Xh/DgwxZ6rFZgWek4QWPUj4E6hKRm
	PaGg==
Received: by 10.205.125.4 with SMTP id gq4mr115679bkc.109.1342168299721;
	Fri, 13 Jul 2012 01:31:39 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id fu8sm4214355bkc.5.2012.07.13.01.31.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 01:31:38 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 10:30:30 +0200
Message-Id: <1342168240-7760-23-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, V2 22/32] gateone: move systemd support to meta-systemd
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
X-List-Received-Date: Fri, 13 Jul 2012 08:42:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-connectivity/gateone/gateone_git.bb    |    9 ++-------
 .../gateone/gateone/gateone.service                |    0
 .../gateone/gateone_git.bbappend                   |   11 +++++++++++
 3 files changed, 13 insertions(+), 7 deletions(-)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-connectivity/gateone/gateone/gateone.service (100%)
 create mode 100644 meta-systemd/meta-oe/recipes-connectivity/gateone/gateone_git.bbappend

diff --git a/meta-oe/recipes-connectivity/gateone/gateone_git.bb b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
index 12f4e51..f6aa377 100644
--- a/meta-oe/recipes-connectivity/gateone/gateone_git.bb
+++ b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
@@ -2,19 +2,18 @@ DESCRIPTION = "HTML5 (plugin-free) web-based terminal emulator and SSH client"
 LICENSE = "AGPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ee5b168fc7de89a0cadc49e27830aa2c"
 
-PR = "r7"
+PR = "r8"
 
 PV = "1.1"
 SRCREV = "bb74e1095adb66b04b51ed6ff10ae0aa96afdd46"
 SRC_URI = "git://github.com/liftoff/GateOne.git \
            file://gateone-avahi.service \
-           file://gateone.service \
            file://server.conf \
           "
 
 S = "${WORKDIR}/git"
 
-inherit distutils allarch systemd
+inherit distutils allarch
 
 export prefix = "${localstatedir}/lib"
 
@@ -27,10 +26,6 @@ do_install_append() {
 	install -m 0644 ${WORKDIR}/server.conf ${D}/var/lib/gateone/server.conf
 }
 
-NATIVE_SYSTEMD_SUPPORT = "1"
-SYSTEMD_PACKAGES = "${PN}"
-SYSTEMD_SERVICE = "gateone.service"
-
 FILES_${PN} = "${localstatedir}/lib ${localstatedir}/log ${base_libdir} ${sysconfdir}"
 RDEPENDS_${PN} = "file \
                   mime-support \
diff --git a/meta-oe/recipes-connectivity/gateone/gateone/gateone.service b/meta-systemd/meta-oe/recipes-connectivity/gateone/gateone/gateone.service
similarity index 100%
rename from meta-oe/recipes-connectivity/gateone/gateone/gateone.service
rename to meta-systemd/meta-oe/recipes-connectivity/gateone/gateone/gateone.service
diff --git a/meta-systemd/meta-oe/recipes-connectivity/gateone/gateone_git.bbappend b/meta-systemd/meta-oe/recipes-connectivity/gateone/gateone_git.bbappend
new file mode 100644
index 0000000..dd5fea1
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-connectivity/gateone/gateone_git.bbappend
@@ -0,0 +1,11 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+PRINC := "${@int(PRINC) + 1}"
+
+inherit systemd
+
+SRC_URI += "file://gateone.service"
+
+NATIVE_SYSTEMD_SUPPORT = "1"
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE = "gateone.service"
-- 
1.7.6.5



