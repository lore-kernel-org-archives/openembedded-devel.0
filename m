Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1QyM64-0008St-UY
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 13:03:13 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1QyM1L-0003Q4-CB from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 03:58:19 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 30 Aug 2011 12:58:18 +0200
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Aug 2011 15:58:40 +0500
Message-Id: <ef49be97f8e75115c1b001694f676f52a53a70c6.1314691875.git.noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1314691875.git.noor_ahsan@mentor.com>
References: <cover.1314691875.git.noor_ahsan@mentor.com>
In-Reply-To: <noor_ahsan@mentor.com>
References: <noor_ahsan@mentor.com>
X-OriginalArrivalTime: 30 Aug 2011 10:58:18.0523 (UTC)
	FILETIME=[B9B6CEB0:01CC6703]
Subject: [meta-oe][PATCH 1/3] bonnie++: Add version 1.03c (initial recipe)
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
X-List-Received-Date: Tue, 30 Aug 2011 11:03:13 -0000

From: Noor Ahsan <noor_ahsan@mentor.com>

* Imported from oe.dev commit id 44985d56bc556786812a0a02d6219afd31a7381d.
* Merge .bb and .inc file.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb |   30 ++++++++++++++++++++
 .../bonnie/files/gcc-4.3-fixes.patch               |   19 ++++++++++++
 2 files changed, 49 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb
 create mode 100644 meta-oe/recipes-benchmark/bonnie/files/gcc-4.3-fixes.patch

diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb b/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb
new file mode 100644
index 0000000..2067307
--- /dev/null
+++ b/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "Tests large file IO and creation/deletion of small files."
+HOMEPAGE = "http://www.coker.com.au/bonnie++/"
+LICENSE = "GPL v2"
+LIC_FILES_CHKSUM = "file://copyright.txt;md5=cd4dde95a6b9d122f0a9150ae9cc3ee0"
+
+SRC_URI = "http://www.coker.com.au/bonnie++/bonnie++-${PV}.tgz \
+           file://gcc-4.3-fixes.patch \
+           "
+SRC_URI[md5sum] = "77a1ba78f37bdd7f024b67e1e36ad151"
+SRC_URI[sha256sum] = "c674f1182f4c20f1e6d038feceb0a6617fc3e7658dfbbac89396043b49612a26"
+
+SCRIPTS = "bon_csv2html bon_csv2txt"
+EXES = "bonnie++ zcav"
+
+inherit autotools
+
+do_install () {
+        install -d ${D}/bin
+        install -d ${D}/sbin
+        install -m 0755 ${EXES} ${D}/sbin
+        install -m 0755 ${SCRIPTS} ${D}/bin
+}
+
+PACKAGES += "bonnie-scripts"
+
+FILES_${PN} = "/sbin"
+FILES_bonnie-scripts="/bin"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
diff --git a/meta-oe/recipes-benchmark/bonnie/files/gcc-4.3-fixes.patch b/meta-oe/recipes-benchmark/bonnie/files/gcc-4.3-fixes.patch
new file mode 100644
index 0000000..67f1b74
--- /dev/null
+++ b/meta-oe/recipes-benchmark/bonnie/files/gcc-4.3-fixes.patch
@@ -0,0 +1,19 @@
+Includes string.h to one of the source file.
+
+Upstream-Status: Inappropriate [not author.]
+---
+ zcav.cpp |    1 +
+ 1 file changed, 1 insertion(+)
+
+Index: bonnie++-1.03a/zcav.cpp
+===================================================================
+--- bonnie++-1.03a.orig/zcav.cpp
++++ bonnie++-1.03a/zcav.cpp
+@@ -15,6 +15,7 @@ using namespace std;
+ #else
+ #include <vector.h>
+ #endif
++#include <string.h>
+ 
+ // Read the specified number of megabytes of data from the fd and return the
+ // amount of time elapsed in seconds.
-- 
1.7.0.4



