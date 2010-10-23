Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fidencio@profusion.mobi>) id 1P9RnG-0007au-LA
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 02:17:12 +0200
Received: by gxk22 with SMTP id 22so1148347gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 17:16:28 -0700 (PDT)
Received: by 10.150.131.8 with SMTP id e8mr2360298ybd.91.1287792987922;
	Fri, 22 Oct 2010 17:16:27 -0700 (PDT)
Received: from localhost.localdomain ([201.82.29.28])
	by mx.google.com with ESMTPS id u3sm4239972ani.19.2010.10.22.17.16.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 22 Oct 2010 17:16:26 -0700 (PDT)
From: fidencio@profusion.mobi
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Oct 2010 22:15:42 -0200
Message-Id: <4cc2295a.0311650a.0c4d.ffffaf5a@mx.google.com>
X-Mailer: git-send-email 1.7.3.1
In-Reply-To: <y>
References: <y>
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fidencio@profusion.mobi
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 02/17] EFL: Add recipe for ethumb
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
X-List-Received-Date: Sat, 23 Oct 2010 00:17:12 -0000

From: Eduardo Lima (Etrunko) <eblima@gmail.com>

Signed-off-by: Eduardo Lima (Etrunko) <eblima@gmail.com>
---
 recipes/efl1/ethumb_svn.bb |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 recipes/efl1/ethumb_svn.bb

diff --git a/recipes/efl1/ethumb_svn.bb b/recipes/efl1/ethumb_svn.bb
new file mode 100644
index 0000000..7f826cf
--- /dev/null
+++ b/recipes/efl1/ethumb_svn.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "EFL based thumbnail generation library"
+LICENSE = "LGPL"
+DEPENDS = "eet-native evas ecore edje eet edbus emotion epdf"
+PV = "0.1.0+svnr${SRCPV}"
+SRCREV = "${EFL_SRCREV}"
+
+inherit efl
+
+EXTRA_OECONF = "\
+  --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
+  --with-eet-eet=${STAGING_BINDIR_NATIVE}/eet \
+"
+
+SRC_URI = "svn://svn.enlightenment.org/svn/e/trunk;module=ethumb;proto=http"
+
+# Some upgrade path tweaking, as in evas
+AUTO_LIBNAME_PKGS = ""
+
+FILES_${PN} += "\
+    ${bindir}/ethumbd \
+    ${libexecdir}/ethumbd_slave \
+    ${libdir}/plugins/*.so \
+    ${libdir}/plugins/data/*.edj \
+"
-- 
1.7.3.1



