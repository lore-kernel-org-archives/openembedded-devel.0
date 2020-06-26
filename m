Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.6818.1593174667849337565
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 05:31:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kynetics-com.20150623.gappssmtp.com header.s=20150623 header.b=rvevz+4p;
 spf=neutral (domain: kynetics.com, ip: 209.85.221.68, mailfrom: jacopo.dallaglio@kynetics.com)
Received: by mail-wr1-f68.google.com with SMTP id r12so9278073wrj.13
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2020 05:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynetics-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZncG9M3zdGvW8fpL3paOzuDkTleelNm827XYamTN/JI=;
        b=rvevz+4pn88kJVdfZHofmony5PVCVZLwVZUnpXP9VllMTA7pPO2F+2jiIkjsahmGY7
         EPxhpt/axHwkCJl6G/HGb7wrf/nCPethEaSQBgvWgN+A59rnjC5PAscgkkAwEelHZLlb
         oaGL0zUNwq4tmyFex31J6qZp3vrogxBUWnmLRqMTPMuEcF07hckI3fnK1lmO3RBYLB6A
         3Vu4F2Djy9o6th12mdqXa9j5XU+oUTmQkcCulihYMN6r169Fb1m9T0ZpMDINT5xhA0jG
         H/eBgIahNS/Dy9qnjyueZ0OroQ5K6KrX11yqI9vaOQHawgVgoujM46/CSjDfl8wpxncp
         lRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZncG9M3zdGvW8fpL3paOzuDkTleelNm827XYamTN/JI=;
        b=GLHK89H19Dauo6XeyOeD/il2QsbHSQ3K/VIAZsmuU0bzoPBuNcvKujGHm2DszVTj0p
         mHC8UzqcF9GX2n0BBn+BJbAkdRtO4svpQP9EbLtWaChvhzbw21NkUkmnpIvAG4T9kDst
         sNwowpcAHJqx4aKH7RbnQPtbCg6fPKNHCm3L4JcQ1ly4DOR71R4sNqf6AKkBzWdhJp/u
         UyR25JtQHlm0w28wibv39+xk0L6JBwshXWFIAEQO+V1YtFWlBQdhRmi3XH7on3GINMoK
         fbYIqeq8Y/tTAEKeibfxT8IzsQ1AGaILYWffWaFqU60x3532ju8AGBZB7sriJ4i4cl5E
         kD6g==
X-Gm-Message-State: AOAM5305oKQJSA894tEXRY0grrLWYO2xnslWQ1qsxQJste5SuaT5kkVp
	TslSPFfckNMl3ZYi10GqHCwkWpxwZQ==
X-Google-Smtp-Source: ABdhPJzykVdnJQGU79XsCja0qy9kewbkACJKzQhYBAVc80xtoUTsTfkahJyl4a3VSFqPbvMXAoEtHw==
X-Received: by 2002:a05:6000:18c:: with SMTP id p12mr3827489wrx.66.1593174666023;
        Fri, 26 Jun 2020 05:31:06 -0700 (PDT)
Return-Path: <jacopo.dallaglio@kynetics.com>
Received: from localhost.localdomain.home-life.hub ([176.206.83.120])
        by smtp.gmail.com with ESMTPSA id u23sm23614848wru.94.2020.06.26.05.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 05:31:05 -0700 (PDT)
From: "Jacopo Dall'Aglio" <jacopo.dallaglio@kynetics.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jacopo Dall'Aglio <jacopo.dallaglio@kynetics.com>
Subject: [meta-networking][PATCH] netplan: upgrade 0.98 -> 0.99
Date: Fri, 26 Jun 2020 14:29:02 +0200
Message-Id: <20200626122902.25243-1-jacopo.dallaglio@kynetics.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Main new features of netplan release 0.99:
- YAML parser is now in a separate library named libnetplan
- Systemd unit file for launching WPA Supplicant with netplan
  configuration is now generated at runtime
See here for a full comparison:
https://github.com/CanonicalLtd/netplan/compare/0.98...0.99

Signed-off-by: Jacopo Dall'Aglio <jacopo.dallaglio@kynetics.com>
---
 .../{netplan_0.98.bb => netplan_0.99.bb}      | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)
 rename meta-networking/recipes-connectivity/netplan/{netplan_0.98.bb => netplan_0.99.bb} (81%)

