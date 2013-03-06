Received: from mail.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1UDM5w-0003uc-Lh
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Mar 2013 22:41:55 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Mar 2013 22:25:11 +0100
Message-Id: <1362605111-17641-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH v2] swig: avoid host contamination, make build deterministic
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
X-List-Received-Date: Wed, 06 Mar 2013 21:41:56 -0000

* Explicitly disable all other languages than python, which was the
  only language listed in DEPENDS.

* Inherit pythonnative to make it find OE's python executable.

* Depend on libpcre in order to reliably enable Swig's regex feature.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
Sorry, forgot to add [meta-oe] to the Subject line.

 meta-oe/recipes-devtools/swig/swig.inc |   34 +++++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-devtools/swig/swig.inc b/meta-oe/recipes-devtools/swig/swig.inc
index 97fc5c7..df6f780 100644
--- a/meta-oe/recipes-devtools/swig/swig.inc
+++ b/meta-oe/recipes-devtools/swig/swig.inc
@@ -6,15 +6,39 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e7807a6282784a7dde4c846626b08fc6 \
                     file://LICENSE-UNIVERSITIES;md5=8ce9dcc8f7c994de4a408b205c72ba08"
 
 SECTION = "devel"
-INC_PR = "r2"
+INC_PR = "r3"
 
-DEPENDS = "python"
+DEPENDS = "libpcre python"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
 
-inherit autotools
-
-EXTRA_OECONF = " --without-guile "
+inherit autotools pythonnative
+
+EXTRA_OECONF = " \
+	--with-python=${PYTHON} \
+	--without-allegrocl \
+	--without-android \
+	--without-boost \
+	--without-chicken \
+	--without-clisp \
+	--without-csharp \
+	--without-d \
+	--without-gcj \
+	--without-go \
+	--without-guile \
+	--without-java \
+	--without-lua \
+	--without-mzscheme \
+	--without-ocaml \
+	--without-octave \
+	--without-perl5 \
+	--without-pike \
+	--without-php \
+	--without-python3 \
+	--without-r \
+	--without-ruby \
+	--without-tcl \
+"
 
 BBCLASSEXTEND = "native"
 
-- 
1.7.10.4



