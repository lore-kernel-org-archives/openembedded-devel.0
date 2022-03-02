Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89132C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 15:27:54 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web08.8387.1646234873193509219
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 07:27:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hvUJpNIt;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ay10so3358098wrb.6
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 07:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jnPQmY64Gl85BxUrP4t9CimKcSfxdBdOrFznPuC5j40=;
        b=hvUJpNIt9+rh/hu3v8xxIUhmB9M8P6ZTp0CEK7TWZg383MP8xzluVkorKH9jhJXWy5
         h/MiIwr3TlH6p9oH0bMk8y37aTmo2cpqhvDjvscAB+A0bK41grJDP4BbiMFp+U/m7Ys6
         CdBOouY5MNtTvvg66YWyrg4BNuXVVHV8g9hW4edljM5FHzKp7Ytxmc+BtbgpAUmNe996
         MafBEsSRHdxC9N5u6OmoVJbI4ELQZJo9UR3lxQ+PNaZE2u9BZKGqQgvP7TL8+fg4Z2Ha
         fIAjJ7ZPdqXai1Cw2FGNAsMqYfEho+ye4yMzsCzCBEl0JE4BqxHnm29YaEXVpQDs5qX6
         vasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jnPQmY64Gl85BxUrP4t9CimKcSfxdBdOrFznPuC5j40=;
        b=bL3agoREscX/jLNCx0eMjcWmKLh/svKiExN7eAGVz1L/Z7G2gPtvzkaZP+Bah/1jRw
         MPUmXiPfsV17sGBACw2Ur9LkFNIAk3eeLYYHoCXVdCliYGgw0U/CMfZPY+4Juc6H6IBC
         Ce9jD5JivYOJz2cH9zjdN7i/C9k/mAwMfKbg5OA12USQo//5UIzPvJLQfmYQ932muPdn
         XrWgURuZkGvpOTxxEw+NxTaFXLX/Rnbs7hbrPs7I7uS66B4By7bc+cG9ILRd4Yg6c1J+
         /4rrNxYzI0fSgnRr1eqktmQznXJWuFdqhKa4jadUTwEuR4ATWvreKxytofko3MZsrc8W
         I5xw==
X-Gm-Message-State: AOAM5326IaAknLc6H9dIt7kS2qmJFwxqPMFKRn6PPoJt4evlCeZLkBFn
	mb3erf1NJBZXW5A26ZqgwptMBiqPEPY=
X-Google-Smtp-Source: 
 ABdhPJziMIMF/L6c3YpS8eiRtSHX3zzMklfAQlt2uQBMAZkYft7/i4MwiobSyAzKkKqmOTgTWWxCIA==
X-Received: by 2002:adf:d1cc:0:b0:1f0:4570:bf75 with SMTP id
 b12-20020adfd1cc000000b001f04570bf75mr1933984wrd.656.1646234871421;
        Wed, 02 Mar 2022 07:27:51 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c4ec600b0037bf934bca3sm7470110wmq.17.2022.03.02.07.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 07:27:51 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-networking][PATCH V2 2/2] networkmanager: new configure options
Date: Wed,  2 Mar 2022 16:27:13 +0100
Message-Id: <20220302152713.1876638-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302152713.1876638-1-adrian.freihofer@siemens.com>
References: <20220302152713.1876638-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 15:27:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95692

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
 .../networkmanager/networkmanager_1.36.0.bb   | 127 +++++++++++++-----
 3 files changed, 100 insertions(+), 32 deletions(-)
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
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.0.bb
index 18541cbc03..9108b472c9 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.0.bb
@@ -26,6 +26,8 @@ inherit gnomebase gettext update-rc.d systemd gobject-introspection gtk-doc upda
 SRC_URI = " \
     ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
     file://${BPN}.initd \
+    file://enable-dhcpcd.conf \
+    file://enable-iwd.conf \
     file://0001-do-not-ask-host-for-ifcfg-defaults.patch \
 "
 SRC_URI[sha256sum] = "faa389c9e9ca78243cfab4a8bed6db132f82e5b5e66bb9d44af93379d1348398"
@@ -61,7 +63,7 @@ do_compile:prepend() {
     export GI_TYPELIB_PATH="${B}}/src/libnm-client-impl${GI_TYPELIB_PATH:+:$GI_TYPELIB_PATH}"
 }
 
-PACKAGECONFIG ??= "nss ifupdown dnsmasq nmcli \
+PACKAGECONFIG ??= "readline nss ifupdown dnsmasq nmcli \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d), d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'wifi polkit', d)} \
@@ -69,6 +71,7 @@ PACKAGECONFIG ??= "nss ifupdown dnsmasq nmcli \
 "
 
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'nmcli', 'bash-completion', '', d)}
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'vala', 'vala', '', d)}
 
 PACKAGECONFIG[systemd] = "\
     -Dsystemdsystemunitdir=${systemd_unitdir}/system -Dsession_tracking=systemd,\
@@ -85,22 +88,40 @@ PACKAGECONFIG[nss] = "-Dcrypto=nss,,nss"
 PACKAGECONFIG[resolvconf] = "-Dresolvconf=${base_sbindir}/resolvconf,-Dresolvconf=no,,resolvconf"
 PACKAGECONFIG[gnutls] = "-Dcrypto=gnutls,,gnutls"
 PACKAGECONFIG[wifi] = "-Dwext=true -Dwifi=true,-Dwext=false -Dwifi=false"
+PACKAGECONFIG[iwd] = "-Diwd=true,-Diwd=false"
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
+NETWORKMANAGER_PLUGINDIR = "${libdir}/NetworkManager/${PV}"
+
+FILES:${PN}-adsl = "${NETWORKMANAGER_PLUGINDIR}/libnm-device-plugin-adsl.so"
+
+FILES:${PN}-bluetooth = "${NETWORKMANAGER_PLUGINDIR}/libnm-device-plugin-bluetooth.so"
 
 FILES:${PN}-cloud-setup = " \
     ${libexecdir}/nm-cloud-setup \
@@ -112,9 +133,54 @@ FILES:${PN}-cloud-setup = " \
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
@@ -128,42 +194,29 @@ FILES:${PN} += " \
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
@@ -182,4 +235,14 @@ do_install:append() {
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


