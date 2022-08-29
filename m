Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE480ECAAD4
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 19:47:59 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web12.2903.1661802469188129426
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 12:47:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hy8uNKlC;
 spf=pass (domain: gmail.com, ip: 209.85.218.49,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id h5so6239831ejb.3
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 12:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=1nNl1ne/IgMCZEZDU1nSbweD0uycmDwzeTswnbqli10=;
        b=hy8uNKlCNP1bayc8B4MjTW//VrCLv55qdopVHYPYl65iWt7wKS8y533GNauFTDYJkx
         zu1er5wwziFV6nDZmylHmAbV7LFfG1u5nIxggS33diJHK0dGlRJOhiX41DtS5yUEIJ5I
         vv2t/VEtdSAi9R5+5fgbZDMx3M2k8VfglAdDouSgO9TR9tfc+R5wGh/Fg4dhK3kvC3z7
         pT2Nmhkgoi/isHZ3fwWzpW507QqeLEX4LExEkZllun/U20UO+KAbzAuVq7SA57RUVR6c
         E3WC8qOwqrE1Cx+D80NiuPxPyxS6VUV91wHH6BwetHrX0jbmG27mPNqtm9gbtSDwVKJL
         YhTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=1nNl1ne/IgMCZEZDU1nSbweD0uycmDwzeTswnbqli10=;
        b=Xc9OotzD4WeZy4gCs1NYWGEpPueDO2jBk/ZZMnInP4ld113NJt3eMnKqEEuTqGzuQ4
         N2x6h6JkTNPOYweHEwwI3mk17+va4RxDkzy53HBWjPEPs7xFaBub0Ws25EtglWWvQ+dn
         9pHH171r41ZM8l2Su08a3969UgjOLmN/XMhlovWCKRP6bt5CrSWP5laKDeczEQN9+bt1
         WXEl4veQUftscPBbUsScyaM4jAE1wtjeShKCgpgxdhRJ5VbrQX+kilil6gOXArl9u5Hw
         rnZCIGUU/rPizadEI5boDqIXCgQbgqpEWeSBtj5T+o0aoaLl2p4Lq3IBn74Pk+eV/U7G
         GTSQ==
X-Gm-Message-State: ACgBeo3KAlsjVlRbmV0CDYFKuR8xJFG8DTIcsaiwFlDzjygY1q/doqmG
	juj18IDWqZhfNwVoas4hdmyhrdoBfqw=
X-Google-Smtp-Source: 
 AA6agR7u+8lt9dCukvRmcwVv7A6MsLgVjNHlquTHLThp4GZeAgj8JfkJGzvy0z+PuxmbHMjt9VK/6g==
X-Received: by 2002:a17:906:9b90:b0:738:60f9:c7d6 with SMTP id
 dd16-20020a1709069b9000b0073860f9c7d6mr14634899ejc.198.1661802465955;
        Mon, 29 Aug 2022 12:47:45 -0700 (PDT)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 f8-20020a170906494800b0073d68db09ecsm4822140ejt.23.2022.08.29.12.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 12:47:45 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster@mvista.com,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-networking][PATCH] networkmanager: update 1.38.0 -> 1.40.0
Date: Mon, 29 Aug 2022 21:47:29 +0200
Message-Id: <20220829194729.829693-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Aug 2022 19:47:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98536

NetworkManager:
* Drop unused, internal systemd DHCPv4 client. This is long
  replaced by nettools' n-dhcp4 implementation.
* The nmcli command now supports --offline argument with "add" and
  "modify" commands, allowing operation on keyfile-formatted connection
  profiles without the service running (e.g. during system provisioning).
* The device state file /run/NetworkManager/devices/$ifindex now has
  new sections [dhcp4] and [dhcp6] containing the DHCP options for the
  current lease.
* Add multipath TCP (MPTCP) support. NetworkManager can now configure IP addresses
  as MPTCP endpoints. This is configurable via the "connection.mptcp-flags"
  property. The default setting is such that MPTCP handling is automatically
  enabled if the kernel sysctl "/proc/sys/net/mptcp/enabled" indicates so.
  NetworkManager does not enable the MPTCP sysctl or adjust the limits (ip mptcp limits).
  The administrator or the distribution is supposed to configure the desired system
  settings.
  Note that strict reverse path filtering (rp_filter) breaks many MPTCP use cases.
  With MPTCP handling enabled, NetworkManager will relax a strict (1) rp_filter
  to loose (2). Otherwise rp_filter is untouched by NetworkManager.
* NetworkManager expanded log messages for invalid DHCP options.
* Fix the requirement of hardware address for DHCPv6, by dropping it.
* Increase the PMK lifetime for Wi-Fi connections using WPA-EAP.
* "nmcli networking off" now waits for deactivations to complete.
* Improve the appearance of nm-settings-nmcli man page by preserving
  paragraphs.
* Support enabling ipv4ll alongside DHCPv4 and static addressing.
* Support configuring "ipv6.mtu".
* Honor "nm.debug" kernel command line to enable debug logging of
  NetworkManager.
* NetworkManager reads the kernel command line "/proc/cmdline" for several
  purposes, including "nm.debug" for enabling debugging and the
  "match.kernel-command-line" setting in the profile. NetworkManager now
  first looks now for "/run/NetworkManager/proc-cmdline", which allows to
  overwrite the command line.
* Improve the reapply of non-bridge properties.
* Honor adding a Bluetooth NAP connection with all available methods.
* Improve carrier detection.
* During the build, stop relying on intltool for i18n and use gettext only.
* Undeprecate nm_remote_connection_get_secrets() in libnm.
* NetworkManager now will restart DHCP if the MAC changes on a device.
* Several internal improvements.

