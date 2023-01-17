Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC22C38142
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 22:58:29 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.1841.1673996302954264239
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Jan 2023 14:58:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YBAdHsmW;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id b5so11033187wrn.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 14:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9x/AzessHa8BufY1VH07HOO4cPKJJk2SeHKeQiTlWHU=;
        b=YBAdHsmWtTqiIkanSw4QQ7heaPGCQxU/MCt8R/HgouOFJSToWteKY2Toe5FHwcYY4+
         VtgAhceiRMJLbto7BdqZOrAHxJHAoZDfDiciEL68Ta2esXm9PW3OCZxSRwBXcXNRk70t
         TKX2cvx8cCH01ow5PAHeEUB+fPrSl88vewA3WVATnfCp0nIdrEIxH/c9gAwNcbZGZ0dx
         4giDbsNjXHt0bIP6MJfBTHp1w1VBn02QQJCDaykArCLVV3IZwmSM1CM5Zewk15ZJ16t0
         DxkiacBPfqKdzIUpMztaUdRQHWEQ3Oqn2ruGwn4w0ZfKduxiNWWcipqQcGU7eKYDqqfs
         tqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9x/AzessHa8BufY1VH07HOO4cPKJJk2SeHKeQiTlWHU=;
        b=1jyK4sPOU1sbZYVlFhwXid7vwkeVlIxbO8PrhpXC3fTgaCsk2N4o0OjiIODHR7qBZW
         bho+apSk9Z/qwU+B2Y8IKi0cL8nkaIYiKFYgueYDu227UkYsYo6ASr+s2TpL3uTmPuXa
         WktRYQXCjgRameDOTUCGwVVin4ssLqbNeg+vYEyB4xHMBNr1BHgJTlOTM3hmwXu6wB/U
         IFhMbL7yFG6sTKPlm7/+2Gh0Vgnr88mYfwdSeqVpFMoQHbrnVu986CnhXrPnU91Y/mAd
         3Dmw4c6zB6kf5eciXbRv7zA063PzSSxPXxOxZA9eZjeoN++gFxTWvvrzkUkjWvujhc7q
         /rmQ==
X-Gm-Message-State: AFqh2koU5jDeEVGXFxgaX8R5acD0Vf+wIafRTBalNhkXtjhMgE5dsH6M
	6dn/8kvUVzkRU8YPohL8Mifxn52SIbg=
X-Google-Smtp-Source: AMrXdXsCGytkT0eknGJaK/Ji5cbrtHBLWbiHGdV/CN5EnbBLgRSKXcKYGlsRLHntx2ZcGSFq8ISi3Q==
X-Received: by 2002:a5d:570b:0:b0:277:2e27:61e7 with SMTP id a11-20020a5d570b000000b002772e2761e7mr4317437wrv.17.1673996300833;
        Tue, 17 Jan 2023 14:58:20 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id b10-20020adfe64a000000b00287da7ee033sm30126689wrn.46.2023.01.17.14.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 14:58:20 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH 1/2] dnsmasq: Merge .inc into .bb
