Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A0A797D6C5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2019 02:50:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Jul 2019 19:50:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,492,1557212400"; d="scan'208";a="172100799"
Received: from lduttal-mobl.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.187.17])
	by orsmga006.jf.intel.com with ESMTP; 14 Jul 2019 19:50:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Jul 2019 14:50:05 +1200
Message-Id: <cover.1563158872.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 0/1] picocom: update to 3.1
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
X-List-Received-Date: Mon, 15 Jul 2019 02:50:37 -0000
Content-Transfer-Encoding: 8bit

Changes since v1:
 * Rebase
 * Fix musl build on x86 - somewhat hackily, but it does now build.

The following changes since commit e71751bf3cd209f07b986bb2c6289902546d3666:

  wvdial: Fix build with musl (2019-07-13 23:28:06 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/upgrades4
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=paule/upgrades4

Paul Eggleton (1):
  picocom: update to 3.1

 .../picocom/0001-Fix-building-with-musl.patch | 118 ++++++++++++++++++
 .../recipes-support/picocom/picocom_git.bb    |  12 +-
 2 files changed, 125 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-support/picocom/picocom/0001-Fix-building-with-musl.patch

-- 
2.20.1


