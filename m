Received: from smtprelay-b21.telenor.se ([195.54.99.212])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf@emagii.com>) id 1Rvabs-0007Br-9R
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Feb 2012 21:28:52 +0100
Received: from ipb3.telenor.se (ipb3.telenor.se [195.54.127.166])
	by smtprelay-b21.telenor.se (Postfix) with ESMTP id 7A87EEB8E2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Feb 2012 21:20:46 +0100 (CET)
X-SENDER-IP: [83.227.57.213]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AjBLAKEpNE9T4znVPGdsb2JhbABDr18ZAQEBATc0gXIBAQVLAQojEAgUAwECLzkKDAgZCYd2Bq0cAYYVjF8BCQeDOYEWg0MElTCJM4kw
X-IronPort-AV: E=Sophos;i="4.73,392,1325458800"; d="scan'208";a="47020743"
Received: from c-d539e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost) ([83.227.57.213])
	by ipb3.telenor.se with ESMTP; 09 Feb 2012 21:20:46 +0100
From: ulf@emagii.com
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Feb 2012 21:20:44 +0100
Message-Id: <1328818845-11049-2-git-send-email-ulf@emagii.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1328818845-11049-1-git-send-email-ulf@emagii.com>
References: <1328818845-11049-1-git-send-email-ulf@emagii.com>
Cc: Ulf Samuelsson <ulf@emagii.com>
Subject: [PATCH 2/3] perl_5.10.1.bb: Add search for libraries
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
X-List-Received-Date: Thu, 09 Feb 2012 20:28:52 -0000

From: Ulf Samuelsson <ulf@emagii.com>

Ubuntu 11.04 i686 has moved around the libraries.
perl-native will not build due to this.

Backported from 5.14.2

Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
---
 .../perl/files/0001-Find-pthread-libraries.patch   |   31 ++++++++++++++++++++
 recipes/perl/perl-native_5.10.1.bb                 |    3 +-
 recipes/perl/perl_5.10.1.bb                        |    4 ++-
 3 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 recipes/perl/files/0001-Find-pthread-libraries.patch

diff --git a/recipes/perl/files/0001-Find-pthread-libraries.patch b/recipes/perl/files/0001-Find-pthread-libraries.patch
new file mode 100644
index 0000000..f651dbd
--- /dev/null
+++ b/recipes/perl/files/0001-Find-pthread-libraries.patch
@@ -0,0 +1,31 @@
+From 69f418972f17b7f03cdc335ad14af486d06d94b2 Mon Sep 17 00:00:00 2001
+From: Ulf Samuelsson <ulf@emagii.com>
+Date: Tue, 31 Jan 2012 09:59:31 +0100
+Subject: [PATCH] Find pthread libraries
+
+Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
+---
+ hints/linux.sh |   10 ++++++++++
+ 1 files changed, 10 insertions(+), 0 deletions(-)
+
+diff --git a/hints/linux.sh b/hints/linux.sh
+index d208129..04a99da 100644
+--- a/hints/linux.sh
++++ b/hints/linux.sh
+@@ -441,3 +441,13 @@ case "$libdb_needs_pthread" in
+     libswanted="$libswanted pthread"
+     ;;
+ esac
++
++# plibpth to bypass this check.
++case "$plibpth" in
++  '')	plibpth=`gcc -print-search-dirs | grep libraries | cut -f2- -d= | tr ':' $trnl | grep -v 'gcc' | sed -e 's:/$::'`
++	set X $plibpth # Collapse all entries on one line
++	shift
++	plibpth="$*"
++	;;
++esac
++
+-- 
+1.7.4.1
+
diff --git a/recipes/perl/perl-native_5.10.1.bb b/recipes/perl/perl-native_5.10.1.bb
index 80d6937..f37c6cb 100644
--- a/recipes/perl/perl-native_5.10.1.bb
+++ b/recipes/perl/perl-native_5.10.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Perl is a popular scripting language."
 HOMEPAGE = "http://www.perl.org/"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r12"
+PR = "r13"
 NATIVE_INSTALL_WORKS = "1"
 INHIBIT_DEFAULT_DEPS = "1"
 PATCHTOOL = "patch"
@@ -21,6 +21,7 @@ SRC_URI = "http://ftp.funet.fi/pub/CPAN/src/perl-${PV}.tar.gz;name=perl-${PV} \
            file://native-perlinc.patch \
 	   file://perl-fix-cross-library-check.patch \
            file://ubuntu-11.04-multiarch.patch \
+	   file://0001-Find-pthread-libraries.patch \
 	   "
 
 SRC_URI[perl-5.10.1.md5sum] = "b9b2fdb957f50ada62d73f43ee75d044"
diff --git a/recipes/perl/perl_5.10.1.bb b/recipes/perl/perl_5.10.1.bb
index 6c0dcb1..68eaaf1 100644
--- a/recipes/perl/perl_5.10.1.bb
+++ b/recipes/perl/perl_5.10.1.bb
@@ -75,7 +75,9 @@ SRC_URI = "ftp://ftp.funet.fi/pub/CPAN/src/perl-${PV}.tar.gz;name=perl-${PV} \
         file://config.sh-32-be \
         file://config.sh-64 \
         file://config.sh-64-le \
-        file://config.sh-64-be"
+        file://config.sh-64-be \
+	file://0001-Find-pthread-libraries.patch \
+	"
 
 SRC_URI[perl-5.10.1.md5sum] = "b9b2fdb957f50ada62d73f43ee75d044"
 SRC_URI[perl-5.10.1.sha256sum] = "cb7f26ea4b2b28d6644354d87a269d01cac1b635287dae64e88eeafa24b44f35"
-- 
1.7.4.1



