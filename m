Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1OlM6J-0003Ra-Mg
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 15:21:37 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1OlM5t-0001Kj-Bw from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 06:20:45 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 17 Aug 2010 15:20:43 +0200
From: Noor Ahsan <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Aug 2010 19:18:25 +0600
Message-Id: <1282051105-15180-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 17 Aug 2010 13:20:43.0900 (UTC)
	FILETIME=[FF025BC0:01CB3E0E]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Noor_Ahsan@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] rpm2cpio-native: Run oe-stylize.py
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
X-List-Received-Date: Tue, 17 Aug 2010 13:21:38 -0000

* Run oe-stylize.py script on recipe and modified the recipe according to the output of oe-stylize.py.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 recipes/rpm2cpio/rpm2cpio-native_1.2_2.bb |   29 +++++++++++++----------------
 1 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/recipes/rpm2cpio/rpm2cpio-native_1.2_2.bb b/recipes/rpm2cpio/rpm2cpio-native_1.2_2.bb
index 151753d..252fd53 100644
--- a/recipes/rpm2cpio/rpm2cpio-native_1.2_2.bb
+++ b/recipes/rpm2cpio/rpm2cpio-native_1.2_2.bb
@@ -1,28 +1,25 @@
 # rpm2cpio-native build file
 # Copyright (C) 2005, Advanced Micro Devices, Inc.  All Rights Reserved
 # Released under the MIT license (see COPYING.MIT)
+LICENSE = "BSD"
+DEPENDS = "perl-native"
 
-DEPENDS="perl-native"
-LICENSE="BSD"
-SRC_URI="http://www.freebsd.org/cgi/cvsweb.cgi/%7Echeckout%7E/ports/archivers/rpm2cpio/files/rpm2cpio?rev=1.2"
+SRC_URI = "http://www.freebsd.org/cgi/cvsweb.cgi/%7Echeckout%7E/ports/archivers/rpm2cpio/files/rpm2cpio?rev=1.2"
+SRC_URI[md5sum] = "07f64fa3dae6eb8b1b578d01473a5c07"
+SRC_URI[sha256sum] = "a98cb1d9903192c4fcf40d82c705e091a5c193f87327703217749a5f4cc6197d"
 
-inherit native
+S = "${WORKDIR}"
 
-S="${WORKDIR}"
+inherit native
 
 do_compile() {
 }
-
 do_stage() {
-	install -d ${STAGING_BINDIR}
-	sed -e '1,1s|${bindir}/|${bindir}/env |' "rpm2cpio?rev=1.2" \
-		> ${STAGING_BINDIR}/rpm2cpio.pl
-
-	my_PERL="/usr/bin/env perl"
-	sed -e "s%/[a-zA-Z0-9/]*/bin/perl%$my_PERL%g" -i ${STAGING_BINDIR}/rpm2cpio.pl
-
-	chmod 0755 ${STAGING_BINDIR}/rpm2cpio.pl
+        install -d ${STAGING_BINDIR}
+        sed -e '1,1s|${bindir}/|${bindir}/env |' "rpm2cpio?rev=1.2" \
+                > ${STAGING_BINDIR}/rpm2cpio.pl
+        my_PERL="/usr/bin/env perl"
+        sed -e "s%/[a-zA-Z0-9/]*/bin/perl%$my_PERL%g" -i ${STAGING_BINDIR}/rpm2cpio.pl
+        chmod 0755 ${STAGING_BINDIR}/rpm2cpio.pl
 }
 
-SRC_URI[md5sum] = "07f64fa3dae6eb8b1b578d01473a5c07"
-SRC_URI[sha256sum] = "a98cb1d9903192c4fcf40d82c705e091a5c193f87327703217749a5f4cc6197d"
-- 
1.6.3.3



