Received: from smtprelay-b21.telenor.se ([195.54.99.212])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf@emagii.com>) id 1RaU7w-0000z3-K0
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Dec 2011 16:18:44 +0100
Received: from ipb3.telenor.se (ipb3.telenor.se [195.54.127.166])
	by smtprelay-b21.telenor.se (Postfix) with ESMTP id EC274EB3D6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2011 16:11:48 +0100 (CET)
X-SENDER-IP: [83.227.56.19]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AtRLAJ9q505T4zgTPGdsb2JhbABDqyAZAQEBATcygXIBXBMBDzAfSwotCYd1BrYAiE6DGgSUcZIq
X-IronPort-AV: E=Sophos;i="4.71,345,1320620400"; d="scan'208";a="15342309"
Received: from c-1338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	hexagon.atmel.com) ([83.227.56.19])
	by ipb3.telenor.se with ESMTP; 13 Dec 2011 16:11:48 +0100
From: ulf@emagii.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Dec 2011 16:11:38 +0100
Message-Id: <1323789098-6941-1-git-send-email-ulf@emagii.com>
X-Mailer: git-send-email 1.7.4.1
Cc: Ulf Samuelsson <ulf@emagii.com>
Subject: [meta-oe] tz*: download location has moved
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
X-List-Received-Date: Tue, 13 Dec 2011 15:18:44 -0000

From: Ulf Samuelsson <ulf@emagii.com>

Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
---
 meta-oe/recipes-extended/tzcode/tzcode-native.inc |    6 +++---
 meta-oe/recipes-extended/tzdata/tzdata.inc        |    4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-extended/tzcode/tzcode-native.inc b/meta-oe/recipes-extended/tzcode/tzcode-native.inc
index b946e71..2f9f176 100644
--- a/meta-oe/recipes-extended/tzcode/tzcode-native.inc
+++ b/meta-oe/recipes-extended/tzcode/tzcode-native.inc
@@ -1,9 +1,9 @@
 DESCRIPTION = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
-INC_PR = "r4"
+INC_PR = "r5"
 
 SRC_URI = " \
-        ftp://elsie.nci.nih.gov/pub/tzcode${PV}.tar.gz;name=tzcode-${PV};subdir=${BPN}-${PV} \
-        ftp://elsie.nci.nih.gov/pub/tzdata${TZDATA_PV}.tar.gz;name=tzdata-${TZDATA_PV};subdir=${BPN}-${PV} \
+        http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode-${PV};subdir=${BPN}-${PV} \
+        http://www.iana.org/time-zones/repository/releases/tzdata${TZDATA_PV}.tar.gz;name=tzdata-${TZDATA_PV};subdir=${BPN}-${PV} \
 	"
 
 inherit native
diff --git a/meta-oe/recipes-extended/tzdata/tzdata.inc b/meta-oe/recipes-extended/tzdata/tzdata.inc
index ceec924..94f73d8 100644
--- a/meta-oe/recipes-extended/tzdata/tzdata.inc
+++ b/meta-oe/recipes-extended/tzdata/tzdata.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Timezone data"
 SECTION = "base"
 DEPENDS = "tzcode-native"
 
-INC_PR = "r10"
+INC_PR = "r11"
 
 DEFAULT_TIMEZONE ?= "Europe/London"
 
@@ -11,7 +11,7 @@ RCONFLICTS_${PN} = "timezones timezone-africa timezone-america timezone-antarcti
              timezone-australia timezone-europe timezone-indian \
              timezone-iso3166.tab timezone-pacific timezone-zone.tab"
 
-SRC_URI = "ftp://elsie.nci.nih.gov/pub/tzdata${PV}.tar.gz;subdir=${BPN}-${PV}"
+SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;subdir=${BPN}-${PV}"
 
 TZONES= "africa antarctica asia australasia europe northamerica southamerica  \
          factory solar87 solar88 solar89 etcetera backward systemv \
-- 
1.7.4.1



