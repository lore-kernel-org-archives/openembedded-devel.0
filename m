Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sdq3m-0001fg-O9
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jun 2012 23:52:34 +0200
Received: by mail-we0-f175.google.com with SMTP id g55so1679484wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2012 14:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=ygNs4B4p//6aNnr2LfPKQ1P3V3SrJziQDxLex+oy0Zw=;
	b=n3pN5/upahOiasCeGemAEQda+SZcGlS58iTxuWi2sT4OmD53cyhybqslKOgvfTs0KT
	IEnEh9vV5krwm33rioIZWUSbAZSIzLjNKSVnRtjvX2SRncCnhDFJmMCiM0kD8xLnanSl
	4jaVEwZKPZvRut3Siqz0obrRsI2VssCvF/T4VoaiYZZH4gjDhK4cA6yJj9gvLQ+NhEEk
	2/XokyulMPasOfJPlh6cAxnOJiP91c7+05YxQsMaizsA+gzYet5dGdCnVL5yDx4i17cO
	PQhmXGqG/omJnq4KUH945FkUAP9E4qlc/nKrNGQUeKiCHWR074oAaYXr0LCKXQySAX7y
	oKEw==
Received: by 10.180.93.99 with SMTP id ct3mr15716235wib.13.1339364524271;
	Sun, 10 Jun 2012 14:42:04 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2104.dip.t-dialin.net. [91.10.33.4])
	by mx.google.com with ESMTPS id gc6sm19758306wib.0.2012.06.10.14.42.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Jun 2012 14:42:03 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2012 23:46:55 +0200
Message-Id: <1339364820-2880-23-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
References: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [RFC, meta-oe 22/27] xserver-nodm-init: move systemd support to meta-systemd
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
X-List-Received-Date: Sun, 10 Jun 2012 21:52:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

contents of ${sysconfdir}/default/xserver-nodm were moved from
FILES_${PN}-systemd to FILES_${PN}

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |   11 +++--------
 .../xserver-nodm-init}/xserver-nodm.service        |    0
 .../xserver-nodm-init_2.0.bbappend                 |   12 ++++++++++++
 3 files changed, 15 insertions(+), 8 deletions(-)
 rename {meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0 => meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init}/xserver-nodm.service (100%)
 create mode 100644 meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend

diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
index 62c33c9..c62d0ec 100644
--- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
+++ b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
@@ -3,10 +3,9 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11"
 
-PR = "r16"
+PR = "r17"
 
 SRC_URI = "file://xserver-nodm \
-           file://xserver-nodm.service \
            file://xserver-nodm.conf \
            file://gplv2-license.patch \
 "
@@ -14,15 +13,12 @@ S = "${WORKDIR}"
 
 inherit allarch
 
-inherit update-rc.d systemd
+inherit update-rc.d
 
 INITSCRIPT_NAME = "xserver-nodm"
 INITSCRIPT_PARAMS = "start 01 5 2 . stop 01 0 1 6 ."
 INITSCRIPT_PARAMS_shr = "start 90 5 2 . stop 90 0 1 6 ."
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE_${PN}-systemd = "xserver-nodm.service"
-
 do_install() {
 	install -d ${D}${sysconfdir}/init.d
 	install xserver-nodm ${D}${sysconfdir}/init.d
@@ -30,7 +26,6 @@ do_install() {
 	install xserver-nodm.conf ${D}${sysconfdir}/default/xserver-nodm
 }
 
-FILES_${PN}-systemd += "${sysconfdir}/default/xserver-nodm"
+FILES_${PN} += "${sysconfdir}/default/xserver-nodm"
 
 RDEPENDS_${PN} = "xserver-common (>= 1.30) xinit"
-RDEPENDS_${PN}-systemd += "xserver-common (>= 1.30) xinit"
diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm.service b/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init/xserver-nodm.service
similarity index 100%
rename from meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm.service
rename to meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init/xserver-nodm.service
diff --git a/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend b/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend
new file mode 100644
index 0000000..0a0b170
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend
@@ -0,0 +1,12 @@
+FILESEXTRAPATHS := "${THISDIR}/${PN}"
+
+PRINC := "${@int(PRINC) + 1}"
+
+inherit systemd
+
+SRC_URI += "file://xserver-nodm.service"
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE_${PN}-systemd = "xserver-nodm.service"
+
+RDEPENDS_${PN}-systemd += "xserver-common (>= 1.30) xinit"
-- 
1.7.4.4



