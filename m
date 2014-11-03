Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D765A60557
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Nov 2014 01:41:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA31fvoV012154
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 2 Nov 2014 17:41:57 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Sun, 2 Nov 2014 17:41:57 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 3 Nov 2014 09:38:21 +0800
Message-ID: <1414978701-12934-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH] mariadb: update to 5.5.40
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
X-List-Received-Date: Mon, 03 Nov 2014 01:42:00 -0000
Content-Type: text/plain

Update mariadb from version 5.5.39 to 5.5.40

* rename mariadb_5.5.39.inc -> mariadb.inc
* add dependency bision-native for mariadb-native

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../mysql/{mariadb-native_5.5.39.bb => mariadb-native_5.5.40.bb}      | 4 ++--
 meta-oe/recipes-support/mysql/{mariadb_5.5.39.inc => mariadb.inc}     | 4 ++--
 .../recipes-support/mysql/{mariadb_5.5.39.bb => mariadb_5.5.40.bb}    | 3 +--
 3 files changed, 5 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-support/mysql/{mariadb-native_5.5.39.bb => mariadb-native_5.5.40.bb} (82%)
 rename meta-oe/recipes-support/mysql/{mariadb_5.5.39.inc => mariadb.inc} (98%)
 rename meta-oe/recipes-support/mysql/{mariadb_5.5.39.bb => mariadb_5.5.40.bb} (96%)

diff --git a/meta-oe/recipes-support/mysql/mariadb-native_5.5.39.bb b/meta-oe/recipes-support/mysql/mariadb-native_5.5.40.bb
similarity index 82%
rename from meta-oe/recipes-support/mysql/mariadb-native_5.5.39.bb
rename to meta-oe/recipes-support/mysql/mariadb-native_5.5.40.bb
index 9148dee..4ce960d 100644
--- a/meta-oe/recipes-support/mysql/mariadb-native_5.5.39.bb
+++ b/meta-oe/recipes-support/mysql/mariadb-native_5.5.40.bb
@@ -1,8 +1,8 @@
-require mariadb_${PV}.inc
+require mariadb.inc
 inherit native
 
 PROVIDES += "mysql5-native"
-DEPENDS = "ncurses-native zlib-native"
+DEPENDS = "ncurses-native zlib-native bison-native"
 
 RDEPENDS_${PN} = ""
 PACKAGES = ""
diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc b/meta-oe/recipes-support/mysql/mariadb.inc
similarity index 98%
rename from meta-oe/recipes-support/mysql/mariadb_5.5.39.inc
rename to meta-oe/recipes-support/mysql/mariadb.inc
index ae2e92b..20f5de2 100644
--- a/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -12,8 +12,8 @@ SRC_URI = "http://mirror.stshosting.co.uk/mariadb/mariadb-${PV}/source/mariadb-$
            file://mysqld.service \
           "
 
-SRC_URI[md5sum] = "917a807d8cf2c8ef9deedd2a89b6decd"
-SRC_URI[sha256sum] = "cb850865ab55ce5f01c99a612cc75b76ead5d75adfa75a606f453d32f9089d14"
+SRC_URI[md5sum] = "561bede89a8bd19c374dad2d8f24fdfe"
+SRC_URI[sha256sum] = "cbde17f4a31483143490def6fcce33310ebae49eafe92dc4ada0e7227202415a"
 
 S = "${WORKDIR}/mariadb-${PV}"
 
diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.39.bb b/meta-oe/recipes-support/mysql/mariadb_5.5.40.bb
similarity index 96%
rename from meta-oe/recipes-support/mysql/mariadb_5.5.39.bb
rename to meta-oe/recipes-support/mysql/mariadb_5.5.40.bb
index fee5b62..f24cb43 100644
--- a/meta-oe/recipes-support/mysql/mariadb_5.5.39.bb
+++ b/meta-oe/recipes-support/mysql/mariadb_5.5.40.bb
@@ -1,4 +1,4 @@
-require ${PN}_${PV}.inc
+require mariadb.inc
 
 EXTRA_OECMAKE += "-DSTACK_DIRECTION=-1"
 
@@ -25,4 +25,3 @@ RCONFLICTS_${PN}-client += "mysql5-client"
 RPROVIDES_${PN}-server += "mysql5-server"
 RREPLACES_${PN}-server += "mysql5-server"
 RCONFLICTS_${PN}-server += "mysql5-server"
-
-- 
1.9.1


