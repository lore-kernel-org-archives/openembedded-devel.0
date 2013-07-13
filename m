Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EDD9A6A465
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Jul 2013 14:47:37 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Jul 2013 07:45:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,659,1367996400"; d="scan'208";a="345067067"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.68])
	by orsmga001.jf.intel.com with ESMTP; 13 Jul 2013 07:47:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Jul 2013 15:47:20 +0100
Message-Id: <cover.1373726565.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-oe][PATCH 0/3] Add mosh and dependencies
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
X-List-Received-Date: Sat, 13 Jul 2013 14:47:38 -0000

Add a recipe for mosh, and for dependencies migrate libio-pty-perl from
OE-Classic and bring in protobuf from meta-virtualization.

I considered putting this in meta-networking, however meta-virtualization
will still need protobuf and it already depends on meta-oe, and officially
meta-networking does not depend on meta-oe so splitting these would not
really work with the current layer dependencies.


The following changes since commit c383d6230942bb1558cee02764bced09031cb70f:

  llvm3.3: Add zlib dependency and explicitly enable it (2013-07-12 12:12:09 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/mosh
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/mosh

Paul Eggleton (3):
  protobuf: add recipe from meta-virtualization and tweak
  libio-pty-perl: add from OE-Classic and update
  mosh: add new recipe for version 1.2.4

 meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb    | 29 ++++++++++++++++++++++
 .../recipes-devtools/perl/libio-pty-perl_1.10.bb   | 14 +++++++++++
 .../recipes-devtools/protobuf/protobuf_2.4.1.bb    | 20 +++++++++++++++
 3 files changed, 63 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
 create mode 100644 meta-oe/recipes-devtools/perl/libio-pty-perl_1.10.bb
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf_2.4.1.bb

-- 
1.8.1.2


