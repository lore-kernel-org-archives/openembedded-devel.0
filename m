Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E83FC433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:09:21 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.19974.1646057360024680252
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:09:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=nfLh/e9r;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646057358; i=@fujitsu.com;
	bh=dE5UQkZWDj86Weuz7FOAdunLjJwOs0uHYzVIWTXmtc8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=nfLh/e9rNM+QoGoTxMzNikkDAKwiQvhE1HFw0ebRO0Ul1SjYcT7xFcUTZlad1oLVU
	 A9I3+R55jE6HtEY1lPn/QB3gfO8GyaAJhgWRtygc/EUPtHupWB3Zp8p7l4aJaqZBtg
	 R+3TKllUug7QhsktZ6rrvFEoXAp7E6RxL9lJNLr9vEYwtjFWGcAfpIw2U/135ap28K
	 IpfQEUbqCFi9CWfOG+Lh2rYXiGI4kHMwlXS1QfhCp7Hllezx7NK1lSxs1NRrtoyoT5
	 sbxwkugrGjhTxIW/Rbgebo2Ysi9vsjoAewb842hAZugOxaepBUUBVTPafclU2Wc8Nn
	 ty/RaM4slqW8w==
Received: from [100.115.35.140] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-2.aws.ess.symcld.net id 15/CD-14616-E87DC126;
 Mon, 28 Feb 2022 14:09:18 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8MxRbf3uky
  SwcRdxhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bXNS2sBRdqKvZN6GBtYNyY3cXIxSEkMJNJ
  4unew8wQzglGidWrfzJ2MXJysAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3DzuILSzgIzFh/
  g0wm0VAVeL5nYlMIDavgJPExHmf2EBsCQEFiSkP3zNDxAUlTs58wgIxR1Wi+8hTJghbXqJ562
  xmiHpFidmXm1kg7AqJWbPamCYw8s1C0j4LSfssJO0LGJlXMVonFWWmZ5TkJmbm6BoaGOgaGpr
  qGlvqGhka6yVW6SbqpZbqlqcWl+ga6SWWF+ulFhfrFVfmJuek6OWllmxiBIZlSrH61R2Mm1f9
  1DvEKMnBpCTKy9klmSTEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgrfzmEySkGBRanpqRVpmDjBGY
  NISHDxKIrxPLwOleYsLEnOLM9MhUqcYLTl+7ty/l5lj55bLQPLqlSt7mYVY8vLzUqXEeVOuAT
  UIgDRklObBjYPF8SVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrz/QKbwZOaVwG19BXQQE9B
  Bf4OlQA4qSURISTUw2Rh9vGsfJZO+Yb/+0yU+eeKBNk2PBM/dnNay85qt2YPXaUWLsh568d6J
  EZL/GOoUnqoVzLyj8e/7II2woK5y6fcJ59kZJ6W1z+KwbN12iL/+ue55l4cKdr3VT375L/I8s
  KespKP+l0plebvKLHPJOvWpqWyBHMcv/07lFXYTWW3JZvDw0n3+IrnszH87D4Vo31ol/oph4e
  qFDsyXfVJyj0x4oP36y+OyuW2r8s4p94e93/BE64Hgid7vNdH/d/92e2AVFL7grOb3ScJlnCb
  9HydblyubyK3WXXw4zfT9Rv+TzNlNDzi+fZvTfd9lg/+yz2lruu8F+smsC9Lc4CaeMOeZ5/qp
  bBN4Xn++0uunxFKckWioxVxUnAgAZM6odl4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-571.messagelabs.com!1646057357!25705!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21717 invoked from network); 28 Feb 2022 14:09:17 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-5.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Feb 2022 14:09:17 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 21SE9Hcq000709
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:09:17 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 28 Feb 2022 14:09:15 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] cyrus-sasl: upgrade 2.1.27 -> 2.1.28
Date: Mon, 28 Feb 2022 22:09:06 +0800
Message-ID: <1646057348-36134-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 14:09:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95571

0001-Allow-saslauthd-to-be-built-outside-of-source-tree-w.patch
0001-makeinit.sh-fix-parallel-build-issue.patch
0004-configure.ac-fix-condition-for-suppliment-snprintf-i.patch
deleted since they're included in 2.1.28

CVE-2019-19906.patch
avoid-to-call-AC_TRY_RUN.patch
refreshed for new version

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D
build:
------
configure - Restore LIBS after checking gss_inquire_sec_context_by_oid
makemd5.c - Fix potential out of bound writes
fix build with =E2=80=93disable-shared =E2=80=93enable-static
Dozens of fixes for Windows specific builds
Fix cross platform builds with SPNEGO
Do not try to build broken java subtree
Fix build error with =E2=80=93enable-auth-sasldb

