Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1S6izC-0005sE-Bq
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Mar 2012 14:38:58 +0100
Received: by eekc1 with SMTP id c1so641434eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Mar 2012 06:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=xx/AMDANg/Khj+ulhljcteyIrpw74sbuhqInQ4qypyc=;
	b=KKcxhn1gztNpqS8UJFLFbl321qRj3Y4eYUI/6wLQai+6af2cCDTeRu+uQXg7X4xzFq
	hvW9KOGYXsHjygmu1+GYc6IgRuTbiatwXHEFCJX8G4ATpC9T93PyZCO9eTFZbqa7edS7
	2lG45mEGoMA0d33p3tu6Ut07m9OJFPaAUTP/6pMc5Hwum6vBNeq3Z9muRGC9eeRni9KW
	U6oo49pkMZsKAq9V4m6cyXIwYxUVXy6UvvZSsy2CO0QJtIuJ6ceWbG/Pm+vej8jGKaYk
	MsbIrtH8yS5EQIchodDXu1Z/x7MeJHxqjmwS8p6/0o06gMYqt5pzMBN6kROvn97Uq3mG
	wc8Q==
Received: by 10.14.39.195 with SMTP id d43mr1348411eeb.28.1331472616419;
	Sun, 11 Mar 2012 06:30:16 -0700 (PDT)
Received: from localhost.localdomain (D4B268BA.static.ziggozakelijk.nl.
	[212.178.104.186])
	by mx.google.com with ESMTPS id r44sm1802725eef.2.2012.03.11.06.30.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 11 Mar 2012 06:30:14 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Mar 2012 14:32:11 +0100
Message-Id: <1331472732-28668-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [2011.03-maintenance] [PATCH 1/2] tzcode/tzdata: moved to 2012b; changed src location
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
X-List-Received-Date: Sun, 11 Mar 2012 13:38:58 -0000

elsie does not respond, so moved to ftp.iana.org (also used by oe-core)

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 recipes/tzcode/tzcode-native.inc      |    6 +++---
 recipes/tzcode/tzcode-native_2011e.bb |   16 ----------------
 recipes/tzcode/tzcode-native_2012b.bb |   17 +++++++++++++++++
 recipes/tzdata/tzdata.inc             |    4 ++--
 recipes/tzdata/tzdata_2011b.bb        |   11 -----------
 recipes/tzdata/tzdata_2012b.bb        |   11 +++++++++++
 6 files changed, 33 insertions(+), 32 deletions(-)
 delete mode 100644 recipes/tzcode/tzcode-native_2011e.bb
 create mode 100644 recipes/tzcode/tzcode-native_2012b.bb
 delete mode 100644 recipes/tzdata/tzdata_2011b.bb
 create mode 100644 recipes/tzdata/tzdata_2012b.bb

diff --git a/recipes/tzcode/tzcode-native.inc b/recipes/tzcode/tzcode-native.inc
index 78ddec5..94d1bd9 100644
--- a/recipes/tzcode/tzcode-native.inc
+++ b/recipes/tzcode/tzcode-native.inc
@@ -1,9 +1,9 @@
 DESCRIPTION = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
-INC_PR = "r4"
+INC_PR = "r5"
 
 SRC_URI = " \
-        ftp://elsie.nci.nih.gov/pub/tzcode${PV}.tar.gz;name=tzcode-${PV} \
-        ftp://elsie.nci.nih.gov/pub/tzdata${TZDATA_PV}.tar.gz;name=tzdata-${TZDATA_PV} \
+	ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode-${PV} \
+	ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata-${TZDATA_PV} \
 	"
 
 S = "${WORKDIR}"
