Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8051.1795739671990119389
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:34:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ASl7AttD;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-38644aedba1so11155313eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739671; x=1796344471; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gxetk6AqYjaLzQTUAFZONp9pmAFzLJO2zQV6QXzH/uk=;
        b=ASl7AttDg5P8/QZZ7rOdTiiLLaJfQ8iMqCcd9QxEkGNh/zCR6LGmDttewvU3zJV/8H
         Btr/INewbR2EUJ9pvxY0+Dr0mXvaPGaTBlULnsBZFT2jz1lc2tjsTVMPJwGfGVSK5MMG
         5reqjSABZ/I/my+ruzILJUkIVeSp+UDP91183W0crQwNtAJGVDYCTbNNeUo4nA4RpwDJ
         K5CgYaJkrt7nq2l2fYdTIrzz++RBdqYeiKxC48ktxr4fT5bsJ+SFIEKRb/ySf926VkWt
         MweywmoGyw12p6kywnC1vmP7gQPPn2hICdKskS7erDH9ld4xdw4/XXxJ8mtOyLoRrtqY
         zbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739671; x=1796344471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gxetk6AqYjaLzQTUAFZONp9pmAFzLJO2zQV6QXzH/uk=;
        b=Sk0h4/d/f7e5AUuQKLfKdJApNIw1UYy4keHgAzNIOOCn1oUdUsyLojvWVacoQu53Bz
         v0gzCzbVMlMKMhn9fTbk3KJz9oUsnHmUuN7gbu+iSdrp7muxE9YLklHe1cRXDpvvDmdf
         Fd88t4mUJuZbMRc/Q7q6N1sqVv1hGbmldgRjhgX0JHIKcee5r8g139co1j9K/u76qkkL
         un0Gnh+YhZ/FknjdnZX0L1CAwKpjqA77L2HiZqGm6i3bjlDE7NtGkrRChaJcFDPxhElg
         wyRtj3k10y6CeygoZK8j7sxdmHS6dIXB/JlfjUhbf+ue0ny9aABciGRi3+nXclckmzfJ
         uOhg==
X-Gm-Message-State: APuU4Z/XWQqQJXWW1FUCMSZv3qpSNXYhriPGMR1wpinrJymu2Ga0oYcw
	liRe9VAe8gMNbdxcnFTLG2q3ocJeMxZMNZEGWmQM1YqJJFhmz7nCzT9nEb+dgV61
X-Gm-Gg: AZFdTZco81nizbVXwiliIN6AWwZXO7sPw8+LFOzG53ZJ0TnJjnp3ShhFT+t7AVTtXQi
	TgjtdYc3cdMud3YOlYNUuNPIUQOx968JcGvadYckjdH7nvUxrP0crgvSYgAZzBinRLhAvO/AAuU
	R8JG/NePsAgtL2Zz+/2XQPhHz+NiC8M4gCo+Xh4XzVPu3lRmy6Oh/rZhLhboykU1uLF4uO8M1j8
	A+xVtpJbfRJCxyau/TLDMZ6aKHph+ko8mGQdS4LH6v2Ao21R2rCCt40hvoyJn9fHz3uIXGNrV9l
	vOmccIaRekHIRLoXXpiCxC/b7Ac+hPxAtqSHrkwJVBzKf/1aMKDR38kLVQYR9JyCO8Rb9+7Vavy
	1boVIkFA5eD3MQon4J3btI2sbvl+Z49dZGOrRtbIjwXgj9RwGDc/VcT2SOfWeYlrAXoYaIaNZ/w
	87eciAo1eWQ/cDDasTFK4PpK7IW26n4+Wco2eLJW0PfTzDGn9AjxbeKPWSAKl8AZLaj60LTjpbU
	vtAhj9Dek5KNSZSIrhXVCtyscHMlfjZ2wwLakiWYVKxFSLCJ/z8TuLT3vmTKf/kBV6aLQqU0W/C
	X2MyPV4De54H/nJ6x28CgqngCkBTUtoxcpODcqMqdxTFKb1qghPSTBoM8dCNZOLMMS80Fi2jJ18
	WWI/RGGYwYsyAijhs/PTZqFgYVvQwRN746HPh38bR9HDXDjFJFD1aa5TaB7pVEvJk2ruOuUwkTE
	RDvzZAUv7W0qAfrBW2mf0j/vQ8XjEoAEUcWHlRHiUcys6/Nv2wif4CjFabrkvcpcMDg/s64KK/8
	bVnJQgF/iWjdgt/ZZP2H4w2ClhDYFjoNufHhI5pGzImxq1gtSMFOzaPIhOVtZZQ+hXO3+vAMhMw
	Gd1s