common:
-------
plugin_common.c:
Ensure size is always checked if called repeatedly (#617)

documentation:
--------------
Fixed generation of saslauthd(8) man page
Fixed installation of saslauthd(8) and testsaslauthd(8) man pages (#373)
Updates for additional SCRAM mechanisms
Fix sasl_decode64 and sasl_encode64 man pages
Tons of fixes for Sphinx

include:
--------
sasl.h:
Allow up to 16 bits for security flags

lib:
----
checkpw.c:
Skip one call to strcat
Disable auxprop-hashed (#374)
client.c:
Use proper length for fully qualified domain names
common.c:
CVE-2019-19906 Fix off by one error (#587)
external.c:
fix EXTERNAL with non-terminated input (#689)
saslutil.c:
fix index_64 to be a signed char (#619)

plugins:
--------
gssapi.c:
Emit debug log only in case of errors
ntlm.c:
Fail compile if MD4 is not available (#632)
sql.c:
Finish reading residual return data (#639)
CVE-2022-24407 Escape password for SQL insert/update commands.

sasldb:
-------
db_gdbm.c:
fix gdbm_errno overlay from gdbm_close

DIGEST-MD5 plugin:
------------------
Prevent double free of RC4 context
Use OpenSSL RC4 implementation if available

SCRAM plugin:
------------
Return BADAUTH on incorrect password (#545)
Add -224, -384, -512 (#552)
Remove SCRAM_HASH_SIZE
Add function to return SCRAM auth method name
Allocate enough memory in scam_setpass()
Add function to sort SCRAM methods by hash strength
Update windows build for newer SCRAM options

saslauthd:
---------
auth_httpform.c:
Avoid signed overflow with non-ascii characters (#576)
auth_krb5.c:
support setting an explicit auth_krb5 server name
support setting an explicit servername with Heimdal
unify the MIT and Heimdal auth_krb5 implementations
Remove call to krbtf
auth_rimap.c:
provide native memmem implementation if missing
lak.c:
Allow LDAP_OPT_X_TLS_REQUIRE_CERT to be 0 (no certificate verification)
lak.h:
Increase supported DN length to 4096 (#626)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...to-be-built-outside-of-source-tree-w.patch | 41 --------
 ...makeinit.sh-fix-parallel-build-issue.patch | 95 -------------------
 ...-condition-for-suppliment-snprintf-i.patch | 28 ------
 .../cyrus-sasl/CVE-2019-19906.patch           |  6 +-
 .../cyrus-sasl/avoid-to-call-AC_TRY_RUN.patch | 53 ++++++-----
 ...us-sasl_2.1.27.bb =3D> cyrus-sasl_2.1.28.bb} |  8 +-
 6 files changed, 32 insertions(+), 199 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/0001-Allow-saslauthd-to-be-built-outside-of-source-tree-w.patch
 delete mode 100644 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/0001-makeinit.sh-fix-parallel-build-issue.patch
 delete mode 100644 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/0004-configure.ac-fix-condition-for-suppliment-snprintf-i.patch
 rename meta-networking/recipes-daemons/cyrus-sasl/{cyrus-sasl_2.1.27.bb =3D> cyrus-sasl_2.1.28.bb} (91%)

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/0001-Allow-saslauthd-to-be-built-outside-of-source-tree-w.patch b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/0001-Allow-saslauthd-to-be-built-outside-of-source-tree-w.patch
deleted file mode 100644
index c89822c36b..0000000000
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/0001-Allow-saslauthd-to-be-built-outside-of-source-tree-w.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 6515f3e7656d97d40a6a1cf4eb3ada193a698309 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 12 Sep 2018 23:18:12 +0800
-Subject: [PATCH] Allow saslauthd to be built outside of source tree while
- configuring with `--enable-ldapdb'
-
-[snip]
-| powerpc-wrs-linux-gcc [snip] -I../common
-|../../git/saslauthd/lak.c:58:10: fatal error: crypto-compat.h:
-No such file or directory
-[snip]
-
-The crypto-compat.h locates in git/common/, it should be                                                                                                                           |
-`-I../../git/common'
-
-Remove useless `-I$(top_srcdir)/../include' which was incorrectly
-added by commit `faae590 cleanup misc INCLUDES for different build paths'
-
-Upstream-Status: Submitted [https://github.com/cyrusimap/cyrus-sasl]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- saslauthd/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/saslauthd/Makefile.am b/saslauthd/Makefile.am
-index d7244be..864b29b 100644
---- a/saslauthd/Makefile.am
-+++ b/saslauthd/Makefile.am
-@@ -34,7 +34,7 @@ saslcache_SOURCES =3D saslcache.c
- 
- EXTRA_DIST	=3D saslauthd.8 saslauthd.mdoc include \
- 		  getnameinfo.c getaddrinfo.c LDAP_SASLAUTHD
--AM_CPPFLAGS	=3D -I$(top_srcdir)/include -I$(top_builddir)/include -I$(top_srcdir)/../include -I$(top_builddir)/common
-+AM_CPPFLAGS	=3D -I$(top_srcdir)/include -I$(top_builddir)/include -I$(top_builddir)/common -I$(top_srcdir)/common
- DEFS            =3D @DEFS@ -DSASLAUTHD_CONF_FILE_DEFAULT=3D\"@sysconfdir@/saslauthd.conf\" -I. -I$(srcdir) -I..
- 
- 
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/0001-makeinit.sh-fix-parallel-build-issue.patch b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/0001-makeinit.sh-fix-parallel-build-issue.patch
deleted file mode 100644
index bf232ac272..0000000000
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/0001-makeinit.sh-fix-parallel-build-issue.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From bb693db0e1d1d693e8ca31fcbc4f46d1674eeca1 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 13 Sep 2018 14:20:57 +0800
-Subject: [PATCH] makeinit.sh: fix parallel build issue
-
-While building plugins, each <plugin>.c requires a <plugin>_init.c,
-and the <plugin>_init.c is dynamically generated by makeinit.sh.
-
-But the makeinit.sh generates all *_init.c (13 mechanism plugins,
-3 auxprop plugins) at one time, if there are multiple plugins,
-there will be multiple makeinit.sh invoking.
-
-It caused a parallel issue, the *_init.c files will be generated
-repeatedly.
-
-It occasionally generate dapdb_init.c incorrectly
-[snip plugins/ldapdb_init.c]
-SASL_CANONUSER_PLUG_INIT( ldapdb )
-SASL_CANONUSER_PLUG_INIT( ldapdb )
-SASL_CANONUSER_PLUG_INIT( ldapdb )
-[snip plugins/ldapdb_init.c]
-
-Let makeinit.sh generate the expected <plugin>_init.c which
-is exactly required by <plugin>.c.
-
-Upstream-Status: Submitted [https://github.com/cyrusimap/cyrus-sasl/pull/532]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- plugins/Makefile.am |  2 +-
- plugins/makeinit.sh | 19 ++++++++++++++-----
- 2 files changed, 15 insertions(+), 6 deletions(-)
-
-diff --git a/plugins/Makefile.am b/plugins/Makefile.am
-index 929f6a4..81e7f0b 100644
---- a/plugins/Makefile.am
-+++ b/plugins/Makefile.am
-@@ -149,4 +149,4 @@ passdss_init.c sasldb_init.c sql_init.c ldapdb_init.c
- CLEANFILES=3D$(init_src)
- 
- ${init_src}: $(srcdir)/makeinit.sh
--	$(SHELL) $(srcdir)/makeinit.sh
-+	$(SHELL) $(srcdir)/makeinit.sh $@
-diff --git a/plugins/makeinit.sh b/plugins/makeinit.sh
-index cc65f7d..3131877 100644
---- a/plugins/makeinit.sh
-+++ b/plugins/makeinit.sh
-@@ -1,7 +1,9 @@
-+plugin_init=3D"$1"
- # mechanism plugins
- for mech in anonymous crammd5 digestmd5 scram gssapiv2 kerberos4 login ntlm otp passdss plain srp gs2; do
-+    if [ ${plugin_init} =3D "${mech}_init.c" ];then
- 
--echo "
-+        echo "
- #include <config.h>
- 
- #include <string.h>
-@@ -43,13 +45,16 @@ BOOL APIENTRY DllMain( HANDLE hModule,
- 
- SASL_CLIENT_PLUG_INIT( $mech )
- SASL_SERVER_PLUG_INIT( $mech )
--" > ${mech}_init.c
-+"       > ${mech}_init.c
-+        echo "generating $1"
-+    fi # End of `if [ ${plugin_init} =3D "${mech}_init.c" ];then'
- done
- 
- # auxprop plugins
- for auxprop in sasldb sql ldapdb; do
-+    if [ ${plugin_init} =3D "${auxprop}_init.c" ];then
- 
--echo "
-+        echo "
- #include <config.h>
- 
- #include <string.h>
-@@ -86,8 +91,12 @@ BOOL APIENTRY DllMain( HANDLE hModule,
- #endif
- 
- SASL_AUXPROP_PLUG_INIT( $auxprop )
--" > ${auxprop}_init.c
-+"       > ${auxprop}_init.c
-+        echo "generating $1"
-+    fi # End of `if [ ${plugin_init} =3D "${auxprop}_init.c" ];then'
- done
- 
- # ldapdb is also a canon_user plugin
--echo "SASL_CANONUSER_PLUG_INIT( ldapdb )" >> ldapdb_init.c
-+if [ ${plugin_init} =3D "ldapdb_init.c" ];then
-+    echo "SASL_CANONUSER_PLUG_INIT( ldapdb )" >> ldapdb_init.c
-+fi
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/0004-configure.ac-fix-condition-for-suppliment-snprintf-i.patch b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/0004-configure.ac-fix-condition-for-suppliment-snprintf-i.patch
deleted file mode 100644
index 68d09c385b..0000000000
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/0004-configure.ac-fix-condition-for-suppliment-snprintf-i.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 98082f81da1b49876081ff1ab340e952755f985a Mon Sep 17 00:00:00 2001
-From: OBATA Akio <obache@users.noreply.github.com>
-Date: Fri, 11 May 2018 18:36:26 +0900
-Subject: [PATCH] configure.ac: fix condition for suppliment snprintf
- implementation
-
-$sasl_cv_snprintf means requremnt of suppliment snprintf
-implementation, not existence of system snprintf implementation,
-
-Upstream-Status: Submitted [https://github.com/cyrusimap/cyrus-sasl/pull/512]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index ac59f14..9804e98 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1264,7 +1264,7 @@ SNPRINTFOBJS=3D""
- LTSNPRINTFOBJS=3D""
- AC_CHECK_FUNC(snprintf, [AC_DEFINE(HAVE_SNPRINTF,[],[Does the system have snprintf()=3F])], [sasl_cv_snprintf=3Dyes])
- AC_CHECK_FUNC(vsnprintf, [AC_DEFINE(HAVE_VSNPRINTF,[],[Does the system have vsnprintf()=3F])], [sasl_cv_snprintf=3Dyes])
--if test $sasl_cv_snprintf =3D no; then
-+if test $sasl_cv_snprintf =3D yes; then
-        AC_LIBOBJ(snprintf)
-        SNPRINTFOBJS=3D"snprintf.o"
-        LTSNPRINTFOBJS=3D"snprintf.lo"
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/CVE-2019-19906.patch b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/CVE-2019-19906.patch
index b94780f302..33a9e3f6e6 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/CVE-2019-19906.patch
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/CVE-2019-19906.patch
@@ -18,7 +18,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/lib/common.c b/lib/common.c
-index 305311d..445c5d5 100644
+index d9104c8..fef82db 100644
 --- a/lib/common.c
 +++ b/lib/common.c
 @@ -190,7 +190,7 @@ int _sasl_add_string(char **out, size_t *alloclen,
@@ -27,9 +27,9 @@ index 305311d..445c5d5 100644
  
 -  addlen=3Dstrlen(add); /* only compute once */
 +  addlen=3Dstrlen(add)+1; /* only compute once */
-   if (_buf_alloc(out, alloclen, (*outlen)+addlen)!=3DSASL_OK)
+   if (_buf_alloc(out, alloclen, (*outlen)+addlen+1)!=3DSASL_OK)
      return SASL_NOMEM;
  
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/avoid-to-call-AC_TRY_RUN.patch b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/avoid-to-call-AC_TRY_RUN.patch
index aa271b8fb0..1e6f99603c 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/avoid-to-call-AC_TRY_RUN.patch
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/avoid-to-call-AC_TRY_RUN.patch
@@ -9,41 +9,42 @@ Avoid to call AC_TRY_RUN to check if GSSAPI libraries support SPNEGO
 on cross-compile environment by definition AC_ARG_ENABLE enable-spnego
 
 Signed-off-by: Roy.Li <rongqing.li@windriver.com>
-
 ---
- m4/sasl2.m4 | 15 +++++++++++++--
- 1 file changed, 13 insertions(+), 2 deletions(-)
+ m4/sasl2.m4 | 14 +++++++++++++-
+ 1 file changed, 13 insertions(+), 1 deletion(-)
 
 diff --git a/m4/sasl2.m4 b/m4/sasl2.m4
-index 56e0504..cf62607 100644
+index 80371ef..ff70083 100644
 --- a/m4/sasl2.m4
 +++ b/m4/sasl2.m4
-@@ -314,7 +314,18 @@ if test "$gssapi" !=3D no; then
-   cmu_save_LIBS=3D"$LIBS"
-   LIBS=3D"$LIBS $GSSAPIBASE_LIBS"
- 
--  AC_MSG_CHECKING([for SPNEGO support in GSSAPI libraries])
-+  AC_ARG_ENABLE([spnego],
-+              [AC_HELP_STRING([--enable-spnego=3D<DIR>],
-+                              [enable SPNEGO support in GSSAPI libraries [no]])],
-+              [spnego=3D$enableval],
-+              [spnego=3Dno])
-+
-+  if test "$spnego" =3D no; then
-+       echo "no"
-+  elif test "$spnego" =3D yes; then
-+       AC_DEFINE(HAVE_GSS_SPNEGO,,[Define if your GSSAPI implementation supports SPNEGO])
-+  else
-+       AC_MSG_CHECKING([for SPNEGO support in GSSAPI libraries])
-   AC_TRY_RUN([
+@@ -316,6 +316,18 @@ if test "$gssapi" !=3D no; then
+   AC_CACHE_CHECK([for SPNEGO support in GSSAPI libraries],[ac_cv_gssapi_supports_spnego],[
+     cmu_save_LIBS=3D"$LIBS"
+     LIBS=3D"$LIBS $GSSAPIBASE_LIBS"
++    AC_ARG_ENABLE([spnego],
++                [AC_HELP_STRING([--enable-spnego=3D<DIR>],
++                                [enable SPNEGO support in GSSAPI libraries [no]])],
++                [spnego=3D$enableval],
++                [spnego=3Dno])
++  
++    if test "$spnego" =3D no; then
++         echo "no"
++    elif test "$spnego" =3D yes; then
++         AC_DEFINE(HAVE_GSS_SPNEGO,,[Define if your GSSAPI implementation supports SPNEGO])
++    else
++         AC_MSG_CHECKING([for SPNEGO support in GSSAPI libraries])
+     AC_TRY_RUN([
  #ifdef HAVE_GSSAPI_H
  #include <gssapi.h>
-@@ -341,7 +352,7 @@ int main(void)
- 	AC_MSG_RESULT(yes) ],
- 	AC_MSG_RESULT(no))
-   LIBS=3D"$cmu_save_LIBS"
+@@ -343,7 +355,7 @@ int main(void)
+   AS_IF([test "$ac_cv_gssapi_supports_spnego" =3D yes],[
+     AC_DEFINE(HAVE_GSS_SPNEGO,,[Define if your GSSAPI implementation supports SPNEGO])
+   ])
 -
 +   fi
  else
    AC_MSG_RESULT([disabled])
  fi
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.28.bb
similarity index 91%
rename from meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
rename to meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.28.bb
index 43b69f7a21..95a093cd11 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.28.bb
@@ -5,17 +5,13 @@ DEPENDS =3D "openssl db groff-native"
 LICENSE =3D "BSD-4-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3f55e0974e3d6db00ca6f57f2d206396"
 
-SRCREV =3D "e41cfb986c1b1935770de554872247453fdbb079"
+SRCREV =3D "7a6b45b177070198fed0682bea5fa87c18abb084"
 
-SRC_URI =3D "git://github.com/cyrusimap/cyrus-sasl;protocol=3Dhttps;branch=3Dmaster \
+SRC_URI =3D "git://github.com/cyrusimap/cyrus-sasl;protocol=3Dhttps;branch=3Dcyrus-sasl-2.1 \
            file://avoid-to-call-AC_TRY_RUN.patch \
-           file://Fix-hardcoded-libdir.patch \
            file://debian_patches_0014_avoid_pic_overwrite.diff \
            file://saslauthd.service \
            file://saslauthd.conf \
-           file://0004-configure.ac-fix-condition-for-suppliment-snprintf-i.patch \
-           file://0001-Allow-saslauthd-to-be-built-outside-of-source-tree-w.patch \
-           file://0001-makeinit.sh-fix-parallel-build-issue.patch \
            file://CVE-2019-19906.patch \
            "
 
-- 
2.25.1


