Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Od47l-0007eK-5D
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Jul 2010 18:32:33 +0200
Received: by eyf5 with SMTP id 5so359212eyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jul 2010 09:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=+xtPErD1zyhNyXaHB9R9VRN2+H/Rm5KgN1LJ5aXehKk=;
	b=Oh8WKoJSy6i8JToPMAKPhF4mOA710t/xJ8ryomhcoD3c0K19NgmzT5iu7lJbg79zDy
	yhLQkaYY5Pv755xoJpMDf0zZg02+fO6ePP6lrwWhg4va6dXdqZuDUB/hKSBZtGfWtBeK
	AW/Pf9kAJMvT3u5vmZK1OlwR6HYuVVvqzX0S0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=gMd7VVKy4hyimJDU/qM9NmtE8m5sHrx1Kse61fm1bmoXAzur9CHeGw6qPUqeE4yARm
	6/Md6LAKERIg8CkuzdRy7V6nvs09F7PMneKIwS+rbbLn+c8eKTt1+S01d+r42XHGqx5H
	P6+lxfpssss1JbugQHiqBls4pXXnbL110fr8k=
Received: by 10.213.33.197 with SMTP id i5mr2768881ebd.44.1280075532100;
	Sun, 25 Jul 2010 09:32:12 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id a48sm4120358eei.13.2010.07.25.09.32.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 25 Jul 2010 09:32:11 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Jul 2010 18:32:05 +0200
Message-Id: <1280075525-31322-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] cpan.bbclass: removed legacy staging
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
X-List-Received-Date: Sun, 25 Jul 2010 16:32:35 -0000

bumped PR for the main perl recipes so this change takes effect

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---

removed legacy staging

as QA compared with the poky version.
Also build all perl/lib* recipes with it (using perl 5.8.8).
5 of these fail:
ERROR: 'virtual:native:/home/frans/oe/openembedded/recipes/perl/libcurses-perl_1.28.bb' failed
ERROR: '/home/frans/oe/openembedded/recipes/perl/libcurses-perl_1.28.bb' failed
ERROR: '/home/frans/oe/openembedded/recipes/perl/libsocket6-perl_0.23.bb' failed
ERROR: '/home/frans/oe/openembedded/recipes/perl/libdbd-mysql-perl-native_4.010.bb' failed
ERROR: '/home/frans/oe/openembedded/recipes/perl/libencode-detect-perl_1.01.bb' failed
However these 5 also failed before making the change.
These recipes are broken and I did not see an apparent fix

please ack as this affects all perl cpan recipes.

 classes/cpan.bbclass        |   15 ++++-----------
 recipes/perl/perl_5.10.1.bb |    2 +-
 recipes/perl/perl_5.8.8.bb  |    2 +-
 3 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/classes/cpan.bbclass b/classes/cpan.bbclass
index dfc0926..24e0c6e 100644
--- a/classes/cpan.bbclass
+++ b/classes/cpan.bbclass
@@ -13,6 +13,8 @@ export PERL_INC = "${STAGING_LIBDIR}/perl/${@get_perl_version(d)}/CORE"
 export PERL_LIB = "${STAGING_DATADIR}/perl/${@get_perl_version(d)}"
 export PERL_ARCHLIB = "${STAGING_LIBDIR}/perl/${@get_perl_version(d)}"
 
+NATIVE_INSTALL_WORKS = "1"
+
 cpan_do_configure () {
 	yes '' | perl Makefile.PL ${EXTRA_CPANFLAGS}
 	if [ "${BUILD_SYS}" != "${HOST_SYS}" ]; then
@@ -31,16 +33,7 @@ cpan_do_compile () {
 }
 
 cpan_do_install () {
-	if [ ${@is_target(d)} = "yes" ]; then
-		oe_runmake install_vendor
-	fi
-}
-
-cpan_do_stage () {
-	if [ ${@is_target(d)} = "no" ]; then
-		oe_runmake install_vendor
-	fi
+	oe_runmake DESTDIR="${D}" install_vendor
 }
-								
 
-EXPORT_FUNCTIONS do_configure do_compile do_install do_stage
+EXPORT_FUNCTIONS do_configure do_compile do_install
diff --git a/recipes/perl/perl_5.10.1.bb b/recipes/perl/perl_5.10.1.bb
index 86b08dc..e7c90d8 100644
--- a/recipes/perl/perl_5.10.1.bb
+++ b/recipes/perl/perl_5.10.1.bb
@@ -5,7 +5,7 @@ LICENSE = "Artistic|GPL"
 PRIORITY = "optional"
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db perl-native grep-native"
-PR = "r7"
+PR = "r8"
 
 # Not tested enough
 DEFAULT_PREFERENCE = "-1"
diff --git a/recipes/perl/perl_5.8.8.bb b/recipes/perl/perl_5.8.8.bb
index c73fe4e..29ae66c 100644
--- a/recipes/perl/perl_5.8.8.bb
+++ b/recipes/perl/perl_5.8.8.bb
@@ -5,7 +5,7 @@ LICENSE = "Artistic|GPL"
 PRIORITY = "optional"
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db perl-native grep-native"
-PR = "r34"
+PR = "r35"
 
 # Major part of version
 PVM = "5.8"
-- 
1.6.4.2



