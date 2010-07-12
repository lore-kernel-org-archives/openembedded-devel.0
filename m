Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@mate.hex>) id 1OYCwB-0007MU-SA
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jul 2010 08:56:28 +0200
Received: by mate.hex (Postfix, from userid 1000)
	id C92A521B58; Mon, 12 Jul 2010 10:51:27 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Jul 2010 10:51:25 +0400
Message-Id: <1278917485-22565-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <AANLkTin5ott-60Mn_j6a7iPGhr30gQ9R1JaeuYOCezM-@mail.gmail.com>
References: <AANLkTin5ott-60Mn_j6a7iPGhr30gQ9R1JaeuYOCezM-@mail.gmail.com>
X-SA-Exim-Connect-IP: 93.100.16.104
X-SA-Exim-Mail-From: rik@mate.hex
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	RCVD_IN_PBL,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] perl 5.10.1: fix standard module rdependencies
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
X-List-Received-Date: Mon, 12 Jul 2010 06:56:28 -0000

Automatic dependency extraction script made some errors thus perl-modules
wasn't installable.

 * s/perl-module-encode-kr-2022_kr/perl-module-encode-kr-2022-kr/
 * perl-module-your-module-here came from example in script, dropped it
 * s/perl-module-cpan-exception-yaml_not_installed/perl-module-cpan-exception-yaml-not-installed/
 * perl-module-dbd-sqlite - not part of standard perl, provided by libdbd-sqlite-perl
 * perl-module-dbix-simple - same as above, provided by libdbix-simple-perl

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/perl/perl-rdepends_5.10.1.inc |   23 +++++++++++------------
 recipes/perl/perl_5.10.1.bb           |    2 +-
 2 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/recipes/perl/perl-rdepends_5.10.1.inc b/recipes/perl/perl-rdepends_5.10.1.inc
index d948417..49d2637 100644
--- a/recipes/perl/perl-rdepends_5.10.1.inc
+++ b/recipes/perl/perl-rdepends_5.10.1.inc
@@ -216,7 +216,7 @@ RDEPENDS_perl-module-cpan += "perl-module-cpan-deferredcode "
 RDEPENDS_perl-module-cpan += "perl-module-cpan-distribution "
 RDEPENDS_perl-module-cpan += "perl-module-cpan-distrostatus "
 RDEPENDS_perl-module-cpan += "perl-module-cpan-exception-recursivedependency "
-RDEPENDS_perl-module-cpan += "perl-module-cpan-exception-yaml_not_installed "
+RDEPENDS_perl-module-cpan += "perl-module-cpan-exception-yaml-not-installed "
 RDEPENDS_perl-module-cpan += "perl-module-cpan-ftp "
 RDEPENDS_perl-module-cpan += "perl-module-cpan-handleconfig "
 RDEPENDS_perl-module-cpan += "perl-module-cpan-infoobj "
@@ -250,8 +250,8 @@ RDEPENDS_perl-module-cpan-exception-blocked_urllist += "perl-module-overload"
 RDEPENDS_perl-module-cpan-exception-blocked_urllist += "perl-module-strict "
 RDEPENDS_perl-module-cpan-exception-recursivedependency += "perl-module-overload"
 RDEPENDS_perl-module-cpan-exception-recursivedependency += "perl-module-strict "
-RDEPENDS_perl-module-cpan-exception-yaml_not_installed += "perl-module-overload"
-RDEPENDS_perl-module-cpan-exception-yaml_not_installed += "perl-module-strict "
+RDEPENDS_perl-module-cpan-exception-yaml-not-installed += "perl-module-overload"
+RDEPENDS_perl-module-cpan-exception-yaml-not-installed += "perl-module-strict "
 RDEPENDS_perl-module-cpan += "perl-module-exporter"
 RDEPENDS_perl-module-cpan += "perl-module-fcntl"
 RDEPENDS_perl-module-cpan += "perl-module-file-basename"
@@ -428,7 +428,6 @@ RDEPENDS_perl-module-cpanplus-internals-constants-report += "perl-module-package
 RDEPENDS_perl-module-cpanplus-internals-constants-report += "perl-module-strict "
 RDEPENDS_perl-module-cpanplus-internals-constants-report += "perl-module-test "
 RDEPENDS_perl-module-cpanplus-internals-constants-report += "perl-module-vars"
