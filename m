Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 0F99078740
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 22:44:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jan 2018 14:44:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,393,1511856000"; d="scan'208";a="21169340"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by orsmga003.jf.intel.com with ESMTP; 21 Jan 2018 14:44:20 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jan 2018 14:44:06 -0800
Message-Id: <d455bcdf3b87712348c7ad6f791a3cd4293fadb1.1516574387.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1516574387.git.timothy.t.orling@linux.intel.com>
References: <cover.1516574387.git.timothy.t.orling@linux.intel.com>
Subject: [meta-perl][PATCH 06/12] libmime-types-perl: upgrade 2.13 -> 2.14
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
X-List-Received-Date: Sun, 21 Jan 2018 22:44:19 -0000

Changes:

version 2.14: Wed  8 Nov 17:45:22 CET 2017

        Fixes:
        - MojoX should not die on missing types.
          rt.cpan.org#123298 [Dmitry Latin]

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../{libmime-types-perl_2.13.bb => libmime-types-perl_2.14.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libmime/{libmime-types-perl_2.13.bb => libmime-types-perl_2.14.bb} (85%)

diff --git a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.13.bb b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.14.bb
similarity index 85%
rename from meta-perl/recipes-perl/libmime/libmime-types-perl_2.13.bb
rename to meta-perl/recipes-perl/libmime/libmime-types-perl_2.14.bb
index fd51c16ac..ade0a062a 100644
--- a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.13.bb
+++ b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.14.bb
@@ -14,8 +14,8 @@ LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=11;md5=963ce28228347875
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/MIME-Types-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[md5sum] = "f2892ae9e6ea660a58746699c3924817"
-SRC_URI[sha256sum] = "99c3376357bbe22cc8b6c78f560aa18d81621287695cd629008a6c4e66b77bf8"
+SRC_URI[md5sum] = "c1b9b7dea40fbb96c0e0048d10d66268"
+SRC_URI[sha256sum] = "4049cf0fc05205893f25fdbe07d1ab12bfc72259517db2c3348c1d1059730070"
 
 S = "${WORKDIR}/MIME-Types-${PV}"
 
-- 
2.13.6


