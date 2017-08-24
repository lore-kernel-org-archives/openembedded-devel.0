Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id E2D3B7832B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 15:51:53 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id u15so3745020wrg.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 08:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2y0AXC1CLBtj0pGWEn3Rkzr1Vm1Ftx0tihnNjS/AlEg=;
	b=a8s+hhagyCFwSwLvbheRQ8SMv/PViC5uP4nBAzGGfsp15d6jUoFmyr41uvrJsqHg7B
	J7Zwz2fu/z0lphlLkx4U6oQdcLZPfLPQ4bFZvFB2U5WUrN/vIJC+mkP5U3laN9jZatZu
	DN13MB8+FiYwD+72gUoBuBaCAj63lDBmeaC5cLpdUNjtY9F+hsQI+iP/lz+TCzyt0QzY
	OPRz2d1J9EWv3iCUiYaxAhXJzx5VzfrX46gZWql2P0BbHVHWy67hRdr5FbyayBoGXbWS
	XyhJ0zWR7G8YJw0mSVg7AXE4agPOsIiaVHwamxhctQ6yxrsCfAewHZgUTqxpDfUp5eMz
	IVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2y0AXC1CLBtj0pGWEn3Rkzr1Vm1Ftx0tihnNjS/AlEg=;
	b=pmXFSCvOrzUVgMbxWq6RDHKrQmYaTVPjAgIgljtpwSkUOHPswP1ukpXhOAbhWTYOm/
	9dtCI2MxKJACA6hTP62mMPOo3l2mHvdIUvCt44P5cdI/HtB8i3lvq1R3wsL8Gb6p506i
	b4fg42qo3xhLTiavg64JexUtn7/OswqSLBVjk7sa7gSojpTFjD7edc2GgFPCV3zSO1Zk
	4gGz1EkYnbwXNhXwzvWJyY+E/MHMmgCG1Y6r8FJUEziSdJDichF7Oxi0byOaXeW/Gv+N
	2N5UP/oJPWIGFM+wlBG83NV2XBV7sqSFzvQdfkXMYRYAiH8Bu2KBz4WvyTy3eDwUvORt
	BPUw==
X-Gm-Message-State: AHYfb5jmgxIGm30ZEWqw28xQ/Egp3bj24R33R0RJMcHSvDI07d+F/TFU
	N5ZiG9HgVj1Git5C
X-Received: by 10.223.179.11 with SMTP id j11mr5174022wrd.235.1503589914049;
	Thu, 24 Aug 2017 08:51:54 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	j137sm9805977wmd.0.2017.08.24.08.51.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Aug 2017 08:51:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Aug 2017 17:53:31 +0200
Message-Id: <20170824155332.18313-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170824155332.18313-1-Martin.Jansa@gmail.com>
References: <20170824155332.18313-1-Martin.Jansa@gmail.com>
Subject: [PATCHv2 4/5] meta-systemd: remove this now pretty empty layer
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
X-List-Received-Date: Thu, 24 Aug 2017 15:51:54 -0000

* the upgrade path from original meta-systemd still isn't provided
  by oe-core, but hopefully there are only a few remaining users
  of this layer.
