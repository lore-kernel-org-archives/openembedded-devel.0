Return-Path: <anuj.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 97DD760107
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Apr 2018 02:35:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Apr 2018 19:35:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,426,1517904000"; d="scan'208";a="45254020"
Received: from anmitta2-mobl1.png.intel.com ([10.221.16.247])
	by fmsmga001.fm.intel.com with ESMTP; 08 Apr 2018 19:35:10 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Apr 2018 10:35:07 +0800
Message-Id: <1523241307-30325-1-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] libsrtp: allow creation of empty package
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
X-List-Received-Date: Mon, 09 Apr 2018 02:35:11 -0000

Package PN is not created otherwise and results in errors like

 | Problem: conflicting requests
 |  - nothing provides libsrtp = 1.5.2-r0 needed by libsrtp-dev-1.5.2-r0.i586

when PN-staticdev is to be installed that RDEPENDS on it.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta-multimedia/recipes-support/libsrtp/libsrtp_1.5.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-support/libsrtp/libsrtp_1.5.2.bb b/meta-multimedia/recipes-support/libsrtp/libsrtp_1.5.2.bb
index 8abaa12..0104d04 100644
--- a/meta-multimedia/recipes-support/libsrtp/libsrtp_1.5.2.bb
+++ b/meta-multimedia/recipes-support/libsrtp/libsrtp_1.5.2.bb
@@ -18,3 +18,5 @@ do_install[postfuncs] += " rm_unused_bindir "
 rm_unused_bindir() {
     rmdir ${D}/${bindir}
 }
+
+ALLOW_EMPTY_${PN} = "1"
-- 
2.7.4


