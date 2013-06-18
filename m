Return-Path: <diego.ml@zoho.com>
Received: from sender1.zohomail.com (sender1.zohomail.com [72.5.230.95])
	by mail.openembedded.org (Postfix) with ESMTP id 37BC2608A6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2013 12:42:01 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:cc:subject:date:message-id; 
	b=pgdwMyjg7wJVduEeowdxkQMeEsjSMZimpAU0GsYl4X1puTj/KfPhD2y2knzEcg+GB/eREQLJgWRP
	yfDzHZcfvOzyeEhAzY207DWurjXzHL9GMmdIlNWRuTM+rnaNrTSz  
Received: from localhost.localdomain (static-217-133-170-65.clienti.tiscali.it
	[217.133.170.65]) by mx.zohomail.com
	with SMTPS id 1371559319621626.5595828391519;
	Tue, 18 Jun 2013 05:41:59 -0700 (PDT)
From: Diego Rondini <diego.ml@zoho.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Jun 2013 14:07:41 +0200
Message-Id: <1371557261-22526-1-git-send-email-diego.ml@zoho.com>
X-Mailer: git-send-email 1.7.9.5
X-ZohoMail: Ss  SS_10 UW UB ZCF-710TPL UW UB  ZSF-HLOLL_2  SGR3_1_23053_280
X-ZohoMail-Owner: <1371557261-22526-1-git-send-email-diego.ml@zoho.com>+zmo_0_<diego.ml@zoho.com>
X-ZohoMail-Sender: 217.133.170.65
X-Zoho-Virus-Status: 2
X-ZohoMailClient: External
Cc: Diego Rondini <diego.ml@zoho.com>
Subject: [meta-oe][PATCH] glmark2: Add recipe for glmark2
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
X-List-Received-Date: Tue, 18 Jun 2013 12:42:01 -0000

Add a recipe for glmark2, which is an OpenGL 2.0 / OpenGL ES 2.0 benchmark.

Signed-off-by: Diego Rondini <diego.ml@zoho.com>
---
 .../recipes-benchmark/glmark2/glmark2_2012.12.bb   |   35 ++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/glmark2/glmark2_2012.12.bb

diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_2012.12.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_2012.12.bb
new file mode 100644
index 0000000..b5d483c
--- /dev/null
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_2012.12.bb
@@ -0,0 +1,35 @@
+SUMMARY = "OpenGL (ES) 2.0 benchmark"
+DESCRIPTION = "glmark2 is a benchmark for OpenGL (ES) 2.0. \
+It uses only the subset of the OpenGL 2.0 API that is compatible with OpenGL ES 2.0."
+HOMEPAGE = "https://launchpad.net/glmark2"
+BUGTRACKER = "https://bugs.launchpad.net/glmark2"
+
+LICENSE = "GPLv3+ & SGIv1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.SGI;beginline=5;md5=269cdab4af6748677acce51d9aa13552"
+
+DEPENDS = "libpng12"
+
+SRC_URI = "https://launchpad.net/${BPN}/trunk/${PV}/+download/${BP}.tar.gz"
+
+SRC_URI[md5sum] = "4f306664aa3886fa0cf93853603603f8"
+SRC_URI[sha256sum] = "bea6f9de2cdce376195bd91e4a2fdfdf80bf3e480abff8e05b90a6458c1deb47"
+
+inherit pkgconfig
+
+PACKAGECONFIG ?= "gl gles2"
+
+PACKAGECONFIG[gl] = "--enable-gl,,virtual/libgl"
+PACKAGECONFIG[gles2] = "--enable-glesv2,,virtual/libgles2"
+
+do_configure() {
+	./waf configure --prefix=${prefix} ${EXTRA_OECONF}
+}
+
+do_compile() {
+	./waf build ${PARALLEL_MAKE}
+}
+
+do_install() {
+	./waf install --destdir=${D}
+}
-- 
1.7.9.5