Date: Tue, 17 Jan 2023 22:57:45 +0000
Message-Id: <20230117225747.8663-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 22:58:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100640

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../recipes-support/dnsmasq/dnsmasq.inc       | 87 ------------------
 .../recipes-support/dnsmasq/dnsmasq_2.88.bb   | 90 ++++++++++++++++++-
 2 files changed, 86 insertions(+), 91 deletions(-)
 delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq.inc

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
deleted file mode 100644
index a8ff21a125c9..000000000000
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
+++ /dev/null
@@ -1,87 +0,0 @@
-SUMMARY = "Lightweight, easy to configure DNS forwarder and DHCP server"
-HOMEPAGE = "http://www.thekelleys.org.uk/dnsmasq/doc.html"
-SECTION = "net"
-# GPLv3 was added in version 2.41 as license option
-LICENSE = "GPL-2.0-only | GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://COPYING-v3;md5=d32239bcb673463ab874e80d47fae504 \
-                    "
-
-#at least versions 2.69 and prior are moved to the archive folder on the server
-SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getVar('PV').split('.')[1]) > 69]}dnsmasq-${PV}.tar.gz;name=dnsmasq-${PV} \
-           file://init \
-           file://dnsmasq.conf \
-           file://dnsmasq-resolvconf.service \
-           file://dnsmasq-noresolvconf.service \
-           file://dnsmasq-resolved.conf \
-"
-
-inherit pkgconfig update-rc.d systemd
-
-INITSCRIPT_NAME = "dnsmasq"
-INITSCRIPT_PARAMS = "defaults"
-
-PACKAGECONFIG ?= ""
-PACKAGECONFIG[dbus] = ",,dbus"
-PACKAGECONFIG[idn] = ",,libidn"
-PACKAGECONFIG[conntrack] = ",,libnetfilter-conntrack"
-PACKAGECONFIG[lua] = ",,lua"
-PACKAGECONFIG[resolvconf] = ",,,resolvconf"
-EXTRA_OEMAKE = "\
-    'COPTS=${@bb.utils.contains('PACKAGECONFIG', 'dbus', '-DHAVE_DBUS', '', d)} \
-           ${@bb.utils.contains('PACKAGECONFIG', 'idn', '-DHAVE_IDN', '', d)} \
-           ${@bb.utils.contains('PACKAGECONFIG', 'conntrack', '-DHAVE_CONNTRACK', '', d)} \
-           ${@bb.utils.contains('PACKAGECONFIG', 'lua', '-DHAVE_LUASCRIPT', '', d)}' \
-    'CFLAGS=${CFLAGS}' \
-    'LDFLAGS=${LDFLAGS}' \
-"
-
-SRC_URI += "${@bb.utils.contains('PACKAGECONFIG', 'resolvconf', 'file://dnsmasq.resolvconf file://99_dnsmasq file://dnsmasq-resolvconf-helper', '', d)}"
-
-do_compile:append() {
-    # build dhcp_release
-    cd ${S}/contrib/lease-tools
-    oe_runmake
-}
-
-do_install () {
-    oe_runmake "PREFIX=${D}${prefix}" \
-               "BINDIR=${D}${bindir}" \
-               "MANDIR=${D}${mandir}" \
-               install
-    install -d ${D}${sysconfdir}/ ${D}${sysconfdir}/init.d ${D}${sysconfdir}/dnsmasq.d
-    install -m 644 ${WORKDIR}/dnsmasq.conf ${D}${sysconfdir}/
-    install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/dnsmasq
-
-    install -d ${D}${systemd_unitdir}/system
-
-    if [ "${@bb.utils.filter('PACKAGECONFIG', 'resolvconf', d)}" ]; then
-        install -m 0644 ${WORKDIR}/dnsmasq-resolvconf.service ${D}${systemd_unitdir}/system/dnsmasq.service
-    else
-        install -m 0644 ${WORKDIR}/dnsmasq-noresolvconf.service ${D}${systemd_unitdir}/system/dnsmasq.service
-    fi
-    install -d ${D}${sysconfdir}/systemd/resolved.conf.d/
-    install -m 0644 ${WORKDIR}/dnsmasq-resolved.conf ${D}${sysconfdir}/systemd/resolved.conf.d/
-
-    install -m 0755 ${S}/contrib/lease-tools/dhcp_release ${D}${bindir}
-
-    if [ "${@bb.utils.filter('PACKAGECONFIG', 'dbus', d)}" ]; then
-        install -d ${D}${sysconfdir}/dbus-1/system.d
-        install -m 644 dbus/dnsmasq.conf ${D}${sysconfdir}/dbus-1/system.d/
-    fi
-    if [ "${@bb.utils.filter('PACKAGECONFIG', 'resolvconf', d)}" ]; then
-        install -d ${D}${sysconfdir}/resolvconf/update.d/
-        install -m 0755 ${WORKDIR}/dnsmasq.resolvconf ${D}${sysconfdir}/resolvconf/update.d/dnsmasq
-
-        install -d ${D}${sysconfdir}/default/volatiles
-        install -m 0644 ${WORKDIR}/99_dnsmasq ${D}${sysconfdir}/default/volatiles
-        install -m 0755 ${WORKDIR}/dnsmasq-resolvconf-helper ${D}${bindir}
-    fi
-}
-
-CONFFILES:${PN} = "${sysconfdir}/dnsmasq.conf"
-
-RPROVIDES:${PN} += "${PN}-systemd"
-RREPLACES:${PN} += "${PN}-systemd"
-RCONFLICTS:${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE:${PN} = "dnsmasq.service"
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.88.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.88.bb
index 52ee9aa96eb6..43d48490a866 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.88.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.88.bb
@@ -1,7 +1,89 @@
-require dnsmasq.inc
+SUMMARY = "Lightweight, easy to configure DNS forwarder and DHCP server"
+HOMEPAGE = "http://www.thekelleys.org.uk/dnsmasq/doc.html"
+SECTION = "net"
+# GPLv3 was added in version 2.41 as license option
+LICENSE = "GPL-2.0-only | GPL-3.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING-v3;md5=d32239bcb673463ab874e80d47fae504 \
+                    "
 
-SRC_URI[dnsmasq-2.88.sha256sum] = "da9d26aa3f3fc15f3b58b94edbb9ddf744cbce487194ea480bd8e7381b3ca028"
-SRC_URI += "\
-    file://lua.patch \
+#at least versions 2.69 and prior are moved to the archive folder on the server
+SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getVar('PV').split('.')[1]) > 69]}dnsmasq-${PV}.tar.gz \
+           file://lua.patch \
+           file://init \
+           file://dnsmasq.conf \
+           file://dnsmasq-resolvconf.service \
+           file://dnsmasq-noresolvconf.service \
+           file://dnsmasq-resolved.conf \
 "
