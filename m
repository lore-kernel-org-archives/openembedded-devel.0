Return-Path: <n.s.glynn@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 28A4D6CEDE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2013 21:45:33 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id m15so231535wgh.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2013 14:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=j8dUhrJeg/8pHNbKsMNgGvoshGmY+z3gCalavu0JtoM=;
	b=Z/hwKXTQbfaTn29ltLhDUzuiXtv5TpI/NfSCu7x+guqOfgSE3rAcgLlVNn71Kb1M1P
	kxsHTbJoC7tklyudmLXr0/BeByQ228dE4uG8WOEdzQf09CXTtC/fcPzWtHo2HHfwrARO
	GK9gN0NIj0Dk0TDX+nT24AmUl3VzzWtSsbaKCQNVB3IRotygXhnGzEXdhSroDNzJVDH+
	eJIcTFNwCLMt8hcJK/+wpeTkeeO6C8pelze57qQPXAmFYKj67VK8jqXE3PFzVw/9jm2j
	vbAs2BvmFtr06P2ozBAfwyoEvaCVDk4ECfVSlDbRLxZT7ZZQLYT5CUqNLhT7eAkjR9TN
	CDLQ==
X-Received: by 10.180.100.202 with SMTP id fa10mr396075wib.8.1381441534599;
	Thu, 10 Oct 2013 14:45:34 -0700 (PDT)
Received: from zeus.default ([2.26.95.140])
	by mx.google.com with ESMTPSA id j5sm29559726wia.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 10 Oct 2013 14:45:34 -0700 (PDT)
From: Nick Glynn <n.s.glynn@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Oct 2013 22:45:08 +0100
Message-Id: <1381441508-4287-2-git-send-email-n.s.glynn@gmail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1381441508-4287-1-git-send-email-n.s.glynn@gmail.com>
References: <1381441508-4287-1-git-send-email-n.s.glynn@gmail.com>
Subject: [meta-webserver][PATCH 2/2] sthttpd: Added systemd service to recipe
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
X-List-Received-Date: Thu, 10 Oct 2013 21:45:33 -0000

Recipe updated with a systemd service file to remove need for
sysvinit compatibility

Signed-off-by: Nick Glynn <n.s.glynn@gmail.com>
---
 meta-webserver/recipes-httpd/sthttpd/sthttpd/sthttpd.service | 10 ++++++++++
 meta-webserver/recipes-httpd/sthttpd/sthttpd_2.26.4.bb       | 11 +++++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)
 create mode 100644 meta-webserver/recipes-httpd/sthttpd/sthttpd/sthttpd.service

diff --git a/meta-webserver/recipes-httpd/sthttpd/sthttpd/sthttpd.service b/meta-webserver/recipes-httpd/sthttpd/sthttpd/sthttpd.service
new file mode 100644
index 0000000..b75f751
--- /dev/null
+++ b/meta-webserver/recipes-httpd/sthttpd/sthttpd/sthttpd.service
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
index ba2f047..40c410d 100644
--- a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.26.4.bb
+++ b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.26.4.bb
@@ -5,6 +5,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://src/thttpd.c;beginline=1;endline=26;md5=0c5762c2c34dcbe9eb18815516502872"
 
 SRC_URI = "http://opensource.dyc.edu/pub/sthttpd/sthttpd-${PV}.tar.gz \
+           file://sthttpd.service \
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
+    install -m 0644 ${WORKDIR}/sthttpd.service ${D}${systemd_unitdir}/system
 }
 
 INITSCRIPT_NAME = "thttpd"
@@ -28,4 +32,7 @@ INITSCRIPT_PARAMS = "defaults"
 
 FILES_${PN} += "${servicedir}"
 FILES_${PN}-dbg += "${servicedir}/www/cgi-bin/.debug"
-
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "sthttpd.service"
-- 
1.8.3.1


