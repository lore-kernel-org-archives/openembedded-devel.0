Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E63A5C00A5A
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 22:58:29 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.1842.1673996303477959425
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Jan 2023 14:58:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RPn9rZLi;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id t5so27788455wrq.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 14:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQJgOG69EeRe/CLalHudwCdeoURTkDdee0y/xSE5Trw=;
        b=RPn9rZLiBNok1mYQNwiEm9ZGOq+/Q6+zYglCjl/VcmalidyxHgO0Pm9M//jHYH2Lp8
         1u8B8kvlEOZGlNwApQNHJ0LuqlKDzl2dMZKLbl4I8RgXBLPRFLqfcM3WTpJ1LtcPrVxs
         mDbpDYQ5TC+R8wnyPEtso6/mG9E3lSEHs48A0s9beRokXfnC59D+F/ePpPtmDQpyU6r6
         BMSdZUW+xmfBiYf7WANyoBsIu12EypK+x0jqTjZ8/iQWiVLA4RAHagH1qEbFAppzjmfX
         i3CDx3+fJIY1PxlfftkBBXd8TdpBPow4FjaQGJ2ouK+q/42EEzZ71uozKAkR51C8fpuv
         im5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kQJgOG69EeRe/CLalHudwCdeoURTkDdee0y/xSE5Trw=;
        b=N2F9n8OwCS/prZIW1Zoo7oechDf4UfGmGxLPsD7Uj5QVyUHSqD3nv+JDVc8rOTNMo5
         ji8huKxLOojcRTA5SIaFaDAdk+ScDhQ9twzoBVMArC1UeSrOz9qmu0iIhVDr14ismlw/
         25Xp5r4nxlVGNLG2PAPdc5bJeGA1MPN2nlulvh34l8YZ+vgwl1Y5v7N0GvUPu9e7umhd
         3+C1x6ej9N7eWAFXuz54h9/59YYziAV4yAjet05ulmi3+LCI2Ix7ab9OX9o98HxFf7BL
         dLZURMB+zcagjtSvlyDcRyzPF2nIYcq8LQcvp7bMmuCWUD9ukkwDLOh96izFaEM4AA1p
         ww5A==
X-Gm-Message-State: AFqh2krqvAYFepJGzjrd9WzZ/hdYF5pCuWJ1/srtP5RIFRAvciXVO+9x
	8YscesrHQlxYUhOgfPLhqSxhVOllh+U=
X-Google-Smtp-Source: AMrXdXsHzhnq5u3I/wHbyjrXN36DTn3bxApR9X2+6qEBeCqTlxwxOzKkkVq5RNvbVB5eZi3msplDkA==
X-Received: by 2002:a5d:428e:0:b0:2bc:8339:1fcc with SMTP id k14-20020a5d428e000000b002bc83391fccmr4222064wrq.58.1673996301776;
        Tue, 17 Jan 2023 14:58:21 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id b10-20020adfe64a000000b00287da7ee033sm30126689wrn.46.2023.01.17.14.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 14:58:21 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH 2/2] dnsmasq: Expand configuration options
Date: Tue, 17 Jan 2023 22:57:46 +0000
Message-Id: <20230117225747.8663-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117225747.8663-1-alex.kiernan@gmail.com>
References: <20230117225747.8663-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 22:58:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100641

Expose all current dnsmasq configuration options in PACKAGECONFIG,
enable i18n generation, filter supplementary systemd files against
DISTRO_FEATURES.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../recipes-support/dnsmasq/dnsmasq_2.88.bb   | 75 ++++++++++++++-----
 1 file changed, 58 insertions(+), 17 deletions(-)

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.88.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.88.bb
index 43d48490a866..4bf1dd8954c6 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.88.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.88.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING-v3;md5=d32239bcb673463ab874e80d47fae504 \
                     "
 
+DEPENDS += "gettext-native"
+
 #at least versions 2.69 and prior are moved to the archive folder on the server
 SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getVar('PV').split('.')[1]) > 69]}dnsmasq-${PV}.tar.gz \
            file://lua.patch \
@@ -23,34 +25,62 @@ inherit pkgconfig update-rc.d systemd
 INITSCRIPT_NAME = "dnsmasq"
 INITSCRIPT_PARAMS = "defaults"
 
-PACKAGECONFIG ?= ""
-PACKAGECONFIG[dbus] = ",,dbus"
-PACKAGECONFIG[idn] = ",,libidn"
-PACKAGECONFIG[conntrack] = ",,libnetfilter-conntrack"
-PACKAGECONFIG[lua] = ",,lua"
+# dnsmasq defaults
+PACKAGECONFIG ?= "auth dhcp dhcp6 dumpfile inotify ipset loop script tftp"
+
+PACKAGECONFIG[auth] = "-DHAVE_AUTH,-DNO_AUTH"
+PACKAGECONFIG[broken-rtc] = "-DHAVE_BROKEN_RTC,"
+PACKAGECONFIG[conntrack] = "-DHAVE_CONNTRACK,,libnetfilter-conntrack"
+PACKAGECONFIG[dbus] = "-DHAVE_DBUS,,dbus"
+PACKAGECONFIG[dhcp] = "-DHAVE_DHCP,-DNO_DHCP"
+PACKAGECONFIG[dhcp6] = "-DHAVE_DHCP6,-DNO_DHCP6"
+PACKAGECONFIG[dnssec] = "-DHAVE_DNSSEC,,nettle"
+PACKAGECONFIG[dumpfile] = "-DHAVE_DUMPFILE,-DNO_DUMPFILE"
+PACKAGECONFIG[idn] = "-DHAVE_LIBIDN,,libidn,,,idn2"
+PACKAGECONFIG[idn2] = "-DHAVE_LIBIDN2,,libidn2,,,idn"
+PACKAGECONFIG[inotify] = "-DHAVE_INOTIFY,-DNO_INOTIFY"
+PACKAGECONFIG[ipset] = "-DHAVE_IPSET,-DNO_IPSET"
+PACKAGECONFIG[loop] = "-DHAVE_LOOP,-DNO_LOOP"
+PACKAGECONFIG[lua] = "-DHAVE_LUASCRIPT -DHAVE_SCRIPT,,lua"
+PACKAGECONFIG[nftset] = "-DHAVE_NFTSET,,nftables"
+PACKAGECONFIG[no-gmp] = "-DNO_GMP,"
+PACKAGECONFIG[no-id] = "-DNO_ID,"
 PACKAGECONFIG[resolvconf] = ",,,resolvconf"
