Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 272F778740
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 22:44:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jan 2018 14:44:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,393,1511856000"; d="scan'208";a="21169325"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by orsmga003.jf.intel.com with ESMTP; 21 Jan 2018 14:44:17 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jan 2018 14:44:03 -0800
Message-Id: <08cbdf1e2fdeca5ce6929b9c21ff990c9ad9b2d1.1516574387.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1516574387.git.timothy.t.orling@linux.intel.com>
References: <cover.1516574387.git.timothy.t.orling@linux.intel.com>
Subject: [meta-perl][PATCH 03/12] libcgi-perl: upgrade 4.36 -> 4.38
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
X-List-Received-Date: Sun, 21 Jan 2018 22:44:16 -0000

* Fix RDEPENDS

Changes:

4.38 2017-12-01

    [ TESTING ]
    - command_line.t: Avoid -I for libs (GH #224, thanks to cpansprout)

4.37 2017-11-01

    [ FIX ]
    - Fix incorrect quoting of ? in ->url (GH #112, GH #222, with
      thanks to Reuben Thomas)

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../libcgi/{libcgi-perl_4.36.bb => libcgi-perl_4.38.bb}          | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcgi/{libcgi-perl_4.36.bb => libcgi-perl_4.38.bb} (75%)

diff --git a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.36.bb b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.38.bb
similarity index 75%
rename from meta-perl/recipes-perl/libcgi/libcgi-perl_4.36.bb
rename to meta-perl/recipes-perl/libcgi/libcgi-perl_4.38.bb
index 8f26ab0f7..db16d8307 100644
--- a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.36.bb
+++ b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.38.bb
@@ -10,11 +10,16 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2e9769f0a2613a98bc7fce15dee0c533"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/L/LE/LEEJO/CGI-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "48566d81f430a7f755bb4d8f426ce35d"
-SRC_URI[sha256sum] = "fefe84d4f2461e867f9be80f3f988e17bcbbcb4e306952cf2fd1dea7e4515490"
+SRC_URI[md5sum] = "0aeb8563d533e7f83724ed068b5bfc37"
+SRC_URI[sha256sum] = "8c58f4a529bb92a914b22b7e64c5e31185c9854a4070a6dfad44fe5cc248e7d4"
 
 S = "${WORKDIR}/CGI-${PV}"
 
 inherit cpan
 
+RDEPENDS_${PN} += "\
+    perl-module-deprecate \
+    perl-module-if \
+"
+
 RPROVIDES_${PN} += "perl-module-cgi"
-- 
2.13.6


