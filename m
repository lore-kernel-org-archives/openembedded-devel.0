Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@mate.hex>) id 1O08fF-0006VE-HI
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Apr 2010 09:30:06 +0200
Received: by mate.hex (Postfix, from userid 1000)
	id A07F12DBDD; Fri,  9 Apr 2010 11:23:18 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Apr 2010 11:23:07 +0400
Message-Id: <1270797788-25090-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <201004081428.07413.khimov@altell.ru>
References: <201004081428.07413.khimov@altell.ru>
X-SA-Exim-Connect-IP: 93.100.16.104
X-SA-Exim-Mail-From: rik@mate.hex
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	RCVD_IN_PBL,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] tzdata/tzcode: leave only latest version
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
X-List-Received-Date: Fri, 09 Apr 2010 07:30:06 -0000

I don't see any value in old tzdata/tzcode-native recipes as tzcode is only
used to compile tzdata and compiled tzdata should be compatible with any
version of glibc and it's good to have it latest. So I think we should only
leave latest tzdata version and move that forward whenever someone discovers
that elsie.nci.nih.gov dropped that version. Same for tzcode.

Add comments to unconditionally move that versions forward whenever there is
a new release.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/tzcode/tzcode-native.inc       |    7 ++++++-
 recipes/tzcode/tzcode-native_2007k.bb  |    7 -------
 recipes/tzcode/tzcode-native_2009k.bb  |    5 -----
 recipes/tzcode/tzcode-native_2010f.bb  |   14 +++++++-------
 recipes/tzdata/tzdata.inc              |    4 ++--
 recipes/tzdata/tzdata/russia-2010.diff |   32 --------------------------------
 recipes/tzdata/tzdata_2007k.bb         |    3 ---
 recipes/tzdata/tzdata_2009m.bb         |    3 ---
 recipes/tzdata/tzdata_2009o.bb         |    3 ---
 recipes/tzdata/tzdata_2009p.bb         |    3 ---
 recipes/tzdata/tzdata_2009s.bb         |    4 ----
 recipes/tzdata/tzdata_2010b.bb         |    5 -----
 recipes/tzdata/tzdata_2010h.bb         |    7 +++++--
 13 files changed, 20 insertions(+), 77 deletions(-)
 delete mode 100644 recipes/tzcode/tzcode-native_2007k.bb
 delete mode 100644 recipes/tzcode/tzcode-native_2009k.bb
 delete mode 100644 recipes/tzdata/tzdata/russia-2010.diff
 delete mode 100644 recipes/tzdata/tzdata_2007k.bb
 delete mode 100644 recipes/tzdata/tzdata_2009m.bb
 delete mode 100644 recipes/tzdata/tzdata_2009o.bb
 delete mode 100644 recipes/tzdata/tzdata_2009p.bb
 delete mode 100644 recipes/tzdata/tzdata_2009s.bb
 delete mode 100644 recipes/tzdata/tzdata_2010b.bb

diff --git a/recipes/tzcode/tzcode-native.inc b/recipes/tzcode/tzcode-native.inc
index 0d6bd5b..a3a16da 100644
--- a/recipes/tzcode/tzcode-native.inc
+++ b/recipes/tzcode/tzcode-native.inc
@@ -1,5 +1,10 @@
 DESCRIPTION = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
-INC_PR = "r2"
+INC_PR = "r3"
+
+SRC_URI = " \
+	ftp://elsie.nci.nih.gov/pub/tzcode${PV}.tar.gz;name=tzcode-${PV} \
+	ftp://elsie.nci.nih.gov/pub/tzdata${TZDATA_PV}.tar.gz;name=tzdata-${TZDATA_PV} \
+	"
 
 S = "${WORKDIR}"
 
