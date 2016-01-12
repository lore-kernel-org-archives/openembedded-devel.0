Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id B6F3865CC2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 10:10:03 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id l65so245054790wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 02:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZdcShit29M3KKjNwZiiYjafddOzELg3Xroc9176GKGI=;
	b=tnp4dB8Il1M/R78UPA3AOyiuVnkTHhHUUF55JQe1WedJzyKIDYSAw7CzppHWRPBILq
	f1o4yAnZohq8ixuZOh0O/0oTrTNo4sKKuiZM78DTBE9gAUn79ElN4MrfloCdqVcAJByo
	reiDCy/Rbj93BE+FceA4pVcooYzaZ0SPLpqh9dav9lkQ90r33KeILULZmwbE0g2c/NrE
	NxfhPdnAyMUacJQyIvDdqFYKwlMzYl6jQlGuGcLKfkq92oJGmYL+d+T5PIgQZY9xMpNs
	s/rktN03LgE6RiqQH7ZSFG85yFPiJq/775gkZZUumxe+Gr+mEHg+/v42XCT/6nA2v8zh
	jjlw==
X-Received: by 10.28.14.138 with SMTP id 132mr17434836wmo.25.1452593403874;
	Tue, 12 Jan 2016 02:10:03 -0800 (PST)
Received: from chl500346.neratec.local (mail.neratec.com. [46.140.151.2])
	by smtp.gmail.com with ESMTPSA id
	k130sm3090286wmg.6.2016.01.12.02.10.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jan 2016 02:10:03 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jan 2016 11:09:52 +0100
Message-Id: <1452593395-19468-2-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1452593395-19468-1-git-send-email-adrian.freihofer@gmail.com>
References: <1452593395-19468-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCHv2 1/4] networkmanager: 1.0.6 -> 1.0.10
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jan 2016 10:10:06 -0000

From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>

Upgrade networkmanager from 1.0.6 to 1.0.10.

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 .../networkmanager/networkmanager_1.0.10.bb        | 117 +++++++++++++++++++++
 .../networkmanager/networkmanager_1.0.6.bb         | 117 ---------------------
 2 files changed, 117 insertions(+), 117 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
