Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A488C5DF7E
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:02:19 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2526.1787029332577260818
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:02:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=i+RzTwpj;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cbee3777e1cso2357975a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 22:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787029332; x=1787634132; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d+J3IQguY+5dVdFmhLbUKJB9DW0fOVZIlWjFWmF1NSk=;
        b=i+RzTwpjnk/Ez1pGpCTLm3Eo382nq9Q3QGCHi8kuT291fkrzLCUmLQGMerZrf7qcz0
         Bo4M2XXNPuVFc7ndF/aPexp6JFvlnos5mhLJead4AoUEWCNVsCQF+HPMx7KKKWX3VW/R
         Ui0dzOR/isrim1cPUCv7aTGrrepvY85137xUthrivjh74QF/x0U27cwxpuRECra45643
         oLUhNLXDcnHGhwS02MEAkucUrY5gXjjB2+9VpunYzl+efrA2i2vt5x9CoVF8TKscYZDB
         Z8s0bYXWxfWHHgDhpDIGEKmU9A+KonoNBUk49fBeMbCB+33pjxp7rF7LU6zoIJlj6kEM
         8AkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787029332; x=1787634132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d+J3IQguY+5dVdFmhLbUKJB9DW0fOVZIlWjFWmF1NSk=;
        b=TsHM0SrSBU6sZi8qJf7YH3jriD0EK8TU4MoPMhOUbUBnuVV7VYjQZGAHO/Tyw+7SGJ
         zSRa/D2kO5ZgnYNck7gKcAcwV/6Kc1To3GUq7El8i5IuwAPMA3KzrZuPF9UqJQa+M995
         sY7MDBqBCiaFauzhwpQ444ZZeVdqTClkjeYv7U5H6cwWVAm36XfrylIs3pvn4TZk3TIZ
         2i6ipptyELbLQVHZ3fMPvOPWu9LDGv+BQ1axcQ42Wfh6p+iHn4PNmvshkaw3HoJ+jOwo
         vHodmR18e1Y/OIgfcpLp7m9t0Iy1hnKXK8Tcge2awMJystehGW2UuyDKMpm0wm5P1wjL
         RuGw==
X-Gm-Message-State: AOJu0YzdnP9SCEomCuMJ1kbyrjVJOfop99U9cbZplgSu70Pv2Wp/BS2f
	jlCCOPMPTHBUpIzBkHiaAX8SZoSOPXFAwXXOyUGH/cBQOXhmCubylQk30uDszw==
X-Gm-Gg: AR+sD1278K1jpg7JoZvUC4xQr3zHOUmZ3VJ2EGOFjgtpMjjCq5YjAcjCqISOr5qq4kn
	0Zqr71J0FP2RTVAOfPNoB/AXGhAGLRjD4Nlj0sYv1hHP41ENaUZqT0RbSVDOu8SsOrbFEW5gF6r
	krJ/znK5Vf1OEyK62gJoqMpMxUy9CpP7JhyVpjrrdgcd17qfH1A4OcNPM6sLmlTjGOIOlIOodd7
	+mDsEYdT0yQTOErsbf+fbzZ6KKFzzjo0REBIv5Pu7qKqlpRh9x0KQbhHcmdTuuShH/vx3M2lU9H
	FJeNB7rjgFu0u8t2JxCajKH4LGCRpzw4Hs1V3iYek3dnPGGrA09B4zQK36uU9m7yDzCV0QKayCn
	r4mN1S5W3lzcsMUKuUL/8pB5P1BwwhJsVa1DyGDjJ7ycwi3PpNxNz/vj1xAfyMVEdcavlVsmGPI
	DbaOSj8leSUN5OEQbYJ5utcmq1vWnlsXaxSymrmm7VjmXFee9DA/dqCXY9GLPrHowCCx8olV9QM
	g==
X-Received: by 2002:a05:6a21:a94:b0:3bf:b84c:2984 with SMTP id adf61e73a8af0-3cce34a035cmr4917600637.11.1787029331704;
        Mon, 17 Aug 2026 22:02:11 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267be8e5c8sm12840095eec.16.2026.08.17.22.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 22:02:11 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 13/27] tayga: upgrade 0.9.2 -> 0.9.6
