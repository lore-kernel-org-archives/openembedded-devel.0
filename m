Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id E08206FFE7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jun 2014 17:35:11 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 Jun 2014 10:35:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,495,1400050800"; d="scan'208";a="446620688"
Received: from garethcl-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.19])
	by azsmga001.ch.intel.com with ESMTP; 17 Jun 2014 10:35:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Jun 2014 18:34:59 +0100
Message-Id: <0732127a51dece2812f5cbfd5d275ea04ff2f8d9.1403026461.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1403026460.git.paul.eggleton@linux.intel.com>
References: <cover.1403026460.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1403026460.git.paul.eggleton@linux.intel.com>
References: <cover.1403026460.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 3/3] pv: fix metadata fields
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
X-List-Received-Date: Tue, 17 Jun 2014 17:35:14 -0000

* Use correct LICENSE value to match up with common license file (and
  avoid corresponding warning)
* Set SUMMARY instead of DESCRIPTION

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-support/pv/pv_1.5.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/pv/pv_1.5.3.bb b/meta-oe/recipes-support/pv/pv_1.5.3.bb
index 5695412..5e3dd67 100644
--- a/meta-oe/recipes-support/pv/pv_1.5.3.bb
+++ b/meta-oe/recipes-support/pv/pv_1.5.3.bb
@@ -1,6 +1,6 @@
-DESCRIPTION = "pv - Pipe Viewer - is a terminal-based tool for monitoring the progress of data through a pipeline."
+SUMMARY = "Terminal-based tool for monitoring the progress of data through a pipeline"
 
-LICENSE = "Artistic-License-2.0"
+LICENSE = "Artistic-2.0"
 LIC_FILES_CHKSUM = "file://doc/COPYING;md5=9c50db2589ee3ef10a9b7b2e50ce1d02"
 
 SRC_URI = "http://www.ivarch.com/programs/sources/pv-${PV}.tar.bz2"
-- 
1.9.3


