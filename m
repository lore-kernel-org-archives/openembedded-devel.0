Return-Path: <patrick.wicki@subset.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B52C46CA3
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 02:56:10 +0000 (UTC)
Received: from ci74p00im-qukt09090301.me.com (ci74p00im-qukt09090301.me.com [17.57.156.20])
 by mx.groups.io with SMTP id smtpd.web11.63590.1701312960356836611
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Nov 2023 18:56:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@subset.ch header.s=sig1 header.b=hSR06Z8h;
 spf=pass (domain: subset.ch, ip: 17.57.156.20, mailfrom: patrick.wicki@subset.ch)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=subset.ch; s=sig1;
	t=1701312959; bh=g+b22BIM6jrYJTJEAqVXj/NFiFuJCkiB7VMNm+4jnmw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=hSR06Z8htk3VhdvXuKGkC1q3depLgr2ssgFNZZfv3z5uKC9xvCV//HtpG24vOjIqL
	 423maf/3Dsb0MODkhsGRxsg7rTMrq8sqQHoAJDLLAsl/UnfF98dsvKeOGWVlVKkTg8
	 w039+wEJ8856iyLLDnfV/GY/mTdwbghjpsO36YjEb9FJ+Sec8glsQXkJVP+8GXkJK5
	 TQMwlbUYD9OdlaPal9uFsKUbACHiyM4O9/2apL4eCExnDVZgz0tJBAVC1i6IWQmnBh
	 hYFNX+p7Wv32eOQsJZLCUibRlIAF6p5BObFZpVoqm4YWQchIHLGj097E60qJxENlgY
	 MpO/mQhbNbaeQ==
Received: from localhost.localdomain (ci77p00im-dlb-asmtp-mailmevip.me.com [17.57.156.26])
	by ci74p00im-qukt09090301.me.com (Postfix) with ESMTPSA id 2366011202A3;
	Thu, 30 Nov 2023 02:55:57 +0000 (UTC)
From: patrick.wicki@subset.ch
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Wicki <patrick.wicki@siemens.com>
Subject: [oe][meta-networking][PATCH 1/6] squid: update from v5.7 to v6.5
Date: Thu, 30 Nov 2023 03:55:24 +0100
Message-ID: <b1a419eaaf04176712a17de811d217fa8eb12ea6.1701312810.git.patrick.wicki@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1701312810.git.patrick.wicki@siemens.com>
References: <cover.1701312810.git.patrick.wicki@siemens.com>
MIME-Version: 1.0
X-Proofpoint-GUID: Rtf08UYCO_k4tyPtTsIp7hXKPLPax2RZ
X-Proofpoint-ORIG-GUID: Rtf08UYCO_k4tyPtTsIp7hXKPLPax2RZ
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 clxscore=1030
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2311300020
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 02:56:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107154

From: Patrick Wicki <patrick.wicki@siemens.com>

Refresh patches and clean up ones that are no longer needed:

* dlopen test was removed in b65d2165c5c250242764ed7cdac4540fba813dec
* libxml2 variables were removed in
  866a092dad01e58986a6e9ecb84ac89037a63e9a
* squid-conf-tests no longer run at build time since
  cd3dc147bf8abc0225237ced865c6660fffcb63a

Fix squid-conf-tests to allow running on target device.

License change: Update year

The version update eliminates the following CVEs:

