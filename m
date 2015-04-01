Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6DA6660034
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Apr 2015 13:38:23 +0000 (UTC)
Received: by pdbni2 with SMTP id ni2so55433108pdb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Apr 2015 06:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=dogqAk/vf1m1IAluMPAHuKB5dWmk2uavh0N2hIP4sMo=;
	b=yQlzLN8eKtQ4vAMro3r1bOfof2+inR6IUKgwoLxOMNnsqO7QpY4cfMB1xS8HD1JyFA
	ani7cp/C+grXyYz/0X9kiUeWFgn4pYQvDunezWlv4+xXh/yRvX0If5Gyn9vfPL8yQW8p
	9ph9dLnwE8uL+csFPT2HUvv9XjuaiNVsV3r4FPPsVdcoVEUYJWRpjJ9utXNX5MrS9CfH
	tcU6FAC565bkmezfEuobuunRsoGUn01PlZ8QJMUZVc9twOssBvUx4iBIlJ9JvOSUoEsZ
	WbpkyZnXyYYWVIuGv95mMR1gRkCunR/JWiDEQsjc0nrYsvMyVOjI0ItB4QqDJ80f66Kb
	/5ew==
X-Received: by 10.66.234.2 with SMTP id ua2mr77721085pac.137.1427895504938;
	Wed, 01 Apr 2015 06:38:24 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id fk4sm2189601pbb.80.2015.04.01.06.38.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Apr 2015 06:38:23 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Wed,  1 Apr 2015 06:38:09 -0700
Message-Id: <cover.1427894535.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 00/20 V2][Dizzy-next]
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
X-List-Received-Date: Wed, 01 Apr 2015 13:38:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

please consider these changes for meta-openembedded dizzy-next

V2:
added two missing commits.

the Wireshark update is mainly security fixes. if anyone has an issue, these can be dropped.


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

Hongxu Jia (1):
  pimd: add do_install to pimd

Paul Eggleton (1):
  tmux: remove sed-native from DEPENDS

Philip Balister (5):
  python-pyqt: Update to 4.11.3.
  sip: Update to 4.14.2.
  anki: python-sip package replaces with just sip.
  sip: Split python into a new package for runtime support.
  python-pyqt : Move RDEPENDS on python-sip to PyQT.

Sven Ebenfeld (2):
  claws-mail: Fix SRC_URI
  pxaregs: Add source file and fix SRC_URI

Zhenhua Luo (1):
  python-pip: add python-distribute in RDEPENDS

 meta-networking/recipes-support/pimd/pimd_2.1.8.bb |    7 +
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
 22 files changed, 2147 insertions(+), 466 deletions(-)
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