diff --git a/recipes/tzcode/tzcode-native_2007k.bb b/recipes/tzcode/tzcode-native_2007k.bb
deleted file mode 100644
index fe0fb87..0000000
--- a/recipes/tzcode/tzcode-native_2007k.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require tzcode-native.inc
-SRC_URI = "\
-  http://bent.latency.net/bent/darcs/zoneinfo-${PV}/src/tzcode${PV}.tar.gz \
-  http://bent.latency.net/bent/darcs/zoneinfo-${PV}/src/tzdata${PV}.tar.gz \
-"
-
-PR = "${INC_PR}.0"
diff --git a/recipes/tzcode/tzcode-native_2009k.bb b/recipes/tzcode/tzcode-native_2009k.bb
deleted file mode 100644
index 632dc84..0000000
--- a/recipes/tzcode/tzcode-native_2009k.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require tzcode-native.inc
-SRC_URI = "ftp://elsie.nci.nih.gov/pub/tzcode${PV}.tar.gz \
-           ftp://elsie.nci.nih.gov/pub/tzdata2009p.tar.gz \
-	  "
-PR = "${INC_PR}.1"
diff --git a/recipes/tzcode/tzcode-native_2010f.bb b/recipes/tzcode/tzcode-native_2010f.bb
index 937726f..f2fbffd 100644
--- a/recipes/tzcode/tzcode-native_2010f.bb
+++ b/recipes/tzcode/tzcode-native_2010f.bb
@@ -1,13 +1,13 @@
 require tzcode-native.inc
 
 # Note that elsie.nci.nih.gov removes old versions when new is coming out
-# Other tzcode/tzdata recipes use Gentoo mirrors, but that is unreliable
-# wrt older versions too. If you find any stable tzdata/tzcode mirror, please
-# fix this URLs
-SRC_URI = " \
-	ftp://elsie.nci.nih.gov/pub/tzcode${PV}.tar.gz;name=tzcode-${PV} \
-	ftp://elsie.nci.nih.gov/pub/tzdata2010h.tar.gz;name=tzdata-2010h \
-	"
+# So if this doesn't build for you because of missing source file, just
+# bump it to the latest available version, removing old one
+# Also, tzdata (and it is needed to build tzcode) version can differ from
+# tzcode version, thus this variable
+
+TZDATA_PV = "2010h"
+
 SRC_URI[tzcode-2010f.md5sum] = "e530cc9bbdfd5e8c1eac21a68f4d5656"
 SRC_URI[tzcode-2010f.sha256sum] = "651d866c91ada925b4ac9491e69ebd5c355c46b2c01dd1741b5e6a609d93eb1e"
 SRC_URI[tzdata-2010h.md5sum] = "d384ac091e6d56802f9b3e6b3d3f0f2e"
diff --git a/recipes/tzdata/tzdata.inc b/recipes/tzdata/tzdata.inc
index 6d8062e..1f4dfdb 100644
--- a/recipes/tzdata/tzdata.inc
+++ b/recipes/tzdata/tzdata.inc
@@ -3,7 +3,7 @@ SECTION = "base"
 PRIORITY = "optional"
 DEPENDS = "tzcode-native"
 
-INC_PR = "r6"
+INC_PR = "r7"
 
 DEFAULT_TIMEZONE ?= "Europe/London"
 
@@ -12,7 +12,7 @@ RCONFLICTS= "timezones timezone-africa timezone-america timezone-antarctica \
              timezone-australia timezone-europe timezone-indian \
              timezone-iso3166.tab timezone-pacific timezone-zone.tab"
 
-SRC_URI = "http://bent.latency.net/bent/darcs/zoneinfo-${PV}/src/tzdata${PV}.tar.gz"
+SRC_URI = "ftp://elsie.nci.nih.gov/pub/tzdata${PV}.tar.gz;name=tar"
 
 S = "${WORKDIR}"
 