* CVE-2023-5824  (affected: <6.4)
* CVE-2023-46724 (affected: >=3D3.3.0.1, <6.4)
* CVE-2023-46728 (affected: <6.0.1)
* CVE-2023-46846 (affected: >=3D2.6, <6.4)
* CVE-2023-46847 (affected: >=3D3.2.0.1, <6.4)
* CVE-2023-46848 (affected: >=3D5.0.3, <6.4)

Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
---
 ...for-Wno-error-format-truncation-comp.patch | 18 ++---
 ...quid-conf-tests-run-on-target-device.patch | 74 +++++++++++++++++++
 ...d-dynamic-ldb-link-test-in-configure.patch | 40 ----------
 .../files/Set-up-for-cross-compilation.patch  | 10 +--
 .../files/Skip-AC_RUN_IFELSE-tests.patch      | 25 +++----
 .../recipes-daemons/squid/files/run-ptest     |  1 +
 .../squid/files/set_sysroot_patch.patch       | 41 ----------
 ...-t-do-squid-conf-tests-at-build-time.patch | 61 ---------------
 .../squid/{squid_5.7.bb =3D> squid_6.5.bb}      | 27 +++----
 9 files changed, 110 insertions(+), 187 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/squid/files/0002-squi=
d-make-squid-conf-tests-run-on-target-device.patch
 delete mode 100644 meta-networking/recipes-daemons/squid/files/Fix-flawe=
d-dynamic-ldb-link-test-in-configure.patch
 delete mode 100644 meta-networking/recipes-daemons/squid/files/set_sysro=
ot_patch.patch
 delete mode 100644 meta-networking/recipes-daemons/squid/files/squid-don=
-t-do-squid-conf-tests-at-build-time.patch
 rename meta-networking/recipes-daemons/squid/{squid_5.7.bb =3D> squid_6.=
5.bb} (81%)

diff --git a/meta-networking/recipes-daemons/squid/files/0001-configure-C=
heck-for-Wno-error-format-truncation-comp.patch b/meta-networking/recipes=
-daemons/squid/files/0001-configure-Check-for-Wno-error-format-truncation=
-comp.patch
index acebd6dce..a478dcd80 100644
--- a/meta-networking/recipes-daemons/squid/files/0001-configure-Check-fo=
r-Wno-error-format-truncation-comp.patch
+++ b/meta-networking/recipes-daemons/squid/files/0001-configure-Check-fo=
r-Wno-error-format-truncation-comp.patch
@@ -1,4 +1,4 @@
-From c21adbb0b230ffba97cf5d059e2bd024e13a37df Mon Sep 17 00:00:00 2001
+From 38e7e90cc2075952c1b74f5fca826f9c6cadb2f0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 22 Apr 2017 11:54:57 -0700
 Subject: [PATCH] configure: Check for -Wno-error=3Dformat-truncation com=
piler
@@ -13,8 +13,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
 Upstream-Status: Pending
=20
- acinclude/ax_check_compile_flag.m4 | 74 +++++++++++++++++++++++++++++++=
+++++++
- configure.ac                       |  2 ++
+ acinclude/ax_check_compile_flag.m4 | 74 ++++++++++++++++++++++++++++++
+ configure.ac                       |  2 +
  2 files changed, 76 insertions(+)
  create mode 100644 acinclude/ax_check_compile_flag.m4
=20
@@ -99,20 +99,20 @@ index 0000000..dcabb92
 +AS_VAR_POPDEF([CACHEVAR])dnl
 +])dnl AX_CHECK_COMPILE_FLAGS
 diff --git a/configure.ac b/configure.ac
-index ff4688c..9382fdf 100644
+index 2543676..4635474 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -26,6 +26,7 @@ m4_include([acinclude/pkg.m4])
+@@ -28,6 +28,7 @@ m4_include([acinclude/pkg.m4])
+ m4_include([acinclude/tdb.m4])
  m4_include([acinclude/lib-checks.m4])
- m4_include([acinclude/ax_cxx_compile_stdcxx_11.m4])
- m4_include([acinclude/ax_cxx_0x_types.m4])
+ m4_include([acinclude/ax_cxx_compile_stdcxx.m4])
 +m4_include([acinclude/ax_check_compile_flag.m4])
 =20
  HOSTCXX=3D"$BUILD_CXX"
  PRESET_CFLAGS=3D"$CFLAGS"