* some BSPs probably still use systemd-machine-units, it's now added
  to oe-core:
  http://git.openembedded.org/openembedded-core/commit/?id=5f3dbcf71059939f1c33af7b8848eb18b311365a

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-systemd/README                                | 26 ------------------
 meta-systemd/conf/layer.conf                       | 32 ----------------------
 .../recipes-bsp/keymaps/keymaps_1.0.bbappend       |  4 ---
 .../recipes-connectivity/avahi/avahi_%.bbappend    |  4 ---
 .../connman/connman_%.bbappend                     |  3 --
 .../dhcp/dhcp/dhclient.service                     | 13 ---------
 .../recipes-connectivity/dhcp/dhcp_%.bbappend      | 24 ----------------
 .../recipes-connectivity/ofono/ofono_%.bbappend    |  5 ----
 .../openssh/openssh_%.bbappend                     |  3 --
 .../wpa-supplicant/wpa-supplicant_%.bbappend       |  3 --
 .../recipes-core/busybox/busybox_%.bbappend        |  3 --
 .../oe-core/recipes-core/dbus/dbus_%.bbappend      |  3 --
 .../recipes-core/dropbear/dropbear_%.bbappend      |  4 ---
 .../recipes-core/systemd/systemd_%.bbappend        |  3 --
 .../recipes-core/util-linux/util-linux_%.bbappend  |  3 --
 .../oe-core/recipes-extended/at/at_%.bbappend      |  4 ---
 .../recipes-extended/cronie/cronie_%.bbappend      |  3 --
 .../recipes-extended/lighttpd/lighttpd_%.bbappend  |  3 --
 .../recipes-extended/rpcbind/rpcbind_%.bbappend    |  3 --
 .../systemd/systemd-machine-units_1.0.bb           | 13 ---------
 20 files changed, 159 deletions(-)
 delete mode 100644 meta-systemd/README
 delete mode 100644 meta-systemd/conf/layer.conf
 delete mode 100644 meta-systemd/oe-core/recipes-bsp/keymaps/keymaps_1.0.bbappend
 delete mode 100644 meta-systemd/oe-core/recipes-connectivity/avahi/avahi_%.bbappend
 delete mode 100644 meta-systemd/oe-core/recipes-connectivity/connman/connman_%.bbappend
 delete mode 100644 meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp/dhclient.service
 delete mode 100644 meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend
 delete mode 100644 meta-systemd/oe-core/recipes-connectivity/ofono/ofono_%.bbappend
 delete mode 100644 meta-systemd/oe-core/recipes-connectivity/openssh/openssh_%.bbappend
 delete mode 100644 meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_%.bbappend
 delete mode 100644 meta-systemd/oe-core/recipes-core/busybox/busybox_%.bbappend
 delete mode 100644 meta-systemd/oe-core/recipes-core/dbus/dbus_%.bbappend
 delete mode 100644 meta-systemd/oe-core/recipes-core/dropbear/dropbear_%.bbappend
 delete mode 100644 meta-systemd/oe-core/recipes-core/systemd/systemd_%.bbappend
 delete mode 100644 meta-systemd/oe-core/recipes-core/util-linux/util-linux_%.bbappend
 delete mode 100644 meta-systemd/oe-core/recipes-extended/at/at_%.bbappend
 delete mode 100644 meta-systemd/oe-core/recipes-extended/cronie/cronie_%.bbappend
 delete mode 100644 meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_%.bbappend
 delete mode 100644 meta-systemd/oe-core/recipes-extended/rpcbind/rpcbind_%.bbappend
 delete mode 100644 meta-systemd/recipes-core/systemd/systemd-machine-units_1.0.bb

