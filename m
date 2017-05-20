Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id AF08A7197E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 May 2017 16:40:36 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 May 2017 09:40:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,370,1491289200"; d="scan'208";a="103389437"
Received: from chiron.jf.intel.com ([10.7.159.56])
	by orsmga005.jf.intel.com with ESMTP; 20 May 2017 09:40:35 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 May 2017 09:40:23 -0700
Message-Id: <20170520164023.72248-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [meta-xfce][PATCH] xfce4-vala: update vala api to 0.36
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
X-List-Received-Date: Sat, 20 May 2017 16:40:36 -0000

oe-core has updated to vala_0.36.2

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
index c9eace8..d0a0598 100644
--- a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
+++ b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
@@ -9,7 +9,7 @@ SRC_URI = "http://archive.xfce.org/src/bindings/${BPN}/${@xfce_verdir("${PV}")}/
 SRC_URI[md5sum] = "0bbb1d6e473e0fe9b335b7b1b49d8a71"
 SRC_URI[sha256sum] = "07a8f2b7c09fcdd3d86e0c52adea3c58ca011d0142a93997a01b4af77260ae7b"
 
-EXTRA_OECONF = "-with-vala-api=0.34"
+EXTRA_OECONF = "-with-vala-api=0.36"
 
 FILES_${PN} += "${datadir}/vala-*/vapi"
 
-- 
2.9.3