+SRC_URI[sha256sum] = "da9d26aa3f3fc15f3b58b94edbb9ddf744cbce487194ea480bd8e7381b3ca028"
 
+inherit pkgconfig update-rc.d systemd
+
+INITSCRIPT_NAME = "dnsmasq"
+INITSCRIPT_PARAMS = "defaults"
+
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[dbus] = ",,dbus"
+PACKAGECONFIG[idn] = ",,libidn"
+PACKAGECONFIG[conntrack] = ",,libnetfilter-conntrack"
+PACKAGECONFIG[lua] = ",,lua"
+PACKAGECONFIG[resolvconf] = ",,,resolvconf"
+EXTRA_OEMAKE = "\
+    'COPTS=${@bb.utils.contains('PACKAGECONFIG', 'dbus', '-DHAVE_DBUS', '', d)} \
+           ${@bb.utils.contains('PACKAGECONFIG', 'idn', '-DHAVE_IDN', '', d)} \
+           ${@bb.utils.contains('PACKAGECONFIG', 'conntrack', '-DHAVE_CONNTRACK', '', d)} \
+           ${@bb.utils.contains('PACKAGECONFIG', 'lua', '-DHAVE_LUASCRIPT', '', d)}' \
+    'CFLAGS=${CFLAGS}' \
+    'LDFLAGS=${LDFLAGS}' \
+"
+
+SRC_URI += "${@bb.utils.contains('PACKAGECONFIG', 'resolvconf', 'file://dnsmasq.resolvconf file://99_dnsmasq file://dnsmasq-resolvconf-helper', '', d)}"
+
+do_compile:append() {
+    # build dhcp_release
+    cd ${S}/contrib/lease-tools
+    oe_runmake
+}
+
+do_install () {
+    oe_runmake "PREFIX=${D}${prefix}" \
+               "BINDIR=${D}${bindir}" \
+               "MANDIR=${D}${mandir}" \
+               install
+    install -d ${D}${sysconfdir}/ ${D}${sysconfdir}/init.d ${D}${sysconfdir}/dnsmasq.d
+    install -m 644 ${WORKDIR}/dnsmasq.conf ${D}${sysconfdir}/
+    install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/dnsmasq
+
+    install -d ${D}${systemd_unitdir}/system
+
+    if [ "${@bb.utils.filter('PACKAGECONFIG', 'resolvconf', d)}" ]; then
+        install -m 0644 ${WORKDIR}/dnsmasq-resolvconf.service ${D}${systemd_unitdir}/system/dnsmasq.service
+    else
+        install -m 0644 ${WORKDIR}/dnsmasq-noresolvconf.service ${D}${systemd_unitdir}/system/dnsmasq.service
+    fi
+    install -d ${D}${sysconfdir}/systemd/resolved.conf.d/
+    install -m 0644 ${WORKDIR}/dnsmasq-resolved.conf ${D}${sysconfdir}/systemd/resolved.conf.d/
+
+    install -m 0755 ${S}/contrib/lease-tools/dhcp_release ${D}${bindir}
+
+    if [ "${@bb.utils.filter('PACKAGECONFIG', 'dbus', d)}" ]; then
+        install -d ${D}${sysconfdir}/dbus-1/system.d
+        install -m 644 dbus/dnsmasq.conf ${D}${sysconfdir}/dbus-1/system.d/
+    fi
+    if [ "${@bb.utils.filter('PACKAGECONFIG', 'resolvconf', d)}" ]; then
+        install -d ${D}${sysconfdir}/resolvconf/update.d/
+        install -m 0755 ${WORKDIR}/dnsmasq.resolvconf ${D}${sysconfdir}/resolvconf/update.d/dnsmasq
+
+        install -d ${D}${sysconfdir}/default/volatiles
+        install -m 0644 ${WORKDIR}/99_dnsmasq ${D}${sysconfdir}/default/volatiles
+        install -m 0755 ${WORKDIR}/dnsmasq-resolvconf-helper ${D}${bindir}
+    fi
+}
+
+CONFFILES:${PN} = "${sysconfdir}/dnsmasq.conf"
+
+RPROVIDES:${PN} += "${PN}-systemd"
+RREPLACES:${PN} += "${PN}-systemd"
+RCONFLICTS:${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE:${PN} = "dnsmasq.service"
-- 
2.39.0


