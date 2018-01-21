Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 1F746787B9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 22:44:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jan 2018 14:44:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,393,1511856000"; d="scan'208";a="21169331"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by orsmga003.jf.intel.com with ESMTP; 21 Jan 2018 14:44:18 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jan 2018 14:44:04 -0800
Message-Id: <15275c83a15744f7365aeb1b4a39941da2dec171.1516574387.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1516574387.git.timothy.t.orling@linux.intel.com>
References: <cover.1516574387.git.timothy.t.orling@linux.intel.com>
Subject: [meta-perl][PATCH 04/12] libextutils-cppguess-perl: upgrade 0.09 -> 0.12
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
X-List-Received-Date: Sun, 21 Jan 2018 22:44:17 -0000

Changes:

0.12    Sat Oct 21 18:12:51 BST 2017
    - Fix tests on 5.26 without '.' in @INC (kentfredric)

0.11   Thu Sep 10 13:12:17 MDT 2015
    - Add leading whitespace to $cflags in _get_cflags (bulk88)

0.10   Tue Sep 08 21:15:30 MDT 2015
    - Config's ccflags must always be used. (bulk88)

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 ...tutils-cppguess-perl_0.09.bb => libextutils-cppguess-perl_0.12.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libextutils/{libextutils-cppguess-perl_0.09.bb => libextutils-cppguess-perl_0.12.bb} (89%)

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.09.bb b/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.12.bb
similarity index 89%
rename from meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.09.bb
rename to meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.12.bb
index d13cb03ee..99df6f33f 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.09.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.12.bb
@@ -12,8 +12,8 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README;beginline=81;endline=84;md5=84c0390b90ea8c6702ce659b67bed699"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETJ/ExtUtils-CppGuess-${PV}.tar.gz"
-SRC_URI[md5sum] = "f8ada38ee4ad86a4f1e20d8525ce0c99"
-SRC_URI[sha256sum] = "48625195a88c0f2ddc37bbd7a06346aa68ffb6948ba78da3aea47c0db2540f65"
+SRC_URI[md5sum] = "28be49072585b25df87e54180f741a4d"
+SRC_URI[sha256sum] = "31c47b5b15e3e9fd5ae7b35881a0fffd26a2983b241e7e3a1bc340d6d446186b"
 
 S = "${WORKDIR}/ExtUtils-CppGuess-${PV}"
 
-- 
2.13.6


