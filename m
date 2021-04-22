Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web09.8390.1619071032921848858
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Apr 2021 22:57:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wJQw5NjA;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619071021; i=@fujitsu.com;
	bh=S5FLIl1kckV0ctCaY9hppFeH73asPkXfDcd60AtitPs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=wJQw5NjAdwtMm5u/G9LCKxpaU/DW/tpB9DGfBpzw13VfvADAoTvJ20LX6bZB/lgJ3
	 Vo9TsHanCSyCLUYZa3HTCsTXJP4IRYM/EghdCZ3Gdla695pWVZwYO5hzGyIagFOg2y
	 /7LIVsA6y4eFzcH3Ngg43NPJqtEpV0y8r0HgFfZf94UNLyozpCx85afXtTzlfSMWNA
	 C0Y5cqs+EXP8+HudIwOuQEX+GQU98e3XeC6K9Z6fXv19M96eESCqy/JH3N/Z9OdFt0
	 WYqnVE4p0mNwomfJRz+0GcI7YC8kbC+tQC9SQhYsDZEBSbRE8rt5k6hVsYDKYocKCc
	 eXayzZwzHzB1g==
Received: from [100.112.196.73] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-west-1.aws.symcld.net id 02/21-46412-D2011806; Thu, 22 Apr 2021 05:57:01 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8MxRVdHoDH
  B4OIHa4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP04/eMBY/lKh792czYwDhfuouRi0NIYDaT
  xIuNS9kgnOOMEr0tvcxdjJwcbAI6Eh0vullAbBEBfYmls/cAxTk4hAWCJRYezQcJswioSryaO
  5EVxOYVcJOYe+IYE4gtIaAgMeXhe2aIuKDEyZlPwMYwC0hIHHzxghmiRlFi+84zLBB2pcT2aW
  cZJzDyzELSMgtJywJGplWM5klFmekZJbmJmTm6hgYGuoaGRrqGlma6ZiZ6iVW6SXqppbrlqcU
  luoZ6ieXFesWVuck5KXp5qSWbGIFBlFJwxGEH4/3XH/QOMUpyMCmJ8i7ka0wQ4kvKT6nMSCzO
  iC8qzUktPsQow8GhJMF7BCQnWJSanlqRlpkDDGiYtAQHj5II729eoDRvcUFibnFmOkTqFGMsx
  7O1SxYxc7wBkxvmLQWS/+/eBZJt90Bk/4KDq5k5ZoLJm+2HgOR9ECnEkpeflyolzrsTZKcAyN
  CM0jy4lbDovcQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmPcsyBSezLwSuMteAR3NBHS09pR
  akKNLEhFSUg1Ma79ctOraGvqeY906wct2x7el6xUKWwem8EQsqNr2NePhfl+FY8orF15wXXfh
  vfTmpQvfnvNgm5EZqn7g8aMXrQayPF4n26syNrLOyZYt0nj5om+uj76zQ0DkiT+XT1x22sNQ7
  JF/9KCT+8wJ865O1Lo6y2p1kkf38Y2TDjDwmUeuUTB5biC9lW+bT6jQn1sr8rOELumxN97fda
  h2bUTygWtOT+ezc6RtvZ+TxL11gshVc7P48/qR5/rbXBa9mKWRsEejOzhIWMJCxeDL6qxjn76
  rJN8xr9ldHd/343D09AOfa8pP2N1NLvuzqCuVmdH502ebRb275Vzlu2+uKdBp6xHLS/98z+7P
  F9kENtUMJZbijERDLeai4kQAKI73blkDAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-18.tower-291.messagelabs.com!1619071020!1575002!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21882 invoked from network); 22 Apr 2021 05:57:00 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-18.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Apr 2021 05:57:00 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13M5v0vA015718
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Apr 2021 06:57:00 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 22 Apr 2021 06:56:59 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] [oe] [meta-networking] [PATCH] tinyproxy: upgrade 1.10.0 -> 1.11.0
Date: Fri, 23 Apr 2021 01:56:52 +0800
Message-ID: <1619114212-4802-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Refresh the following patch:
disable-documentation.patch

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../tinyproxy/disable-documentation.patch     | 49 ++++++++++++-------
 ...inyproxy_1.10.0.bb => tinyproxy_1.11.0.bb} |  4 +-
 2 files changed, 32 insertions(+), 21 deletions(-)
 rename meta-networking/recipes-support/tinyproxy/{tinyproxy_1.10.0.bb => tinyproxy_1.11.0.bb} (89%)

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/disable-documentation.patch b/meta-networking/recipes-support/tinyproxy/tinyproxy/disable-documentation.patch
index 91508d721f..af99edcb5b 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy/disable-documentation.patch
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/disable-documentation.patch
@@ -1,14 +1,14 @@
-From b71eb384522b5ce4629dee6e8be257fb4880fef3 Mon Sep 17 00:00:00 2001
-From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
+From b71eb384522b5ce4629dee6e8be257fb4880fef3 Mon Sep 17 00:00:00 2001 
+From: Benjamin Gaignard <benjamin.gaignard@linaro.org> 
 Date: Thu, 20 Apr 2017 14:25:18 +0200
 
 ---
