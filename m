Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 04ECC7EA7A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2019 05:00:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jun 2019 21:53:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,426,1557212400"; d="scan'208";a="246055507"
Received: from chiron.jf.intel.com ([10.54.74.38])
	by orsmga001.jf.intel.com with ESMTP; 27 Jun 2019 21:53:13 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Jun 2019 21:52:24 -0700
Message-Id: <3b399868dd71009c47bf424d584ac324320f62c7.1561696450.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1561696450.git.timothy.t.orling@linux.intel.com>
References: <cover.1561696450.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [meta-perl][PATCH 8/9] libnet-ldap-perl: upgrade 0.65 -> 0.66; enable ptest
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
X-List-Received-Date: Fri, 28 Jun 2019 05:00:16 -0000
Content-Transfer-Encoding: 8bit

* Add runtime dependencies
* Add ptest dependencies

Upstream release notes:

0.66 -- Tue Apr 16 11:23:55 CEST 2019

Enhancements
* Entry.pm: accept more options in ldif()
* inc/: refresh install tools
* contrib/ldifsort: new option -h
* documentation extensions
* typo fixes

Bug Fixes
* contrib/schema2ad: fix syntax calculation
* Refresh.pm: fix get_ttl() method
* DSML: fix detection of auxiliary object classes

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 ...-perl_0.65.bb => libnet-ldap-perl_0.66.bb} | 26 +++++++++++++++----
 1 file changed, 21 insertions(+), 5 deletions(-)
 rename meta-perl/recipes-perl/libnet/{libnet-ldap-perl_0.65.bb => libnet-ldap-perl_0.66.bb} (51%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.65.bb b/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.66.bb
similarity index 51%
rename from meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.65.bb
rename to meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.66.bb
index f2b1f1634d..26c7c389d8 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.65.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.66.bb
@@ -9,21 +9,37 @@ SECTION = "libs"
 LICENSE = "Artistic-1.0|GPLv1+"
 LIC_FILES_CHKSUM = "file://README;beginline=3;endline=5;md5=4d6588c2fa0d38ae162f6314d201d89e"
 
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MA/MARSCHAP/perl-ldap-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/M/MA/MARSCHAP/perl-ldap-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "d057c8db76913d95c0e460c7bdd98b27"
-SRC_URI[sha256sum] = "5f57dd261dc16ebf942a272ddafe69526598df71151a51916edc37a4f2f23834"
+SRC_URI[md5sum] = "c4c1ae9299cd488e75c1b82904458bef"
+SRC_URI[sha256sum] = "09263ce6166e80c98d689d41d09995b813389fd069b784601f6dc57f8e2b4102"
 
 S = "${WORKDIR}/perl-ldap-${PV}"
 
-inherit cpan
+inherit cpan ptest-perl
 
 do_configure_prepend() {
     perl -pi -e 's/auto_install_now.*//g' Makefile.PL
 }
 
-RDEPENDS_${PN} = "perl \
+do_install_ptest() {
+	cp -r ${B}/data ${D}${PTEST_PATH}
+	chown -R root:root ${D}${PTEST_PATH}
+}
+
+RDEPENDS_${PN} += " \
     libconvert-asn1-perl \
     libio-socket-ssl-perl \
     libauthen-sasl-perl \
+    perl-module-integer \
 "
+
+RDEPENDS_${PN}-ptest += " \
+    libxml-sax-base-perl \
+    libxml-sax-writer-perl \
+    perl-module-file-compare \
+    perl-module-perlio \
+    perl-module-test-more \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.20.1


