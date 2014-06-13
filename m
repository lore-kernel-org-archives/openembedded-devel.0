Return-Path: <anders@chargestorm.se>
Received: from stoexhub03.domain01.net (STOEXHUB03.domain01.net
	[83.145.59.144])
	by mail.openembedded.org (Postfix) with ESMTP id 4165E6FE23
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jun 2014 13:01:35 +0000 (UTC)
Received: from localhost (213.114.64.43) by stoexhub03.domain01.net
	(10.12.10.3) with Microsoft SMTP Server id 8.3.279.1; Fri, 13 Jun 2014
	15:01:34 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 13 Jun 2014 15:01:21 +0200
Message-ID: <362107ac6702cb380c86a7ac249b52f558d2b923.1402664272.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <cover.1402664272.git.anders@chargestorm.se>
References: <cover.1402664272.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [meta-webserver][PATCH 2/2] webmin: split out webmin themes
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
X-List-Received-Date: Fri, 13 Jun 2014 13:01:42 -0000
Content-Type: text/plain

The default set of themes taks up ~13MB, with a couple of them weighting in
at ~5MB each.

Let's split the themes to separate packages, to allow a considerable size
reduction of the core webmin package (from +15MB to 2.1MB on my build host).

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb b/meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb
index a561de2..7eb1d63 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb
@@ -113,7 +113,7 @@ RDEPENDS_${PN} += "perl-module-warnings perl-module-xsloader perl-module-posix p
 RDEPENDS_${PN} += "perl-module-fcntl perl-module-tie-hash perl-module-vars perl-module-time-local perl-module-config perl-module-constant"
 RDEPENDS_${PN} += "perl-module-file-glob perl-module-file-copy perl-module-sdbm perl-module-sdbm-file perl-module-timelocal perl-module-feature"
 
-PACKAGES_DYNAMIC += "webmin-module-*"
+PACKAGES_DYNAMIC += "webmin-module-* webmin-theme-*"
 RRECOMMENDS_${PN} += "webmin-module-system-status"
 
 RDEPENDS_webmin-module-proc = "procps"
@@ -128,12 +128,17 @@ python populate_packages_prepend() {
     wadir = bb.data.expand('${libexecdir}/webmin', d)
     wadir_image = bb.data.expand('${D}', d) + wadir
     modules = []
+    themes = []
     for mod in os.listdir(wadir_image):
         modinfo = os.path.join(wadir_image, mod, "module.info")
+        themeinfo = os.path.join(wadir_image, mod, "theme.info")
         if os.path.exists(modinfo):
             modules.append(mod)
+        elif os.path.exists(themeinfo):
+            themes.append(mod)
 
     do_split_packages(d, wadir, '^(%s)$' % "|".join(modules), 'webmin-module-%s', 'Webmin module for %s', allow_dirs=True, prepend=True)
+    do_split_packages(d, wadir, '^(%s)$' % "|".join(themes), 'webmin-theme-%s', 'Webmin theme for %s', allow_dirs=True, prepend=True)
 }
 
 # Time-savers
-- 
2.0.0


