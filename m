Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF61F0182E
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 11:39:37 +0000 (UTC)
Received: from mailrelay-egress7.pub.mailoutpod3-cph3.one.com (mailrelay-egress7.pub.mailoutpod3-cph3.one.com [46.30.211.246])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67240.1772797170837455369
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Mar 2026 03:39:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa2 header.b=wzU5Z6gP;
 dkim=pass header.i=@berginkonsult.se header.s=ed2 header.b=dz7rFSkW;
 spf=none, err=SPF record not found (domain: berginkonsult.se, ip: 46.30.211.246, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1772797169; x=1773401969;
	d=berginkonsult.se; s=rsa2;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=fQdjj9uOwQXgl2pG6Vbvj4sv44JXZJDdlb+oh7shajI=;
	b=wzU5Z6gPlMZJXy/mVAFIdIVwe2luM0vDqzGbw5UTZnEdsZkxiTzt8EwM4/Kbt2O0aG8xlEvt6VpeI
	 mFnL5ekeGFuxL8G3NVzXROvCkY9mPjEDiQXY4uNma9zAgqO1ZwkDsUfXQ46wc3IUeOPvWaGOq+Jkd/
	 whJ6X6l/YdbgZLjCkBRNRPCQ5ZpH2ACXkVg0q5AzWsqkaZYt6VA5yYGS4mY4FtMDjfbqVTgQpAHh6n
	 m2Sn2CBsLtlCDeXPhe1JypgNM6swN3X4VAC91FKsLbNev5HLOHlHU4MrqyWf+4eRvDG8vWCJQQxDyL
	 H788oSRIKuNrUMnx7j34sTVvqkeukWQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1772797169; x=1773401969;
	d=berginkonsult.se; s=ed2;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=fQdjj9uOwQXgl2pG6Vbvj4sv44JXZJDdlb+oh7shajI=;
	b=dz7rFSkWAoMDPobGImG95nEgEjB0ZHK2myDSxkom2CdCHstKGyIEbIhDIlxqGkC2CnmvsauhoUB8T
	 A7dQtccBg==
X-HalOne-ID: 218e9953-1951-11f1-a394-81a63d10fb2d
Received: from pbkserver2.. (c83-191-168-223.bredband.tele2.se [83.191.168.223])
	by mailrelay5.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id 218e9953-1951-11f1-a394-81a63d10fb2d;
	Fri, 06 Mar 2026 11:39:28 +0000 (UTC)
From: Peter Bergin <peter@berginkonsult.se>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Bergin <peter@berginkonsult.se>
Subject: [meta-oe][PATCH 2/2] rtla: add recipe for real-time linux analysis tool
Date: Fri,  6 Mar 2026 12:39:22 +0100
Message-ID: <20260306113922.3319380-2-peter@berginkonsult.se>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306113922.3319380-1-peter@berginkonsult.se>
References: <20260306113922.3319380-1-peter@berginkonsult.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 11:39:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124904

rtla source code is present in the kernel source tree at tools/tracing/rtla.
There is another build option for rtla to enable bpf bindings, this was
not a quick one to get working and left as a future improvement.

Makefile for rtla has evolved in newer kernels (v6.9). Some fixes needed for
support with older kernels. This commit was tested against 6.18 and 6.8.

Also add rtla to packagegroup-meta-oe-benchmarks.

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 +
 meta-oe/recipes-kernel/rtla/rtla.bb           | 47 +++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/rtla/rtla.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 9fd7af6c08..0cbe3964c4 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -68,6 +68,7 @@ RDEPENDS:packagegroup-meta-oe-benchmarks = "\
     nbench-byte \
     phoronix-test-suite \
     qperf \
+    rtla \
     s-suite \
     stressapptest \
     tinymembench \
diff --git a/meta-oe/recipes-kernel/rtla/rtla.bb b/meta-oe/recipes-kernel/rtla/rtla.bb
new file mode 100644
index 0000000000..af40fd5bd2
--- /dev/null
+++ b/meta-oe/recipes-kernel/rtla/rtla.bb
@@ -0,0 +1,47 @@
+SUMMARY = "Real-Time Linux Analysis tool"
+LICENSE = "GPL-2.0-only"
+
+DEPENDS = "libtraceevent libtracefs"
+PROVIDES = "virtual/rtla"
+
+B = "${WORKDIR}/${BPN}-${PV}"
+
+inherit kernelsrc kernel-arch pkgconfig
+
+do_populate_lic[depends] += "virtual/kernel:do_shared_workdir"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[cpupower] = ",,cpupower"
+
+EXTRA_OEMAKE = "V=1 -C ${S}/tools/tracing/rtla O=${B} CROSS=${TARGET_PREFIX} \
+    CC="${CC} ${DEBUG_PREFIX_MAP}" LD="${LD}" AR=${AR} ARCH=${ARCH} \
+    BUILD_BPF_SKEL=0"
+
+do_compile() {
+    # Older kernels (before 6.9) use a standalone rtla Makefile that does not honor
+    # O= so outputs land in the kernel source tree (shared workdir). Remove
+    # build output to make sure it is rebuilt. For newer kernels this wil be a no-op.
+    rm -f ${S}/tools/tracing/rtla/rtla
+    rm -f ${S}/tools/tracing/rtla/src/*.o
+
+    # Older kernels need additional variable EXTRA_LDFLAGS to pick up correct linker options.
+    export EXTRA_LDFLAGS="${LDFLAGS}"
+    oe_runmake
+}
+
+do_install() {
+    install -d ${D}${bindir}
+
+    # Older kernels (before 6.9) use a standalone rtla Makefile that does not honor
+    # O= for the final binary, so it ends up in the kernel source tree.
+    rtla_bin="${B}/rtla"
+    [ -f "${rtla_bin}" ] || rtla_bin="${S}/tools/tracing/rtla/rtla"
+    install -m 755 "${rtla_bin}" ${D}${bindir}/rtla
+
+    # rtla, osnoise, hwnoise, and timerlat are all the same binary
+    ln -s rtla ${D}${bindir}/osnoise
+    ln -s rtla ${D}${bindir}/hwnoise
+    ln -s rtla ${D}${bindir}/timerlat
+}
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"

