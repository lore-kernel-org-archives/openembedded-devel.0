Received: from [209.85.200.168] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ls37W-000797-EF
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Apr 2009 00:53:22 +0200
Received: by wf-out-1314.google.com with SMTP id 25so901242wfa.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Apr 2009 15:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=R8StCqZZJnosE1IktwZdmCwRYuCCtM2TjypMPZI5mFw=;
	b=QfRITlIPPMUBBe4ShMhmY3SS0H2fDaEfEOsOA1PHFDFgT9oc2gMoZRiXyvQBKE66CG
	Q2aJBA59nDPyzC72qfYcnmmpNPkUCVXD6rar67WCYPgVHd4ILWRov7Pd7RCX+pU5eW1d
	IP4q1aNDt+mgn3DHtaKqdVjhGszCHqF7aNY1c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=O6r3CzAu6tl/4i4mUq3Oy8MvE12J9D3nMuYF16XCfNLbM19ZpYmKz9Q6b+6pTKORh2
	gNDGmvgof0CVmINUSTqsSPHUN/0QzbyR78YcyidDV2ht0OffJvcgCwk8md/INra7Ms8w
	BW64sWanldSuY+r8OJo6JEodq+v3NPCDLDMnk=
Received: by 10.142.79.12 with SMTP id c12mr1032588wfb.325.1239317405337;
	Thu, 09 Apr 2009 15:50:05 -0700 (PDT)
Received: from localhost (adsl-71-146-24-121.dsl.pltn13.sbcglobal.net
	[71.146.24.121])
	by mx.google.com with ESMTPS id 30sm1184519wfg.34.2009.04.09.15.50.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 09 Apr 2009 15:50:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Apr 2009 15:50:02 -0700
Message-Id: <1239317402-31917-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
X-SA-Exim-Connect-IP: 209.85.200.168
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] quilt-0.48: Add new version 0.48 of quilt.
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
X-List-Received-Date: Thu, 09 Apr 2009 22:53:22 -0000

	* Adds the latest release of quilt recipes.
	* Move PR out of quilt.inc into respective bb files.
---
 conf/checksums.ini                     |    4 +
 recipes/quilt/quilt-0.48/aclocal.patch |  126 ++++++++++++++++++++++++++++++++
 recipes/quilt/quilt-0.48/install.patch |   13 +++
 recipes/quilt/quilt-native_0.45.bb     |    1 +
 recipes/quilt/quilt-native_0.46.bb     |    1 +
 recipes/quilt/quilt-native_0.48.bb     |    1 +
 recipes/quilt/quilt.inc                |    1 -
 recipes/quilt/quilt_0.45.bb            |    1 +
 recipes/quilt/quilt_0.46.bb            |    1 +
 recipes/quilt/quilt_0.48.bb            |    1 +
 10 files changed, 149 insertions(+), 1 deletions(-)
 create mode 100644 recipes/quilt/quilt-0.48/aclocal.patch
 create mode 100644 recipes/quilt/quilt-0.48/install.patch
 create mode 100644 recipes/quilt/quilt-native_0.48.bb
 create mode 100644 recipes/quilt/quilt_0.48.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index c638792..3b0f1a5 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -19998,6 +19998,10 @@ sha256=de7290f334baf631a14d031df304ee94cfb550aa69e7512aa589d21c2381c7d8
 md5=4508546d1ed0257ef7c128b6121b7208
 sha256=47bf030565bb462840db694acc183273455714028c74974c5b3a3bd4ad29ad89
 
