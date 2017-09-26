Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id C964060049
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Sep 2017 11:09:31 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 26 Sep 2017 04:09:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,440,1500966000"; d="scan'208";a="153436264"
Received: from lmazlan-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.67.104])
	by orsmga005.jf.intel.com with ESMTP; 26 Sep 2017 04:09:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Sep 2017 00:08:49 +1300
Message-Id: <cover.1506424098.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
Subject: [meta-oe][PATCH 0/2] Add mraa/upm recipes from meta-refkit-core
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
X-List-Received-Date: Tue, 26 Sep 2017 11:09:31 -0000

Move in recipes from meta-refkit-core for the mraa I/O library and upm
sensor library.


The following changes since commit f841648657069051dffa1012a42eb1524b894d50:

  openwsman: Fix build with musl (2017-09-22 22:56:13 +0000)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/mraa
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=paule/mraa

Paul Eggleton (2):
  mraa: move recipe from meta-refkit-core
  upm: add recipe from meta-refkit-core

 meta-oe/recipes-extended/mraa/mraa_git.bb          | 48 +++++++++++++++++++
 ...15-fixed-case-logic-in-getThresh-function.patch | 54 ++++++++++++++++++++++
 meta-oe/recipes-extended/upm/upm_git.bb            | 42 +++++++++++++++++
 3 files changed, 144 insertions(+)
 create mode 100644 meta-oe/recipes-extended/mraa/mraa_git.bb
 create mode 100644 meta-oe/recipes-extended/upm/files/ads1x15-fixed-case-logic-in-getThresh-function.patch
 create mode 100644 meta-oe/recipes-extended/upm/upm_git.bb

-- 
2.9.5