+PACKAGECONFIG[script] = "-DHAVE_SCRIPT,-DNO_SCRIPT"
+PACKAGECONFIG[tftp] = "-DHAVE_TFTP,-DNO_TFTP"
+PACKAGECONFIG[ubus] = "-DHAVE_UBUS,,ubus"
+
+DNSMASQ_LEASEFILE ?= "${localstatedir}/lib/misc/dnsmasq.leases"
+DNSMASQ_CONFFILE ?= "${sysconfdir}/dnsmasq.conf"
+DNSMASQ_RESOLVFILE ?= "${sysconfdir}/resolv.conf"
+
+COPTS = "${PACKAGECONFIG_CONFARGS} \
+         -DLEASEFILE=\"${DNSMASQ_LEASEFILE}\" \
+         -DCONFFILE=\"${DNSMASQ_CONFFILE}\" \
+         -DRESOLVFILE=\"${DNSMASQ_RESOLVFILE}\" \
+         -DLOCALEDIR=\"${localedir}\""
+
 EXTRA_OEMAKE = "\
-    'COPTS=${@bb.utils.contains('PACKAGECONFIG', 'dbus', '-DHAVE_DBUS', '', d)} \
-           ${@bb.utils.contains('PACKAGECONFIG', 'idn', '-DHAVE_IDN', '', d)} \
-           ${@bb.utils.contains('PACKAGECONFIG', 'conntrack', '-DHAVE_CONNTRACK', '', d)} \
-           ${@bb.utils.contains('PACKAGECONFIG', 'lua', '-DHAVE_LUASCRIPT', '', d)}' \
+    'COPTS=${COPTS}' \
     'CFLAGS=${CFLAGS}' \
     'LDFLAGS=${LDFLAGS}' \
 "
 
 SRC_URI += "${@bb.utils.contains('PACKAGECONFIG', 'resolvconf', 'file://dnsmasq.resolvconf file://99_dnsmasq file://dnsmasq-resolvconf-helper', '', d)}"
 
-do_compile:append() {
-    # build dhcp_release
-    cd ${S}/contrib/lease-tools
-    oe_runmake
+do_compile () {
+    oe_runmake all-i18n
+    if ${@bb.utils.contains_any('PACKAGECONFIG', ['dhcp', 'dhcp6'], 'true', 'false', d)}; then
+        # build dhcp_release
+        oe_runmake -C ${S}/contrib/lease-tools
+    fi
 }
 
 do_install () {
     oe_runmake "PREFIX=${D}${prefix}" \
                "BINDIR=${D}${bindir}" \
                "MANDIR=${D}${mandir}" \
-               install
+               install-i18n
     install -d ${D}${sysconfdir}/ ${D}${sysconfdir}/init.d ${D}${sysconfdir}/dnsmasq.d
     install -m 644 ${WORKDIR}/dnsmasq.conf ${D}${sysconfdir}/
     install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/dnsmasq
@@ -62,15 +92,26 @@ do_install () {
     else
         install -m 0644 ${WORKDIR}/dnsmasq-noresolvconf.service ${D}${systemd_unitdir}/system/dnsmasq.service
     fi
-    install -d ${D}${sysconfdir}/systemd/resolved.conf.d/
-    install -m 0644 ${WORKDIR}/dnsmasq-resolved.conf ${D}${sysconfdir}/systemd/resolved.conf.d/
 
-    install -m 0755 ${S}/contrib/lease-tools/dhcp_release ${D}${bindir}
+    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}" ]; then
+        install -d ${D}${sysconfdir}/systemd/resolved.conf.d/
+        install -m 0644 ${WORKDIR}/dnsmasq-resolved.conf ${D}${sysconfdir}/systemd/resolved.conf.d/
+    fi
+
+    if [ "${@bb.utils.filter('PACKAGECONFIG', 'dhcp', d)}" ]; then
+        install -m 0755 ${S}/contrib/lease-tools/dhcp_release ${D}${bindir}
+        install -m 0755 ${S}/contrib/lease-tools/dhcp_lease_time ${D}${bindir}
+    fi
+
+    if [ "${@bb.utils.filter('PACKAGECONFIG', 'dhcp6', d)}" ]; then
+        install -m 0755 ${S}/contrib/lease-tools/dhcp_release6 ${D}${bindir}
+    fi
 
     if [ "${@bb.utils.filter('PACKAGECONFIG', 'dbus', d)}" ]; then
         install -d ${D}${sysconfdir}/dbus-1/system.d
         install -m 644 dbus/dnsmasq.conf ${D}${sysconfdir}/dbus-1/system.d/
     fi
+
     if [ "${@bb.utils.filter('PACKAGECONFIG', 'resolvconf', d)}" ]; then
         install -d ${D}${sysconfdir}/resolvconf/update.d/
         install -m 0755 ${WORKDIR}/dnsmasq.resolvconf ${D}${sysconfdir}/resolvconf/update.d/dnsmasq
-- 
2.39.0