new file mode 100644
index 0000000..81ce953
--- /dev/null
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
@@ -0,0 +1,117 @@
+SUMMARY = "NetworkManager"
+SECTION = "net/misc"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b \
+                    file://libnm-util/COPYING;md5=1c4fa765d6eb3cd2fbd84344a1b816cd \
+                    file://docs/api/html/license.html;md5=51d7fb67bde992e58533a8481cee070b \
+"
+
+DEPENDS = "libnl dbus dbus-glib libgudev util-linux libndp libnewt"
+
+inherit gnomebase gettext systemd bluetooth
+
+SRC_URI = " \
+    ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
+    file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch \
+    file://0002-add-pkg-config-for-libgcrypt.patch \
+"
+SRC_URI[md5sum] = "a8f54460a4708efd840358f32d0968fd"
+SRC_URI[sha256sum] = "1bcfce8441dfd9f432a100d06b54f3831a2275cccc3b74b1b4c09a011e179fbc"
+
+S = "${WORKDIR}/NetworkManager-${PV}"
+
+EXTRA_OECONF = " \
+    --disable-ifcfg-rh \
+    --disable-ifnet \
+    --disable-ifcfg-suse \
+    --disable-more-warnings \
+    --with-iptables=${sbindir}/iptables \
+    --with-tests \
+    --with-nmtui=yes \
+"
+
+PACKAGECONFIG ??= "nss ifupdown netconfig dhclient dnsmasq \
+    ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','consolekit',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','bluetooth','${BLUEZ}','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','wifi','wifi','',d)} \
+"
+PACKAGECONFIG[systemd] = " \
+    --with-systemdsystemunitdir=${systemd_unitdir}/system --with-session-tracking=systemd --enable-polkit, \
+    --without-systemdsystemunitdir, \
+    polkit \
+"
+PACKAGECONFIG[bluez5] = "--enable-bluez5-dun,--disable-bluez5-dun,bluez5"
+# consolekit is not picked by shlibs, so add it to RDEPENDS too
+PACKAGECONFIG[consolekit] = "--with-session-tracking=consolekit,,consolekit,consolekit"
+PACKAGECONFIG[concheck] = "--with-libsoup=yes,--with-libsoup=no,libsoup-2.4"
+PACKAGECONFIG[modemmanager] = "--with-modem-manager-1=yes,--with-modem-manager-1=no,modemmanager"
+PACKAGECONFIG[ppp] = "--enable-ppp,--disable-ppp,ppp"
+# Use full featured dhcp client instead of internal one
+PACKAGECONFIG[dhclient] = "--with-dhclient=${base_sbindir}/dhclient,,,dhcp-client"
+PACKAGECONFIG[dnsmasq] = "--with-dnsmasq=${bindir}/dnsmasq"
+PACKAGECONFIG[nss] = "--with-crypto=nss,,nss"
+PACKAGECONFIG[gnutls] = "--with-crypto=gnutls,,gnutls libgcrypt"
+PACKAGECONFIG[wifi] = "--enable-wifi=yes,--enable-wifi=no,wireless-tools,wpa-supplicant wireless-tools"
+PACKAGECONFIG[ifupdown] = "--enable-ifupdown,--disable-ifupdown"
+PACKAGECONFIG[netconfig] = "--with-netconfig=yes,--with-netconfig=no"
+
+PACKAGES =+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests ${PN}-bash-completion \
+  ${PN}-nmtui ${PN}-nmtui-doc \
+  ${PN}-adsl \
+"
+
+FILES_libnmutil += "${libdir}/libnm-util.so.*"
+FILES_libnmglib += "${libdir}/libnm-glib.so.*"
+FILES_libnmglib-vpn += "${libdir}/libnm-glib-vpn.so.*"
+
+FILES_${PN}-adsl = "${libdir}/NetworkManager/libnm-device-plugin-adsl.so"
+
+FILES_${PN} += " \
+    ${libexecdir} \
+    ${libdir}/pppd/*/nm-pppd-plugin.so \
+    ${libdir}/NetworkManager/*.so \
+    ${datadir}/polkit-1 \
+    ${datadir}/dbus-1 \
+    ${base_libdir}/udev/* \
+    ${systemd_unitdir}/system \
+"
+
+RRECOMMENDS_${PN} += "iptables \
+    ${@bb.utils.contains('PACKAGECONFIG','dnsmasq','dnsmasq','',d)} \
+"
+RCONFLICTS_${PN} = "connman"
+
+FILES_${PN}-dbg += " \
+    ${libdir}/NetworkManager/.debug/ \
+    ${libdir}/pppd/*/.debug/ \
+"
+
+FILES_${PN}-dev += " \
+    ${datadir}/NetworkManager/gdb-cmd \
+    ${libdir}/pppd/*/*.la \
+    ${libdir}/NetworkManager/*.la \
+"
+
+FILES_${PN}-tests = " \
+    ${bindir}/nm-online \
+"
+
+FILES_${PN}-bash-completion = "${datadir}/bash-completion"
+
+FILES_${PN}-nmtui = " \
+    ${bindir}/nmtui \
+    ${bindir}/nmtui-edit \
+    ${bindir}/nmtui-connect \
+    ${bindir}/nmtui-hostname \
+"
+
+FILES_${PN}-nmtui-doc = " \
+    ${mandir}/man1/nmtui* \
+"
+
+SYSTEMD_SERVICE_${PN} = "NetworkManager.service NetworkManager-dispatcher.service"
+
+do_install_append() {
+    rm -rf ${D}/run ${D}${localstatedir}/run
+}
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
deleted file mode 100644
index c2b00ed..0000000
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
+++ /dev/null
@@ -1,117 +0,0 @@
-SUMMARY = "NetworkManager"
-SECTION = "net/misc"
-
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b \
-                    file://libnm-util/COPYING;md5=1c4fa765d6eb3cd2fbd84344a1b816cd \
-                    file://docs/api/html/license.html;md5=51d7fb67bde992e58533a8481cee070b \
-"
-
-DEPENDS = "libnl dbus dbus-glib libgudev util-linux libndp libnewt"
-
-inherit gnomebase gettext systemd bluetooth
-
-SRC_URI = " \
-    ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
-    file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch \
-    file://0002-add-pkg-config-for-libgcrypt.patch \
-"
-SRC_URI[md5sum] = "00f5f9ec69725a9f9b99366853c6f73e"
-SRC_URI[sha256sum] = "38ea002403e3b884ffa9aae25aea431d2a8420f81f4919761c83fb92648254bd"
-
-S = "${WORKDIR}/NetworkManager-${PV}"
-
-EXTRA_OECONF = " \
-    --disable-ifcfg-rh \
-    --disable-ifnet \
-    --disable-ifcfg-suse \
-    --disable-more-warnings \
-    --with-iptables=${sbindir}/iptables \
-    --with-tests \
-    --with-nmtui=yes \
-"
-
-PACKAGECONFIG ??= "nss ifupdown netconfig dhclient dnsmasq \
-    ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','consolekit',d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES','bluetooth','${BLUEZ}','',d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES','wifi','wifi','',d)} \
-"
-PACKAGECONFIG[systemd] = " \
-    --with-systemdsystemunitdir=${systemd_unitdir}/system --with-session-tracking=systemd --enable-polkit, \
-    --without-systemdsystemunitdir, \
-    polkit \
-"
-PACKAGECONFIG[bluez5] = "--enable-bluez5-dun,--disable-bluez5-dun,bluez5"
-# consolekit is not picked by shlibs, so add it to RDEPENDS too
-PACKAGECONFIG[consolekit] = "--with-session-tracking=consolekit,,consolekit,consolekit"
-PACKAGECONFIG[concheck] = "--with-libsoup=yes,--with-libsoup=no,libsoup-2.4"
-PACKAGECONFIG[modemmanager] = "--with-modem-manager-1=yes,--with-modem-manager-1=no,modemmanager"
-PACKAGECONFIG[ppp] = "--enable-ppp,--disable-ppp,ppp"
-# Use full featured dhcp client instead of internal one
-PACKAGECONFIG[dhclient] = "--with-dhclient=${base_sbindir}/dhclient,,,dhcp-client"
-PACKAGECONFIG[dnsmasq] = "--with-dnsmasq=${bindir}/dnsmasq"
-PACKAGECONFIG[nss] = "--with-crypto=nss,,nss"
-PACKAGECONFIG[gnutls] = "--with-crypto=gnutls,,gnutls libgcrypt"
-PACKAGECONFIG[wifi] = "--enable-wifi=yes,--enable-wifi=no,wireless-tools,wpa-supplicant wireless-tools"
-PACKAGECONFIG[ifupdown] = "--enable-ifupdown,--disable-ifupdown"
-PACKAGECONFIG[netconfig] = "--with-netconfig=yes,--with-netconfig=no"
-
-PACKAGES =+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests ${PN}-bash-completion \
-  ${PN}-nmtui ${PN}-nmtui-doc \
-  ${PN}-adsl \
-"
-
-FILES_libnmutil += "${libdir}/libnm-util.so.*"
-FILES_libnmglib += "${libdir}/libnm-glib.so.*"
-FILES_libnmglib-vpn += "${libdir}/libnm-glib-vpn.so.*"
-
-FILES_${PN}-adsl = "${libdir}/NetworkManager/libnm-device-plugin-adsl.so"
-
-FILES_${PN} += " \
-    ${libexecdir} \
-    ${libdir}/pppd/*/nm-pppd-plugin.so \
-    ${libdir}/NetworkManager/*.so \
-    ${datadir}/polkit-1 \
-    ${datadir}/dbus-1 \
-    ${base_libdir}/udev/* \
-    ${systemd_unitdir}/system \
-"
-
-RRECOMMENDS_${PN} += "iptables \
-    ${@bb.utils.contains('PACKAGECONFIG','dnsmasq','dnsmasq','',d)} \
-"
-RCONFLICTS_${PN} = "connman"
-
-FILES_${PN}-dbg += " \
-    ${libdir}/NetworkManager/.debug/ \
-    ${libdir}/pppd/*/.debug/ \
-"
-
-FILES_${PN}-dev += " \
-    ${datadir}/NetworkManager/gdb-cmd \
-    ${libdir}/pppd/*/*.la \
-    ${libdir}/NetworkManager/*.la \
-"
-
-FILES_${PN}-tests = " \
-    ${bindir}/nm-online \
-"
-
-FILES_${PN}-bash-completion = "${datadir}/bash-completion"
-
-FILES_${PN}-nmtui = " \
-    ${bindir}/nmtui \
-    ${bindir}/nmtui-edit \
-    ${bindir}/nmtui-connect \
-    ${bindir}/nmtui-hostname \
-"
-
-FILES_${PN}-nmtui-doc = " \
-    ${mandir}/man1/nmtui* \
-"
-
-SYSTEMD_SERVICE_${PN} = "NetworkManager.service NetworkManager-dispatcher.service"
-
-do_install_append() {
-    rm -rf ${D}/run ${D}${localstatedir}/run
-}
-- 
2.5.0


