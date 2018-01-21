Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 7780178748
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 22:44:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jan 2018 14:44:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,393,1511856000"; d="scan'208";a="21169378"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by orsmga003.jf.intel.com with ESMTP; 21 Jan 2018 14:44:29 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jan 2018 14:44:12 -0800
Message-Id: <d293b05f546871c8fac59562c5910d6e789c3f10.1516574387.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1516574387.git.timothy.t.orling@linux.intel.com>
References: <cover.1516574387.git.timothy.t.orling@linux.intel.com>
Subject: [meta-perl][PATCH 12/12] libxml-libxml-perl: upgrade 2.0131 -> 2.0132
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
X-List-Received-Date: Sun, 21 Jan 2018 22:44:27 -0000

* Fix RDEPENDS

Changes:

2.0132  2017-10-28
    - Revert setNamespace() enhancements that broke some dependent tests:
        - commit df9fdc6659cb2e4e9bc896e58c02dfd79b430fbb
        - add t/48_rt123379_setNamespace.t .
        - Thanks to Alexander Bluhm and Slaven Rezic for the reports and
          the test.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 ...libxml-perl_2.0131.bb => libxml-libxml-perl_2.0132.bb} | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)
 rename meta-perl/recipes-perl/libxml/{libxml-libxml-perl_2.0131.bb => libxml-libxml-perl_2.0132.bb} (80%)

diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0131.bb b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0132.bb
similarity index 80%
rename from meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0131.bb
rename to meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0132.bb
index 410524953..1f1840118 100644
--- a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0131.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0132.bb
@@ -13,10 +13,13 @@ DEPENDS += "libxml2 \
         libxml-sax-perl-native \
         zlib \
 "
-RDEPENDS_${PN} += "libxml2 \
-        libxml-sax-perl \
-        libxml-sax-base-perl \
-        zlib \
+RDEPENDS_${PN} += "\
+    libxml2 \
+    libxml-sax-perl \
+    libxml-sax-base-perl \
+    perl-module-encode \
+    perl-module-data-dumper \
+    zlib \
 "
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/XML-LibXML-${PV}.tar.gz;name=libxml \
@@ -27,8 +30,8 @@ SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/XML-LibXML-${PV}.
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=64eda1bc135f0ece1d1187f2a8ac82c1 \
     file://LICENSE;md5=97871bde150daeb5e61ad95137ff2446 \
 "
-SRC_URI[libxml.md5sum] = "4dd1efcda5159c9e73139a4546190665"
-SRC_URI[libxml.sha256sum] = "b04c77dea55f9f270e1040e3a1d4f79b81dcdcd4da3e648f92dcf6c80bbe19df"
+SRC_URI[libxml.md5sum] = "43546fd9a3974f19323f9fb04861ece9"
+SRC_URI[libxml.sha256sum] = "721452e3103ca188f5968ab06d5ba29fe8e00e49f4767790882095050312d476"
 
 S = "${WORKDIR}/XML-LibXML-${PV}"
 
-- 
2.13.6


