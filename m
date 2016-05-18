Return-Path: <akuster808@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id E7C377704E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 May 2016 20:04:44 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id n62so4905777qkc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 May 2016 13:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=E5ulxjQmH5CUukPkRtJzWtvJPzrF+kKgASC/wOu4l8I=;
	b=cedQYDFGpJ5jhguAr2olBRRTrhfXP6idPI6YpRd0j2P3yajO/us4/aApGCWrUvsnyq
	rZIVH25tTUdJhhU4EBl1ra6IayVkn1sJbzSKujGvOUvapq4PkrcRzWQfBmeARImyepIk
	tSjXptuyTKpVJqkb8U1TwXhp3U06lLEsAe38kfFXw/udOUTwF+Y2fs0zaylSP2J7sYd8
	En7qLcbmVDJWJ35UVi7JKohCKl+Unee9JO8IppRAKTxpSESDAfbptAA4Zh3IRIXQ9ut1
	xMrl3ItezG8Ixd+6ha3o8KsBPwlwBXHOLX9uez23RO9CadfPKINs221kcPiXFvrsujcA
	IilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=E5ulxjQmH5CUukPkRtJzWtvJPzrF+kKgASC/wOu4l8I=;
	b=IukaJoza2BGl74eOt5SU9RFv0VOAWqgBcIWiJEBV8J0ahvi8636bhuYdfvkzBcfYtX
	Jfof1d1qB4OKry64FMlPoIN5nB+x+ILbvwBl32JGZmMSyMkMd05z9QwOfO3SxtvBFnZp
	/00MzhXTkPuv2Y+67EZ+VWK/JUiZtwArqnlqVFBkB0KVanU5kWw2G4SgiIMXUvhH/kZ+
	+7qQz0JgMHaraEQjJEcCnKAeyZo0bS6sHBOmb+iGAG/imySV7EPCdhLfai7WMWuCQJk+
	Fg6C4fIy9es4E7WsdRvLD10uBhZ4UX+ft7WpXLD1Z2sKvl66Ulje+rWNNJhflrKcNTgx
	L1WQ==
X-Gm-Message-State: AOPr4FX/3CrsAuRHJQumo7vUC4XI7AtbWYJwBX+IDqD0HZJJcy0/fb9B4tc3/YfSZFdnsA==
X-Received: by 10.55.20.13 with SMTP id e13mr10015430qkh.180.1463601885178;
	Wed, 18 May 2016 13:04:45 -0700 (PDT)
Received: from Pahoa2.mvista.com ([50.233.148.158])
	by smtp.gmail.com with ESMTPSA id f6sm4971942qgf.4.2016.05.18.13.04.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 May 2016 13:04:44 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Wed, 18 May 2016 13:04:01 -0700
Message-Id: <cover.1463601459.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
MIME-Version: 1.0
Subject: [PATCH 00/38] Krogoth-next pull request
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
X-List-Received-Date: Wed, 18 May 2016 20:04:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please consider these changes for meta-openembedded krogot-next

The following changes since commit 2092396f0e4fd3891b398c7180528aba67e1d522:

  ntp: Security fixes via update to 4.2.8p7 (2016-05-02 14:04:13 -0700)

are available in the git repository at:

  git://github.com/akuster/meta-openembedded akuster/krogoth-next
  https://github.com/akuster/meta-openembedded/tree/akuster/krogoth-next

Andreas Müller (3):
  meta-xfce: add intltool-native to DEPENDS
  xfce-polkit: fix warning not able to copy license
  fluidsynth: set correct portaudio packageconfig dependency

Ann Thornton (2):
  packagegroup-tools-bluetooth.bb: Selects the tools appropriate for the
    version of bluez being used.
  packagegroup-tools-bluetooth: Selects the tools appropriate for the
    version of bluez being used.

Armin Kuster (4):
  acpitests: Fix license issue
  libwnck: fix WARNING
  upower: fix WARNING
  wireshark: Fix new QA Error

Catalin Enache (2):
  proftpd: CVE-2016-3125
  squid: CVE-2016-3947

Christopher Larson (2):
  fbida: use separate builddir
  sox: dep on ffmpeg, not libav

Derek Straka (2):
  python-pyparsing: modify build to correctly use setuptools rather than
    distutils
  leptonica: add PACAKGECONFIG for openjpeg

Herrie (1):
  pidgin: Update to 2.10.12

Ioan-Adrian Ratiu (2):
  openconnect: add missing dependencies
  syslog-ng.inc: fix prerm script & class includes

Kinsella, Ray (1):
  wvstreams: fixing segfault with new gcc optimizations

Li xin (1):
  rp-pppoe: Fix rootfs creation errors

Martin Jansa (5):
  sblim-sfcb: add missing dependency on unzip-native
  pidgin: add PACKAGECONFIGs
  pidgin: use pkg-config instead of hardcoded paths or python-config
  llvm3.3: Disable auto -dbg packages
  poppler: add --std=c++11 to fix build with Qt 5.7

Neena Busireddy (1):
  glmark2: wl_surface should be destoryed after destroying wl_window

Noor Ahsan (1):
  libnice, farsight2: unblacklist as libnice's nice.pc issue fixed.

Otavio Salvador (1):
  opencv: Fix metapkg dependencies for opencv-java and opencv-locales

Paul Barker (1):
  toybox: Remove out-of-date patch

