Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id E5B047EA8E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 17:57:31 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id s21so3391832pga.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 10:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=k02GN0UTATudfVCULAcwxsZQv2/5mP4AIRz/5qja6x0=;
	b=vK8IB/n6wOf3YVX3MbXAQS61rHhM7plz82M5KLA7zi44oHsk7Ve96SGk+mc5i4T1Cg
	bfXsUi+NgxIwc8MI3JVyPxUjpRk0lnSWBt1TLmk/bj5bdwEUYtEDQ4Gk0vU9nPJ+Q4Et
	ZVKAgWiwIczICUha4xnYEAcJY2ACk9xWUduRctrE4Jg+3waz5n/YMp0eSJJftn8GzU/n
	TafbhbnYllmWxvDwW84AwcObgIGXhSXUTeB39rhUz7UrJgQH8eRNynzaH5VXMXH3dPI3
	+nCVglyeHy9Y2gPC4+JwVC2cq1LLdtXqV2NFxJAxlVvSLlZUDdLDCPH/1oe5djM0ikfN
	9K9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=k02GN0UTATudfVCULAcwxsZQv2/5mP4AIRz/5qja6x0=;
	b=alNgiMpAoelgHqV/5AubT/28wLScdKO9Ps0LkYieiM9l+5X0c3oxO4Hg7mr4I3+Iyn
	Bm1MB97XeCSoZd2yz+QxX4UenaNazPV6NQeqpEasm9r8nMUvwdPI4IXJCNPY+LkhRMZi
	zN88hXrEq9h6geGoZ4n0kpIHxTlELqn5oJSzdWum/qolHXTAITCJlVAk/1TuG/K5nR9f
	tcu2KH1qo+hKQlc5qa7F+6Bj4LcmZPXzNfSxuGN1A+Du3pLGBlakMzkeFRyx8pD1sv7n
	DPAeOxFRHzejFXtY2yXXwNsfNrqOU6X40o6Z4/kxImJRiGen61MvzpZdrM4vW5AyoOF/
	0XMg==
X-Gm-Message-State: APjAAAW2VCMdEN7fUdCX1+KPs8UWPuBNd3Sgzr9+YhZhwUCaONMtsI+9
	m0RzF8DYxDjBJmyW7Uuci3yAGj+I
X-Google-Smtp-Source: APXvYqzA7fcLfxm1jomx7LZRCJDfZHr/MSCcIlRm9tUhzwXMiPTAE4Otb94NQEhRZl/QwTkH7TERlw==
X-Received: by 2002:a63:4509:: with SMTP id s9mr40798742pga.231.1560621452772; 
	Sat, 15 Jun 2019 10:57:32 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:5942:80bf:dc9c:15ab])
	by smtp.gmail.com with ESMTPSA id
	f14sm8561221pfn.53.2019.06.15.10.57.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Jun 2019 10:57:32 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Jun 2019 10:57:04 -0700
Message-Id: <cover.1560620937.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Warror][ 00/23] Patch review
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
X-List-Received-Date: Sat, 15 Jun 2019 17:57:32 -0000

Most of these where back port requests so I am giving a short review window.
Commnets by Sunday.

The following changes since commit 21cbe3ec166696b4d67d2ef5486a394d14d29269:

  aufs-util: prevent native aufs-util depending on target kernel (2019-05-18 07:38:39 -0700)

are available in the git repository at:

  https://git.openembedded.org/meta-openembedded-contrib stable/warrior-nmut
  http://cgit.openembedded.org//log/?h=stable/warrior-nmut

Changqing Li (1):
  netkit-telnet: add rconflicts

Hongxu Jia (1):
  crash: do not use unstable github archive tarballs

Liwei Song (1):
  turbostat: copy bits.h from kernel to turbostat

Martin Jansa (16):
  gtkwave: add distro_features_check
  ndctl: make MACHINE_ARCH and ignore from libblockdev
  oprofile: make MACHINE_ARCH
  umip: make MACHINE_ARCH
  mscgen: fix SRC_URI for multilib
  triggerhappy: fix issues
  python-cassandra-driver.inc: fix DEPENDS
  opencv: use the same package name in PACKAGES and RDEPENDS
  igmpproxy: remove
    0001-src-igmpproxy.h-Include-sys-types.h-for-u_short-u_in.patch and
    _GNU_SOURCE
  libvncserver: set PV in the recipe
  ccid: fix SRC_URI
  ne10, libopus: add armv7ve override as well
  hunspell: use git fetcher instead of github archive
  ttf-mplus, ttf-vlgothic: add ttf-mplus license
  libmikmod: fix SRC_URI
  leptonica: fix SRC_URI