-RDEPENDS_perl-module-cpanplus-internals-constants-report += "perl-module-your-module-here "
 RDEPENDS_perl-module-cpanplus-internals-constants += "perl-module-strict "
 RDEPENDS_perl-module-cpanplus-internals-constants += "perl-module-vars"
 RDEPENDS_perl-module-cpanplus-internals += "perl-module-cpanplus-error "
@@ -517,8 +516,8 @@ RDEPENDS_perl-module-cpanplus-internals-source-sqlite += "perl-module-cpanplus-e
 RDEPENDS_perl-module-cpanplus-internals-source-sqlite += "perl-module-cpanplus-internals-constants "
 RDEPENDS_perl-module-cpanplus-internals-source-sqlite += "perl-module-cpanplus-internals-source-sqlite-tie "
 RDEPENDS_perl-module-cpanplus-internals-source-sqlite += "perl-module-data-dumper "
-RDEPENDS_perl-module-cpanplus-internals-source-sqlite += "perl-module-dbd-sqlite "
-RDEPENDS_perl-module-cpanplus-internals-source-sqlite += "perl-module-dbix-simple "
+RDEPENDS_perl-module-cpanplus-internals-source-sqlite += "libdbd-sqlite-perl "
+RDEPENDS_perl-module-cpanplus-internals-source-sqlite += "libdbix-simple-perl "
 RDEPENDS_perl-module-cpanplus-internals-source-sqlite += "perl-module-locale-maketext-simple"
 RDEPENDS_perl-module-cpanplus-internals-source-sqlite += "perl-module-params-check"
 RDEPENDS_perl-module-cpanplus-internals-source-sqlite += "perl-module-strict "
@@ -786,13 +785,13 @@ RDEPENDS_perl-module-encode-jp-jis7 += "perl-module-warnings "
 RDEPENDS_perl-module-encode-jp += "perl-module-strict "
 RDEPENDS_perl-module-encode-jp += "perl-module-warnings "
 RDEPENDS_perl-module-encode-jp += "perl-module-xsloader "
-RDEPENDS_perl-module-encode-kr-2022_kr += "perl-module-base"
-RDEPENDS_perl-module-encode-kr-2022_kr += "perl-module-encode"
-RDEPENDS_perl-module-encode-kr-2022_kr += "perl-module-encode-cjkconstants"
-RDEPENDS_perl-module-encode-kr-2022_kr += "perl-module-strict "
-RDEPENDS_perl-module-encode-kr-2022_kr += "perl-module-warnings "
+RDEPENDS_perl-module-encode-kr-2022-kr += "perl-module-base"
+RDEPENDS_perl-module-encode-kr-2022-kr += "perl-module-encode"
+RDEPENDS_perl-module-encode-kr-2022-kr += "perl-module-encode-cjkconstants"
+RDEPENDS_perl-module-encode-kr-2022-kr += "perl-module-strict "
+RDEPENDS_perl-module-encode-kr-2022-kr += "perl-module-warnings "
 RDEPENDS_perl-module-encode-kr += "perl-module-encode "
-RDEPENDS_perl-module-encode-kr += "perl-module-encode-kr-2022_kr "
+RDEPENDS_perl-module-encode-kr += "perl-module-encode-kr-2022-kr "
 RDEPENDS_perl-module-encode-kr += "perl-module-strict "
 RDEPENDS_perl-module-encode-kr += "perl-module-warnings "
 RDEPENDS_perl-module-encode-kr += "perl-module-xsloader "
diff --git a/recipes/perl/perl_5.10.1.bb b/recipes/perl/perl_5.10.1.bb
index c0f6378..c22ecd7 100644
--- a/recipes/perl/perl_5.10.1.bb
+++ b/recipes/perl/perl_5.10.1.bb
@@ -5,7 +5,7 @@ LICENSE = "Artistic|GPL"
 PRIORITY = "optional"
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db perl-native grep-native"
-PR = "r6"
+PR = "r7"
 
 # Not tested enough
 DEFAULT_PREFERENCE = "-1"
-- 
1.6.4.2



