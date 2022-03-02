Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E76C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 20:05:56 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.2417.1646251555682614827
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 12:05:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NqsEcA6P;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id bk29so4534907wrb.4
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 12:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JXGgNbxznf8gaic9A5J1KN0L4KhNruvoZaOo+ia2EqQ=;
        b=NqsEcA6PrQChXf3BZPLfJUw8QqnLzCroo2B/ujq3PfMXAdQRyH+ECc19nCvEXEivOm
         ryxcoPwnKmUMJXjxyDDno9Fs+oj5MRMiGSkmxy/gxBPbmmu/hHLulxK29tx4r3Xk0W3W
         EDpXXjwLLQEeqD+RbG1DGTZjqIP7g51MzGBZUr9HQBC0s+WAyq3taG9jwouRWt9aRl8P
         9KHJ5zsUIL3oE2CThsSKJdpi3ZkKFw9oBpPluR/P8uVjiGz5wB9/IXISmSnJJkLnPSCU
         +hhDUPGdDsela3W1gv0gftDDf/tgfnzgq9eASPD0gssO6YccwO4bU9cFG1SwcNhKd2Qj
         hbrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JXGgNbxznf8gaic9A5J1KN0L4KhNruvoZaOo+ia2EqQ=;
        b=khbhEBrw+f8MtZKqBV5Ldg/NH0NsrpW0eVhg6FpsUS/UiydYPiKOfaswBnxPneRvUL
         bVrxGPdk1xX6GpBQP+L8DOiseIWgmfIq+VJI8u7sgqU7j6914j7rw+6mt5LdH7Wc6ykT
         I+OcGWtrKpMJ71/eYsChPIfGQn893l09Qa6xOjD+fr5Gwo/MUFsxXxuqSKwZtSlSBq5V
         ah57Wm0Y2GiwYtlUT3Crjyzp99kys+nCp+XSkLzeVHcOgkMiWlgK3kcEWM42Az6S3fIW
         5Ys2uM9nDMtH7zftAtpnX+tYhuusvOLpkouXCHtErCzI4LUq67IJ6SzI+5YC7bx9dI4B
         q2Kw==
X-Gm-Message-State: AOAM532fJ9FOA29HKZqR2GfFKPTNJuUinG7SfGW4MEhEsrB7CL9sjW2/
	84qm9UU8x3L1YjhHUaNmnZrSOxy7VpE=
X-Google-Smtp-Source: 
 ABdhPJw04tGdQYjgSA81BLsr8iZdmIKhcCCTzGrEy1EdEw4tn6q2+AtC3VNHLzuQ1ZRiYPY6Z1Wa4w==
X-Received: by 2002:adf:a35e:0:b0:1f0:9f2:a65e with SMTP id
 d30-20020adfa35e000000b001f009f2a65emr7446060wrb.535.1646251553915;
        Wed, 02 Mar 2022 12:05:53 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 m2-20020adff382000000b001f022ef0375sm4688447wro.102.2022.03.02.12.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 12:05:53 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-networking][PATCH V4 2/2] networkmanager: new configure options
Date: Wed,  2 Mar 2022 21:05:48 +0100
Message-Id: <20220302200549.3823033-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302200549.3823033-1-adrian.freihofer@siemens.com>
References: <20220302200549.3823033-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 20:05:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95711

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
index 18541cbc03..2f8b616a68 100644
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
+PACKAGECONFIG ??= "readline nss ifupdown dnsmasq nmcli vala \
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


