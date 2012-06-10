Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sdq3f-0001fg-4R
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jun 2012 23:52:27 +0200
Received: by mail-we0-f175.google.com with SMTP id g55so1679484wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2012 14:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=q+9JliKxZVYNIC9/nUfcy4uOoc3FW9q6zVIe8zo/vxs=;
	b=ZOkYmzxUoNZ4I2mCA6EgOSebvomidhbnsrw7W7sxc5foxwxGVUKiPaMHaK0XNyIoFW
	a0zAS6Rik/8pNBVV0KIk4x0SKW5SIOhmUE/4xNnxUASd4NKUgRqEcDUhm2c8SUwn1CSY
	8Vl6htMsIWUJg+Ixsb7LMzj5Mekdc3sKTVj5oGiFUBXMrFvlpqEiaIJg4HFPRmCrY/g8
	akuf12PQbI6VYA+vC9GkdW0ymL4MF8l0k38AoedmM8ob1xv04G+YtX1FyJJpWxMNgD3D
	RD0hfwV3sfcNBkixbxNvrbFU+TrkIZ47Nw9E8Tj4pJxVZ3QqqbMkNhjIwJFLoRgn9fa4
	uT3w==
Received: by 10.180.106.7 with SMTP id gq7mr15691794wib.4.1339364516807;
	Sun, 10 Jun 2012 14:41:56 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2104.dip.t-dialin.net. [91.10.33.4])
	by mx.google.com with ESMTPS id gc6sm19758306wib.0.2012.06.10.14.41.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Jun 2012 14:41:56 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2012 23:46:50 +0200
Message-Id: <1339364820-2880-18-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
References: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [RFC, meta-oe 17/27] gateone: move systemd support to meta-systemd
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
X-List-Received-Date: Sun, 10 Jun 2012 21:52:27 -0000
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
index 0000000..cf25c89
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-connectivity/gateone/gateone_git.bbappend
@@ -0,0 +1,11 @@
+FILESEXTRAPATHS := "${THISDIR}/${PN}"
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
1.7.4.4



