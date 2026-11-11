Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5340.1794386634144893779
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 00:43:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=PYd2ElQc;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-37071c0f42aso5101176eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 00:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794386633; x=1794991433; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FFCC2B39T968uugrFVAHhHJQakOTWRJi2SCVcRng3oo=;
        b=PYd2ElQcMjDubPFbRJZdODP91rX6NjZM/b/Tknx9VKvu+LqFC+o6nN99SxPAHojys7
         2wMMWt96C03m4wq7Ob+TqSdP/zubrPAXexmjGDaG2Mdz6EU7gU2Pxm3HfKm46JjUEN+F
         +fNkBMbQg+t4JNWvfZApWsLOH5+UBG+kRJ7httGYmZh3gwVy1XdFqEB5fprvE7kLGL0C
         sDYhCGzV/RV/8KcD81ksdC5cfvP6CX4YG6b3uIeem/eK+euvgsW/kg3x2Q4X8JtzdK/e
         4kiOyOz8eYktwjQA1+BQDH25zqEByDiMMb63izHD4EUw9YnGBUzBWbH6NjgOrlNeboXP
         ftoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386633; x=1794991433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FFCC2B39T968uugrFVAHhHJQakOTWRJi2SCVcRng3oo=;
        b=gNFId08URc4eeQ4EvFVptCcjlaYHI/VC6n7S6P/be+PcIP+MsC2Q0JQ76/xLHQXPW4
         VZ61+2GMMTN/QWxHcN/IKrDWLLDbyMbymZ6m+iWRdx/ipfzQph/csaCQWFm3DVPOFHpi
         9S19FeSeqABI4Qai/IJo25fq1lyyMdxDUg/wPj1tFpys+RMbk6ha9kVGpqedPAh3ar4H
         XD+k731y5AR3/4uolMslUWPEhWK/N9V25cbjSxOs0vccgh0XHWr4TWC7WpetFQWCVOJ2
         LFUoCkT8bLXq/kYTpB2+arsw1/44tdvtKlAVS0QlnkGp+M1EqkA9n0W63AInXoRQqiw8
         57EA==
X-Gm-Message-State: APuU4Z+0gPV1jAaQ0AtGvFBid511mFZVpHfhq8CDD/FW/pAYPFucYF3r
	dzJauehyiKV0ka9pgHYKApB6cufxUbvCZHJT02J9aq8RBrkSjNVboXIU37PWHzMmpw78CQ==
X-Gm-Gg: AYBFou1N9VlV1UORE6XTPUdXAggkbbGgHJtHlFUC7KFSuBp8UCX6VUoml16kXCIFBSq
	PQfkY4Hb0iwylsRSqDvSctwjUUT92Y5ib7DvZmuH7Z+tz6CAObZFNhvl4MBu2859/5cNvzE1QOb
	kPmV26BVwEK8JgZm744IwwtSM8J31OnPwkNleb0AyIDLpy49CFrzosMSUQ67eCfiTj0DmK/dghb
	Q3GJrXP99nBty6+g6cXdLRNnD90d2B756yG4joVid1ZbygsmHbsVZv+7fgCHuxOekPBEqO8mhrH
	ZtQ2sJ9Kd/4ABAsBFm3emSmFDxh9avOVQSC3E0PSz0oC19r4lpZ0nOyM1xp99xHrFuK1+daHyTN
	OdLY3x2aHFsC6cjatbQ38ASfbjVWeWxb1fMH768vnxnSczP3laxRUk7sfY5iPI7aA1xVKmo7r4H
	eG+UUV1UmtY5+lNBZ1c6at7iZ8HNA3KG8kVhVwhT/vV/SuJlFeHrHmY2WMZvy/N4gAWE+kiw4v8
	nhXhNWyOPUa+I0nE49d11dNwkc/PH8nVpZ3gabEg5WQAVPHYiwXXtOmHrXkLeE6y/HOUcW3F8pp
	ffMQIPxy8feFV8BBVl/u2y7Ko/o65FdDKHRHT69a8hxscFpWRqmZwIhHRnivtSK3ecFYGW231ru
	XUNifoHTXDWm7BypmM2w7JACU709Sjc3oI3LchKlnyMwICcZnmr2k8Of1q1pwGKD0SCZHiE7u/+
	CT11cDMzs9kQEnwp8+wusoBIhLVYD/pXBHmiaHjsRXrVsyvfEX+huunoxD/5GbXlIc+Kk+c6Y7e
	IYVfkbf0E/oxJXk0veNkHrH2iKcngW6vQ4rYlM08j+HzQXaEAAa/t7PRwBMXdN3b3xeMKJBHRiO
	3/kJ
