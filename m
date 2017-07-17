Return-Path: <stanley.cheong.kwan.phoong@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id ECF6477D3A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jul 2017 02:48:18 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jul 2017 19:48:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,372,1496127600"; d="scan'208";a="879545959"
Received: from phoongst-mobl2.png.intel.com ([10.221.22.197])
	by FMSMGA003.fm.intel.com with ESMTP; 16 Jul 2017 19:48:17 -0700
From: Stanley Phoong <stanley.cheong.kwan.phoong@intel.com>
To: OpenEmbedded Devel Mailing List <openembedded-devel@lists.openembedded.org>
Date: Mon, 17 Jul 2017 10:48:02 +0800
Message-Id: <1500259691-9782-1-git-send-email-stanley.cheong.kwan.phoong@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-openwrt][PATCH 0/9] Patch series for enabling Juci in Poky
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
X-List-Received-Date: Mon, 17 Jul 2017 02:48:19 -0000

This series of patches would help to enable Juci in Poky, it would
compile and build an image without issues, with Juci website installed.
Compatible with Poky master build.

Stanley Cheong Kwan, Phoong (9):
  Juci: fix missing openssl for Luci
  Juci: added dependency of luajit
  Juci: fixed gcc 7 issue
  Juci: fix uglify-js not found
  Juci: fix issue extraneous package and missing lessc
  Juci: replace yui-compressor with minify
  Juci: fix missing Juci website
  Juci: update Juci git to latest
  Juci: fix node_modules dependencies error

 recipes-core/juci/juci/0002-fix-bootstrap.patch    |  15 +++
 recipes-core/juci/juci/0003-fix-juci-compile.patch |  16 +++
 recipes-core/juci/juci/0004-makefile-local.patch   |  44 +++++++++
 recipes-core/juci/juci/0005-makefile-local.patch   |  47 +++++++++
 .../juci/juci/0006-package-json-update.patch       | 108 +++++++++++++++++++++
 recipes-core/juci/juci_git.bb                      |  22 ++++-
 recipes-core/juci/jucid/0001-gcc7-fix-jucid.patch  |  41 ++++++++
 recipes-core/juci/jucid_git.bb                     |   3 +-
 recipes-core/luci/luci_git.bb                      |   2 +-
 9 files changed, 292 insertions(+), 6 deletions(-)
 create mode 100644 recipes-core/juci/juci/0002-fix-bootstrap.patch
 create mode 100644 recipes-core/juci/juci/0003-fix-juci-compile.patch
 create mode 100644 recipes-core/juci/juci/0004-makefile-local.patch
 create mode 100644 recipes-core/juci/juci/0005-makefile-local.patch
 create mode 100644 recipes-core/juci/juci/0006-package-json-update.patch
 create mode 100644 recipes-core/juci/jucid/0001-gcc7-fix-jucid.patch

-- 
2.7.4


