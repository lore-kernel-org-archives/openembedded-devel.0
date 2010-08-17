Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1OlM7O-000542-6M
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 15:22:38 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1OlM75-0001ZS-4w from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 06:21:59 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 17 Aug 2010 15:21:57 +0200
From: Noor Ahsan <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Aug 2010 19:20:10 +0600
Message-Id: <1282051210-15346-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 17 Aug 2010 13:21:57.0839 (UTC)
	FILETIME=[2B148DF0:01CB3E0F]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Noor_Ahsan@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] rpm2cpio-native: convert to new style staging, remove 'do_stage()'
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
X-List-Received-Date: Tue, 17 Aug 2010 13:22:44 -0000

* Replace do_stage() with do_install from the recipe and replace all occurrences of ${STAGING_BINDIR} with ${D}{bindir}.
* Add NATIVE_INSTALL_WORKS = "1"
* Bump PR to "r1"

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 recipes/rpm2cpio/rpm2cpio-native_1.2_2.bb |   13 ++++++++-----
 1 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/recipes/rpm2cpio/rpm2cpio-native_1.2_2.bb b/recipes/rpm2cpio/rpm2cpio-native_1.2_2.bb
index 252fd53..ac3d673 100644
--- a/recipes/rpm2cpio/rpm2cpio-native_1.2_2.bb
+++ b/recipes/rpm2cpio/rpm2cpio-native_1.2_2.bb
@@ -3,6 +3,7 @@
 # Released under the MIT license (see COPYING.MIT)
 LICENSE = "BSD"
 DEPENDS = "perl-native"
+PR = "r1"
 
 SRC_URI = "http://www.freebsd.org/cgi/cvsweb.cgi/%7Echeckout%7E/ports/archivers/rpm2cpio/files/rpm2cpio?rev=1.2"
 SRC_URI[md5sum] = "07f64fa3dae6eb8b1b578d01473a5c07"
@@ -14,12 +15,14 @@ inherit native
 
 do_compile() {
 }
-do_stage() {
-        install -d ${STAGING_BINDIR}
+do_install() {
+        install -d ${D}${bindir}
         sed -e '1,1s|${bindir}/|${bindir}/env |' "rpm2cpio?rev=1.2" \
-                > ${STAGING_BINDIR}/rpm2cpio.pl
+                > ${D}${bindir}/rpm2cpio.pl
         my_PERL="/usr/bin/env perl"
-        sed -e "s%/[a-zA-Z0-9/]*/bin/perl%$my_PERL%g" -i ${STAGING_BINDIR}/rpm2cpio.pl
-        chmod 0755 ${STAGING_BINDIR}/rpm2cpio.pl
+        sed -e "s%/[a-zA-Z0-9/]*/bin/perl%$my_PERL%g" -i ${D}${bindir}/rpm2cpio.pl
+        chmod 0755 ${D}${bindir}/rpm2cpio.pl
 }
 
+NATIVE_INSTALL_WORKS = "1"
+
-- 
1.6.3.3



