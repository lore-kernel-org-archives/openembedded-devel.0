Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NxCXB-0006y3-QC
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 07:01:44 +0200
Received: by gwj21 with SMTP id 21so621095gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Mar 2010 21:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=KIAGDT6AFj7Bnhbra5QFOS4ZGiE+6ISsxO81uQVY4nQ=;
	b=KXBvXWCA1ibOVBuSGmWx0Svhr/KoYKAxsgTh8bUUg/dEnueS/hM3ksyKnIraiEdnVT
	/P6CD+rhjjVg3xAKJntxakGet+zbIqwm6j1fteE++zByxfme3Ap/g1lRkfs6lUe62/P1
	cMH42hlCJswyoI32uPLm0dyROHV5dd3FBNaBA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=FY5nYCLKu/e+1IVKsN8kumGpTRNYB0bqAIOipxMJoICCNuiAkQ6yEQB2JWO2PwDmin
	+SkD0w/rMVhpO7DJaH/ua2M09mEFnKiKH4Zc5HgliwoN04nRHXQqQUh23Fj6J7jVFKSl
	yjA8BGwa9xBBqpWSwxm+2Z1Xk9ngq0anxZqjM=
Received: by 10.90.3.6 with SMTP id 6mr952817agc.27.1270097900804;
	Wed, 31 Mar 2010 21:58:20 -0700 (PDT)
Received: from localhost (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 21sm427432iwn.3.2010.03.31.21.58.19
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 31 Mar 2010 21:58:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Mar 2010 21:59:05 -0700
Message-Id: <1270097945-3713-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] eglibc: Add patch to limit gcc commandline output.
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
X-List-Received-Date: Thu, 01 Apr 2010 05:01:45 -0000

* This patch reduced the size of do_compile of eglibc from 12M to 5.4M
  and the build time for eglibc improved a bit too

* The patch applied to 2.9,2.10 and 2.11

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/eglibc/eglibc_2.10.bb                     |    3 +-
 recipes/eglibc/eglibc_2.11.bb                     |    3 +-
 recipes/eglibc/eglibc_2.9.bb                      |    3 +-
 recipes/eglibc/files/shorten-build-commands.patch |   79 +++++++++++++++++++++
 4 files changed, 85 insertions(+), 3 deletions(-)
 create mode 100644 recipes/eglibc/files/shorten-build-commands.patch

diff --git a/recipes/eglibc/eglibc_2.10.bb b/recipes/eglibc/eglibc_2.10.bb
index 4dfaccf..a65a2bf 100644
--- a/recipes/eglibc/eglibc_2.10.bb
+++ b/recipes/eglibc/eglibc_2.10.bb
@@ -3,13 +3,14 @@ require eglibc.inc
 DEPENDS += "gperf-native"
 FILESPATHPKG =. "eglibc-svn:"
 PV = "2.10"
-PR = "${INC_PR}.8"
+PR = "${INC_PR}.9"
 SVN_REV="10152"
 EGLIBC_BRANCH="eglibc-2_10"
 SRC_URI = "svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};rev=${SVN_REV};proto=svn \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch;patch=1 \
            file://armv4t-interworking.patch;patch=1 \
            file://IO-acquire-lock-fix.patch;patch=1 \
+           file://shorten-build-commands.patch;patch=1 \
            file://etc/ld.so.conf \
            file://generate-supported.mk"
 S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
diff --git a/recipes/eglibc/eglibc_2.11.bb b/recipes/eglibc/eglibc_2.11.bb
index 6a41705..6d78bde 100644
--- a/recipes/eglibc/eglibc_2.11.bb
+++ b/recipes/eglibc/eglibc_2.11.bb
@@ -4,12 +4,13 @@ DEFAULT_PREFERENCE = "-1"
 DEPENDS += "gperf-native"
 FILESPATHPKG =. "eglibc-svn:"
 PV = "2.11"
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 SVN_REV="10151"
 EGLIBC_BRANCH="eglibc-2_11"
 SRC_URI = "svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};rev=${SVN_REV};proto=svn \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch;patch=1 \
            file://IO-acquire-lock-fix.patch;patch=1 \
+           file://shorten-build-commands.patch;patch=1 \
            file://etc/ld.so.conf \
            file://generate-supported.mk"
 S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
diff --git a/recipes/eglibc/eglibc_2.9.bb b/recipes/eglibc/eglibc_2.9.bb
index 37e29c0..031f112 100644
--- a/recipes/eglibc/eglibc_2.9.bb
+++ b/recipes/eglibc/eglibc_2.9.bb
@@ -3,13 +3,14 @@ require eglibc.inc
 DEPENDS += "gperf-native"
 FILESPATHPKG =. "eglibc-svn:"
 PV = "2.9"
