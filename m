Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3899.1795719400340480148
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 10:56:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=dfwGPyyp;
 spf=pass (domain: snapchat.com, ip: 209.85.128.43, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso53335455e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 10:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1795719398; x=1796324198; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lr/N73uWz4iyC6T4ovfpDP+GXqslrE/KaBfEdNvyHH8=;
        b=dfwGPyyp0w5RQag0vXC+TvrH0ANnayzDaXh6QVclRhFE5m6f7U9dtHIWkBgEgcIlXn
         /cpceTbO9J77u3rkvWldE5lsdQgUNzsrZVgcrmZqWcHE14fO1evC4yuCG/H7lNU7Okxc
         HkZylL5s+6x++bMI7Lk3Qr0jaZTjHrpWLtJdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719398; x=1796324198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lr/N73uWz4iyC6T4ovfpDP+GXqslrE/KaBfEdNvyHH8=;
        b=ZBMH4W9qSFzInP7q+nwQ2bP2rBl4jFkZFNZb3MKu+L2WkRpaTJeedUWsdulS+PZV1L
         h0aEeFWmoCac/xmS0zbBTtDCsjYzD2A+51y4p79+att58YDX8ebMenituROSWIdgBxpB
         6CraVAhf3LmNOGBW4huMxYJ8uKTvY9jX1zJ46TsUd6piQDM7ueehp853HwZyD5RGMsGx
         izfG6PbtCysdhCbYeUUVIoa5yzSww/NwE9Q6eAwLahdYcINgnXSMZkZayHPLxR04SUcs
         1ev3Vrw+VJhouk2ORKILg6ylI5JD9gGQckNbRhSpXRZS5pPkxamXCxxBGMHa378zbpv8
         vtlQ==
X-Gm-Message-State: APuU4Z9PVjpbWTFdKL7vSqD4Gygcc8k7S5zy9ajaBMJJjtu3Gy1r1nrU
	VvScnTuQ6zyvAgbOi9BVv+eC5IiygrnU1ypMlusyDA9YckKUTVtmKoLkZSyyMrs242X10yj91er
	gCUL0S/E=
X-Gm-Gg: AZFdTZeI+yjHjp3YVd820OfxXPG97N+ifAADPjmH46CT32eNYKiIh1SDSYhZ3f4WipH
	F2IZSwXokbjcfbW5dsQGJS+0iY2XxngdNY8rVzey8ceXCNPs9n6v3jCooYafF1tbgjFkv+Ex3V8
	HDP5H4rdpzWt9O8nM64AroZGJANPWb+iRrPJfVA79t3eivBnPQZhTPo55xzSO+mquk0WyZP0Sp/
	TbN1heDcTgHSbFo97cI1qBnDBAWyGaknUNoEn+R330O0CS2D2+29UG/izQA3yhvyTbniYMO28WF
	C0HOURca1/hEMvgWC9P+nBdeMjc7LNCeudBKXWZ7WEby5rAMFzScVnwzez9JLdnJ15k2TMNPXP1
	TijAcxsuSqL+0MJJmgqE/g5Id1Szxsj8dkyjOl1PLf91v6v9gqnuSC/H9i4NTDCptsjFJJ7xAS9
	SMaqsWJTFNGvZSnmAZ93Ig5joBT7mcsMlN51gTs3Z8w9K+3rB1u4tQfSeWghCj2MHbHsP/BHfzx
	SX8kzQRu+/7sG/ApwbBwBwX19YYnSQSRgiqg7L/p8kaVwjogb3lOK2QkZqgwj9fLOJsIkymHuSN
	jXJZRjXdnibamsiMPvxd1AE+/AGY9rbps8CJj1nzCht3UR1bYK9836OAO4DU4lkJSDiTmp4CTvq
	xVbxAOAyyurRcpS7rokivTYH4GSG2aCCaWeAh7iKIFcNpZ2d+nDi9cjEnXbZ5ZpUb2ydKFAA3lP
	4=
X-Received: by 2002:a05:600c:4504:b0:4a1:9078:911 with SMTP id 5b1f17b1804b1-4bb888284d7mr461938725e9.31.1795719398367;
        Thu, 26 Nov 2026 10:56:38 -0800 (PST)
Return-Path: <ecordonnier@snapchat.com>
Received: from localhost.localdomain (80-108-196-96.cable.dynamic.surfer.at. [80.108.196.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm637593405e9.7.2026.11.26.10.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:56:38 -0800 (PST)
From: ecordonnier@snap.com
To: openembedded-devel@lists.openembedded.org
Cc: Heinrich Fink <hfink@snap.com>,
	Etienne Cordonnier <ecordonnier@snap.com>
Subject: [meta-oe][PATCH] libperfetto-c: Add recipe
Date: Thu, 26 Nov 2026 19:56:27 +0100
Message-ID: <20261126185627.1255223-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 18:56:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133090
Content-Type: text/plain; charset="utf-8"

From: Heinrich Fink <hfink@snap.com>

Upstream only provides the C++ SDK as a static library or amalgamated
source, and strongly discourages building it as a shared library [0].
libperfetto does so anyway. The C SDK is designed as a shared library
[1], so system components may prefer it.

Based on the v59.1 release. The ABI may still break with future
upgrades until officially frozen, so the major SDK version determines
the SO version (libperfetto_c.so.59).

The amalgamated perfetto_c.cc and perfetto_c.h are not part of the
perfetto git tree and are only shipped as a GitHub release asset, so
fetch that tarball and build it with an added meson.build.

Tested by building the recipe with poky master and capturing a trace in
qemux86-64 with tracebox and the upstream C SDK track event example.

[0] https://github.com/google/perfetto/blob/1e9c61e9844affd7dccd3d42d9ea9f3a3d10cf6d/docs/design-docs/api-and-abi.md#L491-L501
[1] https://github.com/google/perfetto/blob/1e9c61e9844affd7dccd3d42d9ea9f3a3d10cf6d/examples/shared_lib/example_shlib_track_event.c

Signed-off-by: Heinrich Fink <hfink@snap.com>
AI-Generated: Uses Claude Code (commit message, file move)
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 .../perfetto/libperfetto-c/libperfetto_c.map  |  8 +++
 .../perfetto/libperfetto-c/meson.build        | 62 +++++++++++++++++++
 .../perfetto/libperfetto-c_59.1.bb            | 22 +++++++
 3 files changed, 92 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/perfetto/libperfetto-c/libperfetto_c.map
 create mode 100644 meta-oe/recipes-devtools/perfetto/libperfetto-c/meson.build
 create mode 100644 meta-oe/recipes-devtools/perfetto/libperfetto-c_59.1.bb

diff --git a/meta-oe/recipes-devtools/perfetto/libperfetto-c/libperfetto_c.map b/meta-oe/recipes-devtools/perfetto/libperfetto-c/libperfetto_c.map
new file mode 100644
index 0000000000..62771847df
--- /dev/null
+++ b/meta-oe/recipes-devtools/perfetto/libperfetto-c/libperfetto_c.map
@@ -0,0 +1,8 @@
+{
+  global:
+    perfetto_*;
+    Perfetto*;
+
+  local:
+    *;
+};
diff --git a/meta-oe/recipes-devtools/perfetto/libperfetto-c/meson.build b/meta-oe/recipes-devtools/perfetto/libperfetto-c/meson.build
new file mode 100644
index 0000000000..6e367ed1a1
--- /dev/null
+++ b/meta-oe/recipes-devtools/perfetto/libperfetto-c/meson.build
@@ -0,0 +1,62 @@
+project(
+  'libperfetto-c',
+  ['cpp'],
+  version : files('VERSION'),
+  license : 'Apache-2.0',
+  default_options : [
+    'cpp_std=c++17',
+    'warning_level=1',
+  ],
+)
+
+mapfile = join_paths(meson.current_source_dir(), 'libperfetto_c.map')
+
+thread_dep = dependency('threads')
+
+cpp = meson.get_compiler('cpp')
+
+perfetto_c_cpp_args = []
+perfetto_c_cpp_args += cpp.get_supported_arguments([
+  '-ffunction-sections',
+  '-fdata-sections',
+  '-fno-exceptions',
+  '-fno-rtti',
+])
+
+perfetto_c_link_args = []
+perfetto_c_link_args += cpp.get_supported_link_arguments([
+  '-static-libstdc++',
+  '-Wl,--exclude-libs,ALL',
+  '-Wl,--gc-sections',
+  '-Wl,--icf=all',
+])
+
+perfetto_c = shared_library(
+  'perfetto_c',
+  'perfetto_c.cc',
+  dependencies : [thread_dep],
+  install : true,
+  version : meson.project_version(),
+  gnu_symbol_visibility : 'inlineshidden',
+  cpp_args : [
+    perfetto_c_cpp_args,
+    '-DPERFETTO_SDK_SHLIB_IMPLEMENTATION',
+  ],
+  link_args: [
+    perfetto_c_link_args,
+    '-Wl,--version-script=' + mapfile,
+  ],
+  link_depends : mapfile,
+)
+
+install_headers('perfetto_c.h')
+
+pkg = import('pkgconfig')
+pkg.generate(
+  perfetto_c,
+  name : 'libperfetto_c',
+  filebase : 'libperfetto_c',
+  description : 'Perfetto C SDK shared library',
+  version : meson.project_version(),
+  extra_cflags : ['-DPERFETTO_SDK_SHLIB'],
+)
diff --git a/meta-oe/recipes-devtools/perfetto/libperfetto-c_59.1.bb b/meta-oe/recipes-devtools/perfetto/libperfetto-c_59.1.bb
new file mode 100644
index 0000000000..b4ba9be850
--- /dev/null
+++ b/meta-oe/recipes-devtools/perfetto/libperfetto-c_59.1.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Perfetto C SDK shared library"
+DESCRIPTION = "Shared library built from the amalgamated Perfetto C SDK sources"
+HOMEPAGE = "https://perfetto.dev"
+LICENSE = "Apache-2.0"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0b17e8eda713c18363c16102cacd41f3"
+
+SRC_URI = "\
+    https://github.com/google/perfetto/releases/download/v${PV}/perfetto-c-sdk-src.zip;downloadfilename=${BPN}-${PV}.zip;subdir=${BP} \
+    file://meson.build;subdir=${BP} \
+    file://libperfetto_c.map;subdir=${BP} \
+"
+
+SRC_URI[sha256sum] = "28d497a5b01c7517b2084c4b4768a1fdbbac587242775af50f5219936056361f"
+
+S = "${UNPACKDIR}/${BP}"
+
+inherit meson
+
+do_configure:prepend() {
+    echo "${PV}" > ${S}/VERSION
+}
-- 
2.43.0

