Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F84C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 16:13:54 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.10104.1646151233046513415
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 08:13:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m+Bt87O4;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id d17so21287099wrc.9
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 08:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DSvBKx2eLzhiUblj+pZQ0wan6yrQYcFjpLJbi672GuI=;
        b=m+Bt87O4p0exZfKJAQSU52eAgBCHIJLO0G51f33mmuJnO0L2fZlKq9Z73qyBQf1cfB
         BnVK3Zeuepzz+qVoZ1B5RsY468JZ3yZ4OcqAKqqU2cbgIR5ACOu9nfDbV8WwU0WIuHL8
         M74Jguq/f50eiYwZSCxCsUWgUuqSp7/r6WvJL5dnl7rhZuGoW+yWNR3VB6XDZbhYhl6p
         zbxq8fiuPe4jN+j9/ega9SZYSxgkFgfvFIlY85iWQYEFlO4GTrzqaZzg/sJnY6TH6YDp
         CKG6ZmsqE3vylG3GjiQfeZgO/NETDhqudUXmHFu+LzHbh4WYo6+9jrzoJkGhldPU175J
         W8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DSvBKx2eLzhiUblj+pZQ0wan6yrQYcFjpLJbi672GuI=;
        b=Q20lNTazF6sPeUakEOrvziLHwwe37+yVfXkRRmZuoMqDMaDBfyfDZzyBdn6oOii26u
         /z7AWMe7BsaVtm7gKNIo0lrxlqPWHhUtxdup0yuH9pC8gOQAyMTMmAaWHxZWyH2i1FLA
         wMpTa8UG68kKh6Sy+0EJVLAIlys5gJKTxoYrIzUEe+syNoRq0K3LTcbrqGOkm0cVYbnG
         RLonb/FVT6HJzbySj8GeuvGK8IaLdi6trVZKzDTxSNsQaH1z37pzN9EhavVPWMvZDibE
         myGYXVb0v/FP6ejQzwQtnECscz/wz9riMncLq0bEJhqeX018bfGA6J6RpyTrcEsoKCYr
         KZMA==
X-Gm-Message-State: AOAM532f1SnyyU1VHav2DTIGLhemlxdBHGpwt2OW1cSzmPM9oo5vszu0
	S7tCpLb+W/BZvXhZLBbWwnmuPnY+tCA=
X-Google-Smtp-Source: 
 ABdhPJyTJIP4lLkD9tk9LLFpJdj3FA2Xt+s2WFnEEs0hirBIBPeZeuCZnG2+RqYZ1DDSMzYAqK78bA==
X-Received: by 2002:adf:bc02:0:b0:1ef:5b49:d66f with SMTP id
 s2-20020adfbc02000000b001ef5b49d66fmr16946558wrg.360.1646151231284;
        Tue, 01 Mar 2022 08:13:51 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net
 (112.11.107.92.dynamic.wline.res.cust.swisscom.ch. [92.107.11.112])
        by smtp.gmail.com with ESMTPSA id
 d27-20020adfa35b000000b001ede1137d2bsm14864412wrb.116.2022.03.01.08.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 08:13:51 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-networking][PATCH 2/2] networkmanager: new configure options
Date: Tue,  1 Mar 2022 17:13:46 +0100
Message-Id: <20220301161346.700028-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301161346.700028-1-adrian.freihofer@siemens.com>
References: <20220301161346.700028-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 16:13:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95637

- Allow to compile nmcli with libedit (alternative to gplv3 readline)
- Support iwd as well as wpa-supplicant for wifi
- Make vala build-time dependency optional
- Split all plugins into packages. By default all packages are installed
  acc. to features in the PACKAGECONFIG but it's now possible to build
  images where only some plugins are installed.
