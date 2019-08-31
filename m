Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4ECD97F285
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 21:31:47 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id d10so731262pgo.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 14:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=24enT69byrE51tbFpnhai00cwC1mfJJ9AHHSUp/9Wes=;
	b=WqtY9cB5SfAHJQbaAQjfc/xtov2v3lwhVyyckBiz6L5iXhzvTZ2IG+4pMlPeNW3y89
	lebxAM33bPBRELtk6sacIzVwx87r+Ld2K5dhdViZBhk03Oc2W36T+Riq58zpJXwK3xMN
	Lgps/BzOnM8NRJnH46JG6crxw2xWXMhHVoeTO04jj0zg/Ch6KlE7irU4N+Akwzh57eFk
	kXQPuSLQcZDYZ4ybwa+OIqe+TXn/+3jjh0RwRpl/oy/bhVeq+b9Up+dwB2vNhvv22Nap
	e6U+POpB4q1XnfuaROMVhOc4PvOzpa2wmPFk+JBpzeYF1j0S+W6VBeRM7wbsfGd/MMZb
	mNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=24enT69byrE51tbFpnhai00cwC1mfJJ9AHHSUp/9Wes=;
	b=N2/1iR4phX/Nm2mQb9Lr5Bus5va7NwVCXEUqs6YIKbu0qstOFfBrPcgvf8h0DpFn3p
	FGc2ury+gUSdv8iXEZTPQpMYu+cfHAFa7LmMfklwPQ/uPStbRacCRWdNXxuKLD5d68XD
	yTpAf/ojVF+b2APGydOOkaqiFJRT5Txw5vA+uEkVrV4ZAQNn9r5fBUN6qLLAdoo41p0Z
	iQv/cAiM8QG0bTl+FOr9adkB83emYbL0dw5bjKMnDRGqjx+JkmeNt/3Oqh2xxhnuimj1
	YhuJH7tXbY6/QGh7nLuyQaMxCWeYs+457qo2nyEy5NGxiQQsvGXWr73wq0C7H5XvM6s+
	bueQ==
X-Gm-Message-State: APjAAAVPXaFZ8+FEWQnZJtYH6Wy2kquLtY9ju/ROhVFs4W3BWu+0/qCV
	TkoGvvRkWE+wHtQBHoFGVepLc8Mb
X-Google-Smtp-Source: APXvYqwwJ0z4Gu2RGckLIhvFE75Ap/kJZsE+eU2sEWTeDRAMFnULBOjdMwq7IFSdBirSkzwc6t2h/w==
X-Received: by 2002:a62:64c9:: with SMTP id y192mr11287929pfb.6.1567287108165; 
	Sat, 31 Aug 2019 14:31:48 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8107:6109:754a:f033])
	by smtp.gmail.com with ESMTPSA id
	a18sm8060827pgl.44.2019.08.31.14.31.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 31 Aug 2019 14:31:47 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Aug 2019 14:31:21 -0700
Message-Id: <cover.1567286967.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [warrior 00/23] Patch Review
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
X-List-Received-Date: Sat, 31 Aug 2019 21:31:47 -0000

Please review and comment back by Monday

The following changes since commit 222cafdcd97549f67c98833721b4f8f33607555e:

  wireless-regdb: Upgrade 2019.03.01 -> 2019.06.03 (2019-07-13 12:43:43 -0700)

are available in the git repository at:

  https://git.openembedded.org/meta-openembedded-contrib stable/warrior-nmut
  http://cgit.openembedded.org//log/?h=stable/warrior-nmut

Adrian Bunk (6):
  network-manager-applet: Remove obsolete dbus-glib and libnm-glib
    dependencies
  zeromq: Upgrade 4.3.1 -> 4.3.2
  gnome-desktop3: Fix REQUIRED_DISTRO_FEATURES
  wireshark: Use an upstream URL that stays valid longer
  libgit2: Upgrade 0.27.8 -> 0.27.9
  vlc: notify switched to GTK+3 some time ago

Carlos Rafael Giani (1):
  openh264: Fix armv7ve build

Changqing Li (3):
  volume-key: fix "Nothing RPROVIDES" when multilib enabled
  isomd5sum: fix "Nothing RPROVIDES" when multilib enabled
  satyr: fix "Nothing RPROVIDES" when multilib enabled

