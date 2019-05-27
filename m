Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id E22B97D1F9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 14:09:47 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id gn7so7079766plb.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 07:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=T0Vxcdr87p+eLCiWkAFsXCueQoDOonzGWThDa09oiCU=;
	b=dMtagfAKRCuk1TMB7tKr/H4Uvxf7aKkpTzMQDFzPEKVCwMOTBO5N9Y2kg2nHc4250t
	baa9TgX0Y1OhHWRsDGqmK6je+KPR+Czr/vqmP+lU427KHRClQLDqIq3v/xI1dfjZK4+P
	etR43cNCOav5Qh/k/Oa/e5UGYRaORaGMDkth5CpqKSIbD/pY8xysLJ1QJkPvbhiRnfDc
	8ZdkV7a28YHUA/crb9SazrRcmDmeofoHvjfUYsjrmWmHOr5JuhIrle6BLt7hAAuFABaF
	9P5J97/z34zbZx4BdP1P+UHvKGermh4+yit90NEvRZ/yjb7PfmE7a7yAZq8LYSSxPpHk
	XJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=T0Vxcdr87p+eLCiWkAFsXCueQoDOonzGWThDa09oiCU=;
	b=IsK5OqJBTjvLJvmXZKl2BOxwQCR5B3/4nilU7ubIc1zvRL82Xwz8h+NgQa4ynHw3Kh
	Q2fhWwSkwoHZwx0EHYsYug3gCS9SNzqC3LF95hK9tV5Y5KZnigVVfwRUKvZsZ7u/UjD6
	YqQgVFyLb9mNn2fVUJMtoTt+bEhsBGjxMrLt/bvidsV5mhtkxRzCrnN33Ej8xGHb1Eli
	GS1vO1wvLz3bPZN7IEH5m5aA8nDoGDlQiXGbWW2xSUDp3GhygKh09gbWlBos++k7DINp
	1NxtJM0JY2jMF0ZkL2R7Ot0hZy5br4HLUpfVEbH28J8dDVoDMaE8f1DrFrGyzCNKKvAi
	c6Rw==
X-Gm-Message-State: APjAAAWZnwp9VdEmzK9yt/Pa92GZzn7haxEX2DCmNK7pdBLqnwXtNpRv
	pGlJjlFvDiD5BOUogKI97Nml0uWh
X-Google-Smtp-Source: APXvYqyHk8NtqHrHpA3GX7wn3J9HTN+DG43YEJZ9S+HB9ji6Rkoloe2RapIsADSaRFbtWknRMM85PQ==
X-Received: by 2002:a17:902:9693:: with SMTP id
	n19mr127178601plp.92.1558966188573; 
	Mon, 27 May 2019 07:09:48 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:6833:552f:fefb:d39])
	by smtp.gmail.com with ESMTPSA id
	f29sm17558506pfq.11.2019.05.27.07.09.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 May 2019 07:09:47 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 May 2019 07:09:06 -0700
Message-Id: <cover.1558966078.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 00/34] Warrior pull request
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
X-List-Received-Date: Mon, 27 May 2019 14:09:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please merge warrior-next to worrior

The following changes since commit d7338c2b3a96ef7d8bf9df59dcde11f8c131f9c0:

  README: updated Maintainers list for Warrior (2019-05-07 09:34:43 -0700)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded warrior-next
  http://cgit.openembedded.org/meta-openembedded/log/?h=warrior-next

Akshay Bhat (3):
  python-urllib3: Set CVE_PRODUCT
  python3-pillow: Set CVE_PRODUCT
  python-requests: Set CVE_PRODUCT

Andreas Müller (7):
  xfce4-vala: auto-detect vala api version
  gnome-desktop3: set correct meson gtk doc option
  evince: add patch to fix build with recent gobject-introspection
  xfce4-cpufreq-plugin: Fix memory leak and reduce CPU load
  packagegroup-meta-networking: replace DISTRO_FEATURE by
    DISTRO_FEATURES
  meta-xfce: add meta-networking to layer depends
  itstool: rework - it went out too early

Changqing Li (3):
  php: upgrade 7.3.2 -> 7.3.4
  postgresql: fix compile error
  php: correct httpd path

Hongxu Jia (1):
  pmtools: use update-alternatives for acpidump

Johannes Pointner (1):
  samba: update to 4.8.11

Khem Raj (1):
  cpupower: Inherit bash completion class

Martin Jansa (7):
  esound: fix SRC_URI for multilib
  opusfile: fix SRC_URI for multilib
  miniupnpd: fix SRC_URI for multilib
  zbar: fix SRC_URI for multilib
  efivar: prevent native efivar depending on target kernel
  libdbi-perl: prevent native libdbi-perl depending on target perl
  aufs-util: prevent native aufs-util depending on target kernel

Nicolas Dechesne (1):
  cpupower: remove LIC_FILES_CHKSUM

Oleksandr Kravchuk (3):
  ebtables: add UPSTREAM_CHECK_URI
  doxygen: replace ninja 1.9.0 fix with official one
  openvpn: update to 2.4.7

Qi.Chen@windriver.com (3):
  netkit-rsh: add tag to CVE patch
  ipsec-tools: fix CVE tag in patch
  gd: set CVE_PRODUCT

Vincent Prince (1):
  mongodb: Fix build with gcc

Yi Zhao (2):
  openhpi: update openhpi-fix-testfail-errors.patch
  phpmyadmin: upgrade 4.8.3 -> 4.8.5

