Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7FA6D7E41B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Jun 2019 18:44:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jun 2019 11:44:22 -0700
X-ExtLoop1: 1
Received: from chiron.jf.intel.com ([10.54.74.38])
	by orsmga007.jf.intel.com with ESMTP; 02 Jun 2019 11:44:21 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Jun 2019 11:43:18 -0700
Message-Id: <20190602184318.71277-13-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190602184318.71277-1-timothy.t.orling@linux.intel.com>
References: <20190602184318.71277-1-timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [meta-perl][PATCH 13/13] libcapture-tiny-perl: upgrade 0.46 -> 0.48; enable ptest
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
X-List-Received-Date: Sun, 02 Jun 2019 18:44:20 -0000
Content-Transfer-Encoding: 8bit

* sort RDEPENDS in alpha order
* add missing dependencies (since perl-sanity change)

Upstream release notes:

[Fixed]

- Appends PID to random file names for tee signalling to avoid
  random name collision when used in multiple forked children.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 ...l_0.46.bb => libcapture-tiny-perl_0.48.bb} | 36 +++++++++++--------
 1 file changed, 22 insertions(+), 14 deletions(-)
 rename meta-perl/recipes-perl/libcapture/{libcapture-tiny-perl_0.46.bb => libcapture-tiny-perl_0.48.bb} (58%)

diff --git a/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.46.bb b/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb
similarity index 58%
rename from meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.46.bb
rename to meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb
index 2719811ce4..3b3e31dd97 100644
--- a/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.46.bb
+++ b/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb
@@ -15,23 +15,31 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37a4918a30ace24395020e5b8c03b83f"
 
 SRCNAME = "Capture-Tiny"
 SRC_URI = "${CPAN_MIRROR}/authors/id/D/DA/DAGOLDEN/${SRCNAME}-${PV}.tar.gz"
-SRC_URI[md5sum] = "d718af07729d26a793949ca6ba2580a7"
-SRC_URI[sha256sum] = "5d7a6a830cf7f2b2960bf8b8afaac16a537ede64f3023827acea5bd24ca77015"
+SRC_URI[md5sum] = "f5d24083ad270f8326dd659dd83eeb54"
+SRC_URI[sha256sum] = "6c23113e87bad393308c90a207013e505f659274736638d8c79bac9c67cc3e19"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-inherit cpan
-
-RDEPENDS_${PN} = " perl-module-scalar-util \
-                   perl-module-io-file \
-                   perl-module-extutils-makemaker \
-                   perl-module-file-spec \
-                   perl-module-exporter \
-                   perl-module-carp \
-                   perl-module-test-more \
-                   perl-module-file-temp \
-                   perl-module-lib \
-                   perl-module-overloading \
+inherit cpan ptest-perl
+
+RDEPENDS_${PN} = " \
+    perl-module-carp \
+    perl-module-exporter \
+    perl-module-extutils-makemaker \
+    perl-module-extutils-mm-unix \
+    perl-module-file-spec \
+    perl-module-file-temp \
+    perl-module-io-handle \
+    perl-module-lib \
+    perl-module-overloading \
+    perl-module-perlio \
+    perl-module-perlio-scalar \
+    perl-module-scalar-util \
+    perl-module-strict \
+    perl-module-test-more \
+    perl-module-warnings \
 "
 
+RDEPENDS_${PN}-ptest += "perl-module-perlio"
+
 BBCLASSEXTEND = "native"
-- 
2.20.1


