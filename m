Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id BE5C271DEE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Nov 2017 22:08:42 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id n14so2983509pfh.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Nov 2017 15:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=z5K/E3GAjRJoz8exP6icRuE6Z5/Nw/r8rzTGnYBRksg=;
	b=H1KsNIsx3i/TjsOT75cxKfPUBSvP36o+rsnhzEjzFOct5KNAnmmsduTfZuXV/R8zGh
	r1oidjwy+rsO8OdR5Ufv70dKvlncW4iWPM5R5EsuoNtlnQGN+qF4YeufFY6fbnACf2ZS
	n4BJO/ldTrxCUy3ymcFq93ULVdio3Q3ySUBH/KM/zXAZdcZJiA3lldCb1oRbeMk81SUe
	52mNv3JRUTLd81NzowkRD/VIa3M0XiVJ+p3zUJUkgQ7TWkSy4wT3AgM1vYaoWiKkbXNs
	AvkER9fsUFzEYOVhCAqJQqgL3RpIt7PPH7YkpstMMFFr6GMNwxXBdVLxOnXGT2sTTVnu
	ltBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=z5K/E3GAjRJoz8exP6icRuE6Z5/Nw/r8rzTGnYBRksg=;
	b=EJTjai8PUNRUoKz1rgBU0BxSlE74RdbZtekZbYyg+Chmwy7vTWaqoLAC8evAg32r1q
	e1y2+qH87E49q986btiLPpS9f6BkxsIaKPyQJQI7wPqwQVl5qAQig2j0erxEz7C/9fze
	EQ0PHTlc03Lt1l6eBESsnt6hzCbFptRCJQIbmAUURhdehN2tk94b/ghdRVuW9nJm4A1e
	pw7D5fKly3G7S72+VAX60+/nZthWw9Ij82H6Sy6ARv55hY66eP4yTY31RQpTBTRtnt0y
	z+XOvY7kYAzk33e6baqHnIYUYvEIbI9qkyZqQ0UXeKMDPPuFpxuQ/Add6CEz1SfMjdVa
	TLtg==
X-Gm-Message-State: AMCzsaX1xY71OHUB1EK4/bqcuHxE77C2FrHDWXS9JrO7cma1MMBbLm+9
	KQEgVV0JHAIN9YJMcJ8Uv3a6Fw==
X-Google-Smtp-Source: ABhQp+TQSOlEwN5thqTqBSgJ4rpJbp6Wa7NmcVKGAt2Dp61KJZfkFPACfLEVzojDsReNVP2CMBpi8g==
X-Received: by 10.101.88.140 with SMTP id d12mr1322480pgu.166.1509574123421;
	Wed, 01 Nov 2017 15:08:43 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	i187sm2613991pfc.96.2017.11.01.15.08.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Nov 2017 15:08:42 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Nov 2017 15:08:36 -0700
Message-Id: <1509574117-5004-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH 1/2] iksemel: drop stray patch left behind when iksemel 1.4 recipe was purged
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Nov 2017 22:08:42 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../recipes-support/iksemel/iksemel-1.4/r25.diff   | 32 ----------------------
 1 file changed, 32 deletions(-)
 delete mode 100644 meta-oe/recipes-support/iksemel/iksemel-1.4/r25.diff

diff --git a/meta-oe/recipes-support/iksemel/iksemel-1.4/r25.diff b/meta-oe/recipes-support/iksemel/iksemel-1.4/r25.diff
deleted file mode 100644
index e666ce0..0000000
--- a/meta-oe/recipes-support/iksemel/iksemel-1.4/r25.diff
+++ /dev/null
@@ -1,32 +0,0 @@
-Taken from upstream subversion repository:
-
-http://code.google.com/p/iksemel/source/detail?r=25
-
-===================================================================
----
- configure.ac |   10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
---- iksemel-1.4.orig/configure.ac
-+++ iksemel-1.4/configure.ac
-@@ -43,11 +43,19 @@ AM_CONDITIONAL(DO_POSIX, test "x$defio"
- dnl Checks for library functions
- AC_SEARCH_LIBS(recv,socket)
- AC_CHECK_FUNCS(getopt_long)
- AC_CHECK_FUNCS(getaddrinfo)
- 
--AM_PATH_LIBGNUTLS(,AC_DEFINE(HAVE_GNUTLS,,"Use libgnutls"))
-+dnl Check GNU TLS
-+PKG_CHECK_MODULES(GNUTLS, gnutls >= 2.0.0, have_gnutls=yes, have_gnutls=no)
-+if test "x$have_gnutls" = "xyes"; then
-+  LIBGNUTLS_CFLAGS="$GNUTLS_CFLAGS"
-+  LIBGNUTLS_LIBS="$GNUTLS_LIBS"
-+  AC_SUBST(LIBGNUTLS_CFLAGS)
-+  AC_SUBST(LIBGNUTLS_LIBS)
-+  AC_DEFINE(HAVE_GNUTLS, 1, [whether to use GnuTSL support.])
-+fi
- 
- dnl Check -Wall flag of GCC
- if test "x$GCC" = "xyes"; then
-   if test -z "`echo "$CFLAGS" | grep "\-Wall" 2> /dev/null`" ; then
-     CFLAGS="$CFLAGS -Wall"
-- 
1.9.1


