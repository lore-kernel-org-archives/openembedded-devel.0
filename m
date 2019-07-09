Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 99B987E9AD
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jul 2019 12:38:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Jul 2019 05:38:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,470,1557212400"; d="scan'208";a="170580949"
Received: from chiajenx-mobl.ccr.corp.intel.com (HELO localhost.localdomain)
	([10.249.72.228])
	by orsmga006.jf.intel.com with ESMTP; 09 Jul 2019 05:38:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Jul 2019 00:38:31 +1200
Message-Id: <cover.1562675891.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 0/3] Recipe upgrades
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
X-List-Received-Date: Tue, 09 Jul 2019 12:38:46 -0000
Content-Transfer-Encoding: 8bit

The following changes since commit 64974b8779291419486338f75f229a732e450d78:

  xfce4-screensaver: 0.1.4 -> 0.1.5 (2019-06-21 06:22:19 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/upgrades4
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=paule/upgrades4

Paul Eggleton (3):
  mraa: update to 2.0.0
  upm: update to 2.0.0
  picocom: update to 3.1

 meta-oe/recipes-extended/mraa/mraa_git.bb     |   4 +-
 .../0001-Replace-strncpy-with-memcpy.patch    |  49 ------
 .../upm/upm/0001-Use-stdint-types.patch       | 139 ++++++++++++++++++
 ...lude-sys-types.h-for-uint-definition.patch |  33 -----
 meta-oe/recipes-extended/upm/upm_git.bb       |   7 +-
 .../recipes-support/picocom/picocom_git.bb    |   8 +-
 6 files changed, 148 insertions(+), 92 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/upm/upm/0001-Replace-strncpy-with-memcpy.patch
 create mode 100644 meta-oe/recipes-extended/upm/upm/0001-Use-stdint-types.patch
 delete mode 100644 meta-oe/recipes-extended/upm/upm/0001-include-sys-types.h-for-uint-definition.patch

-- 
2.20.1