- Move FILES:networkmanager to last position to increase the FILES
  priority of other packages.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../networkmanager/enable-dhcpcd.conf         |   2 +
 .../networkmanager/enable-iwd.conf            |   3 +
 .../networkmanager/networkmanager_git.bb      | 131 +++++++++++++-----
 3 files changed, 103 insertions(+), 33 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/enable-dhcpcd.conf
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/enable-iwd.conf

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/enable-dhcpcd.conf b/meta-networking/recipes-connectivity/networkmanager/networkmanager/enable-dhcpcd.conf
new file mode 100644
index 0000000000..8da4fe0487
--- /dev/null
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/enable-dhcpcd.conf
@@ -0,0 +1,2 @@
+[main]
+dhcp=dhcpcd
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/enable-iwd.conf b/meta-networking/recipes-connectivity/networkmanager/networkmanager/enable-iwd.conf
new file mode 100644
index 0000000000..abb5937341
--- /dev/null
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/enable-iwd.conf
@@ -0,0 +1,3 @@
+[device]
+wifi.iwd.autoconnect=yes
+wifi.backend=iwd
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_git.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_git.bb
index 8c8e0ddb67..f28877e8a8 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_git.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_git.bb
@@ -27,6 +27,8 @@ inherit gnomebase gettext update-rc.d systemd gobject-introspection gtk-doc upda
 SRC_URI = " \
     git://gitlab.freedesktop.org/NetworkManager/NetworkManager.git;protocol=https;branch=main \
     file://${BPN}.initd \
+    file://enable-dhcpcd.conf \
+    file://enable-iwd.conf \
     file://0001-do-not-ask-host-for-ifcfg-defaults.patch \
 "
 SRCREV ?= "ccb20e23e335b13f6b71354737d653ed3e88101b"
@@ -64,14 +66,16 @@ do_compile:prepend() {
     export GI_TYPELIB_PATH="${B}}/src/libnm-client-impl${GI_TYPELIB_PATH:+:$GI_TYPELIB_PATH}"
 }
 
-PACKAGECONFIG ??= "nss ifupdown dnsmasq nmcli \
+PACKAGECONFIG ??= "readline nss ifupdown dnsmasq nmcli \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d), d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5', '', d)} \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'wifi polkit', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'wifi', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux audit', '', d)} \
 "
 
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'nmcli', 'bash-completion', '', d)}
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'vala', 'vala', '', d)}
 
 PACKAGECONFIG[systemd] = "\
     -Dsystemdsystemunitdir=${systemd_unitdir}/system -Dsession_tracking=systemd,\
@@ -87,23 +91,42 @@ PACKAGECONFIG[dnsmasq] = "-Ddnsmasq=${bindir}/dnsmasq"
 PACKAGECONFIG[nss] = "-Dcrypto=nss,,nss"
 PACKAGECONFIG[resolvconf] = "-Dresolvconf=${base_sbindir}/resolvconf,-Dresolvconf=no,,resolvconf"
 PACKAGECONFIG[gnutls] = "-Dcrypto=gnutls,,gnutls"
+PACKAGECONFIG[wext] = "-Dwext=true,-Dwext=false"
 PACKAGECONFIG[wifi] = "-Dwifi=true,-Dwifi=false"
+PACKAGECONFIG[iwd] = "-Dwifi=true -Diwd=true,-Diwd=false,,iwd"
 PACKAGECONFIG[ifupdown] = "-Difupdown=true,-Difupdown=false"
 PACKAGECONFIG[cloud-setup] = "-Dnm_cloud_setup=true,-Dnm_cloud_setup=false"
 PACKAGECONFIG[nmcli] = "-Dnmcli=true,-Dnmcli=false"
+PACKAGECONFIG[readline] = "-Dreadline=libreadline,,readline"
+PACKAGECONFIG[libedit] = "-Dreadline=libedit,,libedit"
 PACKAGECONFIG[ovs] = "-Dovs=true,-Dovs=false,jansson"
 PACKAGECONFIG[audit] = "-Dlibaudit=yes,-Dlibaudit=no"
 PACKAGECONFIG[selinux] = "-Dselinux=true,-Dselinux=false,libselinux"
