Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 027067EA71
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2019 05:00:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jun 2019 21:53:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,426,1557212400"; d="scan'208";a="246055481"
Received: from chiron.jf.intel.com ([10.54.74.38])
	by orsmga001.jf.intel.com with ESMTP; 27 Jun 2019 21:53:04 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Jun 2019 21:52:21 -0700
Message-Id: <48ee67cedee4b74a8ee6086b6f38024745ff635d.1561696450.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1561696450.git.timothy.t.orling@linux.intel.com>
References: <cover.1561696450.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [meta-perl][PATCH 5/9] libsub-uplevel-perl: add recipe for 0.36
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
X-List-Received-Date: Fri, 28 Jun 2019 05:00:07 -0000
Content-Transfer-Encoding: 8bit

Dependency for Test::Warn

NAME
    Sub::Uplevel - apparently run a function in a higher stack frame

DESCRIPTION
    Like Tcl's uplevel() function, but not quite so dangerous. The idea is
    just to fool caller(). All the really naughty bits of Tcl's uplevel()
    are avoided.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../libsub/libsub-uplevel-perl_0.2800.bb      | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb

diff --git a/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb b/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb
new file mode 100644
index 0000000000..f051037870
--- /dev/null
+++ b/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb
@@ -0,0 +1,43 @@
+SUMMARY = "Sub::Uplevel - apparently run a function in a higher stack frame"
+DESCRIPTION = " Like Tcl's uplevel() function, but not quite so dangerous. \
+The idea is just to fool caller(). All the really naughty bits of Tcl's \
+uplevel() are avoided. \
+\
+THIS IS NOT THE SORT OF THING YOU WANT TO DO EVERYDAY \
+"
+
+SECTION = "libs"
+HOMEPAGE= "https://metacpan.org/release/Sub-Uplevel"
+
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7f1207cd3108e4ade18448d81e6bcb6c"
+
+CPAN_PACKAGE = "Sub-Uplevel"
+CPAN_AUTHOR = "DAGOLDEN"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/D/DA/${CPAN_AUTHOR}/${CPAN_PACKAGE}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "6c6a174861fd160e8d5871a86df00baf"
+SRC_URI[sha256sum] = "b4f3f63b80f680a421332d8851ddbe5a8e72fcaa74d5d1d98f3c8cc4a3ece293"
+
+S = "${WORKDIR}/${CPAN_PACKAGE}-${PV}"
+
+inherit cpan ptest-perl
+
+RDEPENDS_${PN} += " \
+    perl-module-carp \
+    perl-module-constant \
+    perl-module-strict \
+    perl-module-warnings \
+"
+
+RDEPENDS_${PN}-ptest += " \
+    perl-module-cpan \
+    perl-module-exporter \
+    perl-module-extutils-makemaker \
+    perl-module-file-spec \
+    perl-module-lib \
+    perl-module-test-more \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


