Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1OUhfn-0003wn-Su
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 16:57:01 +0200
Received: from localhost.localdomain (build2.altell.local [192.168.1.26])
	by mail.altell.local (Postfix) with ESMTP id 860C746CD;
	Fri,  2 Jul 2010 18:52:09 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Jul 2010 18:57:32 +0400
Message-Id: <1278082654-10070-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.5.6.5
X-Altell-MailScanner-ID: 860C746CD.58561
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_05,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] tzdata: fix RPROVIDES definitions
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
X-List-Received-Date: Fri, 02 Jul 2010 14:57:02 -0000

It seems a bit strange for tzdata-smth explicitly rprovide tzdata-smth, most
probably it were timezone-* packages that ought to be rprovided (see
RCONFLICTS in the same .inc).

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/tzdata/tzdata.inc |   56 ++++++++++++++++++++++----------------------
 1 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/recipes/tzdata/tzdata.inc b/recipes/tzdata/tzdata.inc
index 1f4dfdb..ac9a6a7 100644
--- a/recipes/tzdata/tzdata.inc
+++ b/recipes/tzdata/tzdata.inc
@@ -3,7 +3,7 @@ SECTION = "base"
 PRIORITY = "optional"
 DEPENDS = "tzcode-native"
 
-INC_PR = "r7"
+INC_PR = "r8"
 
 DEFAULT_TIMEZONE ?= "Europe/London"
 
@@ -54,54 +54,54 @@ PACKAGE_ARCH = "all"
 # Packages primarily organized by directory with a major city
 # in most time zones in the base package
 
-PACKAGES = "${PN}-dbg tzdata tzdata-misc tzdata-posix tzdata-right tzdata-africa \
-    tzdata-americas tzdata-antarctica tzdata-arctic tzdata-asia \
-    tzdata-atlantic tzdata-australia tzdata-europe tzdata-pacific"
+PACKAGES = "${PN}-dbg ${PN} ${PN}-misc ${PN}-posix ${PN}-right ${PN}-africa \
+    ${PN}-americas ${PN}-antarctica ${PN}-arctic ${PN}-asia \
+    ${PN}-atlantic ${PN}-australia ${PN}-europe ${PN}-pacific"
 
 ALLOW_EMPTY_${PN}-dbg = "1"
 
-FILES_tzdata-africa += "${datadir}/zoneinfo/Africa/*"
-RPROVIDES_tzdata-africa = "tzdata-africa"
+FILES_${PN}-africa += "${datadir}/zoneinfo/Africa/*"
+RPROVIDES_${PN}-africa = "timezone-africa"
 
-FILES_tzdata-americas += "${datadir}/zoneinfo/America/*  \
+FILES_${PN}-americas += "${datadir}/zoneinfo/America/*  \
                 ${datadir}/zoneinfo/US/*                \
                 ${datadir}/zoneinfo/Brazil/*            \
                 ${datadir}/zoneinfo/Canada/*            \
                 ${datadir}/zoneinfo/Mexico/*            \
                 ${datadir}/zoneinfo/Chile/*"
-RPROVIDES_tzdata-americas = "tzdata-americas"
+RPROVIDES_${PN}-americas = "timezone-americas"
 
-FILES_tzdata-antarctica += "${datadir}/zoneinfo/Antarctica/*"
-RPROVIDES_tzdata-antarctica = "tzdata-antarctica"
+FILES_${PN}-antarctica += "${datadir}/zoneinfo/Antarctica/*"
+RPROVIDES_${PN}-antarctica = "timezone-antarctica"
 
-FILES_tzdata-arctic += "${datadir}/zoneinfo/Arctic/*"
-RPROVIDES_tzdata-arctic = "tzdata-arctic"
+FILES_${PN}-arctic += "${datadir}/zoneinfo/Arctic/*"
+RPROVIDES_${PN}-arctic = "timezone-arctic"
 
-FILES_tzdata-asia += "${datadir}/zoneinfo/Asia/*        \
+FILES_${PN}-asia += "${datadir}/zoneinfo/Asia/*        \
                 ${datadir}/zoneinfo/Indian/*            \
                 ${datadir}/zoneinfo/Mideast/*"
-RPROVIDES_tzdata-asia = "tzdata-asia"
+RPROVIDES_${PN}-asia = "timezone-asia"
 
-FILES_tzdata-atlantic += "${datadir}/zoneinfo/Atlantic/*"
-RPROVIDES_tzdata-atlantic = "tzdata-atlantic"
+FILES_${PN}-atlantic += "${datadir}/zoneinfo/Atlantic/*"
+RPROVIDES_${PN}-atlantic = "timezone-atlantic"
 
-FILES_tzdata-australia += "${datadir}/zoneinfo/Australia/*"
-RPROVIDES_tzdata-australia = "tzdata-australia"
+FILES_${PN}-australia += "${datadir}/zoneinfo/Australia/*"
+RPROVIDES_${PN}-australia = "timezone-australia"
 
-FILES_tzdata-europe += "${datadir}/zoneinfo/Europe/*"
-RPROVIDES_tzdata-europe = "tzdata-europe"
+FILES_${PN}-europe += "${datadir}/zoneinfo/Europe/*"
+RPROVIDES_${PN}-europe = "timezone-europe"
 
-FILES_tzdata-pacific += "${datadir}/zoneinfo/Pacific/*"
-RPROVIDES_tzdata-pacific = "tzdata-pacific"
+FILES_${PN}-pacific += "${datadir}/zoneinfo/Pacific/*"
+RPROVIDES_${PN}-pacific = "timezone-pacific"
 
-FILES_tzdata-posix += "${datadir}/zoneinfo/posix/*"
-RPROVIDES_tzdata-posix = "tzdata-posix"
+FILES_${PN}-posix += "${datadir}/zoneinfo/posix/*"
+RPROVIDES_${PN}-posix = "timezone-posix"
 
-FILES_tzdata-right += "${datadir}/zoneinfo/right/*"
-RPROVIDES_tzdata-right = "tzdata-right"
+FILES_${PN}-right += "${datadir}/zoneinfo/right/*"
+RPROVIDES_${PN}-right = "timezone-right"
 
 
-FILES_tzdata-misc += "${datadir}/zoneinfo/Cuba           \
+FILES_${PN}-misc += "${datadir}/zoneinfo/Cuba           \
                 ${datadir}/zoneinfo/Egypt                \
                 ${datadir}/zoneinfo/Eire                 \
                 ${datadir}/zoneinfo/Factory              \
@@ -119,7 +119,7 @@ FILES_tzdata-misc += "${datadir}/zoneinfo/Cuba           \
                 ${datadir}/zoneinfo/Portugal             \
                 ${datadir}/zoneinfo/Singapore            \
                 ${datadir}/zoneinfo/Turkey"
-RPROVIDES_tzdata-misc = "tzdata-misc"
+RPROVIDES_${PN}-misc = "timezone-misc"
 
 
 FILES_${PN} += "${datadir}/zoneinfo/Pacific/Honolulu     \
-- 
1.5.6.5