Fabian Klemp (1):
  openvpn: respect pid file in init.d service start

Kai Kang (1):
  net-snmp: update SRC_URI

Khem Raj (1):
  libopus: Limit forcing ARM mode ISA to v5 only

Luca Ceresoli (2):
  fuse-exfat: moved to github
  exfat-utils: moved to github

Martin Jansa (5):
  redis: backport a fix for stack trace generation on aarch64
  ntop: fix missing return from non-void function
  freeradius: add runtime dependency on perl
  scsirastools: add runtime dependency on bash
  scsirastools: add runtime dependency on bash II

Mingli Yu (1):
  mariadb: Upgrade to 10.3.16

Yi Zhao (2):
  fuse: upgrade 2.9.8 -> 2.9.9
  apache2: upgrade 2.4.39 -> 2.4.41

 .../fuse-exfat/fuse-exfat_1.2.3.bb                 |  6 +--
 .../fuse/{fuse_2.9.8.bb => fuse_2.9.9.bb}          |  4 +-
 .../recipes-utils/exfat-utils/exfat-utils_1.2.3.bb |  2 +-
 .../network-manager-applet_1.8.20.bb               |  5 +--
 .../networkmanager/networkmanager_%.bbappend       |  3 --
 .../gnome-desktop/gnome-desktop3_3.32.0.bb         |  2 +-
 .../recipes-multimedia/openh264/openh264_1.7.0.bb  |  1 +
 meta-multimedia/recipes-multimedia/vlc/vlc.inc     |  2 +-
 .../freeradius/freeradius_3.0.17.bb                |  2 +-
 .../recipes-protocols/net-snmp/net-snmp_5.8.bb     |  6 +--
 ...fix-missing-return-from-non-void-function.patch | 19 +++++++++
 meta-networking/recipes-support/ntop/ntop_5.0.1.bb |  1 +
 .../recipes-support/openvpn/openvpn/openvpn        | 12 +++++-
 .../recipes-support/wireshark/wireshark_3.0.1.bb   |  2 +-
 .../zeromq/{zeromq_4.3.1.bb => zeromq_4.3.2.bb}    |  4 +-
 ...native_10.3.15.bb => mariadb-native_10.3.16.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc              |  8 ++--
 .../{mariadb_10.3.15.bb => mariadb_10.3.16.bb}     |  0
 .../recipes-extended/isomd5sum/isomd5sum_1.2.3.bb  |  8 ++--
 .../Fixed-stack-trace-generation-on-aarch64.patch  | 45 ++++++++++++++++++++++
 meta-oe/recipes-extended/redis/redis_4.0.14.bb     |  1 +
 .../scsirastools/scsirastools_1.6.6.bb             |  4 +-
 .../volume_key/volume-key_0.3.12.bb                |  7 ++--
 .../recipes-multimedia/libopus/libopus_1.1.3.bb    |  2 +-
 .../{libgit2_0.27.8.bb => libgit2_0.27.9.bb}       |  3 +-
 meta-oe/recipes-support/satyr/satyr_0.27.bb        |  4 +-
 .../{apache2_2.4.39.bb => apache2_2.4.41.bb}       |  4 +-
 27 files changed, 113 insertions(+), 44 deletions(-)
 rename meta-filesystems/recipes-support/fuse/{fuse_2.9.8.bb => fuse_2.9.9.bb} (94%)
 delete mode 100644 meta-gnome/recipes-connectivity/networkmanager/networkmanager_%.bbappend
 create mode 100644 meta-networking/recipes-support/ntop/ntop/fix-missing-return-from-non-void-function.patch
 rename meta-oe/recipes-connectivity/zeromq/{zeromq_4.3.1.bb => zeromq_4.3.2.bb} (85%)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.3.15.bb => mariadb-native_10.3.16.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.3.15.bb => mariadb_10.3.16.bb} (100%)
 create mode 100644 meta-oe/recipes-extended/redis/redis/Fixed-stack-trace-generation-on-aarch64.patch
 rename meta-oe/recipes-support/libgit2/{libgit2_0.27.8.bb => libgit2_0.27.9.bb} (90%)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.39.bb => apache2_2.4.41.bb} (98%)

-- 
2.7.4


