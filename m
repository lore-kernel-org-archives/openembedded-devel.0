Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TrmXG-00036s-QE
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 10:28:58 +0100
Received: by mail-pb0-f52.google.com with SMTP id ro2so9961555pbb.25
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2013 01:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=/y8kK87Wl63ekE2uM5Op7vnVGBuNtiJJaBVpwIk9e/0=;
	b=I6JG3hEmW8p6Csbmgq620Y1VZ6oe8yaxrNBT7auph543lMxT0f/guVw9g0761iGSOX
	aveFVMKzMaaTJkNbUe9N06/f3FF/kelFnnfmPkW6nE0KFjRczqckDOhDH16xH6u+SAT4
	QXrLDL1pggVCdfPYl2sMK8E0vzMX6B3ggnxK+OQHg+/C/B2nraKTVAwOXOVZFnjFY9nA
	pkdVLYvpE8OBc+mAT10EJlMDLx+ecSpan2w+NSUF1D7qIT/eCjp8S10hq8ttFSwlTnJD
	DzYQ8DiBcyKKbheTKwK2HrZ4JngIYjFyyZxn4NpbxLM2vmzRTRQpSnZigyadEZhafSSy
	Ew+Q==
X-Received: by 10.66.82.67 with SMTP id g3mr167492500pay.58.1357463626570;
	Sun, 06 Jan 2013 01:13:46 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qw8sm5137145pbc.39.2013.01.06.01.13.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 01:13:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Jan 2013 01:12:36 -0800
Message-Id: <1357463568-26241-13-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
References: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH V2 13/25] concurrencykit: Add recipe for latest from git
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
X-List-Received-Date: Sun, 06 Jan 2013 09:29:04 -0000

Provides concurrency primitives

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../concurrencykit/concurrencykit/cross.patch      |   69 ++++++++++++++++++++
 .../concurrencykit/concurrencykit_git.bb           |   38 +++++++++++
 2 files changed, 107 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/concurrencykit/concurrencykit/cross.patch
 create mode 100644 meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb

diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit/cross.patch b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/cross.patch
new file mode 100644
index 0000000..38504fe
--- /dev/null
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/cross.patch
@@ -0,0 +1,69 @@
+Index: git/configure
+===================================================================
+--- git.orig/configure	2012-11-19 21:07:51.917429465 -0800
++++ git/configure	2012-11-19 21:13:19.337437278 -0800
+@@ -275,8 +275,11 @@
+ assert "$SYSTEM" "$SYSTEM" "unsupported"
+ 
+ CORES=${CORES:-${DCORES}}
+-printf "Detecting machine architecture..."
+-PLATFORM=`uname -m 2> /dev/null`
++if test -z "$PLATFORM"; then
++	printf "Detecting machine architecture..."
++	PLATFORM=`uname -m 2> /dev/null`
++fi
++
+ case $PLATFORM in
+ 	"macppc"|"Power Macintosh"|"powerpc")
+ 		MM="${MM:-"CK_MD_RMO"}"
+@@ -439,14 +442,18 @@
+ 	GZIP_SUFFIX=".gz"
+ fi
+ 
+-printf "Finding suitable compiler........"
+-CC=`pathsearch "${CC:-cc}"`
+-if test -z "$CC" -o ! -x "$CC"; then
+-	CC=`pathsearch "${CC:-gcc}"`
++if test -z "$CC"; then
++	printf "Finding suitable compiler........"
++	CC=`pathsearch "${CC:-cc}"`
++	if test -z "$CC" -o ! -x "$CC"; then
++		CC=`pathsearch "${CC:-gcc}"`
++	fi
+ fi
+ assert "$CC" "not found"
+ 
+-cat << EOF > .1.c
++if test -z "$COMPILER"; then
++
++	cat << EOF > .1.c
+ #include <stdio.h>
+ int main(void) {
+ #if defined(__GNUC__) && (__GNUC__ >= 4)
+@@ -460,16 +467,16 @@
+ #endif
+ }
+ EOF
+-
+-$CC -o .1 .1.c
+-COMPILER=`./.1`
+-r=$?
+-rm -f .1.c .1
+-
+-if test "$r" -ne 0; then
+-	assert "" "update compiler"
+-else
+-	echo "success [$CC]"
++	$CC -o .1 .1.c
++	COMPILER=`./.1`
++	r=$?
++	rm -f .1.c .1
++
++	if test "$r" -ne 0; then
++		assert "" "update compiler"
++	else
++		echo "success [$CC]"
++	fi
+ fi
+ 
+ if test "$COMPILER" = "suncc"; then
diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
new file mode 100644
index 0000000..463e7e4
--- /dev/null
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
@@ -0,0 +1,38 @@
+DESCRIPTION = "Concurrency Kit provides a plethora of concurrency primitives, \
+safe memory reclamation mechanisms and non-blocking data structures \
+designed to aid in the design and implementation of high performance \
+concurrent systems."
+
+LICENSE = "BSD & Apache-2.0"
+HOMEPAGE = "http://concurrencykit.org"
+SECTION = "base"
+
+SRCREV = "900d203aa9e41288545368ea40da0bee89f7907f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f12611e65e064515ce264249b2bdea98"
+SRC_URI = "git://git.concurrencykit.org/ck.git;protocol=git \
+           file://cross.patch \
+          "
+
+S = "${WORKDIR}/git"
+
+inherit autotools
+
+PLAT_powerpc64 = "ppc64"
+PLAT ?= "${HOST_ARCH}"
+
+do_configure () {
+	export PLATFORM=${PLAT}
+	export COMPILER='gcc'
+	${S}/configure \
+	--prefix=${prefix} \
+	--includedir=${includedir} \
+	--libdir=${libdir} \
+}
+
+do_compile () {
+	oe_runmake
+}
+
+do_install () {
+	oe_runmake 'DESTDIR=${D}' install
+}
-- 
1.7.9.5



