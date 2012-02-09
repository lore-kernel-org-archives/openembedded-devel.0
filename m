Received: from smtprelay-b11.telenor.se ([62.127.194.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf@emagii.com>) id 1Rvb2J-0001T8-9C
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Feb 2012 21:56:11 +0100
Received: from ipb4.telenor.se (ipb4.telenor.se [195.54.127.167])
	by smtprelay-b11.telenor.se (Postfix) with ESMTP id E0132D9CD
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Feb 2012 21:20:49 +0100 (CET)
X-SENDER-IP: [83.227.57.213]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AitLAM4pNE9T4znVPGdsb2JhbABDr1sZAQEBATc0gXIBAQVLAQojEAgYMTkKFBkJh3YGq0ABjX2MXwEJB4M5gRYmgx0ElTCSYw
X-IronPort-AV: E=Sophos;i="4.73,392,1325458800"; d="scan'208";a="1806583042"
Received: from c-d539e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost) ([83.227.57.213])
	by ipb4.telenor.se with ESMTP; 09 Feb 2012 21:20:49 +0100
From: ulf@emagii.com
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Feb 2012 21:20:45 +0100
Message-Id: <1328818845-11049-3-git-send-email-ulf@emagii.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1328818845-11049-1-git-send-email-ulf@emagii.com>
References: <1328818845-11049-1-git-send-email-ulf@emagii.com>
Cc: Ulf Samuelsson <ulf@emagii.com>
Subject: [PATCH 3/3] intltool(-native) Fix dependencies.
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
X-List-Received-Date: Thu, 09 Feb 2012 20:56:11 -0000

From: Ulf Samuelsson <ulf@emagii.com>

intltool used to depend on libxml-parser-perl-native,
which did not exist.

The patch creates a new native recipe for libxml-parser-perl,
and let intltool-native depend on this.
intltool dependency is removed.

Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
---
 recipes/intltool/intltool-native_0.40.3.bb     |    2 +
 recipes/intltool/intltool_0.40.3.bb            |    2 -
 recipes/perl/libxml-parser-perl-native_2.36.bb |   32 ++++++++++++++++++++++++
 3 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 recipes/perl/libxml-parser-perl-native_2.36.bb

diff --git a/recipes/intltool/intltool-native_0.40.3.bb b/recipes/intltool/intltool-native_0.40.3.bb
index 750914c..99d9b6a 100644
--- a/recipes/intltool/intltool-native_0.40.3.bb
+++ b/recipes/intltool/intltool-native_0.40.3.bb
@@ -1,5 +1,7 @@
 require intltool_${PV}.bb
 
+DEPENDS += " libxml-parser-perl-native"
+
 inherit native
 
 EXTRA_OEMAKE = "'PERL_TARGET=/usr/bin/env perl'"
diff --git a/recipes/intltool/intltool_0.40.3.bb b/recipes/intltool/intltool_0.40.3.bb
index bb2b75d..d81ce1a 100644
--- a/recipes/intltool/intltool_0.40.3.bb
+++ b/recipes/intltool/intltool_0.40.3.bb
@@ -2,8 +2,6 @@ require intltool.inc
 
 PR = "${INC_PR}.0"
 
-DEPENDS += " libxml-parser-perl-native"
-
 EXTRA_OEMAKE = "'PERL_TARGET=/usr/bin/perl'"
 
 do_configure_prepend() {
diff --git a/recipes/perl/libxml-parser-perl-native_2.36.bb b/recipes/perl/libxml-parser-perl-native_2.36.bb
new file mode 100644
index 0000000..e46cc59
--- /dev/null
+++ b/recipes/perl/libxml-parser-perl-native_2.36.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "XML::Parser - A perl module for parsing XML documents"
+SECTION = "libs"
+LICENSE = "Artistic|GPLv1+"
+DEPENDS += "expat expat-native"
+PR= "r4"
+
+SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Parser-${PV}.tar.gz"
+
+S = "${WORKDIR}/XML-Parser-${PV}"
+
+EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR}"
+
+inherit cpan
+inherit native
+
+do_compile() {
+	export LIBC="$(find ${STAGING_DIR_TARGET}/lib -name 'libc-*.so')"
+	cpan_do_compile
+}
+# 	cpan_do_compile	|| echo expected failure
+
+do_compile_virtclass-native (){
+	cpan_do_compile
+}
+
+FILES_${PN} = "${PERLLIBDIRS}/auto/XML/Parser/Expat/* \
+                ${PERLLIBDIRS}/XML"
+
+BBCLASSEXTEND="native"
+
+SRC_URI[md5sum] = "1b868962b658bd87e1563ecd56498ded"
+SRC_URI[sha256sum] = "9fd529867402456bd826fe0e5588d35b3a2e27e586a2fd838d1352b71c2ed73f"
-- 
1.7.4.1