diff --git a/recipes/tzdata/tzdata/russia-2010.diff b/recipes/tzdata/tzdata/russia-2010.diff
deleted file mode 100644
index 4616bad..0000000
--- a/recipes/tzdata/tzdata/russia-2010.diff
+++ /dev/null
@@ -1,32 +0,0 @@
---- a/europe
-+++ b/europe
-@@ -2041,7 +2041,8 @@
- 			 3:00	Russia	KUY%sT	1991 Mar 31 2:00s
- 			 2:00	Russia	KUY%sT	1991 Sep 29 2:00s
- 			 3:00	-	KUYT	1991 Oct 20 3:00
--			 4:00	Russia	SAM%sT	# Samara Time
-+			 4:00	Russia	SAM%sT	2010 Mar 28 2:00s
-+			 3:00	Russia	SAM%sT	# Samara Time
- #
- # From Oscar van Vlijmen (2001-08-25): [This region consists of]
- # Respublika Bashkortostan, Komi-Permyatskij avtonomnyj okrug,
-@@ -2194,7 +2195,8 @@
- 			11:00	-	PETT	1930 Jun 21 # P-K Time
- 			12:00	Russia	PET%sT	1991 Mar 31 2:00s
- 			11:00	Russia	PET%sT	1992 Jan 19 2:00s
--			12:00	Russia	PET%sT
-+                        12:00   Russia  PET%sT  2010 Mar 28 2:00s
-+                        11:00   Russia  PET%sT
- #
- # Chukotskij avtonomnyj okrug
- Zone Asia/Anadyr	11:49:56 -	LMT	1924 May  2
-@@ -2202,7 +2204,8 @@
- 			13:00	Russia	ANA%sT	1982 Apr  1 0:00s
- 			12:00	Russia	ANA%sT	1991 Mar 31 2:00s
- 			11:00	Russia	ANA%sT	1992 Jan 19 2:00s
--			12:00	Russia	ANA%sT
-+                        12:00   Russia  ANA%sT  2010 Mar 28 2:00s
-+                        11:00   Russia  ANA%sT
- 
- # Serbia
- # Zone	NAME		GMTOFF	RULES	FORMAT	[UNTIL]
diff --git a/recipes/tzdata/tzdata_2007k.bb b/recipes/tzdata/tzdata_2007k.bb
deleted file mode 100644
index 7bb6671..0000000
--- a/recipes/tzdata/tzdata_2007k.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require tzdata.inc
-SRC_URI = "http://bent.latency.net/bent/darcs/zoneinfo-${PV}/src/tzdata${PV}.tar.gz"
-PR = "${INC_PR}.0"
diff --git a/recipes/tzdata/tzdata_2009m.bb b/recipes/tzdata/tzdata_2009m.bb
deleted file mode 100644
index 17c2dd4..0000000
--- a/recipes/tzdata/tzdata_2009m.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require tzdata.inc
-SRC_URI = "ftp://elsie.nci.nih.gov/pub/tzdata${PV}.tar.gz"
-PR = "${INC_PR}.0"
diff --git a/recipes/tzdata/tzdata_2009o.bb b/recipes/tzdata/tzdata_2009o.bb
deleted file mode 100644
index 17c2dd4..0000000
--- a/recipes/tzdata/tzdata_2009o.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require tzdata.inc
-SRC_URI = "ftp://elsie.nci.nih.gov/pub/tzdata${PV}.tar.gz"
-PR = "${INC_PR}.0"
diff --git a/recipes/tzdata/tzdata_2009p.bb b/recipes/tzdata/tzdata_2009p.bb
deleted file mode 100644
index 17c2dd4..0000000
--- a/recipes/tzdata/tzdata_2009p.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require tzdata.inc
-SRC_URI = "ftp://elsie.nci.nih.gov/pub/tzdata${PV}.tar.gz"
-PR = "${INC_PR}.0"
diff --git a/recipes/tzdata/tzdata_2009s.bb b/recipes/tzdata/tzdata_2009s.bb
deleted file mode 100644
index 2d406bd..0000000
--- a/recipes/tzdata/tzdata_2009s.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require tzdata.inc
-
-SRC_URI = "http://ftp.uni-erlangen.de/pub/Linux/MIRROR.gentoo/distfiles/tzdata${PV}.tar.gz"
-PR = "${INC_PR}.0"
diff --git a/recipes/tzdata/tzdata_2010b.bb b/recipes/tzdata/tzdata_2010b.bb
deleted file mode 100644
index 9bfdfba..0000000
--- a/recipes/tzdata/tzdata_2010b.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require tzdata.inc
-
-SRC_URI = "http://ftp.uni-erlangen.de/pub/Linux/MIRROR.gentoo/distfiles/tzdata${PV}.tar.gz \
-	file://russia-2010.diff;patch=1"
-PR = "${INC_PR}.1"
diff --git a/recipes/tzdata/tzdata_2010h.bb b/recipes/tzdata/tzdata_2010h.bb
index 6e8e28e..1e00fd3 100644
--- a/recipes/tzdata/tzdata_2010h.bb
+++ b/recipes/tzdata/tzdata_2010h.bb
@@ -1,7 +1,10 @@
 require tzdata.inc
 
-SRC_URI = "http://ftp.uni-erlangen.de/pub/Linux/MIRROR.gentoo/distfiles/tzdata${PV}.tar.gz;name=tar \
-"
+# Note that elsie.nci.nih.gov removes old archives when new is being
+# released. So if this doesn't build for you because of missing source file
+# just bump it to the latest available version, removing old one
+
+PR = "${INC_PR}.0"
 
 SRC_URI[tar.md5sum] = "d384ac091e6d56802f9b3e6b3d3f0f2e"
 SRC_URI[tar.sha256sum] = "a4918d60f63440ba9b6050205881e8a98d718dc0c2b7df5955f43e781eab6e7d"
-- 
1.6.4.2