diff --git a/meta-systemd/README b/meta-systemd/README
deleted file mode 100644
index 2cd90b415..000000000
--- a/meta-systemd/README
+++ /dev/null
@@ -1,26 +0,0 @@
-This layer depends on:
-
-URI: git://github.com/openembedded/oe-core.git
-branch: master
-revision: HEAD
-
-And we're working to break the dependency on this one:
-
-URI: git://github.com/openembedded/meta-oe.git
-branch: master
-revision: HEAD
-
-To make BBMASK'ing per layer possible the following directory structure is
-used:
-
-$[LAYERDIR}/<layer name>/recipes-<group-name>/<recipe-name>/<recipe-name>.bbappend
-
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][meta-systemd]' in the subject'
-
-When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][meta-systemd][PATCH'
-
-You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
-
-Main layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
-                       Martin Jansa <martin.jansa@gmail.com>
diff --git a/meta-systemd/conf/layer.conf b/meta-systemd/conf/layer.conf
deleted file mode 100644
index 0563f44cc..000000000
--- a/meta-systemd/conf/layer.conf
+++ /dev/null
@@ -1,32 +0,0 @@
-# It really depends on order of the layers appearing in BBLAYERS
-# variable in toplevel bblayers.conf file, where bitbake will search
-# for .inc files and others where bitbake uses BBPATH since it will
-# search the directories from first to last as specified in BBPATH
-# Therefore if you want a given layer to be considered high priority
-# for the .inc and .conf etc. then consider it adding at the beginning
-# of BBPATH. For bblayers bitbake will use BBFILES_PRIORITY to resolve
-# the recipe contention so the order of directories in BBFILES does 
-# not matter.
-
-# We have a conf and classes directory, append to BBPATH
-BBPATH .= ":${LAYERDIR}"
-
-# We have a recipes directory, add to BBFILES
-BBFILES += "\
-  ${LAYERDIR}/recipes-*/*/*.bb \
-  ${LAYERDIR}/oe-core/recipes-*/*/*.bbappend \
-"
-
-BBFILE_COLLECTIONS += "systemd-layer"
-BBFILE_PATTERN_systemd-layer := "^${LAYERDIR}/"
-
-# Define the priority for recipes (.bb files) from this layer,
-# choosing carefully how this layer interacts with all of the
-# other layers.
-
-BBFILE_PRIORITY_systemd-layer = "7"
-
-SIGGEN_EXCLUDERECIPES_ABISAFE += " \
-  systemd-serialgetty \
-"
-LAYERDEPENDS_systemd-layer = "core"
diff --git a/meta-systemd/oe-core/recipes-bsp/keymaps/keymaps_1.0.bbappend b/meta-systemd/oe-core/recipes-bsp/keymaps/keymaps_1.0.bbappend
deleted file mode 100644
index 181b8784d..000000000
--- a/meta-systemd/oe-core/recipes-bsp/keymaps/keymaps_1.0.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-
diff --git a/meta-systemd/oe-core/recipes-connectivity/avahi/avahi_%.bbappend b/meta-systemd/oe-core/recipes-connectivity/avahi/avahi_%.bbappend
deleted file mode 100644
index 181b8784d..000000000
--- a/meta-systemd/oe-core/recipes-connectivity/avahi/avahi_%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-
diff --git a/meta-systemd/oe-core/recipes-connectivity/connman/connman_%.bbappend b/meta-systemd/oe-core/recipes-connectivity/connman/connman_%.bbappend
deleted file mode 100644
index f006b3fb5..000000000
--- a/meta-systemd/oe-core/recipes-connectivity/connman/connman_%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
diff --git a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp/dhclient.service b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp/dhclient.service
deleted file mode 100644
index c9620cf09..000000000
--- a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp/dhclient.service
+++ /dev/null
@@ -1,13 +0,0 @@
-[Unit]
-Description=Dynamic Host Configuration Protocol (DHCP)
-After=syslog.target network.target
-
-[Service]
-Type=forking
-PIDFile=/var/run/dhclient.pid
-EnvironmentFile=-/etc/default/dhcp-client
-ExecStart=/sbin/dhclient -cf /etc/dhcp/dhclient.conf -q -lf /var/lib/dhcp/dhclient.leases $INTERFACES
-
-[Install]
-WantedBy=multi-user.target
-
diff --git a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend
deleted file mode 100644
index 9c7d93f16..000000000
--- a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend
+++ /dev/null
@@ -1,24 +0,0 @@
-# look for files in the layer first
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SYSTEMD_PACKAGES += "dhcp-client"
-SYSTEMD_SERVICE_${PN}-client = "dhclient.service"
-SYSTEMD_AUTO_ENABLE_${PN}-client = "disable"
-
-FILES_${PN}-client += "${systemd_unitdir}/system/dhclient.service"
-RPROVIDES_dhcp-server += "dhcp-server-systemd"
-RREPLACES_dhcp-server += "dhcp-server-systemd"
-RCONFLICTS_dhcp-server += "dhcp-server-systemd"
-RPROVIDES_dhcp-relay += "dhcp-relay-systemd"
-RREPLACES_dhcp-relay += "dhcp-relay-systemd"
-RCONFLICTS_dhcp-relay += "dhcp-relay-systemd"
-RPROVIDES_${PN}-client += "dhcp-client-systemd"
-RREPLACES_${PN}-client += "dhcp-client-systemd"
-RCONFLICTS_${PN}-client += "dhcp-client-systemd"
-
-SRC_URI += "file://dhclient.service"
-
-do_install_append() {
-    install -m 0644 ${WORKDIR}/dhclient.service ${D}${systemd_unitdir}/system
-}
-
diff --git a/meta-systemd/oe-core/recipes-connectivity/ofono/ofono_%.bbappend b/meta-systemd/oe-core/recipes-connectivity/ofono/ofono_%.bbappend
deleted file mode 100644
index 17a312459..000000000
--- a/meta-systemd/oe-core/recipes-connectivity/ofono/ofono_%.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-
-SYSTEMD_AUTO_ENABLE = "disable"
diff --git a/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_%.bbappend b/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_%.bbappend
deleted file mode 100644
index dadbc1499..000000000
--- a/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-RPROVIDES_${PN}-sshd += "${PN}-sshd-systemd"
-RREPLACES_${PN}-sshd += "${PN}-sshd-systemd"
-RCONFLICTS_${PN}-sshd += "${PN}-sshd-systemd"
diff --git a/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_%.bbappend b/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_%.bbappend
deleted file mode 100644
index f006b3fb5..000000000
--- a/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
diff --git a/meta-systemd/oe-core/recipes-core/busybox/busybox_%.bbappend b/meta-systemd/oe-core/recipes-core/busybox/busybox_%.bbappend
deleted file mode 100644
index 642d450a5..000000000
--- a/meta-systemd/oe-core/recipes-core/busybox/busybox_%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-RPROVIDES_${PN}-syslog += "${PN}-syslog-systemd"
-RREPLACES_${PN}-syslog += "${PN}-syslog-systemd"
-RCONFLICTS_${PN}-syslog += "${PN}-syslog-systemd"
diff --git a/meta-systemd/oe-core/recipes-core/dbus/dbus_%.bbappend b/meta-systemd/oe-core/recipes-core/dbus/dbus_%.bbappend
deleted file mode 100644
index f006b3fb5..000000000
--- a/meta-systemd/oe-core/recipes-core/dbus/dbus_%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
diff --git a/meta-systemd/oe-core/recipes-core/dropbear/dropbear_%.bbappend b/meta-systemd/oe-core/recipes-core/dropbear/dropbear_%.bbappend
deleted file mode 100644
index 181b8784d..000000000
--- a/meta-systemd/oe-core/recipes-core/dropbear/dropbear_%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-
diff --git a/meta-systemd/oe-core/recipes-core/systemd/systemd_%.bbappend b/meta-systemd/oe-core/recipes-core/systemd/systemd_%.bbappend
deleted file mode 100644
index f5aa547f1..000000000
--- a/meta-systemd/oe-core/recipes-core/systemd/systemd_%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-RPROVIDES_udev += "udev-systemd"
-RREPLACES_udev += "udev-systemd"
-RCONFLICTS_udev += "udev-systemd"
diff --git a/meta-systemd/oe-core/recipes-core/util-linux/util-linux_%.bbappend b/meta-systemd/oe-core/recipes-core/util-linux/util-linux_%.bbappend
deleted file mode 100644
index f006b3fb5..000000000
--- a/meta-systemd/oe-core/recipes-core/util-linux/util-linux_%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
diff --git a/meta-systemd/oe-core/recipes-extended/at/at_%.bbappend b/meta-systemd/oe-core/recipes-extended/at/at_%.bbappend
deleted file mode 100644
index 181b8784d..000000000
--- a/meta-systemd/oe-core/recipes-extended/at/at_%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-
diff --git a/meta-systemd/oe-core/recipes-extended/cronie/cronie_%.bbappend b/meta-systemd/oe-core/recipes-extended/cronie/cronie_%.bbappend
deleted file mode 100644
index f006b3fb5..000000000
--- a/meta-systemd/oe-core/recipes-extended/cronie/cronie_%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
diff --git a/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_%.bbappend b/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_%.bbappend
deleted file mode 100644
index f006b3fb5..000000000
--- a/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
diff --git a/meta-systemd/oe-core/recipes-extended/rpcbind/rpcbind_%.bbappend b/meta-systemd/oe-core/recipes-extended/rpcbind/rpcbind_%.bbappend
deleted file mode 100644
index f006b3fb5..000000000
--- a/meta-systemd/oe-core/recipes-extended/rpcbind/rpcbind_%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
diff --git a/meta-systemd/recipes-core/systemd/systemd-machine-units_1.0.bb b/meta-systemd/recipes-core/systemd/systemd-machine-units_1.0.bb
deleted file mode 100644
index 6a66ac214..000000000
--- a/meta-systemd/recipes-core/systemd/systemd-machine-units_1.0.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "Machine specific systemd units"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PR = "r18"
-
-inherit systemd
-SYSTEMD_SERVICE_${PN} = ""
-NATIVE_SYSTEMD_SUPPORT = "1"
-ALLOW_EMPTY_${PN} = "1"
-- 
2.14.1


