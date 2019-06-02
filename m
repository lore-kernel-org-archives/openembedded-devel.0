Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B14F07E413
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Jun 2019 18:44:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jun 2019 11:44:06 -0700
X-ExtLoop1: 1
Received: from chiron.jf.intel.com ([10.54.74.38])
	by orsmga007.jf.intel.com with ESMTP; 02 Jun 2019 11:44:06 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Jun 2019 11:43:13 -0700
Message-Id: <20190602184318.71277-8-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190602184318.71277-1-timothy.t.orling@linux.intel.com>
References: <20190602184318.71277-1-timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [meta-perl][PATCH 08/13] libexutils-config-perl: enable ptest
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
X-List-Received-Date: Sun, 02 Jun 2019 18:44:04 -0000
Content-Transfer-Encoding: 8bit

Add runtime and ptest dependencies.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../recipes-perl/libextutils/libextutils-config-perl_0.008.bb  | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb b/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb
index e93d388e9c..7e1418d499 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb
@@ -13,10 +13,11 @@ SRC_URI[sha256sum] = "ae5104f634650dce8a79b7ed13fb59d67a39c213a6776cfdaa3ee749e6
 
 S = "${WORKDIR}/ExtUtils-Config-${PV}"
 
-inherit cpan
+inherit cpan ptest-perl
 
 RDEPENDS_${PN} = " perl-module-extutils-makemaker \
                    perl-module-data-dumper \
+		   perl-module-ipc-open3 \
                    perl-module-test-more \
                    perl-module-file-temp \
 "
-- 
2.20.1