Date: Tue, 18 Aug 2026 17:01:08 +1200
Message-ID: <20260818050123.2901739-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
References: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 05:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129212

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

- Update SRC_URI as upstream moved to GitHub
- Upstream now builds via Makefile and no longer ships a configure script
- Refresh LICENSE file path and checksum
- Install template systemd service and conf provided by upstream
- Drop patch which is merged in the upstream version
- Recommend kernel-module-tun since /dev/net/tun is required at runtime
Fixes:

root@qemuarm64:~# systemctl status tayga@default.service
x tayga@default.service - Simple, no-fuss NAT64
     Loaded: loaded (/usr/lib/systemd/system/tayga@.service; enabled; preset: disabled)
     Active: failed (Result: exit-code) since Tue 2026-08-18 03:16:11 UTC; 12s ago
 Invocation: a950b39a22a141baaa88e5c919a59009
    Process: 300 ExecStart=tayga --config /etc/tayga/default.conf --journal --nodetach (code=exited, status=1/FAILURE)
   Main PID: 300 (code=exited, status=1/FAILURE)
   Mem peak: 1.7M
        CPU: 190ms

Aug 18 03:16:11 qemuarm64 systemd[1]: Starting Simple, no-fuss NAT64...
Aug 18 03:16:11 qemuarm64 tayga[300]: Starting TAYGA 0.9.6
Aug 18 03:16:11 qemuarm64 tayga[300]: Compiled from tags/0.9.6
Aug 18 03:16:11 qemuarm64 tayga[300]: Commit 7f00122b75d808f696df0efe481a8c8919ba9bd7
Aug 18 03:16:11 qemuarm64 tayga[300]: Unable to open /dev/net/tun, aborting: No such file or directory
Aug 18 03:16:11 qemuarm64 systemd[1]: tayga@default.service: Main process exited, code=exited, status=1/FAILURE
Aug 18 03:16:11 qemuarm64 systemd[1]: tayga@default.service: Failed with result 'exit-code'.
Aug 18 03:16:11 qemuarm64 systemd[1]: Failed to start Simple, no-fuss NAT64.

- Add UPSTREAM_CHECK_GITTAGREGEX for git tag version checks

Fixes:
$ devtool latest-version tayga
...
INFO: Current version: 0.9.2
INFO: Latest version:

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tayga/files/0001-include-sys-uio.patch    |  18 ---
 .../tayga/files/tayga.conf                    | 103 ------------------
 .../tayga/files/tayga.service                 |  12 --
 .../recipes-connectivity/tayga/tayga_0.9.2.bb |  24 ----
 .../recipes-connectivity/tayga/tayga_0.9.6.bb |  39 +++++++
 5 files changed, 39 insertions(+), 157 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/tayga/files/0001-include-sys-uio.patch
 delete mode 100644 meta-networking/recipes-connectivity/tayga/files/tayga.conf
 delete mode 100644 meta-networking/recipes-connectivity/tayga/files/tayga.service
 delete mode 100644 meta-networking/recipes-connectivity/tayga/tayga_0.9.2.bb
 create mode 100644 meta-networking/recipes-connectivity/tayga/tayga_0.9.6.bb

