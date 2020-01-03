Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id 74F8F7F948
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 02:49:31 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id z16so22926798pfk.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 18:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=S8oPUNYnaVgr9aN+FxLdeNG9K4giTUy9FbREMkStlfU=;
	b=RXnQrYy2Gmx/q5B72TYeknPe/jHm363nA4LSVK2+cAQr4+E8k+G1YQQw72PetsjQF7
	pLrYAYBF5W3+Vd93xpmHlebitBqR329LD1J1MNPzlwMTUNdhk3q5GVIxfPY2z+KjzsyJ
	uZdgIs0Tu/oc/Emx57NO7LpxJJE5OHv1zel9u5XvhIcAxWKVUD1ssND/F87RhbWG68fF
	0CyKvEa6tZtoFW9aQDLqN4CTrI0n99T4Roa4QmSaTKqjNekqeY6+avi9NuPSBEn1dVZZ
	uZ14pmloDoR2Mer2clBPYnJuTXb/CJoxhE3BSZBUkuR3nixWR/BQ13/5CwT/pLrOme3Z
	V6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=S8oPUNYnaVgr9aN+FxLdeNG9K4giTUy9FbREMkStlfU=;
	b=We4CeaAWFXWy1Ikg4bVwwN+ryUyPXP3CjMBQVrGP0R0RsgLdCLEikD8ea3XWp0Gcpm
	VNQav35120gLnXSDxsUHQHrihL1Xb5c6h+8TqCM/VJPF+kIZ0bQvZVNfFZxXwF0MYHrr
	i6Rt5gEFQZpUIv8HVG9zzGYKN3eEJN8Nur2f/kBqiQH9XuOWeeYJZRG7i66V2OmFIxKT
	9HY+QLaIc9D6aHazq+AQoPx4kx1NrjxHLZ9F5nAQIn1ZXzIKk9tQ7hKvXX9JsrRPclKx
	ErPHqCpC27eoSiqpUfsQcqz812s9NlaWGsvR2DHAgpz3og4HZWRjZIaqyaZm3P7RbeKn
	yvSw==
X-Gm-Message-State: APjAAAX6iz6+bxVQGIPkqOhZ/9xCnwavGPGK+8rreXGM8b0zJfrWGzGq
	x2gH1G/EZm/ldHOrDJh2haAp3ta1uYU=
X-Google-Smtp-Source: APXvYqzFRC5ORwAvdpeYecva5J63W/vZWg1Ayf2FePkG/KJ02dWPTMSAdgu4zUSsp1mVdc1u71MkMg==
X-Received: by 2002:aa7:8e0e:: with SMTP id c14mr70202230pfr.95.1578019772660; 
	Thu, 02 Jan 2020 18:49:32 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:555:ddff:6770:148b])
	by smtp.gmail.com with ESMTPSA id
	p5sm61306640pga.69.2020.01.02.18.49.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jan 2020 18:49:32 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jan 2020 18:48:57 -0800
Message-Id: <cover.1578019547.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [zeus 00/17] Patch review
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
X-List-Received-Date: Fri, 03 Jan 2020 02:49:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please have comments back by Saturday.

The following changes since commit fbe4cf8d56eea586c096621e7c913b24bd99c9c6:

  gtkwave: add the libtirpc dependence and config (2019-12-17 21:57:51 -0800)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib stable/zeus-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/zeus-nut

Adrian Bunk (3):
  networkmanager: Upgrade 1.18.2 -> 1.18.4
  gpsd: Backport a memory leak fix
  libqmi: Upgrade 1.24.0 -> 1.24.2

Changqing Li (1):
  xfce-dusk-gtk3: correct invalid SRC_URI

Hongxu Jia (1):
  python-more-itertools: downgrade 7.2.0 -> 5.0.0

Kai Kang (1):
  fltk: fix build error when enable package config examples

Khem Raj (9):
  grpc: Define libdir and cmakedir in terms of multilib
  tinyalsa: fix installation libdir path to match multilibs
  libqb: Add --enable-nosection-fallback with mips64/clang
  x11vnc: Fix build for 32bit arches with 64bit time_t
  evtest: Fix build for 32bit arches with 64bit time_t
  lirc: Fix build for 32bit arches with 64bit time_t
  utouch-evemu,utouch-frame: Fix build for 32bit arches with 64bit
    time_t
  directfb: Fix build for 32bit arches with 64bit time_t
  ruli: Fix install step and build samples too

Stefan Agner (1):
  networkmanager: do not deploy unnecessary udev rule file

