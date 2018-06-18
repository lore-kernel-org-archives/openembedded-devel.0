Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0C4F9744D3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 14:32:32 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id c23-v6so9128413plz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 07:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zVYu5c3qWZI4tcxpLm8Cwj31Vv0nQ2W03WpHQnvTQsQ=;
	b=dNB19mBWCgH5kP/a8tVGBEu8Dy30YTRxBS6r2+0Bx5556oFzoayZBIko+9o+/P7fmf
	gv78FVGB3m5fgHvS74F19GdkXmh1fJnfW5pHmTjtHnwFMWjSFDb3p9lXaxkS+J8b/pzX
	wlYMzBBeafHwTdjLNM+K/Pg0Gj1hvigRjvi1r2KP4QWN2ZkhDS7I/GD+xNWDwI/YsQq1
	DBdpUTnW7/ktDMf+E8hKR6iIId/QuKXtOZymw5/Wcdi2eH2vzo+ld2uEdiF+4qP/FCRT
	SpXhO9kWiOnYW00Zx/ErWy/hAVl2y2cQMNE/9wWgwRKfoFdhk3lI1ShaM3O1rZZZn0W9
	VjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zVYu5c3qWZI4tcxpLm8Cwj31Vv0nQ2W03WpHQnvTQsQ=;
	b=nWMBJqSeOga17xeJxcBq5YSZhBJizMBFT0A66khevAlD8Ay4kYQbhMyZCLDnkK/n6t
	U5rlI44XDsAOp+4nbL6PC+83tp9T8Bo1mH7PloOJ3J0cEI+r/q73Cqt2toXxfg18Ik44
	W+yVZa3HYCfw2JPcaWBDFqs59Zlw/Xm+tmS2ji6qn1HXwUiAqJvF1p3DQ923QRMW2EbH
	d73oGfvpPMgJfzNiNsvbAfQMobo+Q5KvBybo9/gx5GtDeLvsnX/alLRgp9UxSB97rZce
	KTTGP8sn+WsmW8TIqPN16eSLW1TgxB6ntPQWhzhvxM/v5uklZMYfA/wOv9Edtc3RMVpc
	CQRg==
X-Gm-Message-State: APt69E3ODOIM/94G4/NH6azWmZcn3TtttZMhZEr5H1aBrZ28cg4DTno6
	4bVi7mIVbXwQaRqHqKWi7Qk=
X-Google-Smtp-Source: ADUXVKK/L2sabGRfonVoojHVafTYJ/pfqE/pFRrZzOwMJVwF3e5rfpAX3hzszx5Vj0401BtGR2mh1w==
X-Received: by 2002:a17:902:16a:: with SMTP id
	97-v6mr14237770plb.336.1529332354202; 
	Mon, 18 Jun 2018 07:32:34 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:eb:1883:34e0:8f40])
	by smtp.gmail.com with ESMTPSA id
	v15-v6sm15176383pff.120.2018.06.18.07.32.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Jun 2018 07:32:33 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Mon, 18 Jun 2018 07:31:49 -0700
Message-Id: <cover.1529330340.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 00/39] Sumo-next patch review
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
X-List-Received-Date: Mon, 18 Jun 2018 14:32:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


These are backports from master for sumo.
This is your chance to comment on this series for sumo.

Cover letter only

The following changes since commit a19aa29f7fa336cd075b72c496fe1102e6e5422b:

  python-evdev: Use target header to generate ecodes.c (2018-05-01 18:17:50 -0700)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/sumo-next
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/sumo-next

Andre McCurdy (1):
  openobex: explicitly set ASNEEDED from openobex recipe

Armin Kuster (1):
  ntp: update to 4.2.8.p11

Christophe PRIOUZEAU (1):
  minicoredumper: relocate admin-binaries to sbin

Florian Wickert (1):
  Add missing dependency for python-flask packages.

Hains van den Bosch (1):
  libtevent: refresh patch

Hannu Lounento (1):
  vlan: use update-alternatives for vconfig

Hongxu Jia (2):
  krb5: support environment setting on systemd
  xfce4-notifyd: fix parallel build issue

Khem Raj (2):
  geany-plugins: Add dependency on fribidi
  iperf3: Drop redundant patch

Mark Asselstine (1):
  gnome-keyring: fix 'installed but not shipped' QA issue

Martin Jansa (2):
  Revert "libxml++: only include when x11 in DISTRO_FEATURES"
  android-tools: use fixed SRCREVs instead of tag name

Michael Siebecker (1):
  Fix zram module paramter name

Mikko Rapeli (1):
  lmbench: fix Upstream-Status metadata typos in patch

Noor Ahsan (1):
  radvd: Fix missing yacc error.

Robert Joslyn (1):
  htop: Fix typo

Sipke Vriend (1):
  python-robotframework: Add runtime dependencies to robot framework

Slater, Joseph (1):
  phoronix-test-suite: disable systemd services by default

Trevor Woerner (14):
  grubby: switch away from github archive
  gst-instruments: switch away from github archive
  gst-instruments: recipe cleanup, fix -staticdev
  libsrtp: switch away from github archive
  libuv: switch away from github archive
  libwebsockets: switch away from github archive
  python-cpuset: switch away from github archive
  openh264: fix build for 32-bit intel arch
  openh264: switch away from github archive
  tinyalsa: switch away from github archive
  wolfssl: switch away from github archive
  ipcalc: switch away from github archive
  geoip-perl: switch away from github archive
  gtest: switch away from github archive

Yi Zhao (2):
  networkmanager: fix QA issue error for multilib
  networkmanager-openvpn: fix QA issue error for multilib

