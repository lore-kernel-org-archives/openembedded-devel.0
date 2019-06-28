Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 048A37EA70
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2019 05:00:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jun 2019 21:53:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,426,1557212400"; d="scan'208";a="246055500"
Received: from chiron.jf.intel.com ([10.54.74.38])
	by orsmga001.jf.intel.com with ESMTP; 27 Jun 2019 21:53:09 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Jun 2019 21:52:23 -0700
Message-Id: <f9e2c1b8150084bbcaceeca02b7dd9dc664b2cd3.1561696450.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1561696450.git.timothy.t.orling@linux.intel.com>
References: <cover.1561696450.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [meta-perl][PATCH 7/9] libcgi-perl: upgrade 4.43 -> 4.44
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
X-List-Received-Date: Fri, 28 Jun 2019 05:00:12 -0000
Content-Transfer-Encoding: 8bit

Add ptest dependencies

Upstream release notes:

4.44 2019-06-03

    [ ENHANCEMENT ]
    - Replace only use of "base" with "parent" (GH #235)

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../libcgi/{libcgi-perl_4.43.bb => libcgi-perl_4.44.bb}      | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcgi/{libcgi-perl_4.43.bb => libcgi-perl_4.44.bb} (88%)

diff --git a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.43.bb b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.44.bb
similarity index 88%
rename from meta-perl/recipes-perl/libcgi/libcgi-perl_4.43.bb
rename to meta-perl/recipes-perl/libcgi/libcgi-perl_4.44.bb
index b4571b27e6..cde187d8bd 100644
--- a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.43.bb
+++ b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.44.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=415fc49abed2728f9480cd32c8d67beb"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/L/LE/LEEJO/CGI-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "8c1f2cf11e4410911827ea48d58aaecc"
-SRC_URI[sha256sum] = "14b94f9df6e48fc26ebc4fa1e01a7b534cbc1611028a49028f9ac9d8ca27b734"
+SRC_URI[md5sum] = "2cbe560fdadbb8b9237744e39bbfc3eb"
+SRC_URI[sha256sum] = "12435fb7ebd3585c47b6d60ee4f5c7d6a7c114a2827d2b5acf3d62aa9fcf1208"
 
 S = "${WORKDIR}/CGI-${PV}"
 
@@ -34,6 +34,7 @@ do_install_prepend() {
 
 RDEPENDS_${PN}-ptest += " \
     libtest-deep-perl \
+    libtest-warn-perl \
     perl-module-bytes \
     perl-module-file-find \
     perl-module-filehandle \
-- 
2.20.1


