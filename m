Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pabigot@gmail.com>) id 1Rh2un-0004Xu-KA
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Dec 2011 18:40:18 +0100
Received: by iakh37 with SMTP id h37so23303110iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Dec 2011 09:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=qNKYGpqcaShii7/EXv6cUoFyy1LuTDseBskCld1RS+8=;
	b=avk2b8aa+24uEOJuXBVHK/lAmY1SEm2sVgUhvmfIxvDG1MxL8/8CT5/sVr4mbJhCca
	VyDcoODcvkqs8L1s3kulbvkUZhCE4QEdNVQ3Mu4BN8tqcQlWHJ/U/5aLm7Bjb45A09Kk
	FWjFRmcV5xG8zaeOaQfM+/pJTDb6vD37/ZBWE=
Received: by 10.43.50.67 with SMTP id vd3mr44143100icb.10.1325352779877;
	Sat, 31 Dec 2011 09:32:59 -0800 (PST)
Received: from localhost.localdomain (c-66-41-60-82.hsd1.mn.comcast.net.
	[66.41.60.82])
	by mx.google.com with ESMTPS id gh9sm93228588igb.3.2011.12.31.09.32.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 31 Dec 2011 09:32:58 -0800 (PST)
Sender: Peter Bigot <pabigot@gmail.com>
From: "Peter A. Bigot" <bigotp@acm.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Dec 2011 11:32:39 -0600
Message-Id: <1325352759-321-1-git-send-email-bigotp@acm.org>
X-Mailer: git-send-email 1.7.6.4
Subject: [meta-oe] python-mysqldb: import from OE classic, update to 1.2.3
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
X-List-Received-Date: Sat, 31 Dec 2011 17:40:18 -0000

From: "Peter A. Bigot" <bigotp@acm.org>

Changes from classic recipe:

* Corrected license description based on text in README.

* Switched to setuptools since distutils produced an egg that had x86
  encoded in it.

* Old site.patch no longer necessary; threadsafe is False in this version.
---
 .../python/python-mysqldb/mysqlpath.patch          |   18 +++++++++++++++
 .../python/python-mysqldb_1.2.3.bb                 |   24 ++++++++++++++++++++
 2 files changed, 42 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/python/python-mysqldb/mysqlpath.patch
 create mode 100644 meta-oe/recipes-devtools/python/python-mysqldb_1.2.3.bb

diff --git a/meta-oe/recipes-devtools/python/python-mysqldb/mysqlpath.patch b/meta-oe/recipes-devtools/python/python-mysqldb/mysqlpath.patch
new file mode 100644
index 0000000..a38da6f
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-mysqldb/mysqlpath.patch
@@ -0,0 +1,18 @@
+--- MySQL-python-1.2.3/_mysql.c.orig	2010-06-17 02:21:56.000000000 -0500
++++ MySQL-python-1.2.3/_mysql.c	2011-12-31 09:50:07.888056331 -0600
+@@ -33,11 +33,11 @@
+ #include <windows.h>
+ #include <config-win.h>
+ #else
+-#include "my_config.h"
++#include "mysql/my_config.h"
+ #endif
+-#include "mysql.h"
+-#include "mysqld_error.h"
+-#include "errmsg.h"
++#include "mysql/mysql.h"
++#include "mysql/mysqld_error.h"
++#include "mysql/errmsg.h"
+ 
+ #if PY_VERSION_HEX < 0x02020000
+ # define MyTuple_Resize(t,n,d) _PyTuple_Resize(t, n, d)
diff --git a/meta-oe/recipes-devtools/python/python-mysqldb_1.2.3.bb b/meta-oe/recipes-devtools/python/python-mysqldb_1.2.3.bb
new file mode 100644
index 0000000..69eb47c
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-mysqldb_1.2.3.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "Python interface to MySQL"
+HOMEPAGE = "http://sourceforge.net/projects/mysql-python/"
+SECTION = "devel/python"
+# "GPL or the original license based on Python 1.5.2's license"
+LICENSE = "GPL"
+LIC_FILES_CHKSUM = "file://README;md5=f92e5d60b213d35288bc14f18e1e31b4"
+DEPENDS = "mysql5"
+
+SRC_URI = "\
+  ${SOURCEFORGE_MIRROR}/mysql-python/MySQL-python-${PV}.tar.gz \
+  file://mysqlpath.patch \
+"
+SRC_URI[md5sum] = "215eddb6d853f6f4be5b4afc4154292f"
+SRC_URI[sha256sum] = "7de66fbbf923634e7c965aeaefa74642ba75ae20ee1cefcefc3009595b7a7e6e"
+
+SRCNAME = "MySQL-python"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+do_install_append() {
+    install -d ${D}${datadir}/doc/${PN}/
+    install -m 0644 ${S}/doc/*.txt ${D}${datadir}/doc/${PN}/
+}
-- 
1.7.6.4



