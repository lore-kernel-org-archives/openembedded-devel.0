Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1ORC7C-0005tb-P5
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 00:39:00 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1ORC2V-0006F7-TI from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jun 2010 15:33:55 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 22 Jun 2010 15:33:55 -0700
Received: from [172.30.80.158] ([172.30.80.158]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 22 Jun 2010 16:33:54 -0600
Message-ID: <4C213A4F.9070705@mentor.com>
Date: Tue, 22 Jun 2010 15:33:51 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 22 Jun 2010 22:33:54.0630 (UTC)
	FILETIME=[FF17D660:01CB125A]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH, RFC] Link with $ORIGIN, mangle only when that's too hard, get it all
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
X-List-Received-Date: Tue, 22 Jun 2010 22:39:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

The following changes relocatable.bbclass to an always for native (and 
disabled for cross) to an opt-in for hard to get right recipes.

With this, cross / native things like with $ORIGIN directly, for the 
common case.  We do this as an in addition to so that programs that run 
before install still work fine.  In addition doing this makes sure that 
the initial RPATH will be long enough, even in the cross case, that we 
can patch in a correct $ORIGIN[1].

Advantages? Less tasks, one less must have host utility (*cough*3rd 
party yum repos*cough*).  Having an exists but not right second known 
part of RPATH ensures cross recipes are now chrpath/patchelf patchable 
and gets us one step closer to pstaging being relocatable (will have to 
run some tests to look at the last corner cases).  Disadvantages? One 
"ugly" escape sequence in bitbake.conf.

Signed-off-by: Tom Rini <tom_rini@mentor.com>

diff --git a/classes/cross.bbclass b/classes/cross.bbclass
index 4cf2b4c..e486e30 100644
--- a/classes/cross.bbclass
+++ b/classes/cross.bbclass
@@ -1,6 +1,3 @@
-# Disabled for now since the relocation paths are too long
-#inherit relocatable
-
  # Cross packages are built indirectly via dependency,
  # no need for them to be a direct target of 'world'
  EXCLUDE_FROM_WORLD = "1"
diff --git a/classes/native.bbclass b/classes/native.bbclass
index 3437836..92f5f83 100644
--- a/classes/native.bbclass
+++ b/classes/native.bbclass
@@ -1,6 +1,3 @@
-# We want native packages to be relocatable
-inherit relocatable
-
  # Native packages are built indirectly via dependency,
  # no need for them to be a direct target of 'world'
  EXCLUDE_FROM_WORLD = "1"
diff --git a/classes/relocatable.bbclass b/classes/relocatable.bbclass
index e4ababa..77b5f87 100644
--- a/classes/relocatable.bbclass
+++ b/classes/relocatable.bbclass
@@ -1,4 +1,5 @@
  SYSROOT_PREPROCESS_FUNCS += "relocatable_binaries_preprocess"
+DEPENDS += "chrpath-native"

  CHRPATH_BIN ?= "chrpath"
  PREPROCESS_RELOCATE_DIRS ?= ""
diff --git a/classes/sanity.bbclass b/classes/sanity.bbclass
index dfb3010..33ec459 100644
--- a/classes/sanity.bbclass
+++ b/classes/sanity.bbclass
@@ -83,7 +83,7 @@ def check_sanity(e):
  	if not check_app_exists('${BUILD_PREFIX}g++', e.data):
  		missing = missing + "C++ Compiler (${BUILD_PREFIX}g++),"

-	required_utilities = "patch help2man diffstat texi2html makeinfo cvs 
svn bzip2 tar gzip gawk md5sum chrpath"
+	required_utilities = "patch help2man diffstat texi2html makeinfo cvs 
svn bzip2 tar gzip gawk md5sum"

  	# If we'll be running qemu, perform some sanity checks
  	if data.getVar('ENABLE_BINARY_LOCALE_GENERATION', e.data, True):
diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 397dbc2..46e6772 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -482,8 +482,9 @@ export CXXFLAGS = "${TARGET_CXXFLAGS}"
  export TARGET_CXXFLAGS = "${TARGET_CFLAGS} -fpermissive"
  export SDK_CXXFLAGS = "${SDK_CFLAGS} -fpermissive"

+export RELATIVERPATH = "${@base_path_relative(d.getVar('bindir', 1), 
d.getVar('STAGING_LIBDIR_NATIVE', 1))}"
  export BUILD_LDFLAGS = "-L${STAGING_LIBDIR_NATIVE} \
-                        -Wl,-rpath-link,${STAGING_LIBDIR_NATIVE} \
+                        -Wl,-rpath,\\\$\$ORIGIN/${RELATIVERPATH} -Wl,-O1 \
                          -Wl,-rpath,${STAGING_LIBDIR_NATIVE} -Wl,-O1"

  export LDFLAGS = "${TARGET_LDFLAGS}"
diff --git a/recipes/binutils/binutils.inc b/recipes/binutils/binutils.inc
index a1866f3..3764f32 100644
--- a/recipes/binutils/binutils.inc
+++ b/recipes/binutils/binutils.inc
@@ -5,7 +5,7 @@ LICENSE = "GPL"

  INC_PR = "r10"

-inherit autotools gettext
+inherit autotools gettext relocatable

  PACKAGES += "${PN}-symlinks"

diff --git a/recipes/gcc/gcc-common.inc b/recipes/gcc/gcc-common.inc
index 7aee542..d7e022d 100644
--- a/recipes/gcc/gcc-common.inc
+++ b/recipes/gcc/gcc-common.inc
@@ -5,7 +5,7 @@ LICENSE = "GPL"

  NATIVEDEPS = ""

-inherit autotools gettext
+inherit autotools gettext relocatable

  FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/gcc-${PV}"

diff --git a/recipes/gdb/gdb.inc b/recipes/gdb/gdb.inc
index 3500e1a..7cd47ed 100644
--- a/recipes/gdb/gdb.inc
+++ b/recipes/gdb/gdb.inc
@@ -14,7 +14,7 @@ RRECOMMENDS_gdb_append_linux-uclibc = " uclibc-thread-db "
  RRECOMMENDS_gdb_append_linux-uclibceabi = " uclibc-thread-db "
  RRECOMMENDS_gdb_append_linux-spe = " uclibc-thread-db "

-inherit gettext
+inherit gettext relocatable

  SRC_URI += "file://kill_arm_map_symbols.patch \
              file://gdbserver-cflags-last.diff;striplevel=0"
diff --git a/recipes/perl/perl-native_5.10.1.bb 
b/recipes/perl/perl-native_5.10.1.bb
index 8bafff0..b210115 100644
--- a/recipes/perl/perl-native_5.10.1.bb
+++ b/recipes/perl/perl-native_5.10.1.bb
@@ -23,7 +23,7 @@ SRC_URI[perl-5.10.1.sha256sum] = 
"cb7f26ea4b2b28d6644354d87a269d01cac1b635287dae

  S = "${WORKDIR}/perl-${PV}"

-inherit native
+inherit native relocatable

  do_configure () {
      ./Configure \
diff --git a/recipes/perl/perl-native_5.8.8.bb 
b/recipes/perl/perl-native_5.8.8.bb
index 336b419..7602d77 100644
--- a/recipes/perl/perl-native_5.8.8.bb
+++ b/recipes/perl/perl-native_5.8.8.bb
@@ -20,7 +20,7 @@ SRC_URI = 
"http://ftp.funet.fi/pub/CPAN/src/5.0/perl-${PV}.tar.gz \

  S = "${WORKDIR}/perl-${PV}"

-inherit native
+inherit native relocatable

  do_configure () {
      ./Configure \

[1]: gcc/binutils/gdb are the hard ones as they re-run configure and 
lead to escape-hell and gcc has an extra layer of fun with mpfr + cc1 in 
libexec

-- 
Tom Rini
Mentor Graphics Corporation


