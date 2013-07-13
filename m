Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 055546A97F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Jul 2013 14:47:38 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Jul 2013 07:45:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,659,1367996400"; d="scan'208";a="345067078"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.68])
	by orsmga001.jf.intel.com with ESMTP; 13 Jul 2013 07:47:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Jul 2013 15:47:22 +0100
Message-Id: <7da9d2f7816b6c2b36750b47312e2678157d4b69.1373726565.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1373726565.git.paul.eggleton@linux.intel.com>
References: <cover.1373726565.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1373726565.git.paul.eggleton@linux.intel.com>
References: <cover.1373726565.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 2/3] libio-pty-perl: add from OE-Classic and update
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 13 Jul 2013 14:47:38 -0000

* Update to version 1.10
* Set SUMMARY instead of DESCRIPTION
* Put SRC_URI checksums under SRC_URI
* Add LIC_FILES_CHKSUM
* Make LICENSE slightly more specific and add spacing

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-devtools/perl/libio-pty-perl_1.10.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/perl/libio-pty-perl_1.10.bb

diff --git a/meta-oe/recipes-devtools/perl/libio-pty-perl_1.10.bb b/meta-oe/recipes-devtools/perl/libio-pty-perl_1.10.bb
new file mode 100644
index 0000000..88db683
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libio-pty-perl_1.10.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Perl module for pseudo tty IO"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://META.yml;beginline=7;endline=8;md5=f86a66cc3d9522a227298d6898b181a2"
+
+SRC_URI = "http://www.cpan.org/modules/by-module/IO/IO-Tty-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "46baec86a145e57f0ec661fa412b097c"
+SRC_URI[sha256sum] = "31a6e21ad187ec5ea93c2b898d6b3519647c5fce9f394b6d3c05a1f7c3f6f8b1"
+
+S = "${WORKDIR}/IO-Tty-${PV}"
+
+inherit cpan
+
-- 
1.8.1.2


