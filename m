Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 03B7E7017B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jan 2018 22:55:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jan 2018 14:55:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,316,1511856000"; d="scan'208";a="192343761"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by fmsmga005.fm.intel.com with ESMTP; 04 Jan 2018 14:55:50 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jan 2018 14:55:47 -0800
Message-Id: <cover.1515106194.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
Subject: [rocko][PATCH 0/1] python[3]-setuptools: inherit setuptools
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
X-List-Received-Date: Thu, 04 Jan 2018 22:55:50 -0000

The existing recipes for python[3]-setuptools were not packaging the
"pkg_resources" module, which bmap-tools RDEPENDS on (see YOCTO #12148).

This was addressed in master, but requires a slightly different approach
for rocko (as we do not want to upgrade versions on stable branches).

This applies on top of poky-contrib stable/rocko-next at the time of
this writing.

The following changes since commit 0baeb05511623c7e68e1341629efd27a80c5b042:

  binutils: Convert SRC_URI and SRCREV to weak defines (2018-01-03 19:54:56 -0800)

are available in the git repository at:

  git://push.yoctoproject.org/poky-contrib timo/rocko-12148

Tim Orling (1):
  python[3]-setuptools: inherit setuptools

 meta/recipes-devtools/python/python-setuptools_36.2.7.bb  | 4 +---
 meta/recipes-devtools/python/python3-setuptools_36.2.7.bb | 7 +------
 2 files changed, 2 insertions(+), 9 deletions(-)

-- 
2.13.6