Zheng Ruoqin (2):
  hostapd: fix the bug for PATCHTOOL = "patch"
  xorgxrdp: Fix the License

leimaohui (1):
  python-lockfile: Fix build error as following:

texierp (1):
  minicoredumper: fixes for sysvinit and systemd

 .../gnome-keyring/gnome-keyring_3.20.0.bb          |   2 +-
 .../recipes-devtools/grubby/grubby_8.40.bb         |  10 +-
 .../recipes-multimedia/openh264/openh264_1.7.0.bb  |  16 +-
 .../recipes-multimedia/tinyalsa/tinyalsa_1.1.1.bb  |   6 +-
 .../gst-instruments/gst-instruments_0.2.3.bb       |  12 +-
 .../recipes-support/libsrtp/libsrtp_1.5.2.bb       |   6 +-
 .../networkmanager/networkmanager-openvpn_1.2.8.bb |   2 +-
 .../networkmanager/networkmanager_1.10.6.bb        |   4 +-
 .../recipes-connectivity/vlan/vlan_1.9.bb          |   6 +
 .../recipes-connectivity/wolfssl/wolfssl_3.12.0.bb |   9 +-
 meta-networking/recipes-daemons/radvd/radvd.inc    |   2 +-
 .../recipes-support/geoip/geoip-perl_1.50.bb       |  11 +-
 .../recipes-support/ipcalc/ipcalc_0.2.2.bb         |   7 +-
 .../libtevent/avoid-attr-unless-wanted.patch       |  18 +-
 .../ntp/{ntp_4.2.8p10.bb => ntp_4.2.8p11.bb}       |   4 +-
 ...de-stdint.h-for-various-std-c99-int-types.patch |  25 -
 meta-oe/recipes-benchmark/iperf3/iperf3_3.2.bb     |   1 -
 .../use-base_libdir-instead-of-hardcoded-lib.patch |   2 +-
 .../phoronix-test-suite_7.8.0.bb                   |   5 +
 ...-Avoid-key-reinstallation-in-FT-handshake.patch | 177 ++++
 ...nstallation-of-an-already-in-use-group-ke.patch | 253 ++++++
 ...ection-of-GTK-IGTK-reinstallation-of-WNM-.patch | 187 ++++
 ...04-Prevent-installation-of-an-all-zero-TK.patch |  82 ++
 ...Fix-PTK-rekeying-to-generate-a-new-ANonce.patch |  67 ++
 .../0006-TDLS-Reject-TPK-TK-reconfiguration.patch  | 135 +++
 ...llow-multiple-Reassociation-Response-fram.patch |  85 ++
 .../hostapd/hostapd/key-replay-cve-multiple.patch  | 984 ---------------------
 .../recipes-connectivity/hostapd/hostapd_2.6.bb    |   8 +-
 .../krb5/krb5/etc/default/krb5-admin-server        |   4 +-
 .../krb5/krb5/krb5-admin-server.service            |   1 +
 .../krb5/krb5/krb5-kdc.service                     |   1 +
 meta-oe/recipes-connectivity/krb5/krb5_1.16.bb     |   5 +
 meta-oe/recipes-connectivity/libuv/libuv_1.11.0.bb |   8 +-
 .../libwebsockets/libwebsockets_2.1.0.bb           |   7 +-
 .../recipes-connectivity/obex/openobex_1.7.2.bb    |   2 +
 meta-oe/recipes-core/libxml/libxml++_2.40.1.bb     |   2 +-
 .../android-tools/android-tools_5.1.1.r37.bb       |  18 +-
 .../recipes-devtools/geany/geany-plugins_1.31.bb   |   1 +
 .../recipes-devtools/python/python-cpuset_1.5.7.bb |  11 +-
 meta-oe/recipes-extended/zram/zram/init            |   2 +-
 .../minicoredumper/files/minicoredumper.init       |   2 +-
 .../minicoredumper/files/minicoredumper.service    |   2 +-
 .../minicoredumper/minicoredumper_2.0.0.bb         |   4 +
 meta-oe/recipes-support/htop/htop_2.1.0.bb         |   2 +-
 .../recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb    |   2 +-
 meta-oe/recipes-test/gtest/gtest_1.8.0.bb          |   9 +-
 .../recipes-devtools/python/python-flask.inc       |   2 +-
 .../python/python-lockfile_0.12.2.bb               |   6 +
 .../python/python-robotframework.inc               |  11 +
 .../python/python-robotframework_3.0.2.bb          |   4 +
 .../xfce4-notifyd/xfce4-notifyd_0.4.2.bb           |   2 +-
 51 files changed, 1123 insertions(+), 1111 deletions(-)
 rename meta-networking/recipes-support/ntp/{ntp_4.2.8p10.bb => ntp_4.2.8p11.bb} (97%)
 delete mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/0001-include-stdint.h-for-various-std-c99-int-types.patch
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0001-hostapd-Avoid-key-reinstallation-in-FT-handshake.patch
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0002-Prevent-reinstallation-of-an-already-in-use-group-ke.patch
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0003-Extend-protection-of-GTK-IGTK-reinstallation-of-WNM-.patch
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0004-Prevent-installation-of-an-all-zero-TK.patch
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0005-Fix-PTK-rekeying-to-generate-a-new-ANonce.patch
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0006-TDLS-Reject-TPK-TK-reconfiguration.patch
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0007-FT-Do-not-allow-multiple-Reassociation-Response-fram.patch
 delete mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/key-replay-cve-multiple.patch

-- 
2.7.4


