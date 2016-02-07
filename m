Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 596C3731FE
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Feb 2016 21:23:27 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id cy9so63147832pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Feb 2016 13:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=O4INSpqT2Ppxqc6resvii88xCTmE22djaM139ETWIB4=;
	b=HJ1fmYYxkmeXkzeCgLiD/z2re5RQYwHrGziTQt2F8XL4VMXLDNocCgSqL6UQ2ZLGVn
	Yti1JrvMSTQNohH09HnEYdTe2Xox/nAYrEbbkC97OrA3R4ucid30nvxqYMQKybcnUkg+
	D0AplCk7U1IZe1jqsCoCB8l36xJCbiDcy9Ni0/p53ejfznnScpBDibb5m4vF9yv0+IG4
	uFtTY5fhh8U/gjQfP59L7x6h5p4cp7vd2+etBJ9eaB8B7c0hPymZgFztbtzojr4EbPZO
	0pr9rN6rk6CP3wfRSfqqnKxIAG9oFQQ5EzUVJ96P0IP/Nk3hvypQJ8HcJ3sMg2m9/Wgu
	OReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=O4INSpqT2Ppxqc6resvii88xCTmE22djaM139ETWIB4=;
	b=Hr0mRyjPhardqMx8E7e1sgz1e8ZJ2Kp3hONe9DVQfaPXZYs7t29kuMzYFSsNUwqYiZ
	mat3rWmWVgxRXSY/7ErWUepYE5rIjJnM5gDu4LdK0vIn1s4bwOerBVAHEBoDctTX6ImB
	ic3eii7Co+AukqmRwhR0IJ2g5r2v7MSlpZvAp7rIwJS3KfbVAzRFxhiF+ZBsHqC/q/KM
	hOs59V2efTQHmZhvIxJX8aRTuAcWiDQQ4CJyA/pNVnBlEHO8Ksax7LQ1379apunUOYhp
	KHibkQBgP8azdSgLrkdFQFrNW8YNbFmRGnehiPMpLr+pFy4Gd3RQeRpHEGO6JB8T5v0N
	hnGw==
X-Gm-Message-State: AG10YOSaZaoBY4YSxrLCX8NO/sRBSvp9Jz5cebort+wptFi4N6iKSBnRlillp6gJ08r22w==
X-Received: by 10.67.8.38 with SMTP id dh6mr24610927pad.1.1454880208057;
	Sun, 07 Feb 2016 13:23:28 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	mj1sm38367304pab.34.2016.02.07.13.23.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 07 Feb 2016 13:23:26 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Sun,  7 Feb 2016 13:22:47 -0800
Message-Id: <cover.1454879728.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
MIME-Version: 1.0
Subject: [PATCH 00/27][jethro V2] Pull request
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
X-List-Received-Date: Sun, 07 Feb 2016 21:23:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

please consider these changes for meta-openembedded jethro-next

The following changes since commit 7bc138a365e20653ddfb9229561e3e9e50b89ee8:

  cifs-utils: add PACKAGECONFIG for cifsidmap (2016-01-14 11:22:38 +0100)

are available in the git repository at:

  git://github.com/akuster/meta-openembedded akuster/jethro-next
  https://github.com//tree/akuster/jethro-next

Andreas Müller (1):
  thunar: remove udisks from RRECOMMENDS

Armin Kuster (5):
  networkmanager: fix QA warning
  qwt: Fix host-user-contaminated
  php: Security fix CVE-2015-7803
  php: Security fix CVE-2015-7804
  php: Security fix CVE-2016-1903

Christopher Larson (1):
  lowpan-tools: add missing flex/bison deps

Hongxu Jia (1):
  postfix: fix clean broken issue

Jackie Huang (3):
  iscsitarget: split the kernel module into separate package
  iscsitarget: skip the arch test for kernel modules
  ncftp: fix build failures with ccdv

Jens Rehsack (1):
  waf-samba: enable parallel builds

Joe Slater (1):
  geoip: add ptest functionality

Kai Kang (1):
  xl2tpd: fix warnings with gcc 5

Maciej Borzecki (1):
  mozjs: fix linking issues on i586

Mark Asselstine (1):
  ctdb: Fix rootfs creation errors

Martin Jansa (2):
  ctdb: add dependency on libldb
  terminus-font: update perl-native-runtime dependency

Qi.Chen@windriver.com (1):
  quagga: fix segment fault when stopping ospf6d

