Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37930.1795594084613752286
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=YOgHjihn;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33fb4680717so13983908eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594084; x=1796198884; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uoeet03Z/NG8oph9+fmpDJ5xLBPAm+GqHAfjWyiO+w8=;
        b=YOgHjihnNWAAxvZrCbu5vEvCUuZ/KM6A3ITkr17MLDGA7Ev5EVhZBlErDMnFAenVAR
         O6EcJRQ2Q3K9VdQAdp4jCPZqA1Yf9w6Jbd1TLySB2rwwmVqedA4YhM6QCawRsU3rB5Te
         GBFl+Cnv6+jplQHbi/Je2E5K2J05HslMOMl6k+im3RR6OrMd2u6FQiVh7mVmZ/kaih1D
         zKWSil4wRWDRU51vdUKRvbR7fiqfREaM7FdzCK6Lry0prPfIvdqVuQDh/ACvLQnirtkK
         PrmBUzSCYirIxchwZp69X2U9akDC8rVnKqDH+KERciVCd2P9lobeBlhg+dDgVCQ+pRGl
         GlSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594084; x=1796198884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uoeet03Z/NG8oph9+fmpDJ5xLBPAm+GqHAfjWyiO+w8=;
        b=TiA2wMkj3z3HewMHbf0niWeuT5yG9c/Yrk+0VX67epzoUwIRAOmpPWkeJ4z0JF5NES
         /rCKEuNU0OJRW90ZTFZK1rOysVfyQfkia2b05ZruaMbVeQU2mBAp5f7vAZZ6tfFscRex
         wOMKeIjb3sbMalw9Dll4P6jDFIRv/9hZrmQnTscY+HAhyzC8jqsn1QHdrvk/AQL4Wf8b
         phs6Xh2ifFp2KseFLFA5VEZ4KflK1Ixu9KcZpDgNNlMvSu6vSDBtqoMX1CI1doJvEePy
         CaEF4bvUz0/8ceuD1mrFGNKZalCnjdnMwhHfBYVlsXwfH7CQ7w5h+4eJ1D0srH8M8RSR
         3nOQ==
X-Gm-Message-State: APuU4Z+QYxM0Zw+ljJ51j/A6BzbleBPs0rav6lPOsJGGJGqD+h3IHpM6
	yRDfPFegE4MLz55xryhOcPYqR/Q/Ujsv+os79/ZsA/cE5ZCR891CMAuhFwANUcHt
X-Gm-Gg: AZFdTZcJXt48Mi2uS1VuKcLkWCeWDmir4dUcsmLl9v0cHycuBVuPqfr4aRkLtNVOjvj
	i6Uz0rhBLoPHjC3WcxKYnmnt4M/lcPU3mSI/lTNh1jzbWZ0XQK4URlN5MvgNcuuiWByaYHp8a8x
	U9jGLCVHKAsNR2QOc0nN0cNSmbnis1f1AudXc4gBnecN9CHgxSvVV2vUxGNzr4vZw7jY5THSpy2
	jHPOXo3jNvo+wiLu+IT42WA/HxNj7kUWtGnliw0eP1/qzTwzhBztqh2STCCPZZuqfQeb9aFlhgX
	5B9wNDubgN3p8fYtHKxNIxOLLBNrZlwx+QRGyl8CBWHpUCpiww0HfjHKMPUvON0AAYpOuqncydR
	PobRD/Jl6FZZCVCgs170MYF6MMdYzbWeBFbqO/HIPQl5cCwbCi68FACaKyGWTdlbYMgCKpnp/f4
	h0bidB9/KEk2xTf7Gjh65ad9AarUhwcCe6R5pwKPo5Ga12dklH2Qsb5xiNObbhJY8HOS5OnaTXX
	7CAdHF5AED4g0pl8NypGxCHGcUcirIzwzKyM2REZ6kY1zTsxgJZQC2nJzc+cyUVHTUxr7muLbn5
	ClYPKW4mSRpmw75G43AnTF59DYYIQ7i4rCXzQwTWChkRKsbwmN9ba2D1BTt2cRpK+aRP7f/WRzc
	mWJ3Uj7V71+yvoPgZlbGY2HEkx670yd0juubozJAjpvoOEKbFSN/EDYsUB2Ilw/nisZ8J875zeD
	98MqE/oaZNVR47L0KXYOFw8QsMQMDkGl9FPo7zg2gaNabztjluwQQ0fylSsyPKHfsT9cYke6Ccr
	9CnU+Dbrlhtd+TiLudNUEoYdNW1+9/tKw78THKcxLTTntARizYZCQUZea7nkaQxCrinxz/5HziB
	fOZv
