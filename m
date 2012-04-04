Received: from pd95cbf07.dip0.t-ipconnect.de ([217.92.191.7] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1SFNN2-0003Ar-0B
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Apr 2012 12:23:20 +0200
Received: by localhost (Postfix, from userid 1000)
	id D65D4C2CC0; Wed,  4 Apr 2012 12:14:09 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Tom Rini <tom.rini@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Wed,  4 Apr 2012 12:14:07 +0200
Message-Id: <21613e405cad072feef779c8e9b374a2f0984158.1333534095.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1333534095.git.sledz@dresearch-fe.de>
References: <cover.1333534095.git.sledz@dresearch-fe.de>
Subject: [2011.03-maintenance 1/1] docbook-utils-native: fix syntax problem in jw.in
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
X-List-Received-Date: Wed, 04 Apr 2012 10:23:20 -0000

Fix runtime error occurred e.g. with docbook-to-man calls:

  grep: character class syntax is [[:space:]], not [:space:]
  grep: character class syntax is [[:space:]], not [:space:]
  jw: There is no frontend called "/docbook/utils-0.6.14/frontends/docbook".

See also:

  <https://qa.mandriva.com/show_bug.cgi?id=61127>

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 .../docbook-utils/docbook-utils-0.6.14/re.patch    |   29 ++++++++++++++++++++
 .../docbook-utils/docbook-utils-native_0.6.14.bb   |    8 ++++-
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 recipes/docbook-utils/docbook-utils-0.6.14/re.patch

diff --git a/recipes/docbook-utils/docbook-utils-0.6.14/re.patch b/recipes/docbook-utils/docbook-utils-0.6.14/re.patch
new file mode 100644
index 0000000..db079d6
--- /dev/null
+++ b/recipes/docbook-utils/docbook-utils-0.6.14/re.patch
@@ -0,0 +1,29 @@
+Upstream-Status: Pending
+
+Fix runtime error occurred e.g. with docbook-to-man calls:
+
+  grep: character class syntax is [[:space:]], not [:space:]
+  grep: character class syntax is [[:space:]], not [:space:]
+  jw: There is no frontend called "/docbook/utils-0.6.14/frontends/docbook".
+
+See also:
+
+   <https://qa.mandriva.com/show_bug.cgi?id=61127>
+
+Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
+
+diff -Nurd docbook-utils-0.6.14-orig/bin/jw.in docbook-utils-0.6.14/bin/jw.in
+--- docbook-utils-0.6.14-orig/bin/jw.in	2012-03-29 07:50:00.789564826 +0200
++++ docbook-utils-0.6.14/bin/jw.in	2012-03-29 07:52:10.371302967 +0200
+@@ -80,9 +80,9 @@
+ SGML_CATALOGS_DIR="/etc/sgml"
+ if [ -f "$SGML_CONF" ]
+ then
+-  RE='^[:space:]*SGML_BASE_DIR[:space:]*=[:space:]*'
++  RE='^[[:space:]]*SGML_BASE_DIR[[:space:]]*=[[:space:]]*'
+   SGML_BASE_DIR=`grep $RE $SGML_CONF | sed "s/$RE//"`
+-  RE='^[:space:]*SGML_CATALOGS_DIR[:space:]*=[:space:]*'
++  RE='^[[:space:]]*SGML_CATALOGS_DIR[[:space:]]*=[[:space:]]*'
+   SGML_CATALOGS_DIR=`grep $RE $SGML_CONF | sed "s/$RE//"`
+ fi
+ 
diff --git a/recipes/docbook-utils/docbook-utils-native_0.6.14.bb b/recipes/docbook-utils/docbook-utils-native_0.6.14.bb
index 7d342ed..29815e3 100644
--- a/recipes/docbook-utils/docbook-utils-native_0.6.14.bb
+++ b/recipes/docbook-utils/docbook-utils-native_0.6.14.bb
@@ -1,9 +1,13 @@
 SECTION = "console/utils"
 LICENSE = "GPL"
 DEPENDS = "openjade-native sgmlspl-native docbook-dsssl-stylesheets-native docbook-sgml-dtd-3.1-native"
-PR = "r2"
+PR = "r3"
+
+SRC_URI = "\
+	ftp://sources.redhat.com/pub/docbook-tools/new-trials/SOURCES/docbook-utils-${PV}.tar.gz \
+	file://re.patch \
+"
 
-SRC_URI = "ftp://sources.redhat.com/pub/docbook-tools/new-trials/SOURCES/docbook-utils-${PV}.tar.gz"
 SRC_URI[md5sum] = "6b41b18c365c01f225bc417cf632d81c"
 SRC_URI[sha256sum] = "48faab8ee8a7605c9342fb7b906e0815e3cee84a489182af38e8f7c0df2e92e9"
 
-- 
1.7.7