X-Received: by 2002:a05:693c:2d82:b0:376:b957:c08 with SMTP id 5a478bee46e88-376b9570f8dmr2504744eec.9.1794386633252;
        Wed, 11 Nov 2026 00:43:53 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212ec002sm16047532eec.26.2026.11.11.00.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:43:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] cpufrequtils: Remove obsolete recipe
Date: Wed, 11 Nov 2026 00:43:50 -0800
Message-ID: <20261111084350.551070-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 08:44:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132129
Content-Type: text/plain; charset="utf-8"

cpufrequtils has not been maintained for years and has been
superseded by cpupower, which lives in the kernel tree under
tools/power/cpupower and is already packaged in meta-oe. cpupower
covers the same functionality (cpufreq-info -> cpupower frequency-info,
cpufreq-set -> cpupower frequency-set) and is built from the running
kernel's sources, so it stays in sync with the kernel's cpufreq
interfaces.

Switch packagegroup-basic to cpupower, and drop cpufrequtils from
packagegroup-meta-oe-bsp, since packagegroup-meta-oe already pulls in
cpupower. Users should install cpupower instead.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../cpufrequtils/cpufrequtils_008.bb          | 35 -------------------
 .../packagegroups/packagegroup-basic.bb       |  2 +-
 .../packagegroups/packagegroup-meta-oe.bb     |  1 -
 3 files changed, 1 insertion(+), 37 deletions(-)
 delete mode 100644 meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb

diff --git a/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb b/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb
deleted file mode 100644
index 0db24a82c3..0000000000
--- a/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-DESCRIPTION = "To make access to the Linux kernel cpufreq subsystem easier for users and cpufreq userspace tools, a cpufrequtils package was created"
-
-inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'nls', 'gettext', '', d)}
-
-DEPENDS = "libtool-cross"
-
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-SRCREV = "a2f0c39d5f21596bb9f5223e895c0ff210b265d0"
-PV .= "+git"
-
-SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/cpufreq/cpufrequtils.git;branch=master;protocol=https"
-
-# Upstream repo does not tag
-UPSTREAM_CHECK_COMMITS = "1"
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-PACKAGECONFIG ??= "${@oe.utils.conditional('USE_NLS', 'no', '', 'nls', d)}"
-PACKAGECONFIG[nls] = "NLS=true,NLS=false,gettext-native"
-
-EXTRA_OEMAKE = "V=1 CROSS=${TARGET_PREFIX} CC='${CC}' STRIPCMD=echo 'CP=cp' ${PACKAGECONFIG_CONFARGS}"
-
-do_compile() {
-	oe_runmake
-}
-
-do_install() {
-	oe_runmake install DESTDIR=${D}
-	rm -f ${D}${libdir}/libcpufreq.so.0 ${D}${libdir}/libcpufreq.so
-	ln -s libcpufreq.so.0.0.0 ${D}${libdir}/libcpufreq.so.0
-	ln -s libcpufreq.so.0.0.0 ${D}${libdir}/libcpufreq.so
-}
-
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
index 324406c1ed..bdcfdf3c19 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
@@ -47,6 +47,6 @@ RRECOMMENDS:${PN} = "\
     \
     tzdata \
     \
-    cpufrequtils \
+    cpupower \
     htop \
 "
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index ebd66425de..f13ae4f834 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -98,7 +98,6 @@ RDEPENDS:packagegroup-meta-oe-benchmarks:remove:riscv32 = "libhugetlbfs"

 RDEPENDS:packagegroup-meta-oe-bsp = "\
     acpitool \
-    cpufrequtils \
     edac-utils \
     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "firmwared", "", d)} \
     flashrom \