+[http://download.savannah.gnu.org/releases/quilt/quilt-0.48.tar.gz]
+md5=f77adda60039ffa753f3c584a286f12b
+sha256=73fd760d3b5cbf06417576591dc37d67380d189392db9000c21b7cbebee49ffc
+
 [http://download.savannah.nongnu.org/releases/qwo/qwo-0.4.tar.gz]
 md5=72811b7d7fecfbdca45d5a74394daa4f
 sha256=c3b9bffd3e27090d4c0623ef61f48257343d0f6ea1cf573f5296250ab7551e5d
diff --git a/recipes/quilt/quilt-0.48/aclocal.patch b/recipes/quilt/quilt-0.48/aclocal.patch
new file mode 100644
index 0000000..1245f74
--- /dev/null
+++ b/recipes/quilt/quilt-0.48/aclocal.patch
@@ -0,0 +1,126 @@
+Add the aclocal.m4 as acinclude.m4
+
+Index: quilt-0.46/acinclude.m4
+===================================================================
+--- /dev/null
++++ quilt-0.46/acinclude.m4
+@@ -0,0 +1,119 @@
++dnl Allow configure to specify a specific binary
++dnl 1: Environment variable
++dnl 2: binary name
++dnl 3: optional list of alternative binary names
++dnl 4: optional list of additional search directories
++AC_DEFUN([QUILT_COMPAT_PROG_PATH],[
++  m4_define([internal_$2_cmd],[esyscmd(ls compat/$2.in 2>/dev/null)])
++
++  AC_ARG_WITH($2, AC_HELP_STRING(
++    [--with-$2], [name of the $2 executable to use]
++                 m4_if(internal_$2_cmd,[],[],[ (use --without-$2
++                          to use an internal mechanism)])),
++  [
++    if test x"$withval" = xnone; then
++      AC_MSG_ERROR([Invalid configure argument.  use --without-$2])
++    fi
++    if test x"$withval" != xno; then
++      AC_MSG_CHECKING(for $2)
++      $1="$withval"
++      if test -e "$$1"; then
++	if test ! -f "$$1" -a ! -h "$$1" || test ! -x "$$1"; then
++	  AC_MSG_ERROR([$$1 is not an executable file])
++	fi
++      fi
++      AC_MSG_RESULT([$$1])
++      if test ! -e "$$1"; then
++        AC_MSG_WARN([$$1 does not exist])
++      fi
++      COMPAT_SYMLINKS="$COMPAT_SYMLINKS $2"
++    fi
++  ],[
++    m4_if([$3],[],[
++      AC_PATH_PROG($1,$2,,$PATH:$4)
++    ],[
++      AC_PATH_PROGS($1,$3,,$PATH:$4)
++      if test -n "$$1" -a "`expr "$$1" : '.*/\([[^/]]*\)$'`" != "$2"; then
++	COMPAT_SYMLINKS="$COMPAT_SYMLINKS $2"
++      fi
++    ])
++    m4_if([$4],[],[],[
++      if test -n "$$1"; then
++	as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
++        for dir in "$4"; do
++          if test "`dirname $$1`" = "$dir"; then
++            COMPAT_SYMLINKS="$COMPAT_SYMLINKS $2"
++	    break
++	  fi
++        done
++	IFS="$as_save_IFS"
++      fi
++    ])
++  ])
++  if test -z "$$1"; then
++    m4_if(internal_$2_cmd,[],[
++      AC_MSG_ERROR([Please specify the location of $2 with the option '--with-$2'])
++    ],[
++      AC_MSG_WARN([Using internal $2 mechanism.  Use option '--with-$2' to override])
++      COMPAT_PROGRAMS="$COMPAT_PROGRAMS $2"
++      $1=$2
++      INTERNAL_$1=1
++    ])
++  fi
++  AC_SUBST($1)
++])
++
++dnl Allow configure to specify a specific binary
++dnl This variant is for optional binaries.
++dnl 1: Environment variable
++dnl 2: binary name
++dnl 3: optional list of alternative binary names
++dnl 4: optional list of additional search directories
++AC_DEFUN([QUILT_COMPAT_PROG_PATH_OPT],[
++  AC_ARG_WITH($2, AC_HELP_STRING(
++    [--with-$2], [name of the $2 executable to use]),
++  [
++    if test x"$withval" != xno; then
++      AC_MSG_CHECKING(for $2)
++      $1="$withval"
++      if test -e "$$1"; then
++	if test ! -f "$$1" -a ! -h "$$1" || test ! -x "$$1"; then
++	  AC_MSG_ERROR([$$1 is not an executable file])
++	fi
++      fi
++      AC_MSG_RESULT([$$1])
++      if test ! -e "$$1"; then
++        AC_MSG_WARN([$$1 does not exist])
++      fi
++      COMPAT_SYMLINKS="$COMPAT_SYMLINKS $2"
++    fi
++  ],[
++    m4_if([$3],[],[
++      AC_PATH_PROG($1,$2,,$PATH:$4)
++    ],[
++      AC_PATH_PROGS($1,$3,,$PATH:$4)
++      if test -n "$$1" -a "`expr "$$1" : '.*/\([[^/]]*\)$'`" != "$2"; then
++	COMPAT_SYMLINKS="$COMPAT_SYMLINKS $2"
++      fi
++    ])
++    m4_if([$4],[],[],[
++      if test -n "$$1"; then
++	as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
++        for dir in "$4"; do
++          if test "`dirname $$1`" = "$dir"; then
++            COMPAT_SYMLINKS="$COMPAT_SYMLINKS $2"
++	    break
++	  fi
++        done
++	IFS="$as_save_IFS"
++      fi
++    ])
++    if test -z "$$1"; then
++      AC_MSG_WARN([$2 not found, some optional functionalities will be missing])
++    fi
++  ])
++  if test -z "$$1"; then
++    $1=$2
++  fi
++  AC_SUBST($1)
++])
diff --git a/recipes/quilt/quilt-0.48/install.patch b/recipes/quilt/quilt-0.48/install.patch
new file mode 100644
index 0000000..7970f11
--- /dev/null
+++ b/recipes/quilt/quilt-0.48/install.patch
@@ -0,0 +1,13 @@
+Index: quilt-0.48/Makefile.in
+===================================================================
+--- quilt-0.48.orig/Makefile.in	2009-01-31 09:09:47.000000000 -0800
++++ quilt-0.48/Makefile.in	2009-04-09 15:36:25.000000000 -0700
+@@ -13,7 +13,7 @@
+ mandir :=	@mandir@
+ localedir :=	$(datadir)/locale
+ emacsdir :=	$(datadir)/emacs/site-lisp
+-etcdir :=	$(subst /usr/etc,/etc,$(prefix)/etc)
++etcdir :=	@sysconfdir@
+ 
+ INSTALL :=	@INSTALL@
+ POD2MAN :=	@POD2MAN@
diff --git a/recipes/quilt/quilt-native_0.45.bb b/recipes/quilt/quilt-native_0.45.bb
index 302df25..5fbaf5a 100644
--- a/recipes/quilt/quilt-native_0.45.bb
+++ b/recipes/quilt/quilt-native_0.45.bb
@@ -1 +1,2 @@
 require quilt-native.inc
+PR = "r2"
diff --git a/recipes/quilt/quilt-native_0.46.bb b/recipes/quilt/quilt-native_0.46.bb
index 302df25..5fbaf5a 100644
--- a/recipes/quilt/quilt-native_0.46.bb
+++ b/recipes/quilt/quilt-native_0.46.bb
@@ -1 +1,2 @@
 require quilt-native.inc
+PR = "r2"
diff --git a/recipes/quilt/quilt-native_0.48.bb b/recipes/quilt/quilt-native_0.48.bb
new file mode 100644
index 0000000..302df25
--- /dev/null
+++ b/recipes/quilt/quilt-native_0.48.bb
@@ -0,0 +1 @@
+require quilt-native.inc
diff --git a/recipes/quilt/quilt.inc b/recipes/quilt/quilt.inc
index 33bc0f6..ce9679d 100644
--- a/recipes/quilt/quilt.inc
+++ b/recipes/quilt/quilt.inc
@@ -2,7 +2,6 @@ DESCRIPTION = "Tool to work with series of patches."
 HOMEPAGE = "http://savannah.nongnu.org/projects/quilt/"
 SECTION = "devel"
 LICENSE = "GPL"
-PR = "r2"
 
 SRC_URI = "http://download.savannah.gnu.org/releases/quilt/quilt-${PV}.tar.gz \
            file://install.patch;patch=1"
diff --git a/recipes/quilt/quilt_0.45.bb b/recipes/quilt/quilt_0.45.bb
index de38f64..99efa48 100644
--- a/recipes/quilt/quilt_0.45.bb
+++ b/recipes/quilt/quilt_0.45.bb
@@ -1 +1,2 @@
 require quilt-package.inc
+PR = "r2"
diff --git a/recipes/quilt/quilt_0.46.bb b/recipes/quilt/quilt_0.46.bb
index de38f64..99efa48 100644
--- a/recipes/quilt/quilt_0.46.bb
+++ b/recipes/quilt/quilt_0.46.bb
@@ -1 +1,2 @@
 require quilt-package.inc
+PR = "r2"
diff --git a/recipes/quilt/quilt_0.48.bb b/recipes/quilt/quilt_0.48.bb
new file mode 100644
index 0000000..de38f64
--- /dev/null
+++ b/recipes/quilt/quilt_0.48.bb
@@ -0,0 +1 @@
+require quilt-package.inc
-- 
1.5.4.3



