Return-Path: <kuo-lang.tseng@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 12E2379551
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 18:44:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Aug 2018 11:44:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,279,1531810800"; d="scan'208";a="79579786"
Received: from ktseng-hp-compaq-elite-8300-sff.sc.intel.com ([10.3.202.171])
	by fmsmga002.fm.intel.com with ESMTP; 23 Aug 2018 11:43:14 -0700
From: Kuo-Lang Tseng <kuo-lang.tseng@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Aug 2018 04:40:21 -0700
Message-Id: <1535024421-10058-1-git-send-email-kuo-lang.tseng@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH v2] turbostat: upgrade to 18.07.27
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
X-List-Received-Date: Thu, 23 Aug 2018 18:44:21 -0000

Update the license hash value also since SPDX header has been
inserted to kernel COPYING file since v4.17.

Signed-off-by: Kuo-Lang Tseng <kuo-lang.tseng@intel.com>

v2: add meta-oe prefix to subject line
---
 .../turbostat/{turbostat_3.4.bb => turbostat_18.07.27.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/turbostat/{turbostat_3.4.bb => turbostat_18.07.27.bb} (96%)

diff --git a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb b/meta-oe/recipes-kernel/turbostat/turbostat_18.07.27.bb
similarity index 96%
rename from meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
rename to meta-oe/recipes-kernel/turbostat/turbostat_18.07.27.bb
index 3559417..5e64efa 100644
--- a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
+++ b/meta-oe/recipes-kernel/turbostat/turbostat_18.07.27.bb
@@ -12,7 +12,7 @@ processor frequency and idle power saving state residency on supported \
 processors."
 
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 COMPATIBLE_HOST = '(x86_64.*|i.86.*)-linux'
 COMPATIBLE_HOST_libc-musl = "null"
-- 
1.9.1


