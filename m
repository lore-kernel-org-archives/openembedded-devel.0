Received: from smtpauth17.prod.mesa1.secureserver.net ([64.202.165.29])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mike@mwester.net>) id 1PsJiQ-0005uT-4q
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 19:45:36 +0100
Received: (qmail 29093 invoked from network); 23 Feb 2011 18:22:41 -0000
Received: from unknown (209.242.7.132)
	by smtpauth17.prod.mesa1.secureserver.net (64.202.165.29) with ESMTP;
	23 Feb 2011 18:22:41 -0000
Message-ID: <4D65557C.3020709@mwester.net>
Date: Wed, 23 Feb 2011 12:44:12 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] groff - fix do_install failure
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
X-List-Received-Date: Wed, 23 Feb 2011 18:45:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Bitbaking groff fails in the do_install step, complaining that img/pic* does
not exist.  Normally, these files would be created by groff itself during the
build process, but since we are cross-compiling, the old recipe replaces the
invocation of groff and troff with echo commands.  However, echo does not
create the output files, which eventually results in the do_install failure.

This patch makes groff dependent on groff-native, and instead of using echo,
it instructs the build process to use the staged groff binaries.

Signed-off-by: Mike Westerhof <mike@mwester.net>

---
diff --git a/recipes/groff/groff_1.20.1.bb b/recipes/groff/groff_1.20.1.bb
index 6ea87dc..5869ff7 100644
--- a/recipes/groff/groff_1.20.1.bb
+++ b/recipes/groff/groff_1.20.1.bb
@@ -1,7 +1,10 @@
 DESCRIPTION = "GNU roff"
 SECTION = "base"
 LICENSE = "GPL"
-PR = "r2"
+PR = "r3"
+
+DEPENDS = "groff-native"
+DEPENDS_virtclass-native = ""

 SRC_URI = "http://ftp.gnu.org/gnu/groff/groff-${PV}.tar.gz \
           "
@@ -15,10 +18,10 @@ PARALLEL_MAKE = ""
 do_configure_prepend(){
        if [ "${BUILD_SYS}" != "${HOST_SYS}" ]; then
                sed -i \
-                   -e '/^GROFFBIN=/s:=.*:=echo:' \
-                   -e '/^TROFFBIN=/s:=.*:=echo:' \
-                   -e '/^GROFF_BIN_PATH=/s:=.*:=:' \
-                   -e '/^GROFF_BIN_DIR=/s:=.*:=:' \
+                   -e '/^GROFFBIN=/s:=.*:=${STAGING_BINDIR_NATIVE}/groff:' \
+                   -e '/^TROFFBIN=/s:=.*:=${STAGING_BINDIR_NATIVE}/troff:' \
+                   -e '/^GROFF_BIN_PATH=/s:=.*:=${STAGING_BINDIR_NATIVE}:' \
+                   -e '/^GROFF_BIN_DIR=/s:=.*:=${STAGING_BINDIR_NATIVE}:' \
                    ${S}/contrib/*/Makefile.sub \
                    ${S}/doc/Makefile.in \
                    ${S}/doc/Makefile.sub


