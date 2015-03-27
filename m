Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4C8EC72B1E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Mar 2015 03:27:06 +0000 (UTC)
Received: by pdbop1 with SMTP id op1so82739642pdb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Mar 2015 20:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=7JYkmaxsgZ3qOMsMvjyF0VPRSZBhfAhynzsQJKC7Kpw=;
	b=NEqy6Ajg7WBFUi9UuKg8fssUSnqKp3WkMW8++x3Ryx/bwtlBlTzF4CNp40lEdqct4y
	tDC4o+UaWGGSCs5QTwDrYNeRNk1x3O1eX0CFV+CCvFpZVTlmiXn8aa4oovCxdlRWDqdW
	XEggpeGwefsr21NJed93JWP0MM2phu9wU42TnE7cGAvDoLuowkj3GUDnmUtIeeOKnFm9
	vTFPl5p6YpP+xy/RZ1OdrSK0Evi4cPeH6lCZArXK+wFgmP3AVPkw18a1fnNxKeTu9hw8
	EaD5YxlErrRInTrwbOfZsAeY5d+C+nAdg9myg7Yffka/Yn4+koOIW+6MsoxxaGHQ6J5n
	Levg==
X-Received: by 10.70.15.67 with SMTP id v3mr31377158pdc.166.1427426827194;
	Thu, 26 Mar 2015 20:27:07 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id zi5sm483452pbc.39.2015.03.26.20.27.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 Mar 2015 20:27:06 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Thu, 26 Mar 2015 20:26:59 -0700
Message-Id: <cover.1427426569.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 00/18] Dizzy pull request
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Mar 2015 03:27:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please consider this changes for meta-openembedded dizzy-next

The following changes since commit 853dcfa0d618dc26bd27b3a1b49494b98d6eee97:

  rsyslog: fix name of syslogd ua group (2015-03-03 21:13:17 +0100)

are available in the git repository at:

  https://github.com/akuster/meta-openembedded akuster/dizzy-next
  https://github.com//tree/akuster/dizzy-next

Andre McCurdy (1):
  log4c: fix undeclared dependency on expat

Andreas Müller (1):
  samba: add mirrors

Armin Kuster (4):
  wireshark: update to 1.12.3
  wireshark: fix rdepends issue
  wireshark: fix pcap-config issue
  wireshark: update to 12.4

Ash Charles (2):
  xfce4-xkb-plugin: Specify GPLv2 license
  xfce4-diskperf-plugin: Specify BSD license

Bian Naimeng (1):
  xbitmaps: fix build warning.

Dan McGregor (1):
  lxdm: RDEPEND on libsvg-gtk

Paul Eggleton (1):
  tmux: remove sed-native from DEPENDS

Philip Balister (4):
  python-pyqt: Update to 4.11.3.
  sip: Update to 4.14.2.
  anki: python-sip package replaces with just sip.
  sip: Split python into a new package for runtime support.

Sven Ebenfeld (2):
  claws-mail: Fix SRC_URI
  pxaregs: Add source file and fix SRC_URI

Zhenhua Luo (1):
  python-pip: add python-distribute in RDEPENDS

 .../{wireshark_1.12.2.bb => wireshark_1.12.4.bb}   |   19 +-
 meta-oe/recipes-connectivity/samba/samba.inc       |    9 +-
 .../python/python-pyqt-4.9.6/pyqt-generated.patch  |   12 -
 .../python-pyqt-4.9.6/qreal_float_support.diff     |  248 ---
 .../recipes-devtools/python/python-pyqt_4.11.3.bb  |   54 +
 .../recipes-devtools/python/python-pyqt_4.9.6.bb   |  103 -
 .../recipes-devtools/python/python-sip_4.14.2.bb   |   46 -
 meta-oe/recipes-extended/anki/anki_0.4.3.bb        |    2 +-
 meta-oe/recipes-extended/sip/sip-native_4.14.2.bb  |   35 -
 meta-oe/recipes-extended/sip/sip_4.16.4.bb         |   52 +
 meta-oe/recipes-extended/tmux/tmux_1.6.bb          |    2 +-
 meta-oe/recipes-graphics/lxdm/lxdm_git.bb          |    2 +-
 .../recipes-graphics/xorg-data/xbitmaps_1.1.1.bb   |    1 +
 .../recipes-sato/claws-mail/claws-mail_3.9.0.bb    |    2 +-
 .../log4c/log4c/fix_configure_with-expat.patch     |   21 +
 meta-oe/recipes-support/log4c/log4c_1.2.4.bb       |   13 +-
 .../recipes-support/pxaregs/pxaregs-1.14/pxaregs.c | 1975 ++++++++++++++++++++
 meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb    |    4 +-
 .../recipes-devtools/python/python-pip_1.3.1.bb    |    2 +-
 .../diskperf/xfce4-diskperf-plugin_2.5.4.bb        |    2 +-
 .../xkb/xfce4-xkb-plugin_0.7.0.bb                  |    2 +-
 21 files changed, 2140 insertions(+), 466 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_1.12.2.bb => wireshark_1.12.4.bb} (63%)
 delete mode 100644 meta-oe/recipes-devtools/python/python-pyqt-4.9.6/pyqt-generated.patch
 delete mode 100644 meta-oe/recipes-devtools/python/python-pyqt-4.9.6/qreal_float_support.diff
 create mode 100644 meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb
 delete mode 100644 meta-oe/recipes-devtools/python/python-pyqt_4.9.6.bb
 delete mode 100644 meta-oe/recipes-devtools/python/python-sip_4.14.2.bb
 delete mode 100644 meta-oe/recipes-extended/sip/sip-native_4.14.2.bb
 create mode 100644 meta-oe/recipes-extended/sip/sip_4.16.4.bb
 create mode 100644 meta-oe/recipes-support/log4c/log4c/fix_configure_with-expat.patch
 create mode 100644 meta-oe/recipes-support/pxaregs/pxaregs-1.14/pxaregs.c

-- 
1.9.1


