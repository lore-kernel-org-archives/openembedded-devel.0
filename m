Received: from smtprelay01.ispgateway.de ([80.67.31.28])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gerd_oe@gerwitec.de>) id 1Oz1a5-0003uQ-Gz
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 08:16:29 +0200
Received: from [84.174.244.91] (helo=localhost.localdomain)
	by smtprelay01.ispgateway.de with esmtpa (Exim 4.68)
	(envelope-from <gerd_oe@gerwitec.de>)
	id 1Oz1YB-0007pU-MB; Fri, 24 Sep 2010 08:14:27 +0200
From: Gerd Wiegand <gerd_oe@gerwitec.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Sep 2010 08:14:24 +0200
Message-Id: <1285308864-3037-1-git-send-email-gerd_oe@gerwitec.de>
X-Mailer: git-send-email 1.7.0.4
X-Df-Sender: 141887
X-SA-Exim-Connect-IP: 80.67.31.28
X-SA-Exim-Mail-From: gerd_oe@gerwitec.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] expat: altered recipe for v2.0.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Sep 2010 06:16:29 -0000

expat-2.0.1.tar.gz has no leading directory, so it unpacked directly in
${WORKDIR} and the following task fails.
* added do_unpack() which create the right directory structur
* updated md5 and sha256 sums

Signed-off-by: Gerd Wiegand <gerd_oe@gerwitec.de>
---
 recipes/expat/expat_2.0.1.bb |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/recipes/expat/expat_2.0.1.bb b/recipes/expat/expat_2.0.1.bb
index 5ff9f1e..6752fd5 100644
--- a/recipes/expat/expat_2.0.1.bb
+++ b/recipes/expat/expat_2.0.1.bb
@@ -1,14 +1,19 @@
 require expat.inc
-PR = "r3"
+PR = "r4"
 
 BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI += "file://autotools.patch"
-SRC_URI[src.md5sum] = "ee8b492592568805593f81f8cdf2a04c"
-SRC_URI[src.sha256sum] = "847660b4df86e707c9150e33cd8c25bc5cd828f708c7418e765e3e983a2e5e93"
+SRC_URI[src.md5sum] = "f8785ec51167c2f90d1fdb8dff6bb969"
+SRC_URI[src.sha256sum] = "e03a463b6892ada099a68ce2d38bc4d2495612e7acd076d7a453d1a2de226212"
 
 inherit lib_package
 
+do_unpack() {
+	mkdir -p ${WORKDIR}/expat-${PV}
+	tar -xzf ${DL_DIR}/expat-${PV}.tar.gz -C expat-${PV}
+}
+
 do_configure() {
 	rm -f ${S}/conftools/libtool.m4
 	touch ${S}/conftools/libtool.m4
-- 
1.7.0.4



