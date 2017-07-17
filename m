Return-Path: <stanley.cheong.kwan.phoong@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 38EA477D52
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jul 2017 02:48:22 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jul 2017 19:48:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,372,1496127600"; d="scan'208";a="879545975"
Received: from phoongst-mobl2.png.intel.com ([10.221.22.197])
	by FMSMGA003.fm.intel.com with ESMTP; 16 Jul 2017 19:48:22 -0700
From: Stanley Phoong <stanley.cheong.kwan.phoong@intel.com>
To: OpenEmbedded Devel Mailing List <openembedded-devel@lists.openembedded.org>
Date: Mon, 17 Jul 2017 10:48:06 +0800
Message-Id: <1500259691-9782-5-git-send-email-stanley.cheong.kwan.phoong@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1500259691-9782-1-git-send-email-stanley.cheong.kwan.phoong@intel.com>
References: <1500259691-9782-1-git-send-email-stanley.cheong.kwan.phoong@intel.com>
Subject: [meta-openwrt][PATCH 4/9] Juci: fix uglify-js not found
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
X-List-Received-Date: Mon, 17 Jul 2017 02:48:22 -0000

From: "Stanley Cheong Kwan, Phoong" <stanley.cheong.kwan.phoong@intel.com>

uglify-js is not found by the Makefile. This happens due to npm install
will install into a local node_modules and this would not be reflected
into recipe-sysroot-native/usr/bin. Added softlink to uglify-js.

Signed-off-by: Stanley Cheong Kwan, Phoong <stanley.cheong.kwan.phoong@intel.com>
---
 recipes-core/juci/juci_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-core/juci/juci_git.bb b/recipes-core/juci/juci_git.bb
index 6d3d798..def6a90 100644
--- a/recipes-core/juci/juci_git.bb
+++ b/recipes-core/juci/juci_git.bb
@@ -23,6 +23,7 @@ do_compile() {
 }
 
 do_install_append() {
+        ln -sf ${WORKDIR}/git/node_modules/uglify-js/bin/uglifyjs ${WORKDIR}/recipe-sysroot-native/usr/bin/uglifyjs
 	oe_runmake
 	oe_runmake DESTDIR='${D}' install
 }
-- 
2.7.4


