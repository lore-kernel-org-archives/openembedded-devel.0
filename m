Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3882.1794729053985484543
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:50:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=z0BSbK0Q;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3704d30b84fso2949030eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729053; x=1795333853; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GwD5f7Nzb48G6oiMM+nmeHHueCqG78N7vZEK7Fm1KVY=;
        b=z0BSbK0QTZ1zWpmbjOUfaRgHUrVdvVvxU2sWWInXbz1IfHBfa/8ZPH3H91X1UU8rdz
         QLsS0YMoC9hE+PQ/G3+YUdyJF0INUtRt3TkBHyXZyVwCWl0VSzQt43GxQlybWqOBOQux
         Q5GnjtBtxk3+PcfvO869TzgcVAmcxQQNaw2jRqWuZZ4kyp+qaWig3L9yWnTk7d4Dw//Z
         zPcHRQuyKbegYZMsBJRu+wWWNt1p1UNLAw1hMESi/rvu9oaKAb5ZWWrbdSWkaBSY8VPL
         Qy0y5JRG5yENBtZibGkuNV90C+N91qsXyGqUpDSgcUD96d7J3MeM/x1G+91tDtXyBsDu
         +5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729053; x=1795333853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GwD5f7Nzb48G6oiMM+nmeHHueCqG78N7vZEK7Fm1KVY=;
        b=Wr2oNCpjdFJpYJTLzoXdtbmXZ58vT1i9wTx1/fx2qu4DZuqkU0WoFNKcswIiC9AcDv
         +7NyySAG0/dKHNb08hG64LPBxTzmdZzrodBqDGGpECCzxxb5kXE8ekTYrzJJVdZoXGxC
         Wla08p3BubxEJKgzZ3Nu+0/4Pk4pSVhHbn5OQdk26LmAXXhXOdXOmsIFqA8gALPEqBV6
         SzZhGXxjEKDgEF4deQQi8ahIEbNYf7LCfV+B7u4zVQQIvex2la6jvWVVvoqkRd7Bg3NS
         9qWuWt+mbWtIAcTUtsRKI9GvO2mFg3YoaIbDnPf3nJ+tFSoKIdKfH/RzEbLynBmOHG1K
         9BAg==
X-Gm-Message-State: APuU4Z97LPFNQl31jdYewQOWnkgOKk6roLEXqaZYHlM4Z4ituZNfrZkA
	/as7xFO96WGVK/DbdQ4VfLZEhSPzClB/GpAQCfIyMgEUZg8THLrYa3VgaUug55tQ
X-Gm-Gg: AYBFou0qmDz+B9yFC4nDUMYp2nNoF8h7Zhmg5tSz1AEAJ4jl2jd5twnRVKhzly6EJwQ
	eV7paz9LUOTN4pglgVfTMw4NZoc4XY0XCjAxR/rfJdBc5TzvnjC5m57Lca8PtzM/XggL8Gng4Og
	ZmIzbLC0OqjHcq5ZnUYEwI5hLcd8e1zZ4h0HtB+j58DOm+Lih2ctSt4JwdEC177IKEyQJcwKOwF
	a4pDpf1lR/0PYF8p87rKC4YyV4Z8kylJKRbqNa/+XPvtRwQ2Szmmcub1rtsM27VLaFrGCuO/i+r
	sY4KUECHxFwjMHJnMMfi9qmYFUoJgCa6sbTJjcACcGcUVAmHnRwr1/acymJiqFdKmQZqqXUdVny
	iZ3W0WEdWgJTVPtzypbDfc/NzPwrUsxhgo543OcosLhA2lifLeadgaECdPVVs5Hg4frFBVIvVzl
	w3mn4zeYY8K++BOPX0cyn8kW8HrQ/QlMXgiipebUZV8aHbbKmJheYJyno27Wp8ZIiezuZmRJJDs
	U3C3ezlZ/2Ct8vyOn4RuC5To6++gk9ZiNJi7q2nuWzh0G/9pKTKWZnb/yxGYzE79BUvU+J2Ysv2
	HDGKvuoZxWLqFBKPQP4vBqVzvuvRqQZhcfqDyQjrKFDMK6gHGC0/e/aT4r+f2WSM/K7guGUOYjZ
	gH1UpWO3hiawK7lML4Ohq2tusQQfrLOG2osseEkrcbxuBUnFVq7iwiyWKu437Al3wmmnhABfQsx
	EovpQACGdmemzmcqfz2+FTI5gGSROZHj7NaeUWF6gyET97UfkNPjnUK2tJGmHWgV04qIelW8MXD
	CPOwCgbpk7rslBRhOYYPgc5rud63bUVyfMRdd2C0L4IqYnemTVrEn4QOPmp5fFbwlSCjX9hyOwN
	nI4m