diff --git a/meta-networking/recipes-connectivity/tayga/files/0001-include-sys-uio.patch b/meta-networking/recipes-connectivity/tayga/files/0001-include-sys-uio.patch
deleted file mode 100644
index 0c6f1609af..0000000000
--- a/meta-networking/recipes-connectivity/tayga/files/0001-include-sys-uio.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-
-This patch addresses the following clang failure: tayga-0.9.2/nat64.c:119:6:
-error: call to undeclared function 'writev'; ISO C99 and later do not support
-implicit function declarations [-Wimplicit-function-declaration]
-
-Upstream-Status: Pending
-Signed-off-by: Pawel Langowski <pawel.langowski@3mdeb.com>
-
---- tayga.h	2023-09-29 14:38:05.005837695 +0200
-+++ tayga-2.h	2023-09-29 14:37:45.560837257 +0200
-@@ -20,6 +20,7 @@
- #include <sys/stat.h>
- #include <sys/ioctl.h>
- #include <sys/socket.h>
-+#include <sys/uio.h>
- #include <netinet/in.h>
- #include <arpa/inet.h>
- #include <unistd.h>
diff --git a/meta-networking/recipes-connectivity/tayga/files/tayga.conf b/meta-networking/recipes-connectivity/tayga/files/tayga.conf
deleted file mode 100644
index c1b6163a45..0000000000
--- a/meta-networking/recipes-connectivity/tayga/files/tayga.conf
+++ /dev/null
@@ -1,103 +0,0 @@
-#
-# Sample configuration file for TAYGA 0.9.2
-#
-# Modify this to use your own addresses!!
-#
-
-#
-# TUN device that TAYGA will use to exchange IPv4 and IPv6 packets with the
-# kernel.  You may use any name you like, but `nat64' is recommended.
-#
-# This device may be created before starting the tayga daemon by running
-# `tayga --mktun`.  This allows routing and firewall rules to be set up prior
-# to commencement of packet translation.
-#
-# Mandatory.
-#
-tun-device nat64
-
-#
-# TAYGA's IPv4 address.  This is NOT your router's IPv4 address!  TAYGA
-# requires its own address because it acts as an IPv4 and IPv6 router, and
-# needs to be able to send ICMP messages.  TAYGA will also respond to ICMP
-# echo requests (ping) at this address.
-#
-# This address can safely be located inside the dynamic-pool prefix.
-#
-# Mandatory.
-#
-ipv4-addr 192.168.254.1
-
-#
-# TAYGA's IPv6 address.  This is NOT your router's IPv6 address!  TAYGA
-# requires its own address because it acts as an IPv4 and IPv6 router, and
-# needs to be able to send ICMP messages.  TAYGA will also respond to ICMP
-# echo requests (ping6) at this address.
-#
-# You can leave ipv6-addr unspecified and TAYGA will construct its IPv6
-# address using ipv4-addr and the NAT64 prefix.
-#
-# Optional if the NAT64 prefix is specified, otherwise mandatory.  It is also
-# mandatory if the NAT64 prefix is 64:ff9b::/96 and ipv4-addr is a private
-# (RFC1918) address.
-#
-#ipv6-addr 2001:db8:1::2
-ipv6-addr fdaa:bb:1::1
-
-#
-# The NAT64 prefix.  The IPv4 address space is mapped into the IPv6 address
-# space by prepending this prefix to the IPv4 address.  Using a /96 prefix is
-# recommended in most situations, but all lengths specified in RFC 6052 are
-# supported.
-#
-# This must be a prefix selected from your organization's IPv6 address space
-# or the Well-Known Prefix 64:ff9b::/96.  Note that using the Well-Known
-# Prefix will prohibit IPv6 hosts from contacting IPv4 hosts that have private
-# (RFC1918) addresses, per RFC 6052.
-#
-# The NAT64 prefix need not be specified if all required address mappings are
-# listed in `map' directives.  (See below.)
-#
-# Optional.
-#
-##prefix 2001:db8:1:ffff::/96
-prefix 64:ff9b::/96
-
-#
-# Dynamic pool prefix.  IPv6 hosts which send traffic through TAYGA (and do
-# not correspond to a static map or an IPv4-translatable address in the NAT64
-# prefix) will be assigned an IPv4 address from the dynamic pool.  Dynamic
-# maps are valid for 124 minutes after the last matching packet is seen.
-#
-# If no unassigned addresses remain in the dynamic pool (or no dynamic pool is
-# configured), packets from unknown IPv6 hosts will be rejected with an ICMP
-# unreachable error.
-#
-# Optional.
-#
-dynamic-pool 192.168.254.0/24
-
-#
-# Persistent data storage directory.  The dynamic.map file, which saves the
-# dynamic maps that are created from dynamic-pool, is stored in this
-# directory.  Omit if you do not need these maps to be persistent between
-# instances of TAYGA.
-#
-# Optional.
-#
-data-dir /var/spool/tayga
-
-#
-# Establishes a single-host map.  If an IPv6 host should be consistently
-# reachable at a specific IPv4 address, the mapping can be specified in a
-# `map' directive.  (IPv6 hosts numbered with an IPv4-translatable address do
-# not need map directives.)
-#
-# IPv4 addresses specified in the `map' directive can safely be located inside
-# the dynamic-pool prefix.
-#
-# Optional.
-#
-#map 192.168.5.42 2001:db8:1:4444::1
-#map 192.168.5.43 2001:db8:1:4444::2
-#map 192.168.255.2 2001:db8:1:569::143
diff --git a/meta-networking/recipes-connectivity/tayga/files/tayga.service b/meta-networking/recipes-connectivity/tayga/files/tayga.service
deleted file mode 100644
index 0bffeb92a5..0000000000
--- a/meta-networking/recipes-connectivity/tayga/files/tayga.service
+++ /dev/null
@@ -1,12 +0,0 @@
-[Unit]
-SourcePath=/usr/sbin/tayga
-Description=LSB: userspace NAT64
-
-[Service]
-Type=forking
-ExecStart=/usr/sbin/tayga -d --config /etc/tayga.conf
-RemainAfterExit=yes
-TimeoutStopSec=infinity
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-networking/recipes-connectivity/tayga/tayga_0.9.2.bb b/meta-networking/recipes-connectivity/tayga/tayga_0.9.2.bb
deleted file mode 100644
index f36435c8ea..0000000000
--- a/meta-networking/recipes-connectivity/tayga/tayga_0.9.2.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-SRC_URI = " \
-        http://www.litech.org/tayga/tayga-${PV}.tar.bz2 \
-        file://tayga.conf \
-        file://tayga.service \
-        file://0001-include-sys-uio.patch;striplevel=0 \
-        "
-SRC_URI[sha256sum] = "2b1f7927a9d2dcff9095aff3c271924b052ccfd2faca9588b277431a44f0009c"
-
-SYSTEMD_PACKAGES = "${PN}"
-SYSTEMD_SERVICE:${PN} = "tayga.service"
-
-EXTRA_OEMAKE += "CFLAGS='${CFLAGS}'"
-
-do_install:append() {
-  install -m 0644 ${UNPACKDIR}/tayga.conf ${D}${sysconfdir}/tayga.conf
-  install -d ${D}${systemd_unitdir}/system/
-  install -m 0644 ${UNPACKDIR}/tayga.service ${D}${systemd_unitdir}/system/
-}
-
-inherit autotools systemd
-
diff --git a/meta-networking/recipes-connectivity/tayga/tayga_0.9.6.bb b/meta-networking/recipes-connectivity/tayga/tayga_0.9.6.bb
new file mode 100644
index 0000000000..2cb3c72948
--- /dev/null
+++ b/meta-networking/recipes-connectivity/tayga/tayga_0.9.6.bb
@@ -0,0 +1,39 @@
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "git://github.com/apalrd/tayga.git;branch=main;protocol=https;tag=${PV}"
+SRCREV = "7f00122b75d808f696df0efe481a8c8919ba9bd7"
+
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
+
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE:${PN} = "tayga@.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
+EXTRA_OEMAKE = "CC='${CC}' CFLAGS='${CFLAGS}' LDFLAGS='${LDFLAGS}'"
+
+do_configure[noexec] = "1"
+
+do_compile() {
+  oe_runmake
+}
+
+do_install() {
+  oe_runmake install \
+    DESTDIR=${D} \
+    prefix=${prefix} \
+    exec_prefix=${exec_prefix} \
+    sbindir=${sbindir} \
+    datarootdir=${datadir} \
+    mandir=${mandir} \
+    sysconfdir=${sysconfdir} \
+    servicedir=${systemd_system_unitdir} \
+    WITH_SYSTEMD=1
+
+  install -d ${D}${sysconfdir}/tayga
+  install -m 0644 ${S}/tayga.conf.example ${D}${sysconfdir}/tayga/default.conf
+}
+
+inherit systemd
+
+RRECOMMENDS:${PN} += "kernel-module-tun"
\ No newline at end of file