X-Received: by 2002:a05:7301:488d:b0:366:83dd:46f7 with SMTP id 5a478bee46e88-3856f85220amr24432093eec.17.1795739671055;
        Thu, 26 Nov 2026 16:34:31 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:34:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 00/69] Upstream version check fixes
Date: Thu, 26 Nov 2026 16:33:16 -0800
Message-ID: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:34:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133100
Content-Type: text/plain; charset="utf-8"

Fix or add UPSTREAM_CHECK_* settings so devtool check-upgrade-status
reports real versions: anchor tag regexes to release tags, restrict
series where newer major versions are separate products or rewrites,
point checks at the current hosting after moves, and mark the few
recipes whose upstream can no longer be checked as unknown.

No recipe versions change in this series.

Khem Raj (69):
  phoronix-test-suite: Fix upstream version check
  fwupd: Fix upstream version check
  ace: Fix upstream version check
  gammu: Fix upstream version check
  irssi: Fix upstream version check
  luv: Fix upstream version check
  cfengine-masterfiles: Fix upstream version check
  tmux: Fix upstream version check
  gmime: Fix upstream version check
  leptonica: Fix upstream version check
  taisei: Fix upstream version check
  modemmanager: Fix upstream version check
  safec: Fix upstream version check
  influxdb: Restrict upstream check to the 1.x series
  e2fsprogs-ext4sparse-native: Fix upstream version check
  include-what-you-use: Fix upstream version check
  lemon: Fix upstream version check
  libtreesitter: Fix upstream version check
  flatpak: Fix upstream version check
  p8platform: Fix upstream version check
  sysdig: Fix upstream version check
  socketcand: Fix upstream version check
  minio: Fix upstream version check
  telepathy-glib: Fix upstream version check
  glibmm: Restrict upstream check to the 2.66 series
  atkmm: Restrict upstream check to the 2.28 series
  gtkmm3: Restrict upstream check to the 3.24 series
  gtkmm4: Fix upstream version check
  cairomm: Restrict upstream check to the 1.14 series
  libdbi: Fix upstream version check
  android-libboringssl: Fix upstream version check
  cpuid: Fix upstream version check
  qhull: Fix upstream version check
  libsdl-image: Fix upstream version check
  libsdl-mixer: Fix upstream version check
  libsdl-net: Fix upstream version check
  libsdl-ttf: Fix upstream version check
  pangomm: Restrict upstream check to the 2.46 series
  spirv-shader-generator: Fix upstream version check
  panel-mipi-dbi-native: Fix upstream version check
  python3-drgn: Fix upstream version check
  libmad: Fix upstream version check
  ttf-liberation-sans-narrow: Fix upstream version check
  broadcom-bt-firmware: Fix upstream version check
  libspatialite: Fix upstream version check
  proj: Fix upstream version check
  spdm-emu: Fix upstream version check
  mksh: Fix upstream version check
  ctre: Fix upstream version check
  exiv2: Fix upstream version check
  hdf5: Fix upstream version check
  libgpiod: Restrict upstream check to the 1.x series
  libutempter: Fix upstream version check
  portaudio-v19: Fix upstream version check
  pty-forward-native: Fix upstream version check
  serial-forward: Fix upstream version check
  gnulib: Fix upstream version check
  hddtemp: Fix upstream version check
  lcov: Fix upstream version check
  libiodbc: Fix upstream version check
  libtinyxml: Fix upstream version check
  ncdu: Restrict upstream check to the 1.x series
  lvgl-demo-fb: Fix upstream version check
  gpsd: Fix upstream version check
  poco: Anchor upstream check to release tags
  websocketpp: Check the cpprest-lts branch for new commits
  blktests: Check master for new commits
  protobuf: Fix upstream version check
  sdbus-c++: Add upstream version check

 .../recipes-graphics/taisei/taisei_1.4.4.bb               | 2 ++
 .../phoronix-test-suite/phoronix-test-suite_10.8.4.bb     | 3 +++
 meta-oe/recipes-bsp/fwupd/fwupd_2.1.10.bb                 | 2 +-
 meta-oe/recipes-connectivity/ace/ace_8.0.8.bb             | 2 +-
 meta-oe/recipes-connectivity/gammu/gammu_1.45.2.bb        | 1 +
 meta-oe/recipes-connectivity/irssi/irssi_1.4.5.bb         | 2 +-
 .../modemmanager/modemmanager_1.24.2.bb                   | 1 +
 .../telepathy/telepathy-glib_0.24.2.bb                    | 2 +-
 meta-oe/recipes-core/glib-2.0/glibmm_2.66.10.bb           | 3 +++
 meta-oe/recipes-core/safec/safec_3.9.1.bb                 | 2 ++
 meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.3.1.bb         | 2 ++
 meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb           | 3 +++
 meta-oe/recipes-dbs/libdbi/libdbi.inc                     | 5 ++---
 .../android-libboringssl_14.0.0+r45.bb                    | 2 ++
 meta-oe/recipes-devtools/cpuid/cpuid_20260503.bb          | 2 ++
 .../e2fsprogs-ext4sparse-native_1.47.4.bb                 | 1 +
 .../include-what-you-use/include-what-you-use_0.26.bb     | 1 +
 meta-oe/recipes-devtools/lemon/lemon_3.53.4.bb            | 1 +
 meta-oe/recipes-devtools/luv/luv_1.53.0.bb                | 3 +++
 meta-oe/recipes-devtools/protobuf/protobuf_7.36.2.bb      | 7 ++-----
 .../recipes-devtools/tree-sitter/libtreesitter_0.27.2.bb  | 1 +
 .../cfengine/cfengine-masterfiles_3.29.0.bb               | 2 +-
 meta-oe/recipes-extended/flatpak/flatpak_1.18.4.bb        | 3 +++
 meta-oe/recipes-extended/minio/minio_git.bb               | 1 +
 meta-oe/recipes-extended/p8platform/p8platform_git.bb     | 1 +
 meta-oe/recipes-extended/qhull/qhull_2020.2.bb            | 4 +---
 meta-oe/recipes-extended/socketcan/socketcand_git.bb      | 6 +-----
 meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb          | 2 ++
 meta-oe/recipes-extended/tmux/tmux_3.8.bb                 | 2 +-
 meta-oe/recipes-gnome/atk/atkmm_2.28.5.bb                 | 3 +++
 meta-oe/recipes-gnome/gmime/gmime_3.2.15.bb               | 2 +-
 meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.11.bb              | 3 +++
 meta-oe/recipes-gnome/gtk+/gtkmm4_4.24.0.bb               | 2 +-
 meta-oe/recipes-graphics/cairo/cairomm_1.14.6.bb          | 3 +++
 meta-oe/recipes-graphics/leptonica/leptonica_1.87.0.bb    | 2 +-
 meta-oe/recipes-graphics/libsdl/libsdl-image_1.2.12.bb    | 2 ++
 meta-oe/recipes-graphics/libsdl/libsdl-mixer_1.2.12.bb    | 2 ++
 meta-oe/recipes-graphics/libsdl/libsdl-net_1.2.8.bb       | 2 ++
 meta-oe/recipes-graphics/libsdl/libsdl-ttf_2.0.11.bb      | 2 ++
 meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.6.0.bb       | 7 +------
 .../panel-mipi-dbi/panel-mipi-dbi-native_git.bb           | 1 +
 meta-oe/recipes-graphics/pango/pangomm_2.46.5.bb          | 3 +++
 .../spir/spirv-shader-generator_1.4.328.1.bb              | 1 +
 .../ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb        | 3 +++
 meta-oe/recipes-kernel/blktests/blktests.bb               | 8 +++-----
 .../broadcom-bt-firmware_12.0.1.1105_p3.bb                | 1 +
 meta-oe/recipes-kernel/drgn/python3-drgn_0.2.0.bb         | 1 +
 meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb       | 3 +++
 meta-oe/recipes-navigation/gpsd/gpsd_3.28.bb              | 3 +++
 .../libspatialite/libspatialite_5.1.0.bb                  | 2 ++
 meta-oe/recipes-navigation/proj/proj_9.8.1.bb             | 2 ++
 meta-oe/recipes-security/spdm-emu/spdm-emu_git.bb         | 6 +-----
 meta-oe/recipes-shells/mksh/mksh_59c.bb                   | 5 +----
 meta-oe/recipes-support/ctre/ctre_3.9.0.bb                | 1 +
 meta-oe/recipes-support/exiv2/exiv2_0.28.9.bb             | 1 +
 meta-oe/recipes-support/gnulib/gnulib_202601.bb           | 1 +
 meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb     | 2 ++
 meta-oe/recipes-support/hdf5/hdf5_2.2.0.bb                | 4 ++--
 meta-oe/recipes-support/lcov/lcov_2.6.bb                  | 2 +-
 meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb        | 3 +++
 meta-oe/recipes-support/libiodbc/libiodbc_3.52.16.bb      | 2 +-
 meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb    | 5 +++--
 .../recipes-support/libutempter/libutempter_1.2.3-alt1.bb | 1 +
 meta-oe/recipes-support/ncdu/ncdu_1.22.bb                 | 2 ++
 meta-oe/recipes-support/poco/poco_1.15.4.bb               | 2 +-
 meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb | 1 +
 .../recipes-support/serial-utils/pty-forward-native.bb    | 1 +
 .../recipes-support/serial-utils/serial-forward_git.bb    | 1 +
 .../websocketpp/websocketpp_0.8.4-cpprest-lts.bb          | 3 +++
 69 files changed, 118 insertions(+), 52 deletions(-)