Zang Ruochen (1):
  python-pyasn1: upgrade 0.4.4 -> 0.4.5

 .../recipes-utils/aufs-util/aufs-util_git.bb       |   2 +-
 ...ove-EvDocumentModel-get-type-function-dec.patch |  33 +++++
 meta-gnome/recipes-gnome/evince/evince_3.28.2.bb   |  12 +-
 .../gnome-desktop/gnome-desktop3_3.32.0.bb         |   1 +
 .../recipes-multimedia/opusfile/opusfile_0.10.bb   |   2 +-
 .../miniupnpd/miniupnpd_2.1.20190210.bb            |   2 +-
 ...to-build-Samba-against-a-newer-minor-vers.patch |  86 ------------
 .../samba/{samba_4.8.4.bb => samba_4.8.11.bb}      |   7 +-
 .../packagegroups/packagegroup-meta-networking.bb  |  13 +-
 ...penhpi-fix-function-saHpiSensorThresholds.patch |  35 +++++
 .../files/openhpi-fix-testfail-errors.patch        |  33 -----
 .../recipes-daemons/openhpi/openhpi_3.8.0.bb       |   2 +-
 .../recipes-filter/ebtables/ebtables_2.0.10-4.bb   |   2 +
 .../CVE-2019-7282-and-CVE-2019-7283.patch          |   2 +
 .../ipsec-tools/fix-CVE-2016-10396.patch           |   2 +-
 .../openvpn/{openvpn_2.4.6.bb => openvpn_2.4.7.bb} |   6 +-
 meta-oe/recipes-bsp/efivar/efivar_37.bb            |   2 +-
 meta-oe/recipes-dbs/mongodb/mongodb_git.bb         |   6 +-
 meta-oe/recipes-dbs/postgresql/postgresql.inc      |  10 ++
 .../doxygen/doxygen/0001-Fix-6906.patch            |  94 +++++++++++++
 meta-oe/recipes-devtools/doxygen/doxygen_1.8.15.bb |   8 +-
 meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb |   9 +-
 meta-oe/recipes-devtools/php/php.inc               |   2 +-
 .../0001-opcache-config.m4-enable-opcache.patch    |  81 ++---------
 ...049-ext-intl-Use-pkg-config-to-detect-icu.patch | 154 ++++++++++++++-------
 .../php/{php_7.3.2.bb => php_7.3.4.bb}             |   4 +-
 meta-oe/recipes-devtools/pmtools/pmtools_git.bb    |   2 +-
 meta-oe/recipes-kernel/cpupower/cpupower.bb        |   3 +-
 meta-oe/recipes-multimedia/esound/esound_0.2.41.bb |   2 +-
 meta-oe/recipes-support/gd/gd_2.2.5.bb             |   2 +
 meta-oe/recipes-support/itstool/itstool_2.0.5.bb   |   6 +-
 meta-oe/recipes-support/zbar/zbar_0.10.bb          |   2 +-
 .../recipes-devtools/python/python-pyasn1.inc      |   6 +-
 ...thon-pyasn1_0.4.4.bb => python-pyasn1_0.4.5.bb} |   0
 .../recipes-devtools/python/python-requests.inc    |   2 +
 .../recipes-devtools/python/python-urllib3.inc     |   2 +
 .../python/python3-pillow_5.4.1.bb                 |   2 +
 ...on3-pyasn1_0.4.4.bb => python3-pyasn1_0.4.5.bb} |   0
 .../{phpmyadmin_4.8.3.bb => phpmyadmin_4.8.5.bb}   |   4 +-
 meta-xfce/conf/layer.conf                          |   1 +
 ...e.ac-Detect-vapidir-if-not-set-explicitly.patch |  31 +++++
 .../recipes-bindings/vala/xfce4-vala_4.10.3.bb     |   7 +-
 ...-memory-leak-and-reduce-cpu-load-slightly.patch | 121 ++++++++++++++++
 .../cpufreq/xfce4-cpufreq-plugin_1.2.1.bb          |   1 +
 44 files changed, 512 insertions(+), 292 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/evince/evince/0001-libview-Remove-EvDocumentModel-get-type-function-dec.patch
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-ldb-Refuse-to-build-Samba-against-a-newer-minor-vers.patch
 rename meta-networking/recipes-connectivity/samba/{samba_4.8.4.bb => samba_4.8.11.bb} (98%)
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/openhpi-fix-function-saHpiSensorThresholds.patch
 delete mode 100644 meta-networking/recipes-daemons/openhpi/files/openhpi-fix-testfail-errors.patch
 rename meta-networking/recipes-support/openvpn/{openvpn_2.4.6.bb => openvpn_2.4.7.bb} (94%)
 create mode 100644 meta-oe/recipes-devtools/doxygen/doxygen/0001-Fix-6906.patch
 rename meta-oe/recipes-devtools/php/{php_7.3.2.bb => php_7.3.4.bb} (87%)
 rename meta-python/recipes-devtools/python/{python-pyasn1_0.4.4.bb => python-pyasn1_0.4.5.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyasn1_0.4.4.bb => python3-pyasn1_0.4.5.bb} (100%)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.8.3.bb => phpmyadmin_4.8.5.bb} (91%)
 create mode 100644 meta-xfce/recipes-bindings/vala/xfce4-vala/0001-configure.ac-Detect-vapidir-if-not-set-explicitly.patch
 create mode 100644 meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin/0001-Fix-memory-leak-and-reduce-cpu-load-slightly.patch

-- 
2.7.4


