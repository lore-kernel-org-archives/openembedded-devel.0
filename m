Return-Path: <cengiz@kernel.wtf>
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
	by mail.openembedded.org (Postfix) with ESMTP id 589597F9AE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2019 15:48:21 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
	by mslow2.mail.gandi.net (Postfix) with ESMTP id 5F8993B2A71
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2019 15:14:51 +0000 (UTC)
X-Originating-IP: 84.44.14.226
Received: from nexussix.ar.arcelik (unknown [84.44.14.226])
	(Authenticated sender: cengiz@kernel.wtf)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 6CC8824000C;
	Thu, 28 Nov 2019 15:14:48 +0000 (UTC)
From: Cengiz Can <cengiz@kernel.wtf>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Nov 2019 18:14:29 +0300
Message-Id: <20191128151428.160407-1-cengiz@kernel.wtf>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH] recipes-support: gperftools: RDEPENDS for pperf
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
X-List-Received-Date: Thu, 28 Nov 2019 15:48:22 -0000
Content-Transfer-Encoding: 8bit

gperftools comes with pperf tool that usually needs to be run at target
machine to aggregate CPUPROFILE data.

However since we were not shipping objdump (binutils), Getopt::long
and POSIX perl5 modules, it was failing.

I've extended RDEPENDS_${PN} with those so that whenever someone
installs gperftools, those dependencies are fulfilled as well.

Signed-off-by: Cengiz Can <cengiz@kernel.wtf>
---
 meta-oe/recipes-support/gperftools/gperftools_2.7.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.7.bb b/meta-oe/recipes-support/gperftools/gperftools_2.7.bb
index 731c83516..e38b3ccde 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.7.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.7.bb
@@ -35,5 +35,10 @@ PACKAGECONFIG[static] = "--enable-static,--disable-static,"

 PACKAGE_BEFORE_PN += "libtcmalloc-minimal"
 FILES_libtcmalloc-minimal = "${libdir}/libtcmalloc_minimal*${SOLIBS} ${libdir}/libtcmalloc_minimal_debug*${SOLIBS}"
+
+# pperf tool requires Getopt::Long and POSIX Perl modules.
+# Also runs `objdump` on each cpuprofile data file
+RDEPENDS_${PN} += "binutils perl-module-getopt-long perl-module-posix"
+
 RDEPENDS_${PN} += "libtcmalloc-minimal (= ${EXTENDPKGV})"

--
2.24.0