Robert Yang (4):
  nbd: use BPN in Files
  cim-schema-exper: fix host-user-contaminated
  ctdb: add PACKAGECONFIG for libtdb
  netkit-ftp: fixed invalid symlink

Ruslan Bilovol (1):
  wireshark: update SRC_URI link to sources

Wenzong Fan (1):
  samba: add PACKAGECONFIG for valgrind

Yi Zhao (2):
  logwatch: fix host-user-contaminated
  orrery: fix host-user-contaminated

 .../21-add-config-option-without-valgrind.patch    |  63 ++++++++++
 .../recipes-connectivity/samba/samba_4.1.12.bb     |   2 +
 .../ncftp-configure-use-BUILD_CC-for-ccdv.patch    |  32 +++++
 .../recipes-daemons/ncftp/ncftp_3.2.5.bb           |   7 +-
 .../recipes-daemons/postfix/postfix.inc            |   2 +
 .../iscsitarget/iscsitarget_1.4.20.3+svn502.bb     |  13 +-
 .../recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb   |   2 +-
 ...heck-ospf6-before-using-it-in-ospf6_clean.patch |  28 +++++
 .../recipes-protocols/quagga/quagga_0.99.24.1.bb   |   1 +
 .../recipes-protocols/xl2tpd/xl2tpd.inc            |   4 +-
 .../fix-inline-functions-errors-with-gcc-5.x.patch | 134 +++++++++++++++++++++
 .../cim-schema/cim-schema-exper_2.39.0.bb          |   1 +
 .../cim-schema/cim-schema-final_2.40.0.bb          |   1 +
 ...rvice-ensure-the-PID-directory-is-created.patch |  25 ++++
 meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb |  11 +-
 .../recipes-support/geoip/files/run-ptest          |  11 ++
 .../recipes-support/geoip/geoip_1.6.6.bb           |  38 ++++++
 .../lowpan-tools/lowpan-tools_git.bb               |   2 +-
 meta-networking/recipes-support/nbd/nbd_3.11.bb    |   6 +-
 .../recipes-support/wireshark/wireshark_1.12.8.bb  |   2 +-
 meta-oe/classes/waf-samba.bbclass                  |   4 +
 .../networkmanager/networkmanager_1.0.4.bb         |   1 +
 .../php/php-5.6.12/CVE-2015-7803.patch             |  85 +++++++++++++
 .../php/php-5.6.12/CVE-2015-7804.patch             |  64 ++++++++++
 .../php/php-5.6.12/CVE-2016-1903.patch             |  55 +++++++++
 meta-oe/recipes-devtools/php/php_5.6.12.bb         |   6 +-
 .../recipes-extended/logwatch/logwatch_7.4.1.bb    |   1 +
 ...010-fix-cross-compilation-on-i586-targets.patch |  46 +++++++
 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb     |   1 +
 .../terminus-font/terminus-font_4.38.bb            |   2 +-
 meta-oe/recipes-navigation/orrery/orrery_2.7.bb    |   1 +
 meta-oe/recipes-qt/qwt/qwt.inc                     |   1 +
 meta-xfce/recipes-xfce/thunar/thunar_1.6.10.bb     |   2 +-
 33 files changed, 632 insertions(+), 22 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/21-add-config-option-without-valgrind.patch
 create mode 100644 meta-networking/recipes-daemons/ncftp/ncftp/ncftp-configure-use-BUILD_CC-for-ccdv.patch
 create mode 100644 meta-networking/recipes-protocols/quagga/files/0001-ospf6d-check-ospf6-before-using-it-in-ospf6_clean.patch
 create mode 100644 meta-networking/recipes-protocols/xl2tpd/xl2tpd/fix-inline-functions-errors-with-gcc-5.x.patch
 create mode 100644 meta-networking/recipes-support/ctdb/ctdb/service-ensure-the-PID-directory-is-created.patch
 create mode 100644 meta-networking/recipes-support/geoip/files/run-ptest
 create mode 100644 meta-oe/recipes-devtools/php/php-5.6.12/CVE-2015-7803.patch
 create mode 100644 meta-oe/recipes-devtools/php/php-5.6.12/CVE-2015-7804.patch
 create mode 100644 meta-oe/recipes-devtools/php/php-5.6.12/CVE-2016-1903.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0010-fix-cross-compilation-on-i586-targets.patch

-- 
2.3.5


