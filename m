Return-Path: <timothy.t.orling@linux.intel.com>
X-Greylist: delayed 426 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 14 Feb 2020 23:36:02 UTC
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0A67A61163
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 23:36:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Feb 2020 15:28:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,442,1574150400"; d="scan'208";a="314212359"
Received: from chiron.jf.intel.com ([10.54.74.38])
	by orsmga001.jf.intel.com with ESMTP; 14 Feb 2020 15:28:52 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Feb 2020 15:28:51 -0800
Message-Id: <20200214232851.3078-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] phoronix-test-suite: add missing mime and mime-xdg inherit
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
X-List-Received-Date: Fri, 14 Feb 2020 23:36:03 -0000
Content-Transfer-Encoding: 8bit

Fixes:
"
WARNING: phoronix-test-suite-9.2.1-r0 do_package_qa: QA Issue:
         package contains desktop file with key 'MimeType' but does not inhert mime-xdg:
         phoronix-test-suite path '/work/all-oe-linux/phoronix-test-suite/9.2.1-r0/packages-split/ \
         phoronix-test-suite/usr/share/applications/phoronix-test-suite-launcher.desktop' [mime-xdg]
WARNING: phoronix-test-suite-9.2.1-r0 do_package_qa: QA Issue:
         package contains mime types but does not inhert mime:
         phoronix-test-suite path '/work/all-oe-linux/phoronix-test-suite/9.2.1-r0/packages-split/ \
         phoronix-test-suite/usr/share/mime/packages/openbenchmarking-mime.xml' [mime]
"

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../phoronix-test-suite/phoronix-test-suite_9.2.1.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_9.2.1.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_9.2.1.bb
index 6525b8ec0b..4a8e5b5b2a 100644
--- a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_9.2.1.bb
+++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_9.2.1.bb
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "675e7ca96719e2f3b42a6c13421213a398f04da0f8e78f4691fa9261fd
 
 S = "${WORKDIR}/phoronix-test-suite"
 
-inherit systemd allarch
+inherit systemd allarch mime mime-xdg
 
 do_install() {
     DESTDIR=${D} ./install-sh ${exec_prefix}
-- 
2.20.1


