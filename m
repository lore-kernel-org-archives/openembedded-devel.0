Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 6217377794
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 01:36:40 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP; 02 Oct 2017 18:36:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,471,1500966000"; d="scan'208";a="158624939"
Received: from imakwana-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.142.79])
	by fmsmga006.fm.intel.com with ESMTP; 02 Oct 2017 18:36:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Oct 2017 08:40:08 +1300
Message-Id: <cover.1506973045.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
Subject: [meta-oe][PATCH v2 0/2] Add mraa/upm recipes from meta-refkit-core
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
X-List-Received-Date: Tue, 03 Oct 2017 01:36:41 -0000

Move in recipes from meta-refkit-core for the mraa I/O library and upm
sensor library.

Changes since v1:
* Set COMPATIBLE_HOST based upon what mraa's CMakeLists.txt checks for


The following changes since commit 06e8aa6bda49b4c103dcb41b059e3dba168ee37a:

  mongodb: Fix build on aarch64 (2017-10-02 12:35:39 +0000)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/mraa
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=paule/mraa

Paul Eggleton (2):
  mraa: move recipe from meta-refkit-core
  upm: add recipe from meta-refkit-core

 meta-oe/recipes-extended/mraa/mraa_git.bb          | 51 ++++++++++++++++++++
 ...15-fixed-case-logic-in-getThresh-function.patch | 54 ++++++++++++++++++++++
 meta-oe/recipes-extended/upm/upm_git.bb            | 45 ++++++++++++++++++
 3 files changed, 150 insertions(+)
 create mode 100644 meta-oe/recipes-extended/mraa/mraa_git.bb
 create mode 100644 meta-oe/recipes-extended/upm/files/ads1x15-fixed-case-logic-in-getThresh-function.patch
 create mode 100644 meta-oe/recipes-extended/upm/upm_git.bb

-- 
2.9.5