diff --git a/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb b/meta-networking/recipes-connectivity/netplan/netplan_0.99.bb
similarity index 81%
rename from meta-networking/recipes-connectivity/netplan/netplan_0.98.bb
rename to meta-networking/recipes-connectivity/netplan/netplan_0.99.bb
index 9f123c70f..67ccddf6a 100644
--- a/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb
+++ b/meta-networking/recipes-connectivity/netplan/netplan_0.99.bb
@@ -11,8 +11,8 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 S = "${WORKDIR}/git"
-SRCREV = "5d22e9d22c4a3724d27b80b0cd9b898ae8f59d2b"
-PV = "0.98+git${SRCPV}"
+SRCREV = "1ccf7e0e3a7a91edbbe3f9f0669c8bbab8248cd1"
+PV = "0.99+git${SRCPV}"
 
 SRC_URI = " \
         git://github.com/CanonicalLtd/netplan.git \
@@ -20,17 +20,17 @@ SRC_URI = " \
 
 DEPENDS = "glib-2.0 libyaml ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 
-RDEPENDS_${PN} = "python3 python3-core python3-pyyaml python3-netifaces python3-nose python3-coverage python3-pycodestyle python3-pyflakes util-linux-libuuid"
+RDEPENDS_${PN} = "python3 python3-core python3-pyyaml python3-netifaces python3-nose python3-coverage python3-pycodestyle python3-pyflakes util-linux-libuuid libnetplan"
 
 inherit pkgconfig systemd
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-EXTRA_OEMAKE = "generate"
+EXTRA_OEMAKE = "generate netplan/_features.py"
 EXTRA_OEMAKE =+ "${@bb.utils.contains('DISTRO_FEATURES','systemd','netplan-dbus dbus/io.netplan.Netplan.service','',d)}"
 
 do_install() {
-	install -d ${D}${sbindir} ${D}${base_libdir}/netplan ${D}${datadir}/netplan/netplan/cli/commands ${D}${sysconfdir}/netplan
+	install -d ${D}${sbindir} ${D}${libdir} ${D}${base_libdir}/netplan ${D}${datadir}/netplan/netplan/cli/commands ${D}${sysconfdir}/netplan
 	install -m 755 ${S}/generate ${D}${base_libdir}/netplan/
 	install -m 644 ${S}/netplan/*.py ${D}${datadir}/netplan/netplan
 	install -m 644 ${S}/netplan/cli/*.py ${D}${datadir}/netplan/netplan/cli
@@ -39,7 +39,6 @@ do_install() {
 	ln -srf ${D}${datadir}/netplan/netplan.script ${D}${sbindir}/netplan
 
 	install -d ${D}/${systemd_unitdir}/system ${D}${systemd_unitdir}/system-generators
-	install -m 644 ${S}/src/netplan-wpa@.service ${D}${systemd_unitdir}/system/
 	ln -srf ${D}/${base_libdir}/netplan/generate ${D}${systemd_unitdir}/system-generators
 
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
@@ -48,12 +47,13 @@ do_install() {
 		install -m 644 ${S}/dbus/io.netplan.Netplan.conf ${D}${datadir}/dbus-1/system.d
 		install -m 644 ${S}/dbus/io.netplan.Netplan.service ${D}${datadir}/dbus-1/system-services
 	fi
-}
 
-SYSTEMD_SERVICE_${PN} = "netplan-wpa@.service"
-SYSTEMD_AUTO_ENABLE = "disable"
+	install -m 755 ${S}/libnetplan.so.0.0 ${D}${libdir}
+        ln -rfs ${D}${libdir}/libnetplan.so.0.0 ${D}${libdir}/libnetplan.so
+}
 
-PACKAGES += "${PN}-dbus"
+PACKAGES += "${PN}-dbus libnetplan"
 
+FILES_libnetplan = "${libdir}/libnetplan.so.0.0"
 FILES_${PN} = "${sbindir} ${base_libdir}/netplan/generate ${datadir}/netplan ${sysconfdir}/netplan ${systemd_unitdir}"
 FILES_${PN}-dbus = "${base_libdir}/netplan/netplan-dbus ${datadir}/dbus-1"
-- 
2.25.4

