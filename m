Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Shc5t-0001LG-8R
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jun 2012 09:46:21 +0200
Received: by wibhn14 with SMTP id hn14so3982330wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2012 00:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=v+zKHyXhrNiw67RRL6coxFuPhkX0CQTX1aH24Uzuerg=;
	b=OlInKF/9S/WhO9QqL46sHVS1wBDeqiNRIIgSrd4ishBBpJILCmg1pLkZI6hNch3XZi
	ybLCk6miwbo+YQ0cCBwa0hfQgj8rlbp0dXJyU5gAbW9QN0AqCiDpUXxAC0U8kW5AL5Q6
	5CsNDcVIgEg31S/1ezI09NLMILBz6QzMvFkDozEpU7fC5nm88yBchXMbsqqdolLUCt8p
	Enq/YaBr97RlowvW7IwtkCAiiLLlQKE3qWsOnAzAr0e1tLcokQ/M/UL5D3lOkIZZZ0/h
	fypNl8yNaiGWOZIXugby0FS4oLrOW8Vg18GNsZ++RDO+yt/NUGcytSGDFvW9XBoVFGXw
	GmGA==
Received: by 10.216.50.211 with SMTP id z61mr13024277web.57.1340264135244;
	Thu, 21 Jun 2012 00:35:35 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id dg2sm85631926wib.4.2012.06.21.00.35.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jun 2012 00:35:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Jun 2012 09:35:26 +0200
Message-Id: <1340264126-29651-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1339364820-2880-23-git-send-email-schnitzeltony@googlemail.com>
References: <1339364820-2880-23-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [RFC, meta-oe 22/27 v2] xserver-nodm-init: move systemd support to meta-systemd
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
X-List-Received-Date: Thu, 21 Jun 2012 07:46:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@googlemail.com>

contents of ${sysconfdir}/default/xserver-nodm were moved from
FILES_${PN}-systemd to FILES_${PN}


---

v2: xserver-nodm.conf was moved to meta-systemd and kept in ${PN}-systemd where it belongs


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xserver-nodm-init-2.0/xserver-nodm.conf        |    1 -
 .../xserver-nodm-init-2.0/xserver-nodm.service     |    9 --------
 .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |   14 +-----------
 .../xserver-nodm-init/xserver-nodm.conf            |    1 +
 .../xserver-nodm-init/xserver-nodm.service         |    9 ++++++++
 .../xserver-nodm-init_2.0.bbappend                 |   21 ++++++++++++++++++++
 6 files changed, 33 insertions(+), 22 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm.conf
 delete mode 100644 meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm.service
 create mode 100644 meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init/xserver-nodm.conf
 create mode 100644 meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init/xserver-nodm.service
 create mode 100644 meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend

diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm.conf b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm.conf
deleted file mode 100644
index 3c0582a..0000000
--- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm.conf
+++ /dev/null
@@ -1 +0,0 @@
-HOME=/home/root
diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm.service b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm.service
deleted file mode 100644
index c15a772..0000000
--- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm.service
+++ /dev/null
@@ -1,9 +0,0 @@
-[Unit]
-Description=Xserver startup with a display manager
-
-[Service]
-EnvironmentFile=/etc/default/xserver-nodm
-ExecStart=/usr/bin/xinit /etc/X11/Xsession -- /etc/X11/Xserver
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
index 62c33c9..e1f2a53 100644
--- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
+++ b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
@@ -3,34 +3,24 @@ LICENSE = "GPLv2"
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
-	install -d ${D}${sysconfdir}/default
-	install xserver-nodm.conf ${D}${sysconfdir}/default/xserver-nodm
 }
 
-FILES_${PN}-systemd += "${sysconfdir}/default/xserver-nodm"
-
 RDEPENDS_${PN} = "xserver-common (>= 1.30) xinit"
-RDEPENDS_${PN}-systemd += "xserver-common (>= 1.30) xinit"
diff --git a/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init/xserver-nodm.conf b/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init/xserver-nodm.conf
new file mode 100644
index 0000000..3c0582a
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init/xserver-nodm.conf
@@ -0,0 +1 @@
+HOME=/home/root
diff --git a/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init/xserver-nodm.service b/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init/xserver-nodm.service
new file mode 100644
index 0000000..c15a772
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init/xserver-nodm.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=Xserver startup with a display manager
+
+[Service]
+EnvironmentFile=/etc/default/xserver-nodm
+ExecStart=/usr/bin/xinit /etc/X11/Xsession -- /etc/X11/Xserver
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend b/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend
new file mode 100644
index 0000000..ed35412
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend
@@ -0,0 +1,21 @@
+FILESEXTRAPATHS := "${THISDIR}/${PN}"
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
1.7.8.6



