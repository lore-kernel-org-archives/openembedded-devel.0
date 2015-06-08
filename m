Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id F2E677579D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jun 2015 22:43:48 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 08 Jun 2015 15:43:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,576,1427785200"; d="scan'208";a="505105195"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Jun 2015 15:43:48 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Jun 2015 15:42:37 +0000
Message-Id: <cover.1433777512.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [meta-oe][PATCH 0/3][dizzy] several backports for iot-devkit compatibility
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
X-List-Received-Date: Mon, 08 Jun 2015 22:43:49 -0000

I would like to include these backports from [master] on [dizzy] for compatibility with iot-devkit

The packages to be backported/upgraded are:

libftdi
lirc
p7zip


The following changes since commit 5b6f39ce325d490fc382d5d59c5b8b9d5fa38b38:

  gsoap: fold .inc and -native into one recipe (2015-04-29 19:24:09 +0200)


Alejandro Hernandez (3):
  libftdi: backport to dizzy for compatibility with iot-devkit
  lirc: backport to dizzy for compatibility with iot-devkit
  p7zip: backport to dizzy for compatibility with iot-devkit

 meta-oe/recipes-connectivity/lirc/lirc.inc         |   14 +
 .../recipes-connectivity/lirc/lirc/lirc.tmpfiles   |    1 +
 .../lirc/lirc/lirc_options.conf                    |   24 +
 meta-oe/recipes-connectivity/lirc/lirc/lircd.conf  |  315 +
 meta-oe/recipes-connectivity/lirc/lirc/lircd.init  |   40 +
 .../recipes-connectivity/lirc/lirc/lircd.service   |   20 +
 .../recipes-connectivity/lirc/lirc/lircexec.init   |   37 +
 meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb    |   69 +
 ...do_not_override_compiler_and_do_not_strip.patch |   31 +
 meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb     |   17 +
 .../libftdi/libftdi-0.19/libtool-m4.patch          | 7377 --------------------
 meta-oe/recipes-support/libftdi/libftdi_0.19.bb    |   31 -
 meta-oe/recipes-support/libftdi/libftdi_1.1.bb     |   29 +
 13 files changed, 597 insertions(+), 7408 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/lirc/lirc.inc
 create mode 100644 meta-oe/recipes-connectivity/lirc/lirc/lirc.tmpfiles
 create mode 100644 meta-oe/recipes-connectivity/lirc/lirc/lirc_options.conf
 create mode 100644 meta-oe/recipes-connectivity/lirc/lirc/lircd.conf
 create mode 100644 meta-oe/recipes-connectivity/lirc/lirc/lircd.init
 create mode 100644 meta-oe/recipes-connectivity/lirc/lirc/lircd.service
 create mode 100644 meta-oe/recipes-connectivity/lirc/lirc/lircexec.init
 create mode 100644 meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb
 create mode 100644 meta-oe/recipes-extended/p7zip/files/do_not_override_compiler_and_do_not_strip.patch
 create mode 100644 meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb
 delete mode 100644 meta-oe/recipes-support/libftdi/libftdi-0.19/libtool-m4.patch
 delete mode 100644 meta-oe/recipes-support/libftdi/libftdi_0.19.bb
 create mode 100644 meta-oe/recipes-support/libftdi/libftdi_1.1.bb

-- 
1.8.4.5