Mingli Yu (1):
  mariadb: Upgrade to 10.3.15

Qi.Chen@windriver.com (1):
  polkit: fix CVE-2019-6133

Scott Ellis (1):
  wireguard: Upgrade 20190123 -> 20190406

nick83ola (1):
  uthash: do not use unstable github archive tarballs

 .../recipes-connectivity/umip/umip_1.0.bb          |   3 +
 ...xy.h-Include-sys-types.h-for-u_short-u_in.patch |  25 ---
 .../recipes-daemons/igmpproxy/igmpproxy_0.2.1.bb   |   6 +-
 ...0190123.bb => wireguard-module_0.0.20190406.bb} |   0
 ...20190123.bb => wireguard-tools_0.0.20190406.bb} |   0
 .../recipes-kernel/wireguard/wireguard.inc         |   4 +-
 .../netkit-telnet/netkit-telnet_0.17.bb            |   1 +
 meta-oe/conf/layer.conf                            |   6 +
 meta-oe/licenses/ttf-mplus                         |  16 ++
 meta-oe/recipes-core/ndctl/ndctl_v63.bb            |   3 +
 .../packagegroups/packagegroup-meta-oe.bb          |   3 +-
 ...native_10.3.13.bb => mariadb-native_10.3.15.bb} |   0
 meta-oe/recipes-dbs/mysql/mariadb.inc              |   4 +-
 .../{mariadb_10.3.13.bb => mariadb_10.3.15.bb}     |   0
 ...pare-PolkitUnixProcess-uids-for-temporary.patch | 186 +++++++++++++++++++++
 meta-oe/recipes-extended/polkit/polkit_0.115.bb    |   7 +-
 .../{triggerhappy_0.5.0.bb => triggerhappy_git.bb} |  22 +--
 meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb |   4 +
 .../recipes-graphics/leptonica/leptonica_1.74.4.bb |   2 +-
 .../libvncserver/libvncserver_git.bb               |   2 +-
 .../recipes-graphics/ttf-fonts/ttf-mplus_027.bb    |   2 +-
 .../ttf-fonts/ttf-vlgothic_20141206.bb             |   2 +-
 meta-oe/recipes-kernel/crash/crash_7.2.5.bb        |   8 +-
 meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb  |   3 +
 meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb  |   2 +
 .../recipes-multimedia/libopus/libopus_1.1.3.bb    |   3 +-
 .../recipes-multimedia/mikmod/libmikmod_3.3.6.bb   |   2 +-
 meta-oe/recipes-support/ccid/ccid_1.4.24.bb        |   4 +-
 meta-oe/recipes-support/hunspell/hunspell_1.7.0.bb |   7 +-
 meta-oe/recipes-support/mscgen/mscgen_0.20.bb      |   2 +-
 meta-oe/recipes-support/ne10/ne10_1.2.1.bb         |   4 +-
 meta-oe/recipes-support/opencv/opencv_3.4.5.bb     |   2 +-
 meta-oe/recipes-support/uthash/uthash_2.1.0.bb     |   7 +-
 .../python/python-cassandra-driver.inc             |   2 +-
 34 files changed, 272 insertions(+), 72 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/igmpproxy/igmpproxy/0001-src-igmpproxy.h-Include-sys-types.h-for-u_short-u_in.patch
 rename meta-networking/recipes-kernel/wireguard/{wireguard-module_0.0.20190123.bb => wireguard-module_0.0.20190406.bb} (100%)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-tools_0.0.20190123.bb => wireguard-tools_0.0.20190406.bb} (100%)
 create mode 100644 meta-oe/licenses/ttf-mplus
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.3.13.bb => mariadb-native_10.3.15.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.3.13.bb => mariadb_10.3.15.bb} (100%)
 create mode 100644 meta-oe/recipes-extended/polkit/polkit/0001-backend-Compare-PolkitUnixProcess-uids-for-temporary.patch
 rename meta-oe/recipes-extended/triggerhappy/{triggerhappy_0.5.0.bb => triggerhappy_git.bb} (73%)

-- 
2.7.4