diff --git a/recipes/tzcode/tzcode-native_2011e.bb b/recipes/tzcode/tzcode-native_2011e.bb
deleted file mode 100644
index 2bf4f4c..0000000
--- a/recipes/tzcode/tzcode-native_2011e.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require tzcode-native.inc
-
-# Note that elsie.nci.nih.gov removes old versions when new is coming out
-# So if this doesn't build for you because of missing source file, just
-# bump it to the latest available version, removing old one
-# Also, tzdata (and it is needed to build tzcode) version can differ from
-# tzcode version, thus this variable
-
-TZDATA_PV = "2011e"
-
-PR = "${INC_PR}.0"
-
-SRC_URI[tzcode-2011e.md5sum] = "fbfc05dbf9ebcfe7c4bba18549870173"
-SRC_URI[tzcode-2011e.sha256sum] = "8fb00f8763aa51d83d6f3190d144124bb7176ca829fc08823d6205297bf0426b"
-SRC_URI[tzdata-2011e.md5sum] = "044a07072300a0ee72b046e5a9a4ec90"
-SRC_URI[tzdata-2011e.sha256sum] = "44fef01de4589a4979eb6b5fdbbfd21a3b135852af1ecbfb9e0368ae47392c79"
diff --git a/recipes/tzcode/tzcode-native_2012b.bb b/recipes/tzcode/tzcode-native_2012b.bb
new file mode 100644
index 0000000..4d3477c
--- /dev/null
+++ b/recipes/tzcode/tzcode-native_2012b.bb
@@ -0,0 +1,17 @@
+require tzcode-native.inc
+
+# Note that elsie.nci.nih.gov removes old versions when new is coming out
+# So if this doesn't build for you because of missing source file, just
+# bump it to the latest available version, removing old one
+# Also, tzdata (and it is needed to build tzcode) version can differ from
+# tzcode version, thus this variable
+
+TZDATA_PV = "2012b"
+
+PR = "${INC_PR}.0"
+
+SRC_URI[tzcode-2012b.md5sum] = "6137322ffd36e1fd5128885be1c57008"
+SRC_URI[tzcode-2012b.sha256sum] = "4345a2de239a7b6e5ab286052cc269eb07d63798ae14ba715eb4c6bdfa0f3350"
+SRC_URI[tzdata-2012b.md5sum] = "0615fd29def380a917e528433c820368"
+SRC_URI[tzdata-2012b.sha256sum] = "2f9f8e2d1ae087be5917f60c3946e8dc3fe1068d7738c3395f2125135309e745"
+
diff --git a/recipes/tzdata/tzdata.inc b/recipes/tzdata/tzdata.inc
index dd5c2c9..af00d4c 100644
--- a/recipes/tzdata/tzdata.inc
+++ b/recipes/tzdata/tzdata.inc
@@ -3,7 +3,7 @@ SECTION = "base"
 PRIORITY = "optional"
 DEPENDS = "tzcode-native"
 
-INC_PR = "r8"
+INC_PR = "r1"
 
 DEFAULT_TIMEZONE ?= "Europe/London"
 
@@ -12,7 +12,7 @@ RCONFLICTS_${PN} = "timezones timezone-africa timezone-america timezone-antarcti
              timezone-australia timezone-europe timezone-indian \
              timezone-iso3166.tab timezone-pacific timezone-zone.tab"
 
-SRC_URI = "ftp://elsie.nci.nih.gov/pub/tzdata${PV}.tar.gz;name=tar"
+SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tar"
 
 S = "${WORKDIR}"
 
diff --git a/recipes/tzdata/tzdata_2011b.bb b/recipes/tzdata/tzdata_2011b.bb
deleted file mode 100644
index 87ba619..0000000
--- a/recipes/tzdata/tzdata_2011b.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require tzdata.inc
-
-# Note that elsie.nci.nih.gov removes old archives when new is being
-# released. So if this doesn't build for you because of missing source file
-# just bump it to the latest available version, removing old one
-
-PR = "${INC_PR}.0"
-
-SRC_URI[tar.md5sum] = "9eaf3ca354c42a32bd28e623539bf0e0"
-SRC_URI[tar.sha256sum] = "ff45f5ddc2ec925249626d00d7bc2ffff587e0956a1d8245517a023bf27e4cc9"
-
diff --git a/recipes/tzdata/tzdata_2012b.bb b/recipes/tzdata/tzdata_2012b.bb
new file mode 100644
index 0000000..8605331
--- /dev/null
+++ b/recipes/tzdata/tzdata_2012b.bb
@@ -0,0 +1,11 @@
+require tzdata.inc
+
+# Note that elsie.nci.nih.gov removes old archives when new is being
+# released. So if this doesn't build for you because of missing source file
+# just bump it to the latest available version, removing old one
+
+PR = "${INC_PR}.0"
+
+SRC_URI[tar.md5sum] = "0615fd29def380a917e528433c820368"
+SRC_URI[tar.sha256sum] = "2f9f8e2d1ae087be5917f60c3946e8dc3fe1068d7738c3395f2125135309e745"
+
-- 
1.7.0.4



