Return-Path: <n.s.glynn@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id AF05C60F06
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 14:11:04 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id l12so3588344wiv.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 07:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0/hK9l8zIlJ3sA51Xnwm7Q/Rywj9XjsN0phIqLCUdtI=;
	b=kK99Suu4FII85caglKcRC+GB6b5ituBY2HwEfFizpEtPk5kejs6nFDTnDoWo1JdUST
	lK/WKBXRXKlJuenWDbT35b/uz1/avMIs2dtZqiTQV2EVduhEFfP2gHb/VAhoUJJRVGaE
	/dhfEGvMSE8TTQCcMZ2gEKLSy12ePSptyTWDA7k1X+tKQhHO1o5uY4lctvWNLQy9nInn
	zI4Gw5QpOpZoSZmBPDMAy1wK31Bi02iBVibeG0kDMWMgCkjT//Ss2gE/H8UU5jrIYNIf
	6RMWhSl88Wk3tOxS7RgsVPCtFGQs+p3MD6QJBd5vorbAH08bkKs40Go3WGifpZezioiQ
	ZVlw==
X-Received: by 10.180.160.178 with SMTP id xl18mr15019520wib.61.1381759864021; 
	Mon, 14 Oct 2013 07:11:04 -0700 (PDT)
Received: from zeus.default ([2.26.95.140]) by mx.google.com with ESMTPSA id
	sh5sm34639055wic.11.2013.10.14.07.11.03 for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Oct 2013 07:11:03 -0700 (PDT)
From: Nick Glynn <n.s.glynn@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Oct 2013 15:10:54 +0100
Message-Id: <1381759854-20148-1-git-send-email-n.s.glynn@gmail.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [meta-webserver][PATCH] sthttpd: Adds systemd service
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Oct 2013 14:11:05 -0000

Fixed version no longer confuses uses sthttpd as service name to
prevent issues with sysv compatibility and removes extraneous
RPROVIDES/RCONFLICTS and RREPLACES.

Signed-off-by: Nick Glynn <n.s.glynn@gmail.com>
---
 meta-webserver/recipes-httpd/sthttpd/sthttpd/thttpd.service | 10 ++++++++++
 meta-webserver/recipes-httpd/sthttpd/sthttpd_2.26.4.bb      |  7 ++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 meta-webserver/recipes-httpd/sthttpd/sthttpd/thttpd.service

diff --git a/meta-webserver/recipes-httpd/sthttpd/sthttpd/thttpd.service b/meta-webserver/recipes-httpd/sthttpd/sthttpd/thttpd.service
new file mode 100644
index 0000000..b75f751
--- /dev/null
+++ b/meta-webserver/recipes-httpd/sthttpd/sthttpd/thttpd.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Tiny/Turbo/Throttling Web Server
+
+[Service]
+Type=forking
+ExecStart=/usr/sbin/thttpd -d /srv/www -c cgi-bin/* -i /var/run/thttpd.pid
+PIDFile=/var/run/thttpd.pid
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.26.4.bb b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.26.4.bb
index b720314..a4118ac 100644
--- a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.26.4.bb
+++ b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.26.4.bb
@@ -5,6 +5,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://src/thttpd.c;beginline=1;endline=26;md5=0c5762c2c34dcbe9eb18815516502872"
 
 SRC_URI = "http://opensource.dyc.edu/pub/sthttpd/sthttpd-${PV}.tar.gz \
+           file://thttpd.service \
            file://init"
 
 SRC_URI[md5sum] = "e645a85a97d3cb883011a35bc2211815"
@@ -12,7 +13,7 @@ SRC_URI[sha256sum] = "78e87979140cbda123c81b4051552242dbbffb5dec1a17e5f95ec4826b
 
 S = "${WORKDIR}/sthttpd-${PV}"
 
-inherit autotools update-rc.d
+inherit autotools update-rc.d systemd
 
 EXTRA_OEMAKE += "'WEBDIR=${servicedir}/www'"
 
@@ -21,6 +22,9 @@ do_install_append () {
     install -c -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/thttpd
     sed -i -e 's,@@SRVDIR,${servicedir}/www,g' ${D}${sysconfdir}/init.d/thttpd
     sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/thttpd
+    
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/thttpd.service ${D}${systemd_unitdir}/system
 }
 
 INITSCRIPT_NAME = "thttpd"
@@ -28,3 +32,4 @@ INITSCRIPT_PARAMS = "defaults"
 
 FILES_${PN} += "${servicedir}"
 FILES_${PN}-dbg += "${servicedir}/www/cgi-bin/.debug"
+SYSTEMD_SERVICE_${PN} = "thttpd.service"
-- 
1.8.3.1


