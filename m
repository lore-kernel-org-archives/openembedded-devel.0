Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id F3AFB7E90E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jul 2019 12:38:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Jul 2019 05:38:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,470,1557212400"; d="scan'208";a="170580965"
Received: from chiajenx-mobl.ccr.corp.intel.com (HELO localhost.localdomain)
	([10.249.72.228])
	by orsmga006.jf.intel.com with ESMTP; 09 Jul 2019 05:38:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Jul 2019 00:38:34 +1200
Message-Id: <11d497c0ecd5157b41e0a5e2c24d1778e6bdab63.1562675891.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1562675891.git.paul.eggleton@linux.intel.com>
References: <cover.1562675891.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/3] picocom: update to 3.1
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
X-List-Received-Date: Tue, 09 Jul 2019 12:38:55 -0000
Content-Transfer-Encoding: 8bit

There have been a couple of releases since we last upgraded, including
a number of additional features. Changelog is here:

  https://github.com/npat-efault/picocom/releases

Also tweak SUMMARY - I don't think this has been 20k in a while; with
this upgrade the binary alone went from 60k to 70k.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-support/picocom/picocom_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/picocom/picocom_git.bb b/meta-oe/recipes-support/picocom/picocom_git.bb
index e091094cf4..0d65453b7c 100644
--- a/meta-oe/recipes-support/picocom/picocom_git.bb
+++ b/meta-oe/recipes-support/picocom/picocom_git.bb
@@ -1,13 +1,13 @@
-SUMMARY = "Lightweight and minimal (~20K) dumb-terminal emulation program"
+SUMMARY = "Lightweight and minimal dumb-terminal emulation program"
 SECTION = "console/utils"
 LICENSE = "GPLv2+"
-HOMEPAGE = "http://code.google.com/p/picocom/"
+HOMEPAGE = "https://github.com/npat-efault/picocom"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3000e4830620e310fe65c0eb69df9e8a"
 
-BASEPV = "2.2"
+BASEPV = "3.1"
 PV = "${BASEPV}+git${SRCPV}"
 
-SRCREV = "deffd18c24145bd6f965f44e735a50b65810ccdc"
+SRCREV = "90385aabe2b51f39fa130627d46b377569f82d4a"
 
 SRC_URI = "git://github.com/npat-efault/picocom"
 
-- 
2.20.1


