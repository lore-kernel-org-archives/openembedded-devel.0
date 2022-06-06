Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD595C43334
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 22:01:56 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web09.4619.1654552913649289656
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jun 2022 15:01:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JD3FXCtZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.44,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id q21so31585636ejm.1
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jun 2022 15:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7txrC88tdIeoDL66Gx6ozrNEWMqIORfVOB6yJnTpzeU=;
        b=JD3FXCtZUKuX3dMYbmfUorOm74h93RPo4ok6/hzOsE3dvoPKDSPIrOhePcdhmDkMc/
         LysQOqjm+xp3PjgTV93WpP5nzR0n87EIv1xciDgLDJsR6QfTU+CYXNtCZ/ApxDsokUJi
         TO9kvhcGbimk9iTzgymFu1em6gdo2nZa1/Ab9FttN9AMCjoMdZ0CfdXL7LrGHUJMhdu3
         jMbXfkAnnbquepNZoq5uifiozlDtGnIFld2RnEu316rJLujWNC81xhRT1XhvuQv4eDlA
         b1bM8OeJNURevR5JNS+I33KZSXpsPoJB+M7gZksJzVOxw4UN9U8xFzBO1sKgJm158CQ7
         Vc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7txrC88tdIeoDL66Gx6ozrNEWMqIORfVOB6yJnTpzeU=;
        b=wiKGRqQA6YOUJYVugHwoMkJ1LZA2PRzfk78E0YUsYli1+3RQBJ7nmgD/CUgwlHjes4
         fnpn7TmasM/oNvwciWzla3gBgG6s6xsM3hsj93L+fz2V6rsBuC032L+7WgmgVRC6Fpll
         zHEvJ9AL21bNxoeS/l0DdSZyeBfQV/+N0lZsBdtiUoIzZQB7DAC0b3DcDGnSOW58uIvu
         pav6bCa5I5Daah+MdXQb6e5Ax43O1/PDhJmCIhyYKNI6zBgs//9EFpm+58M3OZmoo2+Y
         9m+FXhnmwdAfWVhBIRF/y8UxKQxW14Cr55EXN5xE+jAYrykKsM0NsZiJbQQvAz6an9Rx
         1r5A==
X-Gm-Message-State: AOAM530A8GJ4zk2hPoj/NI2LvYp2/xrvPFInDt5neMBhh2lcWWEeM3bg
	XMat3TWiEimBiOXNe9mlxTWkEXyo+wyXOA==
X-Google-Smtp-Source: 
 ABdhPJyUdFzaTq+kwxim9l6XEUV6p3sTqHHz0LIglLX/VW3TQJgXa8sG3gPfByM6mqLfVvsztQNIAA==
X-Received: by 2002:a17:907:2d0c:b0:711:c606:35d5 with SMTP id
 gs12-20020a1709072d0c00b00711c60635d5mr9222733ejc.726.1654552911817;
        Mon, 06 Jun 2022 15:01:51 -0700 (PDT)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 d20-20020aa7ce14000000b0042dd4ccccf5sm9134826edv.82.2022.06.06.15.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 15:01:51 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-networking][PATCH 2/5] networkmanager: simplify selective
 installation
Date: Tue,  7 Jun 2022 00:01:34 +0200
Message-Id: <20220606220137.1887491-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220606220137.1887491-1-adrian.freihofer@siemens.com>
References: <20220606220137.1887491-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jun 2022 22:01:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97433

The main motivation for this rework is to support compiling the
NetworkManager with many plugins, but to install only a few of them in
a firmware image. This is advantageous when different products with
different network interfaces should be supported by only one binary
distribution. This is more in line with the way NetworkManager is
designed and used by other binary Linux distributions. Basically this
is already supported since the last rework of the networkmanager recipe.
However, the rrecomments from networkmanager to all available plugins is
not straight forward to be used in such a scenario. Installing only a
subset of the compiled plugins required to override the rrecommends
from networkmanager to the plugins in some way. To simplify the usage
the networkmanager package is now an empty meta package and
networkmanager itself gets moved to a new networkmanager-daemon package.
This allows to keep backward compatibility: Installing the
networkmanager package still adds all compiled plugins to the firmware.
But with the new package splitting it's also possible to install for
example only the networkmanager-wifi but not the networkmanager-wwan
package even if networkamanger has been compiled with the modemmanager
PACAKGECONFIG flag enabled as well.

