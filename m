Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1863F759F4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jun 2015 02:22:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5J2MRZu025477
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jun 2015 19:22:27 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Thu, 18 Jun 2015 19:22:27 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Jun 2015 10:15:03 +0800
Message-ID: <1434680103-17233-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [meta-oe][PATCH] php: upgrade from 5.5.24 to 5.5.26
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
X-List-Received-Date: Fri, 19 Jun 2015 02:22:27 -0000
Content-Type: text/plain

Upgrade php from 5.5.24 to 5.5.26. Remove part 2 of phar-makefile.patch
which is useless.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-devtools/php/php/phar-makefile.patch          | 9 ---------
 meta-oe/recipes-devtools/php/{php_5.5.24.bb => php_5.5.26.bb} | 4 ++--
 2 files changed, 2 insertions(+), 11 deletions(-)
 rename meta-oe/recipes-devtools/php/{php_5.5.24.bb => php_5.5.26.bb} (98%)

diff --git a/meta-oe/recipes-devtools/php/php/phar-makefile.patch b/meta-oe/recipes-devtools/php/php/phar-makefile.patch
index 2851b0f..2f7fe34 100644
--- a/meta-oe/recipes-devtools/php/php/phar-makefile.patch
+++ b/meta-oe/recipes-devtools/php/php/phar-makefile.patch
@@ -33,12 +33,3 @@ index 6516ddf..36e6cf4 100644
  
  $(builddir)/phar/phar.inc: $(srcdir)/phar/phar.inc
  	-@test -d $(builddir)/phar || mkdir $(builddir)/phar
-@@ -39,7 +28,7 @@ install-pharcmd: pharcmd
- 	-@$(mkinstalldirs) $(INSTALL_ROOT)$(bindir)
- 	$(INSTALL) $(builddir)/phar.phar $(INSTALL_ROOT)$(bindir)
- 	-@rm -f $(INSTALL_ROOT)$(bindir)/phar
--	$(LN_S) -f $(INSTALL_ROOT)$(bindir)/phar.phar $(INSTALL_ROOT)$(bindir)/phar
-+	$(LN_S) -f $(bindir)/phar.phar $(INSTALL_ROOT)$(bindir)/phar
- 	@$(mkinstalldirs) $(INSTALL_ROOT)$(mandir)/man1
- 	@$(INSTALL_DATA) $(builddir)/phar.1 $(INSTALL_ROOT)$(mandir)/man1/phar.1
- 	@$(INSTALL_DATA) $(builddir)/phar.phar.1 $(INSTALL_ROOT)$(mandir)/man1/phar.phar.1
diff --git a/meta-oe/recipes-devtools/php/php_5.5.24.bb b/meta-oe/recipes-devtools/php/php_5.5.26.bb
similarity index 98%
rename from meta-oe/recipes-devtools/php/php_5.5.24.bb
rename to meta-oe/recipes-devtools/php/php_5.5.26.bb
index f8419af..8b64b2b 100644
--- a/meta-oe/recipes-devtools/php/php_5.5.24.bb
+++ b/meta-oe/recipes-devtools/php/php_5.5.26.bb
@@ -30,8 +30,8 @@ SRC_URI_append_class-target += " \
             file://php-fpm.service \
           "
 
-SRC_URI[md5sum] = "f9a8f3e4bb88b33b087bd63732b1402a"
-SRC_URI[sha256sum] = "801b5cf2e0c01b07314d4ac3c8a7c28d524bdd8263ebdd0e33a99008251316a2"
+SRC_URI[md5sum] = "383a4b35327809afd2822e1e5efc8ee1"
+SRC_URI[sha256sum] = "816afffdb03ff4c542bc172a2f77f9c69b817df82d60cce05c1b4f578c2c926e"
 
 S = "${WORKDIR}/php-${PV}"
 
-- 
1.9.1


