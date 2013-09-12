Return-Path: <muhammad_shakeel@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id 5BCE26B3C7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2013 15:27:40 +0000 (UTC)
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r8CFRW9F022993; 
	Thu, 12 Sep 2013 10:27:41 -0500
From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Sep 2013 20:28:53 +0500
Message-Id: <5edd378abcccf73276f64602d1b8dcc19cd9aaf1.1378998806.git.muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <2833ee588a108d99fb999bb8b21b297ec4af97fa.1378998806.git.muhammad_shakeel@mentor.com>
References: <2833ee588a108d99fb999bb8b21b297ec4af97fa.1378998806.git.muhammad_shakeel@mentor.com>
In-Reply-To: <cover.1378998806.git.muhammad_shakeel@mentor.com>
References: <cover.1378998806.git.muhammad_shakeel@mentor.com>
Subject: [meta-oe][meta-systemd][PATCH 2/3] lighttpd: Remove systemd support which is merged in oe-core
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
X-List-Received-Date: Thu, 12 Sep 2013 15:27:40 -0000

OE-Core has been updated to support lighttpd with systemd. Stuff here is
not required anymore.

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 .../lighttpd/lighttpd/lighttpd.service             |   13 -------------
 .../lighttpd/lighttpd_1.4.32.bbappend              |   15 ---------------
 2 files changed, 28 deletions(-)
 delete mode 100644 meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd/lighttpd.service

diff --git a/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd/lighttpd.service b/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd/lighttpd.service
deleted file mode 100644
index f4564f3..0000000
--- a/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd/lighttpd.service
+++ /dev/null
@@ -1,13 +0,0 @@
-[Unit]
-Description=Lightning Fast Webserver With Light System Requirements
-After=syslog.target
-
-[Service]
-Type=oneshot
-EnvironmentFile=-/etc/sysconfig/lighttpd
-ExecStart=/usr/sbin/lighttpd -D -f /etc/lighttpd.conf
-RemainAfterExit=yes
-
-[Install]
-WantedBy=multi-user.target
-
diff --git a/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend b/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend
index 96fa989..f006b3f 100644
--- a/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend
+++ b/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend
@@ -1,18 +1,3 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-PRINC := "${@int(PRINC) + 2}"
-
-inherit systemd
-
-SRC_URI += "file://lighttpd.service"
-
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "lighttpd.service"
-
-do_install_append() {
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/lighttpd.service ${D}${systemd_unitdir}/system
-}
-
-- 
1.7.9.5