- Makefile.am  | 1 -
- configure.ac | 9 ---------
- 2 files changed, 10 deletions(-)
+ Makefile.am  |  1 -
+ configure.ac | 17 -----------------
+ 2 files changed, 18 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index e9113c2..2fe3d54 100644
+index 4a3ead6..a12cb98 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -2,7 +2,6 @@ SUBDIRS = \
@@ -17,24 +17,32 @@ index e9113c2..2fe3d54 100644
  	etc \
 -	docs \
  	m4macros \
- 	tests
- 
+ 	tests \
+ 	scripts
 diff --git a/configure.ac b/configure.ac
-index 48ee0b2..a1a5fa1 100644
+index 3849383..9f3a633 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -194,10 +194,6 @@ AC_SUBST(ADDITIONAL_OBJECTS)
- AC_PATH_PROG(XSLTPROC, xsltproc, no)
- AM_CONDITIONAL(HAVE_XSLTPROC, test "x$XSLTPROC" != "xno")
+@@ -190,18 +190,6 @@ AC_SUBST(CPPFLAGS)
+ AC_SUBST(LIBS)
+ AC_SUBST(ADDITIONAL_OBJECTS)
  
--# Check for asciidoc
--AC_PATH_PROG(A2X, a2x, no)
--AM_CONDITIONAL(HAVE_A2X, test "x$A2X" != "xno")
+-if test x"$manpage_support_enabled" = x"yes"; then
+-AC_PATH_PROG(POD2MAN, pod2man, no)
+-
+-if test "x$POD2MAN" = "xno" && \
+- ! test -e docs/man5/tinyproxy.conf.5 -a -e docs/man8/tinyproxy.8 ; then
+-AC_MSG_ERROR([
+-  manpage generation requested, but neither pod2man
+-  nor pre-generated manpages found.
+-  Use --disable-manpage-support if you want to compile anyway.])
+-fi
+-fi #manpage_support_enabled
 -
- # checking xmllint
- AC_PATH_PROG(XMLLINT, xmllint, no)
- if test "x$XMLLINT" != "xno"; then
-@@ -219,11 +215,6 @@ src/Makefile
+ AM_CONDITIONAL(HAVE_POD2MAN, test "x$POD2MAN" != "x" -a "x$POD2MAN" != "xno")
+ 
+ AC_PATH_PROG(GPERF, gperf, no)
+@@ -226,11 +214,6 @@ src/Makefile
  data/Makefile
  data/templates/Makefile
  etc/Makefile
@@ -46,3 +54,6 @@ index 48ee0b2..a1a5fa1 100644
  m4macros/Makefile
  tests/Makefile
  tests/scripts/Makefile
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.10.0.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.0.bb
similarity index 89%
rename from meta-networking/recipes-support/tinyproxy/tinyproxy_1.10.0.bb
rename to meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.0.bb
index 82d67014bb..7fb29279ea 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.10.0.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.0.bb
@@ -9,8 +9,8 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
            file://tinyproxy.conf \
            "
 
-SRC_URI[md5sum] = "423047c8dc53a15e19f78e238198549c"
-SRC_URI[sha256sum] = "6020955e6a0ef0ef898ad5bb17a448c47f9e4c003c464b4ae7c4dba063272055"
+SRC_URI[md5sum] = "658db5558ffb849414341b756a546a99"
+SRC_URI[sha256sum] = "20f74769e40144e4d251d2977cc4c40d2d428a2bec8c1b8709cd07315454baef"
 
 UPSTREAM_CHECK_URI = "https://github.com/tinyproxy/tinyproxy/releases"
 
-- 
2.25.1

