Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 4D1D278F78
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 17:50:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Aug 2018 10:50:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,234,1531810800"; d="scan'208";a="83030457"
Received: from kkurdej-mobl.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.36.13])
	by orsmga002.jf.intel.com with ESMTP; 13 Aug 2018 10:50:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 19:50:28 +0200
Message-Id: <3f85d2095fea4e117c60518c07f04c6e733efe61.1534182463.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1534182463.git.paul.eggleton@linux.intel.com>
References: <cover.1534182463.git.paul.eggleton@linux.intel.com>
Subject: [meta-multimedia][PATCH 2/4] faac: set LICENSE_FLAGS
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
X-List-Received-Date: Mon, 13 Aug 2018 17:50:49 -0000

Commercial usage requires licensing according to the homepage, so set
LICENSE_FLAGS = "commercial" to indicate that.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-multimedia/recipes-multimedia/faac/faac_1.29.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/faac/faac_1.29.bb b/meta-multimedia/recipes-multimedia/faac/faac_1.29.bb
index 9f11dbdaa..d36f2f48d 100644
--- a/meta-multimedia/recipes-multimedia/faac/faac_1.29.bb
+++ b/meta-multimedia/recipes-multimedia/faac/faac_1.29.bb
@@ -5,6 +5,8 @@ HOMEPAGE = "http://www.audiocoding.com/faac.html"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://libfaac/coder.h;beginline=5;endline=17;md5=fa1fd6a5fa8cdc877d63a12530d273e0"
 
+LICENSE_FLAGS = "commercial"
+
 inherit autotools
 
 SRC_URI = " \
-- 
2.17.1


