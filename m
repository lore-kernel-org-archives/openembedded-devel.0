Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C731C7CAE7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Feb 2019 05:35:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Feb 2019 21:35:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,393,1544515200"; d="scan'208";a="126057924"
Received: from chiron.jf.intel.com ([10.54.74.38])
	by fmsmga008.fm.intel.com with ESMTP; 20 Feb 2019 21:35:52 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Feb 2019 21:35:37 -0800
Message-Id: <20190221053537.4549-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-perl][PATCH] libterm-readkey-perl: fix upstream check
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
X-List-Received-Date: Thu, 21 Feb 2019 05:35:51 -0000
Content-Transfer-Encoding: 8bit

Add UPSTREAM_CHECK_REGEX
Add UPSTREAM_CHECK_URI

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.37.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.37.bb b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.37.bb
index 6679588359..f29f156612 100644
--- a/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.37.bb
+++ b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.37.bb
@@ -19,7 +19,8 @@ SRC_URI[sha256sum] = "4a9383cf2e0e0194668fe2bd546e894ffad41d556b41d2f2f577c8db68
 
 S = "${WORKDIR}/TermReadKey-${PV}"
 
-UPSTREAM_CHECK_REGEX = "TermReadKey\-(?P<pver>(\d+\.\d+))(?!_\d+)\.tar"
+UPSTREAM_CHECK_URI = "https://metacpan.org/release/TermReadKey"
+UPSTREAM_CHECK_REGEX = "TermReadKey\-(?P<pver>(\d+\.\d+))(?!_\d+)\.tar.gz"
 
 # It needs depend on native to let dynamic loader use native modules
 # rather than target ones.
-- 
2.20.1


