Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id AC07872A2D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Apr 2015 15:46:26 +0000 (UTC)
Received: by pdea3 with SMTP id a3so48061421pde.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Apr 2015 08:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=mqYqfRa5mw5gndwnhwcnWPzL1zZjKTpxWBQwU6W0mZ0=;
	b=J+gsHqmRaTHF+SwAgRyhGf+rTDCXBlY90dsmKkGkUlV+CgRmI4bS9RaMByew4hehhw
	WZec4y2/IqFxa7O494JYX1e+Yley5vIvJb4g0WlZhIhyAfbgc7a4hP7ig1HaLWvjW9uu
	9sR5xbZK4q27sDvYGlLo/xgEVjFolRjukP4GZv5H32GguYjds9G0fiEHyHV7fAKEo7Uh
	g5o2En/+TLI51YyS+KTEmuDH3Itha+TcCU3wSYHu79EfXBHfiTfMrWhNbgEUR6gSSLbo
	y81o6pDxYagiCkTAWbojIcbQtX6+uzJUOGIdehHhsZMu53ji31vZO0xHEnlgyvKlRRaF
	g+2A==
X-Received: by 10.70.131.76 with SMTP id ok12mr28204198pdb.155.1428335187435; 
	Mon, 06 Apr 2015 08:46:27 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id kn7sm5133759pab.10.2015.04.06.08.46.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Apr 2015 08:46:25 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Mon,  6 Apr 2015 08:46:11 -0700
Message-Id: <cover.1428334829.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH 00/33 v2][master] meta-oe misc build fixes
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
X-List-Received-Date: Mon, 06 Apr 2015 15:46:29 -0000

V2: downgrade fingerterm back to original 1.0.2, 1.1.14 required qt5.

please consider these misc build fixes for meta-oe. I hope there are not too many dups in the pipe line. I could not tell.

Also I have moved a few recipes out of meta-oe as they have depends on other layers.

The following changes since commit df6c7b1279790d27ebfd58fbdfbac89bde5782ec:

  python-pyopenssl: Upgrade to 0.14 (2015-03-21 16:42:30 +0100)

are available in the git repository at:

  git://github.com/akuster/meta-openembedded.git akuster/build_fixes
  https://github.com//tree/akuster/build_fixes

Armin Kuster (33):
  daq: move recipe to meta-networking
  opencv: build issue
  collectd: fix world build issue
  libgxim: fix world build issues
  networkmanger: meta-oe world build failes
  fingerterm: update SRC_URI
  protbuf: update update and build fix
  serial-forward: fix fetch error
  dialog: update SRC_URI
  xterm: fix issue with SRC_URI
  ckermit: update SRC_URI
  lirc: fix QA warnings
  hplib: fix QA warnings
  udisks: fix QA warnings
  lio-utils: fix QA warnings
  pm-qa: Fix QA warnings
  gateone: Fix QA warnings
  rarpd: Fix QA warnings
  syslog-ng: Fix QA warnings
  pscs-lite: Fix QA warnings
  fbida: Fix QA warnings
  qt-creator: Fix QA warnings
  fio: Fix QA warnings
  foxtrotgps: Fix QA warnings
  usbpath: Fix QA warnings
  wvstreams: Fix QA warnings
  pksc11-helper: Fix QA warnings
  lmsensors-config: Fix QA warnings
  libutempter: update SRC_URI
  gammu: Fix QA warnings
  mosh: Fix QA warnings
  numactl: Fix QA warnings
  packagekit: Fix QA warnings

 .../recipes-connectivity/daq/daq_2.0.2.bb          |  0
 ...le-run-test-program-while-cross-compiling.patch |  0
 ...c-Check-only-for-libsystemd-not-libsystem.patch |  0
 ...o-run-sbin-dhclient-to-get-the-version-nu.patch |  0
 .../networkmanager/networkmanager_0.9.8.10.bb      |  0
 meta-oe/recipes-benchmark/fio/fio_2.2.6.bb         |  2 +-
 meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb |  3 ++
 .../recipes-connectivity/gateone/gateone_git.bb    |  1 +
 meta-oe/recipes-connectivity/lirc/lirc.inc         |  2 +-
 meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb    |  1 +
 meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb    |  2 +-
 .../recipes-connectivity/wvdial/wvstreams_4.6.1.bb |  1 +
 .../packagekit/packagekit_0.5.6.bb                 |  9 +++---
 meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb        |  1 +
 .../{protobuf_2.5.0.bb => protobuf_2.6.1.bb}       | 13 +++++----
 .../recipes-extended/collectd/collectd_5.4.1.bb    |  3 +-
 meta-oe/recipes-extended/dialog/dialog.inc         |  2 +-
 meta-oe/recipes-extended/hplip/hplip_3.12.6.bb     |  3 +-
 meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb   |  2 ++
 meta-oe/recipes-graphics/fbida/fbida_git.bb        |  2 +-
 meta-oe/recipes-graphics/xorg-app/xterm_303.bb     |  2 +-
 .../foxtrotgps/foxtrotgps_1.1.1.bb                 |  1 +
 .../{fingerterm_1.0.2.bb => fingerterm.bb}         | 34 ++++++++++------------
 meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb  |  2 ++
 meta-oe/recipes-support/ckermit/ckermit_302.bb     |  4 +--
 .../{libutempter_1.1.6.bb => libutempter.bb}       | 11 ++++---
 meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb |  3 +-
 .../lm_sensors/lmsensors-config_1.0.bb             |  2 +-
 meta-oe/recipes-support/numactl/numactl_2.0.9.bb   |  2 ++
 .../recipes-support/opencv/opencv-samples_2.4.bb   |  3 ++
 meta-oe/recipes-support/opencv/opencv_2.4.bb       |  2 ++
 .../recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb   |  1 +
 .../pkcs11-helper/pkcs11-helper_1.11.bb            |  2 +-
 .../serial-utils/serial-forward_git.bb             |  2 +-
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |  2 +-
 meta-oe/recipes-support/udisks/udisks_1.0.4.bb     |  2 +-
 meta-oe/recipes-support/usbpath/usbpath_svn.bb     |  2 ++
 ...CAL_AMFLAGS-isnot-supported-by-autoreconf.patch |  0
 .../recipes-extended/libgxim/libgxim_0.5.0.bb      |  0
 39 files changed, 75 insertions(+), 49 deletions(-)
 rename {meta-oe => meta-networking}/recipes-connectivity/daq/daq_2.0.2.bb (100%)
 rename {meta-oe => meta-networking}/recipes-connectivity/daq/files/disable-run-test-program-while-cross-compiling.patch (100%)
 rename {meta-oe => meta-networking}/recipes-connectivity/networkmanager/networkmanager/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch (100%)
 rename {meta-oe => meta-networking}/recipes-connectivity/networkmanager/networkmanager/0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch (100%)
 rename {meta-oe => meta-networking}/recipes-connectivity/networkmanager/networkmanager_0.9.8.10.bb (100%)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_2.5.0.bb => protobuf_2.6.1.bb} (56%)
 rename meta-oe/recipes-qt/fingerterm/{fingerterm_1.0.2.bb => fingerterm.bb} (56%)
 rename meta-oe/recipes-support/libutempter/{libutempter_1.1.6.bb => libutempter.bb} (79%)
 rename {meta-oe => meta-ruby}/recipes-extended/libgxim/libgxim/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch (100%)
 rename {meta-oe => meta-ruby}/recipes-extended/libgxim/libgxim_0.5.0.bb (100%)

-- 
2.3.5