-@@ -44,6 +45,7 @@ AC_PROG_CXX
+@@ -59,6 +60,7 @@ AC_USE_SYSTEM_EXTENSIONS
+=20
  AC_LANG([C++])
- AC_CANONICAL_HOST
 =20
 +AX_CHECK_COMPILE_FLAG([-Werror=3Dformat-truncation],[CFLAGS=3D"$CFLAGS =
-Wno-error=3Dformat-truncation" CXXFLAGS=3D"$CXXFLAGS -Wno-error=3Dformat=
-truncation"])
  # Clang 3.2 on some CPUs requires -march-native to detect correctly.
diff --git a/meta-networking/recipes-daemons/squid/files/0002-squid-make-=
squid-conf-tests-run-on-target-device.patch b/meta-networking/recipes-dae=
mons/squid/files/0002-squid-make-squid-conf-tests-run-on-target-device.pa=
tch
new file mode 100644
index 000000000..56c91de3c
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/0002-squid-make-squid-c=
onf-tests-run-on-target-device.patch
@@ -0,0 +1,74 @@
+From cd8bf8a4bf881f84c23a5fc1f48bb716efa51512 Mon Sep 17 00:00:00 2001
+From: Patrick Wicki <patrick.wicki@siemens.com>
+Date: Wed, 22 Nov 2023 15:35:44 +0100
+Subject: [PATCH] squid: make squid-conf-tests run on target device
+
+* Fix paths to allow tests to run outside the original builddir
+* Allow the tests to run on read-only root
+  * Don't overwrite tests with true on success
+  * Change logfile path to /var/log
+
+Upstream-Status: Inappropriate [cross compile specific]
+
+Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
+
+---
+ test-suite/Makefile.am        | 16 ++++++++--------
+ test-suite/test-squid-conf.sh |  2 +-
+ 2 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/test-suite/Makefile.am b/test-suite/Makefile.am
+index 8becdbc..eccd49c 100644
+--- a/test-suite/Makefile.am
++++ b/test-suite/Makefile.am
+@@ -21,7 +21,7 @@ LDADD =3D \
+ EXTRA_PROGRAMS =3D mem_node_test splay
+=20
+ EXTRA_DIST =3D \
+-	$(srcdir)/squidconf/* \
++	squidconf/* \
+ 	test-functionality.sh \
+ 	test-sources.sh \
+ 	test-squid-conf.sh \
+@@ -134,21 +134,21 @@ VirtualDeleteOperator_SOURCES =3D \
+=20
+ installcheck-local: squid-conf-tests
+=20
+-squid-conf-tests: $(srcdir)/test-squid-conf.sh $(top_builddir)/src/squi=
d.conf.default $(srcdir)/squidconf/*
+-	@failed=3D0; cfglist=3D"$(top_builddir)/src/squid.conf.default $(srcdi=
r)/squidconf/*.conf"; rm -f $@ || $(TRUE); \
++squid-conf-tests: test-squid-conf.sh $(top_builddir)/src/squid.conf.def=
ault squidconf/*
++	@failed=3D0; cfglist=3D"$(top_builddir)/src/squid.conf.default squidco=
nf/*.conf"; rm -f $@ || $(TRUE); \
+ 	for cfg in $$cfglist ; do \
+-		$(srcdir)/test-squid-conf.sh $(top_builddir) $(sbindir) $$cfg || \
++		./test-squid-conf.sh $(top_builddir) $(sbindir) $$cfg || \
+ 			{ echo "FAIL: squid.conf test: $$cfg" | \
+ 				sed s%$(top_builddir)/src/%% | \
+-				sed s%$(srcdir)/squidconf/%% ; \
++				sed s%squidconf/%% ; \
+ 				failed=3D1; break; \
+ 			}; \
+ 		if test "$$failed" -eq 0; then \
+ 			echo "PASS: squid.conf test: $$cfg" | \
+ 				sed s%$(top_builddir)/src/%% | \
+-				sed s%$(srcdir)/squidconf/%% ; \
++				sed s%squidconf/%% ; \
+ 		else break; fi; \
+ 	done; \
+-	if test "$$failed" -eq 0; then cp $(TRUE) $@ ; else exit 1; fi
++	exit "$$failed"
+=20
+-CLEANFILES +=3D squid-conf-tests squid-stderr.log
++CLEANFILES +=3D squid-conf-tests /var/log/squid-stderr.log
+diff --git a/test-suite/test-squid-conf.sh b/test-suite/test-squid-conf.=
sh
+index 05fcaf3..a5a8a5a 100755
+--- a/test-suite/test-squid-conf.sh
++++ b/test-suite/test-squid-conf.sh
+@@ -111,7 +111,7 @@ then
+     done < $instructionsFile
+ fi
+=20
+-errorLog=3D"squid-stderr.log"
++errorLog=3D"/var/log/squid-stderr.log"
+=20
+ $sbindir/squid -k parse -f $configFile 2> $errorLog
+ result=3D$?
diff --git a/meta-networking/recipes-daemons/squid/files/Fix-flawed-dynam=
ic-ldb-link-test-in-configure.patch b/meta-networking/recipes-daemons/squ=
id/files/Fix-flawed-dynamic-ldb-link-test-in-configure.patch
deleted file mode 100644
index 738e609c0..000000000
--- a/meta-networking/recipes-daemons/squid/files/Fix-flawed-dynamic-ldb-=
link-test-in-configure.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From b73b802282bf95d214c86ba943c5765ba6930bc1 Mon Sep 17 00:00:00 2001
-From: Jim Somerville <Jim.Somerville@windriver.com>
-Date: Mon, 21 Oct 2013 12:50:44 -0400
-Subject: [PATCH] Fix flawed dynamic -ldb link test in configure
-
-The test uses dbopen, but just ignores the fact
-that this function may not exist in the db version
-used.  This leads to the dynamic link test failing
-and the configure script just making assumptions
-about why and setting the need for -ldb incorrectly.
-
-Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
-
----
-Upstream-Status: Pending
-
- configure.ac | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index d2f7feb..c7ae568 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3268,6 +3268,16 @@ case "$host" in
- 		;;
- esac
-=20
-+if test "x$ac_cv_have_decl_dbopen" =3D "xyes"; then
-+  dnl 1.85
-+  SQUID_CHECK_DBOPEN_NEEDS_LIBDB
-+else
-+  # dbopen isn't there. So instead of running a compile/link test that
-+  # uses it and is thus guaranteed to fail, we just assume that we will
-+  # need to link in the db library, rather than fabricate some other
-+  # dynamic compile/link test.
-+  ac_cv_dbopen_libdb=3D"yes"
-+fi
- dnl System-specific library modifications
- dnl
- case "$host" in
diff --git a/meta-networking/recipes-daemons/squid/files/Set-up-for-cross=
-compilation.patch b/meta-networking/recipes-daemons/squid/files/Set-up-f=
or-cross-compilation.patch
index ffb737164..ae8706df7 100644
--- a/meta-networking/recipes-daemons/squid/files/Set-up-for-cross-compil=
ation.patch
+++ b/meta-networking/recipes-daemons/squid/files/Set-up-for-cross-compil=
ation.patch
@@ -1,4 +1,4 @@
-From 995aaf30799fa972441354b6feb45f0621968929 Mon Sep 17 00:00:00 2001
+From c0be3192f608037682464bcb728e97f9d9b543aa Mon Sep 17 00:00:00 2001
 From: Jim Somerville <Jim.Somerville@windriver.com>
 Date: Wed, 16 Oct 2013 16:41:03 -0400
 Subject: [PATCH] Set up for cross compilation
@@ -17,12 +17,12 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+)
=20
 diff --git a/configure.ac b/configure.ac
-index fe80ee0..57cd1ac 100644
+index ca0bc79..c222851 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -27,6 +27,7 @@ m4_include([acinclude/lib-checks.m4])
- m4_include([acinclude/ax_cxx_compile_stdcxx_11.m4])
- m4_include([acinclude/ax_cxx_0x_types.m4])
+@@ -29,6 +29,7 @@ m4_include([acinclude/tdb.m4])
+ m4_include([acinclude/lib-checks.m4])
+ m4_include([acinclude/ax_cxx_compile_stdcxx.m4])
 =20
 +HOSTCXX=3D"$BUILD_CXX"
  PRESET_CFLAGS=3D"$CFLAGS"
diff --git a/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFEL=
SE-tests.patch b/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_=
IFELSE-tests.patch
index 10853333e..5bb30bfcb 100644
--- a/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-test=
s.patch
+++ b/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-test=
s.patch
@@ -1,4 +1,4 @@
-From e4778299a3e49a634d2c7fe4fd9ac77777e829e3 Mon Sep 17 00:00:00 2001
+From 050f8ab275a7a5f3d94045da6b15a2b63dfbeb3f Mon Sep 17 00:00:00 2001
 From: Jim Somerville <Jim.Somerville@windriver.com>
 Date: Tue, 14 Oct 2014 02:56:08 -0400
 Subject: [PATCH] Skip AC_RUN_IFELSE tests
@@ -17,10 +17,10 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.c=
om>
  2 files changed, 15 insertions(+), 3 deletions(-)
=20
 diff --git a/acinclude/krb5.m4 b/acinclude/krb5.m4
-index ad0ba60..4477446 100644
+index 2c4e340..64648e3 100644
 --- a/acinclude/krb5.m4
 +++ b/acinclude/krb5.m4
-@@ -61,7 +61,15 @@ main(void)
+@@ -57,7 +57,15 @@ main(void)
 =20
          return 0;
  }
@@ -35,13 +35,13 @@ index ad0ba60..4477446 100644
 +     dnl Can't test in cross compiled env - so assume good
 +     squid_cv_broken_heimdal_krb5_h=3Dno
      ])
+     SQUID_STATE_ROLLBACK(squid_krb5_heimdal_test)
    ])
- ]) dnl SQUID_CHECK_KRB5_HEIMDAL_BROKEN_KRB5_H
 diff --git a/acinclude/lib-checks.m4 b/acinclude/lib-checks.m4
-index 1e9333527c..2d42787029 100644
+index 53847a8..850322a 100644
 --- a/acinclude/lib-checks.m4
 +++ b/acinclude/lib-checks.m4
-@@ -227,7 +227,9 @@ AC_DEFUN([SQUID_CHECK_OPENSSL_CONST_SSL_METHOD],[
+@@ -205,7 +205,9 @@ AC_DEFUN([SQUID_CHECK_OPENSSL_CONST_SSL_METHOD],[
    [
     AC_MSG_RESULT([no])
    ],
@@ -52,15 +52,14 @@ index 1e9333527c..2d42787029 100644
 =20
  SQUID_STATE_ROLLBACK(check_const_SSL_METHOD)
  ])
-@@ -386,8 +386,9 @@ AC_DEFUN([SQUID_CHECK_OPENSSL_TXTDB],[
-   [
-    AC_MSG_RESULT([yes])
-    AC_DEFINE(SQUID_USE_SSLLHASH_HACK, 1)
--  ],
--[])
+@@ -347,7 +349,9 @@ AC_DEFUN([SQUID_CHECK_OPENSSL_TXTDB],[
+   ],[
+     AC_MSG_RESULT([yes])
+     AC_DEFINE(SQUID_USE_SSLLHASH_HACK, 1)
+-  ],[])
 +  ],[
 +    AC_MSG_RESULT([skipped - can't test in cross-compiled env])
 +  ])
 =20
- SQUID_STATE_ROLLBACK(check_TXTDB)
+   SQUID_STATE_ROLLBACK(check_TXTDB)
  ])
diff --git a/meta-networking/recipes-daemons/squid/files/run-ptest b/meta=
-networking/recipes-daemons/squid/files/run-ptest
index de79a293c..8f8e28f92 100644
--- a/meta-networking/recipes-daemons/squid/files/run-ptest
+++ b/meta-networking/recipes-daemons/squid/files/run-ptest
@@ -1,3 +1,4 @@
 #!/bin/sh
 #
+make -C test-suite -k squid-conf-tests
 make -C test-suite -k runtest-TESTS
diff --git a/meta-networking/recipes-daemons/squid/files/set_sysroot_patc=
h.patch b/meta-networking/recipes-daemons/squid/files/set_sysroot_patch.p=
atch
deleted file mode 100644
index 124e04490..000000000
--- a/meta-networking/recipes-daemons/squid/files/set_sysroot_patch.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 702bd881b66dc034e711c0ff47805f2da40b6e0d Mon Sep 17 00:00:00 2001
-From: Yue Tao <yue.tao@windriver.com>
-Date: Mon, 8 Aug 2016 16:04:33 +0800
-Subject: [PATCH] Set the SYSROOT for libxml2 header file to avoid host
- contamination.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Yue Tao <yue.tao@windriver.com>
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
-
----
- configure.ac | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 504a844..ff4688c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -931,15 +931,15 @@ if test "x$squid_opt_use_esi" =3D "xyes" -a "x$wit=
h_libxml2" !=3D "xno" ; then
-     dnl Find the main header and include path...
-     AC_CACHE_CHECK([location of libxml2 include files], [ac_cv_libxml2_=
include], [
-       AC_CHECK_HEADERS([libxml/parser.h], [], [
--        AC_MSG_NOTICE([Testing in /usr/include/libxml2])
-+        AC_MSG_NOTICE([Testing in $SYSROOT/usr/include/libxml2])
-         SAVED_CPPFLAGS=3D"$CPPFLAGS"
--        CPPFLAGS=3D"-I/usr/include/libxml2 $CPPFLAGS"
-+        CPPFLAGS=3D"-I$SYSROOT/usr/include/libxml2 $CPPFLAGS"
-         unset ac_cv_header_libxml_parser_h
--        AC_CHECK_HEADERS([libxml/parser.h], [LIBXML2_CFLAGS=3D"$LIBXML2=
_CFLAGS -I/usr/include/libxml2"], [
--          AC_MSG_NOTICE([Testing in /usr/local/include/libxml2])
--          CPPFLAGS=3D"-I/usr/local/include/libxml2 $SAVED_CPPFLAGS"
-+        AC_CHECK_HEADERS([libxml/parser.h], [LIBXML2_CFLAGS=3D"$LIBXML2=
_CFLAGS -I$SYSROOT/usr/include/libxml2"], [
-+          AC_MSG_NOTICE([Testing in $SYSROOT/usr/local/include/libxml2]=
)
-+          CPPFLAGS=3D"-I$SYSROOT/usr/local/include/libxml2 $SAVED_CPPFL=
AGS"
-           unset ac_cv_header_libxml_parser_h
--          AC_CHECK_HEADERS([libxml/parser.h], [LIBXML2_CFLAGS=3D"$LIBXM=
L2_CFLAGS -I/usr/local/include/libxml2"], [
-+          AC_CHECK_HEADERS([libxml/parser.h], [LIBXML2_CFLAGS=3D"$LIBXM=
L2_CFLAGS -I$SYSROOT/usr/local/include/libxml2"], [
-             AC_MSG_NOTICE([Failed to find libxml2 header file libxml/pa=
rser.h])
-           ])
-         ])
diff --git a/meta-networking/recipes-daemons/squid/files/squid-don-t-do-s=
quid-conf-tests-at-build-time.patch b/meta-networking/recipes-daemons/squ=
id/files/squid-don-t-do-squid-conf-tests-at-build-time.patch
deleted file mode 100644
index ea27285e0..000000000
--- a/meta-networking/recipes-daemons/squid/files/squid-don-t-do-squid-co=
nf-tests-at-build-time.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 8786b91488dae3f6dfeadd686e80d2ffc5c29320 Mon Sep 17 00:00:00 2001
-From: Jackie Huang <jackie.huang@windriver.com>
-Date: Thu, 25 Aug 2016 15:22:57 +0800
-Subject: [PATCH] squid: don't do squid-conf-tests at build time
-
-* squid-conf-tests is a test to run "squid -k parse -f"
-  to perse the config files, which should not be run
-  at build time since we are cross compiling, so remove
-  it but it will be added back for the runtime ptest.
-
-* Fix the directories of the conf files for squid-conf-tests
-  so that it can run on the target board.
-
-Upstream-Status: Inappropriate [cross compile specific]
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
-
----
- test-suite/Makefile.am | 15 +++++++--------
- 1 file changed, 7 insertions(+), 8 deletions(-)
-
-diff --git a/test-suite/Makefile.am b/test-suite/Makefile.am
-index 0233c0e..e0021b6 100644
---- a/test-suite/Makefile.am
-+++ b/test-suite/Makefile.am
-@@ -40,8 +40,7 @@ TESTS +=3D debug \
- 	splay\
- 	mem_node_test\
- 	mem_hdr_test\
--	$(ESI_TESTS) \
--	squid-conf-tests
-+	$(ESI_TESTS)
-=20
- ## Sort by alpha - any build failures are significant.
- check_PROGRAMS +=3D debug \
-@@ -159,19 +158,19 @@ VirtualDeleteOperator_SOURCES =3D \
- ##$(TARGLIB): $(LIBOBJS)
- ##	$(AR_R) $(TARGLIB) $(LIBOBJS)
-=20
--squid-conf-tests: $(top_builddir)/src/squid.conf.default $(srcdir)/squi=
dconf/*
-+squid-conf-tests: $(sysconfdir)/squid.conf.default squidconf/*
- 	@failed=3D0; cfglist=3D"$?"; rm -f $@ || $(TRUE); \
- 	for cfg in $$cfglist ; do \
--		$(top_builddir)/src/squid -k parse -f $$cfg || \
-+		squid -k parse -f $$cfg || \
- 			{ echo "FAIL: squid.conf test: $$cfg" | \
--				sed s%$(top_builddir)/src/%% | \
--				sed s%$(srcdir)/squidconf/%% ; \
-+				sed s%$(sysconfdir)/%% | \
-+				sed s%squidconf/%% ; \
- 				failed=3D1; break; \
- 			}; \
- 		if test "$$failed" -eq 0; then \
- 			echo "PASS: squid.conf test: $$cfg" | \
--				sed s%$(top_builddir)/src/%% | \
--				sed s%$(srcdir)/squidconf/%% ; \
-+				sed s%$(sysconfdir)/%% | \
-+				sed s%squidconf/%% ; \
- 		else break; fi; \
- 	done; \
- 	if test "$$failed" -eq 0; then cp $(TRUE) $@ ; fi
diff --git a/meta-networking/recipes-daemons/squid/squid_5.7.bb b/meta-ne=
tworking/recipes-daemons/squid/squid_6.5.bb
similarity index 81%
rename from meta-networking/recipes-daemons/squid/squid_5.7.bb
rename to meta-networking/recipes-daemons/squid/squid_6.5.bb
index 2a5de1872..3795da7f5 100644
--- a/meta-networking/recipes-daemons/squid/squid_5.7.bb
+++ b/meta-networking/recipes-daemons/squid/squid_6.5.bb
@@ -15,21 +15,19 @@ MIN_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI =3D "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV=
}.tar.bz2 \
            file://Set-up-for-cross-compilation.patch \
            file://Skip-AC_RUN_IFELSE-tests.patch \
-           file://Fix-flawed-dynamic-ldb-link-test-in-configure.patch \
            file://squid-use-serial-tests-config-needed-by-ptest.patch \
            file://run-ptest \
            file://volatiles.03_squid \
-           file://set_sysroot_patch.patch \
-           file://squid-don-t-do-squid-conf-tests-at-build-time.patch \
            file://0001-configure-Check-for-Wno-error-format-truncation-c=
omp.patch \
+           file://0002-squid-make-squid-conf-tests-run-on-target-device.=
patch \
            "
=20
 SRC_URI:remove:toolchain-clang =3D "file://0001-configure-Check-for-Wno-=
error-format-truncation-comp.patch"
=20
-SRC_URI[sha256sum] =3D "4c17e1eb324c4b7aa3c6889eba66eeca7ed98625d44076f7=
db7b027b2b093bd5"
+SRC_URI[sha256sum] =3D "99acd54ec9d68b2a9080d19fcc43eca1a245146cf162dbba=
689510d01e6d0f25"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263 \
-                    file://errors/COPYRIGHT;md5=3D0a7deb73d8fb7a9849af71=
45987829a4 \
+                    file://errors/COPYRIGHT;md5=3Dd324bc1f9447d1d1588d75=
b22a678dc4 \
                     "
 DEPENDS =3D "libtool krb5 openldap db cyrus-sasl"
=20
@@ -81,23 +79,17 @@ do_install_ptest() {
     cp -rf ${B}/${TESTDIR} ${D}${PTEST_PATH}
     cp -rf ${S}/${TESTDIR} ${D}${PTEST_PATH}
=20
-    # Needed to generate file squid.conf.default
-    oe_runmake DESTDIR=3D${D}${PTEST_PATH} -C src install-data-local
-    install -d ${D}${sysconfdir}/squid
-    install -m 0644 ${D}${PTEST_PATH}/${sysconfdir}/squid/squid.conf.def=
ault ${D}${sysconfdir}/squid
+    # Install default config
+    install -d ${D}${PTEST_PATH}/src
+    install -m 0644 ${B}/src/squid.conf.default ${D}${PTEST_PATH}/src
=20
-    # Don't need these directories
-    rm -rf ${D}${PTEST_PATH}/${sysconfdir}
-    rm -rf ${D}${PTEST_PATH}/usr
-    rm -rf ${D}${PTEST_PATH}/var
+    # autoconf.h is needed during squid-conf-tests
+    install -d ${D}${PTEST_PATH}/include
+    install -m 0644 ${B}/include/autoconf.h ${D}${PTEST_PATH}/include
=20
     # do NOT need to rebuild Makefile itself
     sed -i 's/^Makefile:.*$/Makefile:/' ${D}${PTEST_PATH}/${TESTDIR}/Mak=
efile
=20
-    # Add squid-conf-tests for runtime tests
-    sed -e 's/^\(runtest-TESTS:\)/\1 squid-conf-tests/' \
-        -i ${D}${PTEST_PATH}/${TESTDIR}/Makefile
-
     # Ensure the path for command true is correct
     sed -i 's:^TRUE =3D .*$:TRUE =3D /bin/true:' ${D}${PTEST_PATH}/${TES=
TDIR}/Makefile
 }
@@ -122,7 +114,6 @@ do_install:append() {
 FILES:${PN} +=3D "${libdir} ${datadir}/errors ${datadir}/icons"
 FILES:${PN}-dbg +=3D "/usr/src/debug"
 FILES:${PN}-doc +=3D "${datadir}/*.txt"
-FILES:${PN}-ptest +=3D "${sysconfdir}/squid/squid.conf.default"
=20
 RDEPENDS:${PN} +=3D "perl"
 RDEPENDS:${PN}-ptest +=3D "perl make"
--=20
2.43.0


