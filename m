Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37943.1795594093733817002
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=WnKkBdgc;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-38699cf08dfso6372482eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594093; x=1796198893; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mXHqXUfj2edYryW4BliYv1ai7Z1C0qP/ReUQSuy5wI8=;
        b=WnKkBdgcGwq9al3XdrHr3SX/D/gbsFcXAsFSfr4QLFh7m3NSAcwJUu4bZBqV6njYig
         wIo/+Zh5v7iiavsn3Y6cixWh6dyukmEGfcplKRrjUERy7XaQ5B+9k7cVlqWkNiMJ9LVl
         iqbLhfxYxxxDsFyL/RSaU7IwZSqJIUeALuZ6JJQOPkvK2wruTm7LNNoLteoMLL3a5nuX
         ywBzSZGk6aAIzAPNASzhwIvrr5PavsuHNQxeHkEwUiRtd0ZoDN6dHfnXYBJd6dl5tysZ
         2NZA+9M5uWy0uKUqskMmvyCra2JVhGc7Xvy6Mh1gDe0PEl7CZYRLPS9hUvNOnMacSgng
         gHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594093; x=1796198893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mXHqXUfj2edYryW4BliYv1ai7Z1C0qP/ReUQSuy5wI8=;
        b=y5cmgwPjbqwvyGh5CtWlNLivBpvRMZ9Zz5B1f87KUHr0mVkK7KFtTSYIlDBcOMpASN
         SxSL8dgCp+sRxmEKO2dtbR5G7ycvjNmREnQmBmkojWh7L7lP3IrZtkSizd1+jWws9yRi
         cRrbxrvHdS5DyEQcnO/J2IxmqaQ83hXty4070EYxyau4DJS4kfRqwC6GbIi4tVv5FWK0
         sOSWB+dNQxleR/8Tf/gMa3TbjE39hcYpxii55uPof42kHVx6+vDS5ckR/nwLqjq0d2dJ
         2QuHmVF53NpB4kn5deVXca9YvSXmZnNnAKtsffha3BunBLRblq8pw9DuQtXV7nQhD4mX
         bF7w==
X-Gm-Message-State: APuU4Z89Ryc+YrRbmrojOalYsvax7VMhEG+8kW2OVoTW85MeWAfifQHM
	vGMXP904FX+K+h68WtSWsiTef/ktlYwrYyCoLSuRHabG4/wLjkYEfQjKA05MnGUi
X-Gm-Gg: AZFdTZfnUG/zq5FkUsOuBN7XrgoKtsB91v6MWla9IgGimoev1MinXkz3k9ZKTWOleBG
	yho79puZrIvsy8XsTq4f63BVQ07lDVGiYRdgn4/XFAoSNN0xw2nVmclpGZe3xHiMVpsmYC/z8Xg
	mlSt4hXdpxWxxGukgwedbRBfwbYjIIoIgm1fJmtyqavg+hDvb7VqfQRCi77zWpZ6schFpNeO8FJ
	xC4ycCBwFYSgJgnHliKABIDRTFAJuNYSPFJcsSTNhM52ron5qAGBhDKVy38hgvwmM/ERsvWd6z3
	VCVpJfL0c+9NUo0WF1d6GwIPQLbTpeRUK97DcLRhCzeapNiRqjyaBATbGBajmXviqqyf81SAZZV
	e70ZS4gzs3cLfqdY+ayc4TrhI3e3G4LRk8yygZhXoSUXmAUNB9vDlJhfrRxEaY6o0BYFzN5oRnq
	WuYJn3qOTINalWnGEzMR4zb70gfZJRb3ozZlq02G/myil+zV8Cg/DLx1mGxdKLMzJL3w44mLMfi
	JtG5ynx108r7EOmIMhtGV26iAWifFPyE0G7Xf0XpC8wmti7cBCY1rGDQnPIFGCTGvRIg+J8/na7
	LyGmDPAluvTpURsBL+2W/Ga9p5cf8C0gJE7vCJuyiF/7TNnZjI64k+ws3Y5HOcDduZn8XcNE+R/
	gTLbD3Mq7PKy2qFN0zkYFQpHhGiEdqfu0diOrMgLmO+9Y7cw9plo9H7K6ZrOdt/si9KQX9kmP65
	cKYSnbqI3tHafl1VanZAcPjCLj0WnTkm43I32OWosKlyoaKIgomAe89+jM/6HwpvpXZD71ruP4t
	rIKCPfxlx/H+LzmvlQiBpeu6B8Ez5rGzl+I0LHzSDzh9guWASrV2IdyKY/27mdrGcmpy1Q5e+lW
	NFe/
