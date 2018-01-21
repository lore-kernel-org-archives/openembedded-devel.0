Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id ED76171B2A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 22:44:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jan 2018 14:44:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,393,1511856000"; d="scan'208";a="21169308"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by orsmga003.jf.intel.com with ESMTP; 21 Jan 2018 14:44:14 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jan 2018 14:44:01 -0800
Message-Id: <487b0bda27a8d1cfadc7e9088f33feae48650068.1516574387.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1516574387.git.timothy.t.orling@linux.intel.com>
References: <cover.1516574387.git.timothy.t.orling@linux.intel.com>
Subject: [meta-perl][PATCH 01/12] libdbd-sqlite-perl: add UPSTREAM_CHECK_REGEX
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
X-List-Received-Date: Sun, 21 Jan 2018 22:44:13 -0000

The default does not work for this recipe.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.54.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.54.bb b/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.54.bb
index 0b27b5cb1..c72e536de 100644
--- a/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.54.bb
+++ b/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.54.bb
@@ -25,6 +25,8 @@ SRC_URI = "http://search.cpan.org/CPAN/authors/id/I/IS/ISHIGAKI/DBD-SQLite-${PV}
 SRC_URI[md5sum] = "8f835ddacb9a4a92a52bbe2d24d18a8e"
 SRC_URI[sha256sum] = "3929a6dbd8d71630f0cb57f85dcef9588cd7ac4c9fa12db79df77b9d3a4d7269"
 
+UPSTREAM_CHECK_REGEX = "DBD\-SQLite\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
+
 S = "${WORKDIR}/DBD-SQLite-${PV}"
 
 inherit cpan
-- 
2.13.6