-PR = "${INC_PR}.8"
+PR = "${INC_PR}.9"
 SVN_REV="10153"
 EGLIBC_BRANCH="eglibc-2_9"
 SRC_URI = "svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};rev=${SVN_REV};proto=svn \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch;patch=1 \
 	   file://armv4t-interworking.patch;patch=1 \
 	   file://IO-acquire-lock-fix.patch;patch=1 \
+           file://shorten-build-commands.patch;patch=1 \
            file://etc/ld.so.conf \
            file://generate-supported.mk"
 S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
diff --git a/recipes/eglibc/files/shorten-build-commands.patch b/recipes/eglibc/files/shorten-build-commands.patch
new file mode 100644
index 0000000..57835ad
--- /dev/null
+++ b/recipes/eglibc/files/shorten-build-commands.patch
@@ -0,0 +1,79 @@
+Source: http://sourceware.org/ml/libc-alpha/2010-03/msg00064.html
+
+This patch scratches an itch.  Each individual gcc command in the
+glibc build is over 1K, which means it takes up a good chunk of my
+terminal.  Most of that is include paths.  Any version of GCC new
+enough to build glibc supports response files, which were added in
+2005.  So use a response file for the static list of include paths.
+Now the build commands are a lot shorter, and easier to use when
+developing glibc.
+
+Tested on x86_64-linux-gnu.  Please apply if acceptable.
+
+-- 
+Daniel Jacobowitz
+CodeSourcery
+
+2010-03-30  Daniel Jacobowitz  <dan@codesourcery.com>
+
+	* Makeconfig (+common-includes): Define.
+	(+includes): Use @$(common-objpfx)includes.
+	* Makefile (postclean): Remove includes and includes.mk.
+	* Makerules ($(common-objpfx)includes.mk): Include and create
+	includes.mk.  Create includes.
+
+Index: libc/Makeconfig
+===================================================================
+--- libc.orig/Makeconfig	2009-10-13 22:55:12.000000000 -0700
++++ libc/Makeconfig	2010-03-31 16:02:37.120489733 -0700
+@@ -678,9 +678,10 @@ endif	# $(+cflags) == ""
+ # library source directory, in the include directory, and in the
+ # current directory.
+ +sysdep-includes = $(addprefix -I,$(+sysdep_dirs))
+++common-includes = $(+sysdep-includes) $(includes) $(sysincludes)
+ +includes = -I$(..)include $(if $(subdir),$(objpfx:%/=-I%)) \
+-	    $(+sysdep-includes) $(includes) \
+-	    $(patsubst %/,-I%,$(..)) $(libio-include) -I. $(sysincludes)
++	    @$(common-objpfx)includes \
++	    $(patsubst %/,-I%,$(..)) $(libio-include) -I.
+ 
+ # Since libio has several internal header files, we use a -I instead
+ # of many little headers in the include directory.
+Index: libc/Makefile
+===================================================================
+--- libc.orig/Makefile	2009-12-09 12:06:28.000000000 -0800
++++ libc/Makefile	2010-03-31 16:02:37.132481508 -0700
+@@ -247,7 +247,7 @@ parent-mostlyclean: common-mostlyclean #
+ parent-clean: parent-mostlyclean common-clean
+ 
+ postclean = $(addprefix $(common-objpfx),$(postclean-generated)) \
+-	    $(addprefix $(objpfx),sysd-dirs sysd-rules) \
++	    $(addprefix $(objpfx),sysd-dirs sysd-rules includes includes.mk) \
+ 	    $(addprefix $(objpfx),sysd-sorted soversions.mk soversions.i)
+ 
+ clean: parent-clean
+Index: libc/Makerules
+===================================================================
+--- libc.orig/Makerules	2009-12-09 12:06:28.000000000 -0800
++++ libc/Makerules	2010-03-31 16:02:37.140481645 -0700
+@@ -254,6 +254,20 @@ ifndef sysd-rules-done
+ no_deps=t
+ endif
+ 
++-include $(common-objpfx)includes.mk
++ifneq ($(+common-includes),$(saved-includes))
++# Recreate includes.mk (and includes).
++includes-force = FORCE
++FORCE:
++endif
++$(common-objpfx)includes.mk: $(includes-force)
++	-@rm -f $@T $(common-objpfx)includesT
++	for inc in $(+common-includes); do echo "$$inc"; done \
++	  > $(common-objpfx)includesT
++	mv -f $(common-objpfx)includesT $(common-objpfx)includes
++	echo 'saved-includes := $(+common-includes)' > $@T
++	mv -f $@T $@
++
+ define o-iterator-doit
+ $(objpfx)%$o: %.S $(before-compile); $$(compile-command.S)
+ endef
-- 
1.6.3.3