The relation from plugins to services is now a stronger rdepends which
reflects better how NetworkManager is supposed to be used. If a plugin
is installed but the required service is not the plugin periodically
tries to connect to the service and reports error messages to the syslog
if the service is not available. Therefore it's better to make the
installation of the plugin optional but not the installation of the
services.

The bash-completion package adds support for the nmcli command line
utility. This change also moves the bash completion configuration to a
new package networkmanager-nmcli-bash-completion. This is more
consistent anyway but gets even more important when the networkmanager
package gets optional.

To simplify the usage of all these packages a SUMMARY:${PN}-.. for each
packages has been added.
The separation of the doc packages has been removed.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../networkmanager/networkmanager_1.36.2.bb   | 115 +++++++++++-------
 1 file changed, 73 insertions(+), 42 deletions(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
index ab8fc136a9..9fc43dceb5 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
@@ -19,6 +19,7 @@ DEPENDS = " \
     curl \
     dbus \
 "
+DEPENDS:append:class-target = " bash-completion"
 
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gettext update-rc.d systemd gobject-introspection gtk-doc update-alternatives upstream-version-is-even
@@ -71,7 +72,6 @@ PACKAGECONFIG ??= "readline nss ifupdown dnsmasq nmcli vala \
     ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux audit', '', d)} \
 "
 
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'nmcli', 'bash-completion', '', d)}
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'vala', 'vala', '', d)}
 
 PACKAGECONFIG[systemd] = "\
@@ -105,25 +105,42 @@ PACKAGECONFIG[concheck] = "-Dconcheck=true,-Dconcheck=false"
 
 
 PACKAGES =+ " \
+    libnm \
     ${PN}-adsl \
     ${PN}-bluetooth \
     ${PN}-cloud-setup \
-    ${PN}-nmcli ${PN}-nmcli-doc \
-    ${PN}-nmtui ${PN}-nmtui-doc \
+    ${PN}-nmcli \
+    ${PN}-nmcli-bash-completion \
+    ${PN}-nmtui \
     ${PN}-wifi \
     ${PN}-wwan \
-    ${PN}-ovs ${PN}-ovs-doc \
+    ${PN}-ovs \
     ${PN}-ppp \
+    ${PN}-daemon \
 "
 
-SYSTEMD_PACKAGES = "${PN} ${PN}-cloud-setup"
+SYSTEMD_PACKAGES = "${PN}-daemon ${PN}-cloud-setup"
+INITSCRIPT_PACKAGES = "${PN}-daemon"
 
 NETWORKMANAGER_PLUGINDIR = "${libdir}/NetworkManager/${PV}"
+NETWORKMANAGER_DISPATCHERDIR = "${nonarch_libdir}/NetworkManager/dispatcher.d"
 
+
+SUMMARY:libnm = "Libraries for adding NetworkManager support to applications"
+FILES:libnm = "\
+    ${libdir}/libnm.so.* \
+    ${libdir}/girepository-1.0/NM-1.0.typelib \
+"
+
+SUMMARY:${PN}-adsl = "ADSL device plugin for NetworkManager"
 FILES:${PN}-adsl = "${NETWORKMANAGER_PLUGINDIR}/libnm-device-plugin-adsl.so"
+RDEPENDS:${PN}-adsl += "${PN}-daemon"
 
+SUMMARY:${PN}-bluetooth = "Bluetooth device plugin for NetworkManager"
 FILES:${PN}-bluetooth = "${NETWORKMANAGER_PLUGINDIR}/libnm-device-plugin-bluetooth.so"
+RDEPENDS:${PN}-bluetooth += "${PN}-daemon ${@bb.utils.contains('PACKAGECONFIG', 'bluez5', '${PN}-wwan bluez5', '', d)}"
 
+SUMMARY:${PN}-cloud-setup = "Automatically configure NetworkManager in cloud"
 FILES:${PN}-cloud-setup = " \
     ${libexecdir}/nm-cloud-setup \
     ${systemd_system_unitdir}/nm-cloud-setup.service \
@@ -131,28 +148,30 @@ FILES:${PN}-cloud-setup = " \
     ${libdir}/NetworkManager/dispatcher.d/90-nm-cloud-setup.sh \
     ${libdir}/NetworkManager/dispatcher.d/no-wait.d/90-nm-cloud-setup.sh \
 "