+PACKAGECONFIG[vala] = "-Dvapi=true,-Dvapi=false"
+PACKAGECONFIG[dhcpcd] = "-Ddhcpcd=yes,-Ddhcpcd=no,,dhcpcd"
+PACKAGECONFIG[dhclient] = "-Ddhclient=yes,-Ddhclient=no,,dhcp"
+PACKAGECONFIG[concheck] = "-Dconcheck=true,-Dconcheck=false"
+
 
 PACKAGES =+ " \
+    ${PN}-adsl \
+    ${PN}-bluetooth \
+    ${PN}-cloud-setup \
     ${PN}-nmcli ${PN}-nmcli-doc \
     ${PN}-nmtui ${PN}-nmtui-doc \
-    ${PN}-adsl ${PN}-cloud-setup \
+    ${PN}-wifi \
+    ${PN}-wwan \
+    ${PN}-ovs ${PN}-ovs-doc \
+    ${PN}-ppp \
 "
 
 SYSTEMD_PACKAGES = "${PN} ${PN}-cloud-setup"
 
-FILES:${PN}-adsl = "${libdir}/NetworkManager/${PV}/libnm-device-plugin-adsl.so"
+NETWORKMANAGER_PLUGINDIR = "${libdir}/NetworkManager/${PV_BASE}"
+
+FILES:${PN}-adsl = "${NETWORKMANAGER_PLUGINDIR}/libnm-device-plugin-adsl.so"
+
+FILES:${PN}-bluetooth = "${NETWORKMANAGER_PLUGINDIR}/libnm-device-plugin-bluetooth.so"
 
 FILES:${PN}-cloud-setup = " \
     ${libexecdir}/nm-cloud-setup \
@@ -115,9 +138,54 @@ FILES:${PN}-cloud-setup = " \
 ALLOW_EMPTY:${PN}-cloud-setup = "1"
 SYSTEMD_SERVICE:${PN}-cloud-setup = "${@bb.utils.contains('PACKAGECONFIG', 'cloud-setup', 'nm-cloud-setup.service nm-cloud-setup.timer', '', d)}"
 
