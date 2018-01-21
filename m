Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 39CE878740
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 22:44:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jan 2018 14:44:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,393,1511856000"; d="scan'208";a="21169319"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by orsmga003.jf.intel.com with ESMTP; 21 Jan 2018 14:44:16 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jan 2018 14:44:02 -0800
Message-Id: <69c42f8ec447d5955f6cc91e324fb8e1461c1f7b.1516574387.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1516574387.git.timothy.t.orling@linux.intel.com>
References: <cover.1516574387.git.timothy.t.orling@linux.intel.com>
Subject: [meta-perl][PATCH 02/12] libencode-perl: add UPSTREAM_CHECK_REGEX
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
X-List-Received-Date: Sun, 21 Jan 2018 22:44:14 -0000

The default does not work for this recipe.

* Add a note that perl-module-encode should be preferred over
  this package unless a newer version than what is provided
  by perl is needed.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta-perl/recipes-perl/libencode/libencode-perl_2.83.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-perl/recipes-perl/libencode/libencode-perl_2.83.bb b/meta-perl/recipes-perl/libencode/libencode-perl_2.83.bb
index ee8c67d68..1189ff941 100644
--- a/meta-perl/recipes-perl/libencode/libencode-perl_2.83.bb
+++ b/meta-perl/recipes-perl/libencode/libencode-perl_2.83.bb
@@ -1,3 +1,8 @@
+# NOTE:
+#    You should use perl-module-encode rather than this package
+#    unless you specifically need a version newer than what is
+#    provided by perl.
+
 SUMMARY = "Encode - character encodings"
 DESCRIPTION = "The \"Encode\" module provides the interfaces between \
 Perl's strings and the rest of the system.  Perl strings are sequences \
@@ -13,6 +18,8 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/D/DA/DANKOGAI/Encode-${PV}.tar.gz"
 SRC_URI[md5sum] = "0d3f59e8ea704497647eded665919053"
 SRC_URI[sha256sum] = "5d3a90e30aabe78dfcf5e816ffb1da1e33475892dbd0075320315cdce5682988"
 
+UPSTREAM_CHECK_REGEX = "Encode\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
+
 S = "${WORKDIR}/Encode-${PV}"
 
 inherit cpan
-- 
2.13.6