Recipe:
* Drop the last patch :-). -Difcfg_rh=false is now honored and the
  distro detection patch is no longer needed.
* Fix: move /etc/resolv-conf.NetworkManager to daemon package
* Fix: remove ppp rdepends from daemon. The ppp plugin rdepends on ppp.
* ifupdown plugin requires now bash not sh. But the ifupdown is an
  optional plugin anyway.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 ...1-do-not-ask-host-for-ifcfg-defaults.patch | 24 -------------------
 ...ger_1.38.0.bb => networkmanager_1.40.0.bb} | 12 ++++++----
 2 files changed, 8 insertions(+), 28 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-do-not-ask-host-for-ifcfg-defaults.patch
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.38.0.bb => networkmanager_1.40.0.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-do-not-ask-host-for-ifcfg-defaults.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-do-not-ask-host-for-ifcfg-defaults.patch
deleted file mode 100644
index 92b129320c..0000000000
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-do-not-ask-host-for-ifcfg-defaults.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 37559b659e22886d5f55837d4f167ba5fda73e85 Mon Sep 17 00:00:00 2001
-From: Adrian Freihofer <adrian.freihofer@siemens.com>
-Date: Sun, 29 Aug 2021 15:50:35 +0200
-Subject: [PATCH] do-not-ask-host-for-ifcfg-defaults
-
----
- meson.build | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index d0cec83..289aa1b 100644
---- a/meson.build
-+++ b/meson.build
-@@ -304,8 +304,8 @@ else
-   distro = 'unknown'
- endif
- 
--enable_ifcfg_rh = get_option('ifcfg_rh') or (distro == 'redhat')
--enable_ifupdown = get_option('ifupdown') or (distro == 'debian')
-+enable_ifcfg_rh = get_option('ifcfg_rh')
-+enable_ifupdown = get_option('ifupdown')
- 
- config_plugins_default = get_option('config_plugins_default')
- config_h.set_quoted('NM_CONFIG_DEFAULT_MAIN_PLUGINS', config_plugins_default)
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.38.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.38.0.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb
index ebd25a8f8a..10241e12a6 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.38.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb
@@ -29,9 +29,8 @@ SRC_URI = " \
     file://${BPN}.initd \
     file://enable-dhcpcd.conf \
     file://enable-iwd.conf \
-    file://0001-do-not-ask-host-for-ifcfg-defaults.patch \
 "
-SRC_URI[sha256sum] = "82a4cf07ddfeb0816787b67c0f5058ae6c50d6259c0b0541a24e35156062b2ef"
+SRC_URI[sha256sum] = "aee7e057bc2cca5dab84e41f15f1da8b795eb290747b04cbeee822bad9e9fc03"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
@@ -88,7 +87,7 @@ PACKAGECONFIG[bluez5] = "-Dbluez5_dun=true,-Dbluez5_dun=false,bluez5"
 # consolekit is not picked by shlibs, so add it to RDEPENDS too
 PACKAGECONFIG[consolekit] = "-Dsession_tracking_consolekit=true,-Dsession_tracking_consolekit=false,consolekit,consolekit"
 PACKAGECONFIG[modemmanager] = "-Dmodem_manager=true,-Dmodem_manager=false,modemmanager mobile-broadband-provider-info"
-PACKAGECONFIG[ppp] = "-Dppp=true -Dpppd=${sbindir}/pppd,-Dppp=false,ppp,ppp"
+PACKAGECONFIG[ppp] = "-Dppp=true -Dpppd=${sbindir}/pppd,-Dppp=false,ppp"
 PACKAGECONFIG[dnsmasq] = "-Ddnsmasq=${bindir}/dnsmasq"
 PACKAGECONFIG[nss] = "-Dcrypto=nss,,nss"
 PACKAGECONFIG[resolvconf] = "-Dresolvconf=${base_sbindir}/resolvconf,-Dresolvconf=no,,resolvconf"
@@ -233,16 +232,21 @@ FILES:${PN}-daemon += " \
     ${nonarch_base_libdir}/udev/* \
     ${nonarch_libdir}/firewalld \
     ${nonarch_libdir}/NetworkManager/conf.d \
+    ${nonarch_libdir}/NetworkManager/dispatcher.d/no-wait.d \
     ${nonarch_libdir}/NetworkManager/dispatcher.d/pre-down.d \
     ${nonarch_libdir}/NetworkManager/dispatcher.d/pre-up.d \
-    ${nonarch_libdir}/NetworkManager/dispatcher.d/no-wait.d \
     ${nonarch_libdir}/NetworkManager/system-connections \
     ${nonarch_libdir}/NetworkManager/VPN \
     ${sbindir}/NetworkManager \
     ${sysconfdir}/init.d/network-manager \
     ${sysconfdir}/NetworkManager \
+    ${sysconfdir}/resolv-conf.NetworkManager \
+    ${sysconfdir}/sysconfig/network-scripts \
     ${systemd_system_unitdir} \
 "
+RDEPENDS:${PN}-daemon += "\
+    ${@bb.utils.contains('PACKAGECONFIG', 'ifupdown', 'bash', '', d)} \
+"
 RRECOMMENDS:${PN}-daemon += "\
     ${NETWORKMANAGER_FIREWALL_DEFAULT} \
     ${@bb.utils.filter('PACKAGECONFIG', 'dnsmasq', d)} \
-- 
2.37.1