zhangxiao (1):
  syslog-ng: Fix multilib header conflict - syslog-ng-config.h

 .../recipes-multimedia/tinyalsa/tinyalsa.bb   |   4 +-
 ...L_-path-instead-of-hardcoding-bin-li.patch |  46 +++++
 ...ger_1.18.2.bb => networkmanager_1.18.4.bb} |   9 +-
 .../recipes-devtools/grpc/grpc_1.24.1.bb      |   4 +-
 ...-Fix-build-with-format-string-checks.patch |  29 ++-
 ...ake-space-for-flags-from-environment.patch |  95 +++++++++
 ...v-Mark-prev_addr_list_size-as-unused.patch |  35 ++++
 .../recipes-support/ruli/files/Makefile.patch | 122 ------------
 .../recipes-support/ruli/ruli_0.36.bb         |  23 ++-
 .../{libqmi_1.24.0.bb => libqmi_1.24.2.bb}    |   4 +-
 ...ld-on-32bit-arches-with-64bit-time_t.patch |  40 ++++
 .../recipes-connectivity/lirc/lirc_0.9.4d.bb  |   1 +
 meta-oe/recipes-extended/libqb/libqb_1.0.5.bb |   6 +-
 .../recipes-graphics/directfb/directfb.inc    |   3 +-
 ...ld-on-32bit-arches-with-64bit-time_t.patch | 139 +++++++++++++
 ...ld-on-32bit-arches-with-64bit-time_t.patch | 111 +++++++++++
 .../recipes-graphics/x11vnc/x11vnc_0.9.16.bb  |   5 +-
 .../0001-gps_shm_close-Free-privdata.patch    |  37 ++++
 meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb  |   1 +
 meta-oe/recipes-support/fltk/fltk.bb          |   7 +-
 ...-when-enable-package-config-examples.patch | 182 ++++++++++++++++++
 .../recipes-support/syslog-ng/syslog-ng.inc   |   4 +-
 ...ld-on-32bit-arches-with-64bit-time_t.patch |  76 ++++++++
 .../utouch/utouch-evemu_git.bb                |   4 +-
 ...ld-on-32bit-arches-with-64bit-time_t.patch |  41 ++++
 ...tat.h-for-fixing-build-issue-on-musl.patch |   0
 .../remove-man-page-creation.patch            |   0
 .../utouch/utouch-frame_git.bb                |   1 +
 ...ld-on-32bit-arches-with-64bit-time_t.patch |  41 ++++
 meta-oe/recipes-test/evtest/evtest_1.34.bb    |   6 +-
 .../python/python-more-itertools.inc          |   3 -
 .../python/python-more-itertools_5.0.0.bb     |   7 +
 .../python/python-more-itertools_7.2.0.bb     |   2 -
 .../python/python3-more-itertools_7.2.0.bb    |   3 +
 .../xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb      |   2 +-
 35 files changed, 935 insertions(+), 158 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa/0001-Use-CMAKE_INSTALL_-path-instead-of-hardcoding-bin-li.patch
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.18.2.bb => networkmanager_1.18.4.bb} (94%)
 create mode 100644 meta-networking/recipes-support/ruli/files/0001-Make-space-for-flags-from-environment.patch
 create mode 100644 meta-networking/recipes-support/ruli/files/0001-ruli_srv-Mark-prev_addr_list_size-as-unused.patch
 delete mode 100644 meta-networking/recipes-support/ruli/files/Makefile.patch
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.24.0.bb => libqmi_1.24.2.bb} (85%)
 create mode 100644 meta-oe/recipes-connectivity/lirc/lirc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
 create mode 100644 meta-oe/recipes-graphics/directfb/directfb/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
 create mode 100644 meta-oe/recipes-graphics/x11vnc/files/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/0001-gps_shm_close-Free-privdata.patch
 create mode 100644 meta-oe/recipes-support/fltk/fltk/0004-Fix-build-error-when-enable-package-config-examples.patch
 create mode 100644 meta-oe/recipes-support/utouch/utouch-evemu/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
 create mode 100644 meta-oe/recipes-support/utouch/utouch-frame/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
 rename meta-oe/recipes-support/utouch/{files => utouch-frame}/0001-include-sys-stat.h-for-fixing-build-issue-on-musl.patch (100%)
 rename meta-oe/recipes-support/utouch/{files => utouch-frame}/remove-man-page-creation.patch (100%)
 create mode 100644 meta-oe/recipes-test/evtest/evtest/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
 create mode 100644 meta-python/recipes-devtools/python/python-more-itertools_5.0.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-more-itertools_7.2.0.bb

-- 
2.17.1