X-Received: by 2002:a05:7301:714:b0:36a:7b3c:4e0a with SMTP id 5a478bee46e88-3856fd5e4a4mr17989017eec.24.1795594092999;
        Wed, 25 Nov 2026 00:08:12 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 24/55] nvme-cli: upgrade 2.16 -> 3.2
Date: Wed, 25 Nov 2026 00:06:40 -0800
Message-ID: <20261125080732.2419614-30-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133027
Content-Type: text/plain; charset="utf-8"

- libnvme is now part of nvme-cli as libnvme3 (libnvme3.so.1,
  libnvme3.pc, headers in include/libnvme3) with NVMe 2.4 renames
  in its API; the separate libnvme 1.x library is no longer used
- nvme-fabrics.conf(.d) INI configuration replaces config.json and
  discovery.conf (converted on first use); key commands moved to
  "nvme keys", DH-HMAC-CHAP is now KX-HMAC-CHAP
- new nvme-discoverd and nvme-keysd daemons, nvme top, ownership
  registry/exclusion list, privsep and sandbox (tech previews)
- strict command line parsing: long options need two dashes and the
  full name, numbers are parsed strictly, --help goes to stdout
- gen-hostnqn must run as root; Meson >= 1.0 is required

Drop the libnvme dependency; the libnvme recipe stays for libblockdev,
sedutil and NetworkManager, which use the 1.x API. Package the bundled
library as libnvme3 with its own license. Pin the autodetected
dependencies with PACKAGECONFIGs: keyutils and openssl on (as in the
libnvme recipe), libarchive, libdbus, libkmod, liburing and
nvme-discoverd (needs systemd) off; with nvme-discoverd off the legacy
nvmf-autoconnect units, udev rules and dracut config are installed as
before. Disable python bindings, nvme-keysd, tests and examples.
Package the new NetworkManager dispatcher script. Drop the
-Wno-error=incompatible-pointer-types workaround, the virtium plugin
now uses time_t. Add UPSTREAM_CHECK_GITTAGREGEX.

License-Update: ccan/licenses/ replaced by a LICENSES/ directory
(CC0-1.0, MIT, LGPL-2.1-or-later, LicenseRef-Gary-S-Brown-CRC32 for
the shared crc32 code); LICENSE adds GPL-2.0-or-later,
LGPL-2.1-or-later (bundled libnvme and shared code) and the CRC32
notice.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.16.bb | 34 ------------
 meta-oe/recipes-bsp/nvme-cli/nvme-cli_3.2.bb  | 52 +++++++++++++++++++
 2 files changed, 52 insertions(+), 34 deletions(-)
 delete mode 100644 meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.16.bb
 create mode 100644 meta-oe/recipes-bsp/nvme-cli/nvme-cli_3.2.bb

diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.16.bb b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.16.bb
deleted file mode 100644
index 397537417e..0000000000
--- a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.16.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-SUMMARY = "NVMe management command line interface"
-HOMEPAGE = "https://github.com/linux-nvme/nvme-cli"
-SECTION = "console/utils"
-LICENSE = "CC0-1.0 AND GPL-2.0-only AND MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022 \
-                    file://ccan/licenses/CC0;md5=c17af43b05840255a6fedc5eda9d56cc \
-                    file://ccan/licenses/BSD-MIT;md5=838c366f69b72c5df05c96dff79b35f2"
-DEPENDS = "json-c libnvme"
-SRCREV = "faf7326a2997dea91687fd3daa17fc405910a4c1"
-
-SRC_URI = "git://github.com/linux-nvme/nvme-cli.git;branch=master;protocol=https;tag=v${PV}"
-
-inherit bash-completion meson pkgconfig systemd
-
-EXTRA_OEMESON += "-Dsystemddir=${systemd_unitdir}/system"
-
-pkg_postinst_ontarget:${PN}-user () {
-    ${sbindir}/nvme gen-hostnqn > ${sysconfdir}/nvme/hostnqn
-    ${bindir}/uuidgen > ${sysconfdir}/nvme/hostid
-}
-
-PACKAGES =+ "${PN}-dracut ${PN}-zsh-completion ${PN}-user"
-
-FILES:${PN} += "${systemd_system_unitdir}"
-FILES:${PN}-dracut = "${nonarch_libdir}/dracut/dracut.conf.d"
-FILES:${PN}-zsh-completion = "${datadir}/zsh/site-functions"
-ALLOW_EMPTY:${PN}-user = "1"
-
-RDEPENDS:${PN}-user = "util-linux-uuidgen"
-
-# This one is reproducible only on 32bit MACHINEs
-# http://errors.yoctoproject.org/Errors/Details/766964/
-# git/plugins/virtium/virtium-nvme.c:205:63: error: passing argument 1 of 'localtime' from incompatible pointer type [-Wincompatible-pointer-types]
-CFLAGS += "-Wno-error=incompatible-pointer-types"
diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_3.2.bb b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_3.2.bb
new file mode 100644
index 0000000000..95365e17e7
--- /dev/null
+++ b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_3.2.bb
@@ -0,0 +1,52 @@
+SUMMARY = "NVMe management command line interface"
+HOMEPAGE = "https://github.com/linux-nvme/nvme-cli"
+SECTION = "console/utils"
+LICENSE = "GPL-2.0-only AND GPL-2.0-or-later AND LGPL-2.1-or-later AND CC0-1.0 AND MIT AND LicenseRef-Gary-S-Brown-CRC32"
+LICENSE:libnvme3 = "LGPL-2.1-or-later AND CC0-1.0 AND MIT AND LicenseRef-Gary-S-Brown-CRC32"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022 \
+                    file://LICENSES/LGPL-2.1-or-later.txt;md5=310c7c93cf5181c6b0cc8229a1f3c6f6 \
+                    file://LICENSES/CC0-1.0.txt;md5=65d3616852dbf7b1a6d4b53b00626032 \
+                    file://LICENSES/MIT.txt;md5=3912d958d00bac4a6b550f75d7c806bb \
+                    file://LICENSES/LicenseRef-Gary-S-Brown-CRC32.txt;md5=c923b33bfa4944fc9c3d644b16424ff6"
+NO_GENERIC_LICENSE[Gary-S-Brown-CRC32] = "LICENSES/LicenseRef-Gary-S-Brown-CRC32.txt"
+
+DEPENDS = "json-c"
+SRCREV = "ce55132af26607e1904a0f449f94eeae028cfee5"
+
+SRC_URI = "git://github.com/linux-nvme/nvme-cli.git;branch=master;protocol=https;tag=v${PV}"
+
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
+
+inherit bash-completion meson pkgconfig systemd
+
+PACKAGECONFIG ??= "keyutils openssl"
+PACKAGECONFIG[discoverd] = "-Dnvme-discoverd=enabled,-Dnvme-discoverd=disabled,systemd"
+PACKAGECONFIG[keyutils] = "-Dkeyutils=enabled,-Dkeyutils=disabled,keyutils"
+PACKAGECONFIG[libarchive] = "-Dlibarchive=enabled,-Dlibarchive=disabled,libarchive"
+PACKAGECONFIG[libdbus] = "-Dlibdbus=enabled,-Dlibdbus=disabled,dbus"
+PACKAGECONFIG[libkmod] = "-Dlibkmod=enabled,-Dlibkmod=disabled,kmod"
+PACKAGECONFIG[liburing] = "-Dliburing=enabled,-Dliburing=disabled,liburing"
+PACKAGECONFIG[openssl] = "-Dopenssl=enabled,-Dopenssl=disabled,openssl"
+
+EXTRA_OEMESON += "-Dsystemddir=${systemd_unitdir}/system \
+                  -Djson-c=enabled \
+                  -Dpython=disabled \
+                  -Dnvme-keysd=disabled \
+                  -Dtests=false \
+                  -Dexamples=false \
+"
+
+pkg_postinst_ontarget:${PN}-user () {
+    ${sbindir}/nvme gen-hostnqn > ${sysconfdir}/nvme/hostnqn
+    ${bindir}/uuidgen > ${sysconfdir}/nvme/hostid
+}
+
+PACKAGES =+ "libnvme3 ${PN}-dracut ${PN}-zsh-completion ${PN}-user"
+
+FILES:libnvme3 = "${libdir}/libnvme3${SOLIBS}"
+FILES:${PN} += "${systemd_system_unitdir} ${nonarch_libdir}/NetworkManager"
+FILES:${PN}-dracut = "${nonarch_libdir}/dracut/dracut.conf.d"
+FILES:${PN}-zsh-completion = "${datadir}/zsh/site-functions"
+ALLOW_EMPTY:${PN}-user = "1"
+
+RDEPENDS:${PN}-user = "util-linux-uuidgen"
