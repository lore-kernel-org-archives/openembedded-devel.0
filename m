Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 74011607A2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 15:20:46 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 21 Nov 2016 07:20:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,675,1473145200"; d="scan'208";a="789102831"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Nov 2016 07:20:46 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Nov 2016 17:20:43 +0200
Message-Id: <1479741645-2318-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [meta-oe][PATCH 0/2] Don't use update-alternatives for syslog init script
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
X-List-Received-Date: Mon, 21 Nov 2016 15:20:46 -0000

This is a follow-up for an earlier similar patchset for oe-core.

This patchset makes syslog packages conflict each other instead of using
update-alternatives to manage their init script. Using update-alternatives for
init scripts seems to cause unfixable problems in oe, and, there should be no
need to install two syslog services in the system at the same time (one of
which would be inactive anyway).

[YOCTO #10433]

Markus Lehtonen (2):
  syslog-ng: don't use update-alternatives to manage init script
  rsyslog: don't use update-alternatives to manage init script

 meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb | 34 +++-------------------
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc    | 22 +++-----------
 2 files changed, 8 insertions(+), 48 deletions(-)

-- 
2.6.6