X-Received: by 2002:a05:7301:5416:b0:375:7be3:1bbd with SMTP id 5a478bee46e88-37967ae6b5bmr7584631eec.23.1794729053231;
        Sat, 14 Nov 2026 23:50:53 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 58/96] perfetto, libperfetto: upgrade 57.2 -> 59.1
Date: Sat, 14 Nov 2026 23:48:36 -0800
Message-ID: <20261115074918.2932593-58-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132328
Content-Type: text/plain; charset="utf-8"

Update the zstd revision to the one install-build-deps pins for v59.1,
fetched from the GitHub repository it is mirrored from; the other
third-party revisions are unchanged.

Refresh 0001-Remove-check_build_deps-build-steps.patch. LICENSE only
changed a source path.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-devtools/perfetto/libperfetto.bb  |  2 +-
 meta-oe/recipes-devtools/perfetto/perfetto.bb |  6 +++---
 .../recipes-devtools/perfetto/perfetto.inc    |  4 ++--
 ...-Remove-check_build_deps-build-steps.patch | 21 +++++++++----------
 4 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/meta-oe/recipes-devtools/perfetto/libperfetto.bb b/meta-oe/recipes-devtools/perfetto/libperfetto.bb
index 0693c18166..3256978588 100644
--- a/meta-oe/recipes-devtools/perfetto/libperfetto.bb
+++ b/meta-oe/recipes-devtools/perfetto/libperfetto.bb
@@ -1,5 +1,5 @@
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b06e43f2e368eb8663632d529232353"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0b17e8eda713c18363c16102cacd41f3"
 
 require perfetto.inc
 
diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.bb b/meta-oe/recipes-devtools/perfetto/perfetto.bb
index f21b983a2b..02db461783 100644
--- a/meta-oe/recipes-devtools/perfetto/perfetto.bb
+++ b/meta-oe/recipes-devtools/perfetto/perfetto.bb
@@ -1,6 +1,6 @@
 LICENSE = "Apache-2.0 AND BSD-3-Clause AND MIT AND Zlib"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b06e43f2e368eb8663632d529232353 \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0b17e8eda713c18363c16102cacd41f3 \
                     file://buildtools/libcxx/LICENSE.TXT;md5=55d89dd7eec8d3b4204b680e27da3953 \
                     file://buildtools/libcxxabi/LICENSE.TXT;md5=7b9334635b542c56868400a46b272b1e \
                     file://buildtools/libunwind/LICENSE.TXT;md5=f66970035d12f196030658b11725e1a1 \
@@ -23,7 +23,7 @@ SRC_URI:append = " \
            git://android.googlesource.com/platform/bionic.git;branch=master;protocol=https;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/buildtools/bionic;name=bionic \
            git://chromium.googlesource.com/chromium/src/third_party/zlib.git;nobranch=1;protocol=https;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/buildtools/zlib;name=zlib \
            git://android.googlesource.com/platform/external/lzma.git;branch=master;protocol=https;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/buildtools/lzma;name=lzma \
-           git://android.googlesource.com/platform/external/zstd.git;branch=master;protocol=https;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/buildtools/zstd;name=zstd \
+           git://github.com/facebook/zstd.git;nobranch=1;protocol=https;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/buildtools/zstd;name=zstd \
            git://chromium.googlesource.com/external/github.com/google/re2.git;nobranch=1;protocol=https;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/buildtools/re2;name=re2 \
            \
            file://0001-Remove-check_build_deps-build-steps.patch \
@@ -43,7 +43,7 @@ SRCREV_libcxx = "852bc6746f45add53fec19f3a29280e69e358d44"
 SRCREV_libcxxabi = "a37a3aa431f132b02a58656f13984d51098330a2"
 SRCREV_libunwind = "419b03c0b8f20d6da9ddcb0d661a94a97cdd7dad"
 SRCREV_zlib = "6f9b4e61924021237d474569027cfb8ac7933ee6"