Paul Gortmaker (2):
  autotools-bootstrap: make bootstrap package specific.
  netcf: fix mishandling of gnulib submodule causing build fail

Qi.Chen@windriver.com (4):
  dovecot: fix QA issue and remove from blacklist
  rrdtool: fix do_configure failure on some hosts
  curlpp: fix recipe
  znc: fix QA issue and remove from blacklist

Robert Yang (1):
  nbd: fix LIC_FILES_CHKSUM

Roy Li (1):
  lmbench: avoid gcc optimize-away multiplication

Zhu Yanjun (1):
  net-snmp: enable ipv6 support

 meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb |   2 +-
 .../fluidsynth/fluidsynth_1.1.6.bb                 |   2 +-
 .../recipes-multimedia/sox/sox_14.4.0.bb           |   2 +-
 .../openconnect/openconnect_git.bb                 |   2 +-
 .../proftpd/files/CVE-2016-3125.patch              | 247 +++++++++++++
 .../recipes-daemons/proftpd/proftpd_1.3.5a.bb      |   1 +
 .../squid/files/CVE-2016-3947.patch                |  48 +++
 .../recipes-daemons/squid/squid_3.5.7.bb           |   1 +
 meta-networking/recipes-irc/znc/znc_git.bb         |   5 +-
 .../recipes-protocols/net-snmp/net-snmp_5.7.3.bb   |   3 +
 .../recipes-protocols/rp-pppoe/rp-pppoe_3.12.bb    |   4 +
 .../recipes-support/curlpp/curlpp_0.7.3.bb         |  60 ----
 .../recipes-support/dovecot/dovecot_2.2.21.bb      |   8 +-
 meta-networking/recipes-support/nbd/nbd_3.11.bb    |   2 +-
 meta-networking/recipes-support/netcf/netcf_git.bb |  21 +-
 .../recipes-support/wireshark/wireshark_2.0.2.bb   |   5 +-
 meta-oe/classes/autotools-bootstrap.bbclass        |  24 --
 meta-oe/licenses/Intel                             |  21 ++
 ...ace-should-be-destoryed-after-the-wl_wind.patch |  34 ++
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb   |   3 +-
 .../0001-avoid-gcc-optimize-away-the-loops.patch   |  79 +++++
 .../recipes-benchmark/lmbench/lmbench_3.0-a9.bb    |   1 +
 .../packagegroups/packagegroup-tools-bluetooth.bb  |  37 ++
 .../recipes-connectivity/wvdial/wvstreams_4.6.1.bb |   2 +
 meta-oe/recipes-core/llvm/llvm.inc                 |   3 +-
 .../toybox/0001-Match-paths-with-busybox.patch     | 388 ---------------------
 meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb  |   2 +
 .../sblim-sfcb/sblim-sfcb_1.4.9.bb                 |   2 +-
 meta-oe/recipes-graphics/fbida/fbida_2.10.bb       |   5 +-
 .../fontforge/fontforge_20150824.bb                |  18 +-
 .../recipes-graphics/leptonica/leptonica_1.70.bb   |   3 +
 .../recipes-support/farsight/farsight2_0.0.22.bb   |   2 -
 meta-oe/recipes-support/farsight/libnice_0.0.13.bb |   4 +-
 meta-oe/recipes-support/opencv/opencv_3.1.bb       |   5 +-
 .../pidgin/pidgin/pidgin-cross-python-265.patch    |  50 ++-
 .../pidgin/pidgin/pidgin.desktop-set-icon.patch    |  11 -
 .../pidgin/{pidgin_2.10.9.bb => pidgin_2.10.12.bb} |  41 ++-
 ...h-C-11-compilers-that-don-t-define-isinfi.patch |  39 +++
 meta-oe/recipes-support/poppler/poppler_0.41.0.bb  |   4 +
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |   2 +-
 meta-oe/recipes-support/upower/upower_0.9.14.bb    |   2 +-
 .../python/python-pyparsing_2.1.1.bb               |   2 +-
 meta-xfce/classes/xfce.bbclass                     |   2 +
 .../recipes-apps/xfce-polkit/xfce-polkit_0.2.bb    |   2 +-
 .../xfce4-taskmanager/xfce4-taskmanager_1.1.0.bb   |   2 +-
 .../recipes-multimedia/parole/parole_0.8.1.bb      |   2 +-
 .../notes/xfce4-notes-plugin_1.8.1.bb              |   2 +-
 .../xfce4-power-manager_1.4.4.bb                   |   2 +-
 48 files changed, 661 insertions(+), 548 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/proftpd/files/CVE-2016-3125.patch
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2016-3947.patch
 delete mode 100644 meta-oe/classes/autotools-bootstrap.bbclass
 create mode 100644 meta-oe/licenses/Intel
 create mode 100644 meta-oe/recipes-benchmark/glmark2/files/0001-Fix-wl_surface-should-be-destoryed-after-the-wl_wind.patch
 create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench/0001-avoid-gcc-optimize-away-the-loops.patch
 create mode 100644 meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
 delete mode 100644 meta-oe/recipes-core/toybox/toybox/0001-Match-paths-with-busybox.patch
 delete mode 100644 meta-oe/recipes-support/pidgin/pidgin/pidgin.desktop-set-icon.patch
 rename meta-oe/recipes-support/pidgin/{pidgin_2.10.9.bb => pidgin_2.10.12.bb} (67%)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/0001-Compile-with-C-11-compilers-that-don-t-define-isinfi.patch

-- 
2.3.5


