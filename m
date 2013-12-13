Return-Path: <kergoth@gmail.com>
Received: from mail-pb0-f49.google.com (mail-pb0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id 04894610DC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Dec 2013 16:08:42 +0000 (UTC)
Received: by mail-pb0-f49.google.com with SMTP id jt11so2754087pbb.22
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Dec 2013 08:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=06N5Ncywia2c8bqAwkTdIo6wOwhcrgXdH4z+Ofs/vQo=;
	b=ROs6+2jV5lXBKVYdMXWkLq8KNB99z4PxnVLJUSjCnwVHDpv1QwNPPhRTod/sGeCw7Z
	7PGfAaMY4IwDbSIOlbJW9f4NL9onWleorJGe2Cun5elpsAje4AIzywd0zNwAOEfPDKys
	xPHCkI2rsONQpsc3wapzgGCLWwKYhyx0ArmNl6vKgcE7eBHpQwAW8TxrWcuWWLHiPI0P
	vQRkhEIMbqH4KD3/L1jaoInVWwpVDxZIMCnKXrM2oywP5sxeRLdzw0W4oeYSFsNojm+O
	8MfW204Rtvdx9kAJGTNRVDzk5BqCxGmrfBjWYMZBvYE4fdQq1Y7+ouLYrGa6aClZLjPE
	eStA==
X-Received: by 10.68.194.71 with SMTP id hu7mr4269634pbc.68.1386950921663;
	Fri, 13 Dec 2013 08:08:41 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id bp5sm5882411pbb.18.2013.12.13.08.08.39
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Dec 2013 08:08:40 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Dec 2013 09:08:25 -0700
Message-Id: <1386950905-25658-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] postgresql: apply upstream parallel make fix
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
X-List-Received-Date: Fri, 13 Dec 2013 16:08:43 -0000

Reported-by: Drew Moseley <drew_moseley@mentor.com>
Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../postgresql-9.2.4/ecpg-parallel-make-fix.patch  | 31 ++++++++++++++++++++++
 .../recipes-support/postgresql/postgresql_9.2.4.bb |  5 +++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/postgresql/postgresql-9.2.4/ecpg-parallel-make-fix.patch

diff --git a/meta-oe/recipes-support/postgresql/postgresql-9.2.4/ecpg-parallel-make-fix.patch b/meta-oe/recipes-support/postgresql/postgresql-9.2.4/ecpg-parallel-make-fix.patch
new file mode 100644
index 0000000..63615cd
--- /dev/null
+++ b/meta-oe/recipes-support/postgresql/postgresql-9.2.4/ecpg-parallel-make-fix.patch
@@ -0,0 +1,31 @@
+Upstream-status: backport
+
+From 602070f9cce790debd8d1469254e7726ab499ae7 Mon Sep 17 00:00:00 2001
+From: Peter Eisentraut <peter_e@gmx.net>
+Date: Fri, 29 Mar 2013 21:39:55 -0400
+Subject: [PATCH] ecpg: Parallel make fix
+
+In some parallel make situations, the install-headers target could be
+called before the installation directories are created by installdirs,
+causing the installation to fail.  Fix that by making install-headers
+depend on installdirs.
+---
+ src/interfaces/ecpg/include/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/interfaces/ecpg/include/Makefile b/src/interfaces/ecpg/include/Makefile
+index eab833b..e92e56f 100644
+--- a/src/interfaces/ecpg/include/Makefile
++++ b/src/interfaces/ecpg/include/Makefile
+@@ -18,7 +18,7 @@ ecpg_headers = ecpgerrno.h ecpglib.h ecpgtype.h sqlca.h sql3types.h ecpg_informi
+ 	sqlda.h sqlda-compat.h sqlda-native.h
+ informix_headers = datetime.h decimal.h sqltypes.h
+ 
+-install-headers: $(ecpg_headers) $(informix_headers)
++install-headers: $(ecpg_headers) $(informix_headers) installdirs
+ 	$(INSTALL_DATA) $(addprefix $(srcdir)/,$(ecpg_headers)) '$(DESTDIR)$(includedir)/'
+ 	$(INSTALL_DATA) $(addprefix $(srcdir)/,$(informix_headers)) '$(DESTDIR)$(informix_esql_dir)/'
+ 	$(INSTALL_DATA) $(ecpg_config_h) '$(DESTDIR)$(includedir)'
+-- 
+1.8.3.4
+
diff --git a/meta-oe/recipes-support/postgresql/postgresql_9.2.4.bb b/meta-oe/recipes-support/postgresql/postgresql_9.2.4.bb
index 59665da..49ca53f 100644
--- a/meta-oe/recipes-support/postgresql/postgresql_9.2.4.bb
+++ b/meta-oe/recipes-support/postgresql/postgresql_9.2.4.bb
@@ -4,7 +4,10 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=ab55a5887d3f8ba77d0fd7db787e4bab"
 
 PR = "${INC_PR}.0"
 
-SRC_URI += "file://remove.autoconf.version.check.patch"
+SRC_URI += "\
+    file://remove.autoconf.version.check.patch \
+    file://ecpg-parallel-make-fix.patch \
+"
 
 SRC_URI[md5sum] = "6ee5bb53b97da7c6ad9cb0825d3300dd"
 SRC_URI[sha256sum] = "d97dd918a88a4449225998f46aafa85216a3f89163a3411830d6890507ffae93"
-- 
1.8.3.4