+FILES:${PN}-nmcli = " \
+    ${bindir}/nmcli \
+"
+
+FILES:${PN}-nmcli-doc = " \
+    ${mandir}/man1/nmcli* \
+"
+
+FILES:${PN}-nmtui = " \
+    ${bindir}/nmtui \
+    ${bindir}/nmtui-edit \
+    ${bindir}/nmtui-connect \
+    ${bindir}/nmtui-hostname \
+"
+
+FILES:${PN}-nmtui-doc = " \
+    ${mandir}/man1/nmtui* \
+"
+
+FILES:${PN}-wifi = "${NETWORKMANAGER_PLUGINDIR}/libnm-device-plugin-wifi.so"
+
+FILES:${PN}-wwan = "\
+    ${NETWORKMANAGER_PLUGINDIR}/libnm-device-plugin-wwan.so \
+    ${NETWORKMANAGER_PLUGINDIR}/libnm-wwan.so \
+"
+
+FILES:${PN}-ovs = "\
+    ${NETWORKMANAGER_PLUGINDIR}/libnm-device-plugin-ovs.so \
+    ${systemd_system_unitdir}/NetworkManager.service.d/NetworkManager-ovs.conf \
+"
+
+FILES:${PN}-ovs-doc = "\
+    ${mandir}/man7/nm-openvswitch.7* \
+"
+
+FILES:${PN}-ppp = "\
+    ${NETWORKMANAGER_PLUGINDIR}/libnm-ppp-plugin.so \
+    ${libdir}/pppd/*/nm-pppd-plugin.so \
+"
+
+FILES:${PN}-dev += " \
+    ${libdir}/pppd/*/*.la \
+    ${libdir}/NetworkManager/*.la \
+    ${NETWORKMANAGER_PLUGINDIR}/*.la \
+"
+
 FILES:${PN} += " \
     ${libexecdir} \
-    ${libdir}/NetworkManager/${PV}/*.so \
     ${libdir}/NetworkManager \
     ${libdir}/firewalld/zones \
     ${nonarch_libdir}/NetworkManager/conf.d \
@@ -131,42 +199,29 @@ FILES:${PN} += " \
     ${datadir}/dbus-1 \
     ${nonarch_base_libdir}/udev/* \
     ${systemd_system_unitdir} \
-    ${libdir}/pppd \
 "
 
-RRECOMMENDS:${PN} += "iptables \
+RRECOMMENDS:${PN} += "\
+    iptables \
     ${@bb.utils.filter('PACKAGECONFIG', 'dnsmasq', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG','adsl','${PN}-adsl','',d)} \
+    ${@bb.utils.contains('PACKAGECONFIG','bluez5','${PN}-bluetooth','',d)} \
+    ${@bb.utils.contains('PACKAGECONFIG','cloud-setup','${PN}-cloud-setup','',d)} \
+    ${@bb.utils.contains('PACKAGECONFIG','nmcli','${PN}-nmcli','',d)} \
+    ${@bb.utils.contains('PACKAGECONFIG','nmtui','${PN}-nmtui','',d)} \
+    ${@bb.utils.contains('PACKAGECONFIG','wifi','${PN}-wifi','',d)} \
+    ${@bb.utils.contains('PACKAGECONFIG','wwan','${PN}-wwan','',d)} \
+    ${@bb.utils.contains('PACKAGECONFIG','ovs','${PN}-ovs','',d)} \
+    ${@bb.utils.contains('PACKAGECONFIG','ppp','${PN}-ppp','',d)} \
 "
 RCONFLICTS:${PN} = "connman"
 
-FILES:${PN}-dev += " \
-    ${datadir}/NetworkManager/gdb-cmd \
-    ${libdir}/pppd/*/*.la \
-    ${libdir}/NetworkManager/*.la \
-    ${libdir}/NetworkManager/${PV}/*.la \
-"
-
-FILES:${PN}-nmcli = " \
-    ${bindir}/nmcli \
-"
-
-FILES:${PN}-nmcli-doc = " \
-    ${mandir}/man1/nmcli* \
-"
-
-FILES:${PN}-nmtui = " \
-    ${bindir}/nmtui \
-    ${bindir}/nmtui-edit \
-    ${bindir}/nmtui-connect \
-    ${bindir}/nmtui-hostname \
-"
-
-FILES:${PN}-nmtui-doc = " \
-    ${mandir}/man1/nmtui* \
-"
 
 INITSCRIPT_NAME = "network-manager"
-SYSTEMD_SERVICE:${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'NetworkManager.service NetworkManager-dispatcher.service', '', d)}"
+SYSTEMD_SERVICE:${PN} = "\
+    NetworkManager.service \
+    NetworkManager-dispatcher.service \
+"
 
 ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE:${PN} = "${@bb.utils.contains('DISTRO_FEATURES','systemd','resolv-conf','',d)}"
@@ -185,4 +240,14 @@ do_install:append() {
         # systemd v210 and newer do not need this rule file
         rm ${D}/${nonarch_base_libdir}/udev/rules.d/84-nm-drivers.rules
     fi
+
+    # Enable iwd if compiled
+    if ${@bb.utils.contains('PACKAGECONFIG','iwd','true','false',d)}; then
+        install -Dm 0644 ${WORKDIR}/enable-iwd.conf ${D}${libdir}/NetworkManager/conf.d/enable-iwd.conf
+    fi
+
+    # Enable dhcpd if compiled
+    if ${@bb.utils.contains('PACKAGECONFIG','dhcpcd','true','false',d)}; then
+        install -Dm 0644 ${WORKDIR}/enable-dhcpcd.conf ${D}${libdir}/NetworkManager/conf.d/enable-dhcpcd.conf
+    fi
 }
-- 
2.34.1