+RDEPENDS:${PN}-cloud-setup += "${PN}-daemon"
 ALLOW_EMPTY:${PN}-cloud-setup = "1"
 SYSTEMD_SERVICE:${PN}-cloud-setup = "${@bb.utils.contains('PACKAGECONFIG', 'cloud-setup', 'nm-cloud-setup.service nm-cloud-setup.timer', '', d)}"
 
+SUMMARY:${PN}-nmcli = "NetworkManager command line client"
 FILES:${PN}-nmcli = " \
     ${bindir}/nmcli \
 "
+RDEPENDS:${PN}-nmcli += "${PN}-daemon"
 
-FILES:${PN}-nmcli-doc = " \
-    ${mandir}/man1/nmcli* \
-"
+SUMMARY:${PN}-nmcli-bash-completion = "NetworkManager command line client bash completion"
+FILES:${PN}-nmcli-bash-completion = "${datadir}/bash-completion/completions/nmcli"
+RDEPENDS:${PN}-nmcli-bash-completion = "bash-completion"
 
+SUMMARY:${PN}-nmtui = "NetworkManager curses-based UI"
 FILES:${PN}-nmtui = " \
     ${bindir}/nmtui \
     ${bindir}/nmtui-edit \
     ${bindir}/nmtui-connect \
     ${bindir}/nmtui-hostname \
 "
+RDEPENDS:${PN}-nmtui += "${PN}-daemon"
 
-FILES:${PN}-nmtui-doc = " \
-    ${mandir}/man1/nmtui* \
-"
-
+SUMMARY:${PN}-wifi = "Wifi plugin for NetworkManager"
 FILES:${PN}-wifi = "\
     ${NETWORKMANAGER_PLUGINDIR}/libnm-device-plugin-wifi.so \
     ${libdir}/NetworkManager/conf.d/enable-iwd.conf \
@@ -166,55 +185,80 @@ def get_wifi_deps(d):
             return 'wpa-supplicant'
     else:
         return ''
-RRECOMMENDS:${PN}-wifi += "${@get_wifi_deps(d)}"
+RDEPENDS:${PN}-wifi += "${PN}-daemon ${@get_wifi_deps(d)}"
 
+SUMMARY:${PN}-wwan = "Mobile broadband device plugin for NetworkManager"
 FILES:${PN}-wwan = "\
     ${NETWORKMANAGER_PLUGINDIR}/libnm-device-plugin-wwan.so \
     ${NETWORKMANAGER_PLUGINDIR}/libnm-wwan.so \
 "
-RRECOMMENDS:${PN}-wwan += "${@bb.utils.contains('PACKAGECONFIG','modemmanager','modemmanager','',d)}"
+RDEPENDS:${PN}-wwan += "${PN}-daemon ${@bb.utils.contains('PACKAGECONFIG','modemmanager','modemmanager','',d)}"
 
+SUMMARY:${PN}-ovs = "Open vSwitch device plugin for NetworkManager"
 FILES:${PN}-ovs = "\
     ${NETWORKMANAGER_PLUGINDIR}/libnm-device-plugin-ovs.so \
     ${systemd_system_unitdir}/NetworkManager.service.d/NetworkManager-ovs.conf \
 "
+RDEPENDS:${PN}-ovs += "${PN}-daemon"
 
-FILES:${PN}-ovs-doc = "\
-    ${mandir}/man7/nm-openvswitch.7* \
-"
-
+SUMMARY:${PN}-ppp = "PPP plugin for NetworkManager"
 FILES:${PN}-ppp = "\
     ${NETWORKMANAGER_PLUGINDIR}/libnm-ppp-plugin.so \
     ${libdir}/pppd/*/nm-pppd-plugin.so \
 "
-RRECOMMENDS:${PN}-ppp += "${@bb.utils.contains('PACKAGECONFIG','ppp','ppp','',d)}"
+RDEPENDS:${PN}-ppp += "${PN}-daemon ${@bb.utils.contains('PACKAGECONFIG','ppp','ppp','',d)}"
 
 FILES:${PN}-dev += " \
     ${libdir}/pppd/*/*.la \
     ${libdir}/NetworkManager/*.la \
     ${NETWORKMANAGER_PLUGINDIR}/*.la \
+    ${datadir}/dbus-1/interfaces/*.xml \
 "
 
