Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TdJWM-0004ex-3l
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 12:40:10 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Nov 2012 03:25:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,328,1352102400"; d="scan'208";a="224990783"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.231])
	by orsmga001.jf.intel.com with ESMTP; 27 Nov 2012 03:25:55 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Nov 2012 11:25:45 +0000
Message-Id: <cover.1354015335.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-networking][PATCH v3 0/8] Networking recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Nov 2012 11:40:10 -0000

Since v2, address feedback from Aws Ismail and fix one other issue I
noticed:
* quagga: don't use -A with single watch daemon in watchquagga config
* quagga: use correct D_PATH /usr/sbin in initscript
* quagga: set PATH in initscript to have sbin dirs first as per comment


The following changes since commit e4236266b7ac6103e4b9400eb51b5cb0037f3ba9:

  hiawatha: add CONFFILES and a php example (2012-11-27 10:48:24 +0000)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/networking
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/networking

Paul Eggleton (8):
  tftp-hpa: add from OE-Classic, update and tidy up
  tunctl: add from OE-Classic and tweak
  quagga: add from OE-Classic, update and tidy-up
  radvd: add from OE-Classic, update and tidy up
  vblade: add from OE-Classic, update and tidy up
  xl2tpd: add from OE-Classic, update and tidy up
  proftpd: add from meta-baryon
  mtr: add from OE-Classic, update and tidy up

 .../recipes-daemons/proftpd/files/basic.conf.patch |   21 ++
 .../recipes-daemons/proftpd/files/contrib.patch    |   42 ++++
 .../recipes-daemons/proftpd/files/default          |    9 +
 .../recipes-daemons/proftpd/files/make.patch       |   66 ++++++
 .../proftpd/files/proftpd-basic.init               |  220 ++++++++++++++++++++
 .../recipes-daemons/proftpd/proftpd_1.3.4b.bb      |   66 ++++++
 .../recipes-daemons/radvd/files/radvd.init         |  124 +++++++++++
 .../recipes-daemons/radvd/files/volatiles.03_radvd |    2 +
 meta-networking/recipes-daemons/radvd/radvd.inc    |   42 ++++
 .../recipes-daemons/radvd/radvd_1.9.1.bb           |    6 +
 .../recipes-daemons/tftp-hpa/files/default         |    3 +
 .../recipes-daemons/tftp-hpa/files/init            |  104 +++++++++
 .../tftp-hpa/files/tftp-0.40-remap.patch           |   25 +++
 .../tftp-hpa/files/tftp-0.42-tftpboot.patch        |   60 ++++++
 .../tftp-hpa/files/tftp-0.49-chk_retcodes.patch    |   21 ++
 .../tftp-hpa/files/tftp-0.49-cmd_arg.patch         |  165 +++++++++++++++
 .../tftp-hpa/files/tftp-hpa-0.39-tzfix.patch       |   24 +++
 .../files/tftp-hpa-0.49-fortify-strcpy-crash.patch |   32 +++
 .../tftp-hpa/files/tftp-hpa-0.49-stats.patch       |   20 ++
 .../tftp-hpa/files/tftp-hpa-5.2-pktinfo.patch      |   29 +++
 .../recipes-daemons/tftp-hpa/files/tftp-xinetd     |   18 ++
 .../recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb       |   71 +++++++
 .../recipes-daemons/vblade/files/cross.patch       |   16 ++
 .../recipes-daemons/vblade/vblade_20.bb            |   20 ++
 .../quagga/files/fix-for-lib-inpath.patch          |   19 ++
 .../quagga/files/quagga-0.99.17-libcap.patch       |   64 ++++++
 .../recipes-protocols/quagga/files/quagga.default  |   13 ++
 .../recipes-protocols/quagga/files/quagga.init     |  200 ++++++++++++++++++
 .../quagga/files/volatiles.03_quagga               |    3 +
 .../quagga/files/watchquagga.default               |    7 +
 .../quagga/files/watchquagga.init                  |   64 ++++++
 .../recipes-protocols/quagga/quagga.inc            |  153 ++++++++++++++
 .../recipes-protocols/quagga/quagga_0.99.21.bb     |    8 +
 .../xl2tpd/xl2tpd-1.3.1/cflags.patch               |   58 ++++++
 .../recipes-protocols/xl2tpd/xl2tpd.inc            |   40 ++++
 .../recipes-protocols/xl2tpd/xl2tpd_1.3.1.bb       |    8 +
 .../recipes-support/mtr/files/no-gtk.patch         |   31 +++
 meta-networking/recipes-support/mtr/mtr_0.82.bb    |   19 ++
 meta-networking/recipes-support/tunctl/tunctl.inc  |   15 ++
 .../recipes-support/tunctl/tunctl_1.5.bb           |    4 +
 40 files changed, 1912 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/proftpd/files/basic.conf.patch
 create mode 100644 meta-networking/recipes-daemons/proftpd/files/contrib.patch
 create mode 100644 meta-networking/recipes-daemons/proftpd/files/default
 create mode 100644 meta-networking/recipes-daemons/proftpd/files/make.patch
 create mode 100644 meta-networking/recipes-daemons/proftpd/files/proftpd-basic.init
 create mode 100644 meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
 create mode 100755 meta-networking/recipes-daemons/radvd/files/radvd.init
 create mode 100644 meta-networking/recipes-daemons/radvd/files/volatiles.03_radvd
 create mode 100644 meta-networking/recipes-daemons/radvd/radvd.inc
 create mode 100644 meta-networking/recipes-daemons/radvd/radvd_1.9.1.bb
 create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/default
 create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/init
 create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.40-remap.patch
 create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.42-tftpboot.patch
 create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.49-chk_retcodes.patch
 create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.49-cmd_arg.patch
 create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-0.39-tzfix.patch
 create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-0.49-fortify-strcpy-crash.patch
 create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-0.49-stats.patch
 create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-5.2-pktinfo.patch
 create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/tftp-xinetd
 create mode 100644 meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
 create mode 100644 meta-networking/recipes-daemons/vblade/files/cross.patch
 create mode 100644 meta-networking/recipes-daemons/vblade/vblade_20.bb
 create mode 100644 meta-networking/recipes-protocols/quagga/files/fix-for-lib-inpath.patch
 create mode 100644 meta-networking/recipes-protocols/quagga/files/quagga-0.99.17-libcap.patch
 create mode 100644 meta-networking/recipes-protocols/quagga/files/quagga.default
 create mode 100644 meta-networking/recipes-protocols/quagga/files/quagga.init
 create mode 100644 meta-networking/recipes-protocols/quagga/files/volatiles.03_quagga
 create mode 100644 meta-networking/recipes-protocols/quagga/files/watchquagga.default
 create mode 100644 meta-networking/recipes-protocols/quagga/files/watchquagga.init
 create mode 100644 meta-networking/recipes-protocols/quagga/quagga.inc
 create mode 100644 meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb
 create mode 100644 meta-networking/recipes-protocols/xl2tpd/xl2tpd-1.3.1/cflags.patch
 create mode 100644 meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
 create mode 100644 meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.1.bb
 create mode 100644 meta-networking/recipes-support/mtr/files/no-gtk.patch
 create mode 100644 meta-networking/recipes-support/mtr/mtr_0.82.bb
 create mode 100644 meta-networking/recipes-support/tunctl/tunctl.inc
 create mode 100644 meta-networking/recipes-support/tunctl/tunctl_1.5.bb

-- 
1.7.9.5