X-Received: by 2002:a05:7300:d108:b0:386:c6dd:2616 with SMTP id 5a478bee46e88-386c6dd29ffmr3511298eec.41.1795594083943;
        Wed, 25 Nov 2026 00:08:03 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 17/55] systemd-repart-native: upgrade 257.6 -> 262
Date: Wed, 25 Nov 2026 00:06:33 -0800
Message-ID: <20261125080732.2419614-23-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133020
Content-Type: text/plain; charset="utf-8"

- libsystemd: new sd-varlink protocol-upgrade helpers,
  SD_ELF_NOTE_DLOPEN_ANCHORED() in sd-dlopen.h, and
  sd_id128_from_string() accepts urn:uuid: strings
- libsystemd no longer links against libgcrypt; journal sealing moved to
  OpenSSL
- systemd-repart: supports Encrypt= combined with Verity=data, honors
  $SOURCE_DATE_EPOCH for reproducible images, and gains --cow= and -n
  for --dry-run
- systemd-repart: MakeSymlinks= expands specifiers in the target, and
  the legacy FactoryReset EFI variable is no longer honored (use
  FactoryResetRequest)

Require oe-core's systemd.inc so the recipe follows oe-core's systemd
version, sources and license files. systemd 262 removed the rootlibdir
and rootprefix meson options, and the libsystemd-shared name is now
derived from PV.

License-Update: license files now come from systemd.inc; the systemd 262 copies carry the older FSF postal address, terms unchanged
AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ..._257.6.bb => systemd-repart-native_262.bb} | 21 ++++---------------
 1 file changed, 4 insertions(+), 17 deletions(-)
 rename meta-oe/recipes-core/systemd/{systemd-repart-native_257.6.bb => systemd-repart-native_262.bb} (58%)

diff --git a/meta-oe/recipes-core/systemd/systemd-repart-native_257.6.bb b/meta-oe/recipes-core/systemd/systemd-repart-native_262.bb
similarity index 58%
rename from meta-oe/recipes-core/systemd/systemd-repart-native_257.6.bb
rename to meta-oe/recipes-core/systemd/systemd-repart-native_262.bb
index 8fb19b1b90..220e20e517 100644
--- a/meta-oe/recipes-core/systemd/systemd-repart-native_257.6.bb
+++ b/meta-oe/recipes-core/systemd/systemd-repart-native_262.bb
@@ -3,19 +3,12 @@
 # Copyright Leica Geosystems AG
 #
 
+require recipes-core/systemd/systemd.inc
+
 SUMMARY = "systemd-repart"
 DESCRIPTION = "systemd-repart grows and adds partitions to a partition table, based on the configuration files described in repart.d(5), or generates a Discoverable Disk Image (DDI) for a system extension (sysext, see systemd-sysext(8))."
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/systemd"
 
-LICENSE = "GPL-2.0-only AND LGPL-2.1-or-later"
-LICENSE:libsystemd = "LGPL-2.1-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
-                    file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
-
-SRCREV = "00a12c234e2506f5cab683460199575f13c454db"
-SRCBRANCH = "v257-stable"
-SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH}"
-
 DEPENDS = " \
     cryptsetup-native \
     gperf-native \
@@ -28,16 +21,10 @@ inherit meson pkgconfig gettext native
 
 MESON_TARGET = "systemd-repart"
 
-# Helper variables to clarify locations. This mirrors the logic in systemd's
-# build system.
-rootprefix ?= "${root_prefix}"
-rootlibdir ?= "${base_libdir}"
-rootlibexecdir = "${rootprefix}/lib"
+SYSTEMD_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 EXTRA_OEMESON += "-Dnobody-user=nobody \
     -Dnobody-group=nogroup \
-    -Drootlibdir=${rootlibdir} \
-    -Drootprefix=${rootprefix} \
     -Ddefault-locale=C \
     -Dmode=release \
     -Dsystem-alloc-uid-min=101 \
@@ -50,7 +37,7 @@ do_install() {
     install -d ${D}${bindir}/
     install -m 0755 ${B}/systemd-repart ${D}${bindir}/systemd-repart
     install -d ${D}${libdir}/
-    install -m 0644 ${B}/src/shared/libsystemd-shared-257.so ${D}${libdir}/libsystemd-shared-257.so
+    install -m 0644 ${B}/src/shared/libsystemd-shared-${SYSTEMD_MAJOR}.so ${D}${libdir}/libsystemd-shared-${SYSTEMD_MAJOR}.so
 
     install -d ${D}${libdir}/systemd/repart/
     cp -r ${S}/src/repart/definitions ${D}${libdir}/systemd/repart/
