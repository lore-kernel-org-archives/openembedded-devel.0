Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SpbSm-00085v-1L
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 10:43:00 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2247681bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 01:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=hquiHFxYGwqfydgyTsUGOlmXtjm8ddnGDd5pb6qYW5k=;
	b=sZ+kZArt+32QFp7jZiB1lpL/cagwuyDhEOyA0ABJnXh3BdCQLAdh/YRofFhstSF9dU
	kx09KuamYj51MCnjIYei/0DWdFozYC2WC2+ds7NNf4A2EWCws6scHU58h15TGGn8LmTS
	Jef0EJEIVUa9oczOdmthU6SSXS+EQGHxkk9F79MDwkjhcDxcD+rwfg8KT4xzi64cXFaf
	pptkcwtEggk/yZM8uxOJGc9WQsN0SKQGqiHu7Yhx427DLFFE6ubwsT0hGo7fWdzGG4Bv
	7m2Jr4+ji3XVo+FyRcJHgk8+qS3gQKGRXsB1qxR30vnp/DvMcA9SobkUnL+2XwSfyPFx
	Gp+Q==
Received: by 10.204.141.15 with SMTP id k15mr116504bku.107.1342168308195;
	Fri, 13 Jul 2012 01:31:48 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id fu8sm4214355bkc.5.2012.07.13.01.31.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 01:31:47 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 10:30:35 +0200
Message-Id: <1342168240-7760-28-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, V2 27/32] xserver-nodm-init: move systemd support to meta-systemd
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
X-List-Received-Date: Fri, 13 Jul 2012 08:43:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |   16 +-------------
 .../xserver-nodm-init}/xserver-nodm.conf           |    0
 .../xserver-nodm-init}/xserver-nodm.service        |    0
 .../xserver-nodm-init_2.0.bbappend                 |   21 ++++++++++++++++++++
 4 files changed, 23 insertions(+), 14 deletions(-)
 rename {meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0 => meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init}/xserver-nodm.conf (100%)
 rename {meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0 => meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init}/xserver-nodm.service (100%)
 create mode 100644 meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend

diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
index 62c33c9..544ae7f 100644
--- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
+++ b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
@@ -3,34 +3,22 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11"
 
-PR = "r16"
+PR = "r17"
 
 SRC_URI = "file://xserver-nodm \
-           file://xserver-nodm.service \
-           file://xserver-nodm.conf \
            file://gplv2-license.patch \
 "
 S = "${WORKDIR}"
 
-inherit allarch
-
-inherit update-rc.d systemd
+inherit allarch update-rc.d
 
 INITSCRIPT_NAME = "xserver-nodm"
 INITSCRIPT_PARAMS = "start 01 5 2 . stop 01 0 1 6 ."
 INITSCRIPT_PARAMS_shr = "start 90 5 2 . stop 90 0 1 6 ."
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE_${PN}-systemd = "xserver-nodm.service"
-
 do_install() {
 	install -d ${D}${sysconfdir}/init.d
 	install xserver-nodm ${D}${sysconfdir}/init.d
-	install -d ${D}${sysconfdir}/default
-	install xserver-nodm.conf ${D}${sysconfdir}/default/xserver-nodm
 }
 
-FILES_${PN}-systemd += "${sysconfdir}/default/xserver-nodm"
-
 RDEPENDS_${PN} = "xserver-common (>= 1.30) xinit"
-RDEPENDS_${PN}-systemd += "xserver-common (>= 1.30) xinit"
diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm.conf b/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init/xserver-nodm.conf
similarity index 100%
rename from meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm.conf
rename to meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init/xserver-nodm.conf
diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm.service b/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init/xserver-nodm.service
similarity index 100%
rename from meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm.service
rename to meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init/xserver-nodm.service
diff --git a/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend b/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend
new file mode 100644
index 0000000..5538805
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend
@@ -0,0 +1,21 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+PRINC := "${@int(PRINC) + 1}"
+
+inherit systemd
+
+SRC_URI += "file://xserver-nodm.service \
+            file://xserver-nodm.conf \
+"
+
+do_install_append() {
+        install -d ${D}${sysconfdir}/default
+        install xserver-nodm.conf ${D}${sysconfdir}/default/xserver-nodm
+}
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE_${PN}-systemd = "xserver-nodm.service"
+
+FILES_${PN}-systemd += "${sysconfdir}/default/xserver-nodm"
+
+RDEPENDS_${PN}-systemd += "xserver-common (>= 1.30) xinit"
-- 
1.7.6.5



