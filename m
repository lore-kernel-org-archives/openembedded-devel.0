Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id C4640731DB
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2016 00:59:52 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id uo6so284894160pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2016 16:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=z0Hvqkz9+NK2e/7FGE+QzBl/oHT5/yeZwC4kcowIOww=;
	b=yILWrpX7x81Hef4XQ4GuR/UiUxDoWlzgE1O0iRwg/leEKx7npI5yH1mrFS30/EqimX
	jI+G+EDfzqJwQ31E69V+pL0mgtXNMP1YRCJS2ib7kREpBjDNNCIeEMvOT3YYk8QRA7Y5
	WKX/5UcMm7a9ZoIaerbzXPgbfzQnAUSqg0tyxE0ugdhESZvKmTzTPMXVVBSCl/q0yOBx
	WI6R6JO283FqZ0onk8AU66VL8FZOARA3mUCns7lkLgD8vPB8RBDd7hSz565/gy9N5vlH
	9btOs2Qvl6BkxFr2qMWab9mgy5mPKutp/plaCJyuxv21Nbf+tpFwiK81f3kA8KUPcsp1
	7Umg==
X-Received: by 10.66.117.199 with SMTP id kg7mr170998535pab.105.1452387593055; 
	Sat, 09 Jan 2016 16:59:53 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	i76sm13766912pfj.68.2016.01.09.16.59.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 16:59:52 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 4A99DFCC838; Sat,  9 Jan 2016 16:59:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Jan 2016 16:59:23 -0800
Message-Id: <cover.1452386602.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 00/22] Jethro-next pull request 2016-2
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
X-List-Received-Date: Sun, 10 Jan 2016 00:59:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please consider these changes for Jethro-next

The following changes since commit 26eefaedfe82512b1db57c6fb8ca7bd1a6bc97d4:

  tcpdump: add PACKAGECONFIG for libcap-ng (2015-12-30 13:06:00 +0100)

are available in the git repository at:

  git://github.com/akuster/meta-openembedded akuster/jethro-next
  https://github.com/akuster/meta-openembedded/tree/akuster/jethro-next

Andre McCurdy (4):
  mpg123: add textrel to INSANE_SKIP
  opencv: sort PACKAGECONFIG options
  opencv: limit ARM_INSTRUCTION_SET = "arm" over-ride to armv4/armv5
  opencv: support machines based on oe-core tune-corei7.inc

Andrea Adami (1):
  kexec-tools-klibc: add explicit SRC_URI

Armin Kuster (3):
  gnome-desktop: Fix QA issue
  fltk: fix build issue.
  fltk: Fix license warning

Chris Patterson (3):
  strongswan: add additional PACKAGECONFIG flags
  strongswan: add configure patch fix for systemd
  strongswan: install strongswan-swanctl systemd service by default.

Jagadeesh Krishnanjanappa (1):
  iscsitarget: resolve build error if CONFIG_IPV6 config is not enabled

Jens Rehsack (1):
  samba: fix typo distinguishing between plain sysv init and lsb init

Jose Alarcon (3):
  contrib: ensure that oe-stylize.py works with python versions < 3.0
  contrib: add missing common OE variables
  contrib: print oldline within single quotes

Kai Kang (2):
  edac-utils: add patches for initscript
  iperf3: fix build-deps qa warning

Rafaël Carré (2):
  VLC: PACKAGECONFIG for new dependency on libvncserver
  VLC: depend on jpeg rather than libjpeg-turbo

Yi Zhao (1):
  polkit-gnome: remove unrecognized configure options

mike.looijmans@topic.nl (1):
  samba: Fix typo in PACKAGECONFIG for "acl" and "aio"

 contrib/oe-stylize.py                              |  9 +-
 .../gnome-desktop/gnome-desktop_2.32.1.bb          |  2 +-
 .../kexec/kexec-tools-klibc_2.0.2.bb               |  2 +
 .../recipes-multimedia/mpg123/mpg123_1.21.0.bb     |  4 +
 meta-multimedia/recipes-multimedia/vlc/vlc.inc     |  3 +-
 .../recipes-connectivity/samba/samba_4.1.12.bb     |  6 +-
 .../access-sk_v6_daddr-iff-IPV6-defined.patch      | 28 +++++++
 .../iscsitarget/iscsitarget_1.4.20.3+svn502.bb     |  1 +
 .../files/install-strongswan-swanctl-service.patch | 22 +++++
 .../strongswan/files/support-newer-systemd.patch   | 69 +++++++++++++++
 .../recipes-support/strongswan/strongswan_5.3.2.bb | 26 ++++--
 meta-oe/licenses/FLTK                              | 43 ++++++++++
 meta-oe/recipes-benchmark/iperf3/iperf3_git.bb     |  3 +
 .../recipes-extended/polkit/polkit-gnome_0.105.bb  |  4 -
 .../recipes-support/edac-utils/edac-utils_git.bb   | 19 +++--
 .../files/add-restart-to-initscript.patch          | 33 ++++++++
 ...cript-be-able-to-automatically-load-EDAC-.patch | 98 ++++++++++++++++++++++
 .../fltk/fltk-1.1.10/Fl_JPEG_Image_buildix.patch   | 37 ++++++++
 meta-oe/recipes-support/fltk/fltk_1.1.10.bb        |  1 +
 meta-oe/recipes-support/opencv/opencv_2.4.bb       | 10 ++-
 meta-oe/recipes-support/opencv/opencv_3.0.bb       | 20 +++--
 21 files changed, 406 insertions(+), 34 deletions(-)
 create mode 100644 meta-networking/recipes-extended/iscsitarget/files/access-sk_v6_daddr-iff-IPV6-defined.patch
 create mode 100644 meta-networking/recipes-support/strongswan/files/install-strongswan-swanctl-service.patch
 create mode 100644 meta-networking/recipes-support/strongswan/files/support-newer-systemd.patch
 create mode 100644 meta-oe/licenses/FLTK
 create mode 100644 meta-oe/recipes-support/edac-utils/files/add-restart-to-initscript.patch
 create mode 100644 meta-oe/recipes-support/edac-utils/files/make-init-script-be-able-to-automatically-load-EDAC-.patch
 create mode 100644 meta-oe/recipes-support/fltk/fltk-1.1.10/Fl_JPEG_Image_buildix.patch

-- 
1.9.1


