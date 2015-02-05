Return-Path: <fenixk19@mail.ru>
X-Greylist: delayed 2440 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 05 Feb 2015 16:27:41 UTC
Received: from smtp34.i.mail.ru (smtp34.i.mail.ru [94.100.177.94])
	by mail.openembedded.org (Postfix) with ESMTP id 4EA436E62E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail2; h=Message-Id:Date:Subject:Cc:To:From;
	bh=p1TTBreG4tK8kYSL9i4GY9l/aZCr2DTFUxbLo6tWvWI=; 
	b=uTPE/rlxNWnDh45bVFjSdS4tfTj+dbcy6aFXTitmRr3H4aq+kDwjQU+6w5jbDJOHNe4SmwUEfQgmzqOEdJWAclwfvHauFW4u1iWA5RhpliWmVDEBrFkYWX8kd+uJ+h3sWXlL65dw0DBv+HohG5D36C8eclWK7yYqNtRfUt/+BDg=;
Received: from [37.204.187.134] (port=36041 helo=localhost.localdomain)
	by smtp34.i.mail.ru with esmtpa (envelope-from <fenixk19@mail.ru>)
	id 1YJPHD-0004Vf-U6; Thu, 05 Feb 2015 19:27:41 +0300
From: "A. Varnin" <fenixk19@mail.ru>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Feb 2015 19:27:24 +0300
Message-Id: <1423153645-9754-1-git-send-email-fenixk19@mail.ru>
X-Mailer: git-send-email 1.9.1
X-Spam: Not detected
X-Mras: Ok
Subject: [meta-oe][PATCH 1/2] unixodbc: add new recipe
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
X-List-Received-Date: Thu, 05 Feb 2015 16:27:50 -0000

From: Alexander Varnin <fenixk19@mail.ru>

UnixODBC is an implementation of the Open Database Connectivity standard,
a database abstraction layer that allows applications to be used with
many different relational databases by way of a single library.

Signed-off-by: Alexander Varnin <fenixk19@mail.ru>
---
 .../recipes-extended/unixodbc/unixodbc_2.3.2.bb    | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-extended/unixodbc/unixodbc_2.3.2.bb

diff --git a/meta-oe/recipes-extended/unixodbc/unixodbc_2.3.2.bb b/meta-oe/recipes-extended/unixodbc/unixodbc_2.3.2.bb
new file mode 100644
index 0000000..f9b0069
--- /dev/null
+++ b/meta-oe/recipes-extended/unixodbc/unixodbc_2.3.2.bb
@@ -0,0 +1,23 @@
+SUMMARY = "UnixODBC is an implementation of the Open Database Connectivity standard, a database abstraction layer that allows applications to be used with many different relational databases by way of a single library."
+HOMEPAGE = "http://www.unixodbc.org"
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7b37bf80a3df5a65b355433ae36d206"
+
+SRC_URI = "ftp://ftp.unixodbc.org/pub/unixODBC/unixODBC-${PV}.tar.gz"
+SRC_URI[md5sum] = "5e4528851eda5d3d4aed249b669bd05b"
+SRC_URI[sha256sum] = "9c3459742f25df5aa3c10a61429bde51a6d4f11552c03095f1d33d7eb02b5c9a"
+
+S = "${WORKDIR}/unixODBC-${PV}"
+
+inherit autotools
+
+do_configure() {
+    gnu-configize --force
+    libtoolize --force --copy
+    aclocal
+    autoconf
+    automake --add-missing
+    oe_runconf
+}
+
-- 
1.9.1