-SRCREV_zstd = "77211fcc5e08c781734a386402ada93d0d18d093"
+SRCREV_zstd = "f8745da6ff1ad1e7bab384bd1f9d742439278e99"
 SRCREV_re2 = "927f5d53caf8111721e734cf24724686bb745f55"
 
 SRCREV_FORMAT .= "_bionic_core_lzma_libprocinfo_logging_unwinding_protobuf_abseil_libbase_libcxx_libcxxabi_libunwind_zlib_zstd_re2"
diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.inc b/meta-oe/recipes-devtools/perfetto/perfetto.inc
index 188472b27d..bb5e152a80 100644
--- a/meta-oe/recipes-devtools/perfetto/perfetto.inc
+++ b/meta-oe/recipes-devtools/perfetto/perfetto.inc
@@ -5,6 +5,6 @@ HOMEPAGE = "https://github.com/google/perfetto"
 SRC_URI = "git://github.com/google/perfetto.git;protocol=https;name=perfetto;nobranch=1 \
 	"
 
-SRCREV_perfetto = "da1d152cff27890903d158fe96751de3aab883cc"
+SRCREV_perfetto = "1e9c61e9844affd7dccd3d42d9ea9f3a3d10cf6d"
 SRCREV_FORMAT = "perfetto"
-PV = "57.2"
+PV = "59.1"
diff --git a/meta-oe/recipes-devtools/perfetto/perfetto/0001-Remove-check_build_deps-build-steps.patch b/meta-oe/recipes-devtools/perfetto/perfetto/0001-Remove-check_build_deps-build-steps.patch
index 67720ea227..1956273cbc 100644
--- a/meta-oe/recipes-devtools/perfetto/perfetto/0001-Remove-check_build_deps-build-steps.patch
+++ b/meta-oe/recipes-devtools/perfetto/perfetto/0001-Remove-check_build_deps-build-steps.patch
@@ -12,14 +12,18 @@ rather than the Bitbake-generated one.
 
 Signed-off-by: Sui Chen <suichen6@gmail.com>
 Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
----
 Upstream-Status: Pending
+---
+ gn/BUILD.gn                  |  1 -
+ gn/standalone/BUILD.gn       | 20 ++++++++++----------
+ gn/standalone/BUILDCONFIG.gn |  5 +++--
+ 3 files changed, 13 insertions(+), 13 deletions(-)
 
 diff --git a/gn/BUILD.gn b/gn/BUILD.gn
-index 6f2ad9fd..05e4030b 100644
+index 24204c14..27fb036b 100644
 --- a/gn/BUILD.gn
 +++ b/gn/BUILD.gn
-@@ -137,7 +137,6 @@ group("default_deps") {
+@@ -139,7 +139,6 @@ group("default_deps") {
    deps = [ ":gen_buildflags" ]
    if (perfetto_build_standalone) {
      public_deps = [
@@ -28,10 +32,10 @@ index 6f2ad9fd..05e4030b 100644
        "//gn/standalone/sanitizers:deps",
      ]
 diff --git a/gn/standalone/BUILD.gn b/gn/standalone/BUILD.gn
-index 7ecaae60..3edb470b 100644
+index 4c7a09e8..26fdbec1 100644
 --- a/gn/standalone/BUILD.gn
 +++ b/gn/standalone/BUILD.gn
-@@ -541,16 +541,16 @@ config("android_liblog") {
+@@ -602,13 +602,13 @@ config("android_liblog") {
  }
  
  # Checks that tools/install-build-deps has been run since it last changed.
@@ -55,11 +59,8 @@ index 7ecaae60..3edb470b 100644
 +#    "--android",
 +#  ]
 +#}
- 
- # TODO(https://github.com/google/perfetto/issues/5353): Remove this after
- # updating emscripten.
 diff --git a/gn/standalone/BUILDCONFIG.gn b/gn/standalone/BUILDCONFIG.gn
-index 2e27f2f1..7037d35e 100644
+index 88fff1b5..a05a92ab 100644
 --- a/gn/standalone/BUILDCONFIG.gn
 +++ b/gn/standalone/BUILDCONFIG.gn
 @@ -64,8 +64,9 @@ declare_args() {
@@ -74,5 +75,3 @@ index 2e27f2f1..7037d35e 100644
  }
  default_configs = [
    "//gn/standalone:default",
--- 
-2.43.0