-FILES:${PN} += " \
-    ${libexecdir} \
+SUMMARY:${PN}-daemon += "The NetworkManager daemon"
+FILES:${PN}-daemon += " \
+    ${bindir}/nm-online \
+    ${datadir}/dbus-1 \
+    ${datadir}/polkit-1 \
     ${libdir}/NetworkManager \
-    ${nonarch_libdir}/firewalld/zones \
+    ${libexecdir} \
+    ${localstatedir}/lib/NetworkManager \
+    ${NETWORKMANAGER_DISPATCHERDIR} \
+    ${nonarch_base_libdir}/udev/* \
+    ${nonarch_libdir}/firewalld \
     ${nonarch_libdir}/NetworkManager/conf.d \
-    ${nonarch_libdir}/NetworkManager/dispatcher.d \
     ${nonarch_libdir}/NetworkManager/dispatcher.d/pre-down.d \
     ${nonarch_libdir}/NetworkManager/dispatcher.d/pre-up.d \
     ${nonarch_libdir}/NetworkManager/dispatcher.d/no-wait.d \
-    ${nonarch_libdir}/NetworkManager/VPN \
     ${nonarch_libdir}/NetworkManager/system-connections \
-    ${datadir}/polkit-1 \
-    ${datadir}/dbus-1 \
-    ${nonarch_base_libdir}/udev/* \
+    ${nonarch_libdir}/NetworkManager/VPN \
+    ${sbindir}/NetworkManager \
+    ${sysconfdir}/init.d/network-manager \
+    ${sysconfdir}/NetworkManager \
     ${systemd_system_unitdir} \
 "
-
-RRECOMMENDS:${PN} += "\
+RRECOMMENDS:${PN}-daemon += "\
     iptables \
     ${@bb.utils.filter('PACKAGECONFIG', 'dnsmasq', d)} \
+"
+INITSCRIPT_NAME:${PN}-daemon = "network-manager"
+SYSTEMD_SERVICE:${PN}-daemon = "\
+    NetworkManager.service \
+    NetworkManager-dispatcher.service \
+"
+RCONFLICTS:${PN}-daemon += "connman"
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE:${PN}-daemon = "${@bb.utils.contains('DISTRO_FEATURES','systemd','resolv-conf','',d)}"
+ALTERNATIVE_TARGET[resolv-conf] = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${sysconfdir}/resolv-conf.NetworkManager','',d)}"
+ALTERNATIVE_LINK_NAME[resolv-conf] = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${sysconfdir}/resolv.conf','',d)}"
+
+
+# The networkmanager package is an empty meta package which weakly depends on all the compiled features.
+# Install this package to get all plugins and related dependencies installed. Alternatively just install
+# plugins and related dependencies e.g. by installing networkmanager-wifi or networkmanager-wwan
+# packages to the firmware.
+ALLOW_EMPTY:${PN} = "1"
+RRECOMMENDS:${PN} += "\
     ${@bb.utils.contains('PACKAGECONFIG','adsl','${PN}-adsl','',d)} \
     ${@bb.utils.contains('PACKAGECONFIG','bluez5','${PN}-bluetooth','',d)} \
     ${@bb.utils.contains('PACKAGECONFIG','cloud-setup','${PN}-cloud-setup','',d)} \
@@ -225,19 +269,6 @@ RRECOMMENDS:${PN} += "\
     ${@bb.utils.contains('PACKAGECONFIG','ovs','${PN}-ovs','',d)} \
     ${@bb.utils.contains('PACKAGECONFIG','ppp','${PN}-ppp','',d)} \
 "
-RCONFLICTS:${PN} = "connman"
-
-
-INITSCRIPT_NAME = "network-manager"
-SYSTEMD_SERVICE:${PN} = "\
-    NetworkManager.service \
-    NetworkManager-dispatcher.service \
-"
-
-ALTERNATIVE_PRIORITY = "100"
-ALTERNATIVE:${PN} = "${@bb.utils.contains('DISTRO_FEATURES','systemd','resolv-conf','',d)}"
-ALTERNATIVE_TARGET[resolv-conf] = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${sysconfdir}/resolv-conf.NetworkManager','',d)}"
-ALTERNATIVE_LINK_NAME[resolv-conf] = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${sysconfdir}/resolv.conf','',d)}"
 
 do_install:append() {
     install -Dm 0755 ${WORKDIR}/${BPN}.initd ${D}${sysconfdir}/init.d/network-manager
-- 
2.35.3


