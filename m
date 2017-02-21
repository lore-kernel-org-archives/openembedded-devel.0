Return-Path: <gthomas@mlbassoc.com>
X-Greylist: delayed 542 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 21 Feb 2017 11:10:35 UTC
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 8EABC71A84
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 11:10:35 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 8F5E668A01C; Tue, 21 Feb 2017 11:01:33 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 0BD6168A019;
	Tue, 21 Feb 2017 11:01:33 +0000 (GMT)
Received: by zeus.mlbassoc.com (Postfix, from userid 1000)
	id BF65E6740331; Tue, 21 Feb 2017 12:01:32 +0100 (CET)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Feb 2017 12:01:29 +0100
Message-Id: <1487674889-17516-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 2.7.4
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: [meta-oe][PATCH] fbgrab: Update to latest version
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
X-List-Received-Date: Tue, 21 Feb 2017 11:10:36 -0000

Update to version 1.3 (2015-06-16), fix recipe for different directory name

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 meta-oe/recipes-graphics/fbgrab/{fbgrab_1.2.bb => fbgrab_1.3.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/fbgrab/{fbgrab_1.2.bb => fbgrab_1.3.bb} (71%)

diff --git a/meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb b/meta-oe/recipes-graphics/fbgrab/fbgrab_1.3.bb
similarity index 71%
rename from meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb
rename to meta-oe/recipes-graphics/fbgrab/fbgrab_1.3.bb
index 1d87b86..905c1e5 100644
--- a/meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb
+++ b/meta-oe/recipes-graphics/fbgrab/fbgrab_1.3.bb
@@ -8,10 +8,10 @@ SRC_URI = "http://fbgrab.monells.se/${BP}.tar.gz"
 
 inherit autotools-brokensep
 
-S = "${WORKDIR}/${BPN}"
+S = "${WORKDIR}/${BP}"
 
-SRC_URI[md5sum] = "15b432735d6efd0373722bb96577b945"
-SRC_URI[sha256sum] = "61e0772ad6ea744ee597ae478398ddd0ba6fceee2cf343859bebde2c15bafb91"
+SRC_URI[md5sum] = "7d8c24081c681dfbba21f2934c1ac656"
+SRC_URI[sha256sum] = "5fab478cbf8731fbacefaa76236a8f8b38ccff920c53b3a8253bc35509fba8ed"
 
 do_configure_prepend() {
     sed -i 's|$(DESTDIR)/usr/man/|$(DESTDIR)${mandir}/|g' ${S}/Makefile
-- 
2.7.4


