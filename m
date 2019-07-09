Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2FE147EB40
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jul 2019 12:38:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Jul 2019 05:38:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,470,1557212400"; d="scan'208";a="170580952"
Received: from chiajenx-mobl.ccr.corp.intel.com (HELO localhost.localdomain)
	([10.249.72.228])
	by orsmga006.jf.intel.com with ESMTP; 09 Jul 2019 05:38:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Jul 2019 00:38:32 +1200
Message-Id: <badebf1eded0ec5587d1af9af443644ca0a0bd6f.1562675891.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1562675891.git.paul.eggleton@linux.intel.com>
References: <cover.1562675891.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/3] mraa: update to 2.0.0
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
X-List-Received-Date: Tue, 09 Jul 2019 12:38:48 -0000
Content-Transfer-Encoding: 8bit

Changelog:

  https://github.com/intel-iot-devkit/mraa/blob/master/docs/changelog.md

Also tweak PV to match convention for git recipes (+git rather than
 -git).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-extended/mraa/mraa_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb b/meta-oe/recipes-extended/mraa/mraa_git.bb
index 737c13427a..17ca262734 100644
--- a/meta-oe/recipes-extended/mraa/mraa_git.bb
+++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
@@ -5,8 +5,8 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4b92a3b497d7943042a6db40c088c3f2"
 
-SRCREV = "fbb7d9232067eac3f4508a37a8f7ea0c4fcebacb"
-PV = "1.9.0-git${SRCPV}"
+SRCREV = "967585c9ea0e1a8818d2172d2395d8502f6180a2"
+PV = "2.0.0+git${SRCPV}"
 
 SRC_URI = "git://github.com/intel-iot-devkit/${BPN}.git;protocol=http \
            "
-- 
2.20.1


