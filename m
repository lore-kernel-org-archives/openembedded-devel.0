Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8B2DD74840
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Apr 2018 22:03:18 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id p53so11020202wrc.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2018 15:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=0IQDSAGJmjeOdRbbG0t+0W3LIGsFzS5OlCXziLlYhLc=;
	b=ugCiRa1qGwxHKvJTK/cDrmlK0YBrvEH8FPs3b/xJJHfvrZ4PRzKUCXW0M+2hdd7QiB
	z11kTPhUK9kP48YLc2Gkx2OA8lT2CuCdBR3ebcba5bkFOlNR1JoV/iA8CIKo838rtpdL
	GD4CcXBYXlz8nqRSpwxGzok0eokcQ7PNHiLuiMEdcRb4z+DEMc9BmPGeZSYLqcwYjCKX
	cFaq+vpPFpYEkM0NWnFZL8/N5kjXCh7KKNtdTvJVby9NIwwpd4zoJ5merUXnOAAWs3kO
	c1BXeWn+EPWtT4hI6gfYLDfJHKdBt53Ya8c4BuLw5VhyYPdzB7xpFWN6stXLoREQp3jm
	QF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=0IQDSAGJmjeOdRbbG0t+0W3LIGsFzS5OlCXziLlYhLc=;
	b=NpiCvWUipSIXc7Ti4JmdekTZEUNS7oeoj4bOsQKugzQkkjgOujwEUjPm6qVIWpBUue
	i4rzBcMFTH4wXdENPdxv/qz70K4jnQ0MmvhmXYu9PrrpP2kxB7MVtaDocBUkDQZFV0f9
	mRyNDlbZPBd36KIO3z5Guzic/c2xjml2ShxeUO2zpQRq+NEAerZ+XlzXn834W1/Ti3ju
	mMRiPKiyBA3pnEqww1QvzLHk8uIdHdl+ZzF20/pa3kNYc/O0WE9zWb67sMN+tVM7Mrge
	MxOe9ETfrrppMQcXiwNLj+75IeA771yuSnEqMzfC7Lw1WKzOoyaALnM9HdyGmlakn3j+
	NbXw==
X-Gm-Message-State: ALQs6tCrA0lB9rWa7B18LtmVrRnWvBbUbA31rrkU+KgVkz2gGX+naf5n
	VX9R1PCd0AnSTEEjbBBkESh7ew==
X-Google-Smtp-Source: AIpwx4/ZvvuqZnrlBQKdVDxxfetZr4sjfuoTV/mF9peTkW13c7z9CHI9HNRJeCsnVx94dDiBVlIzrQ==
X-Received: by 10.223.139.199 with SMTP id w7mr6296929wra.230.1523311398492;
	Mon, 09 Apr 2018 15:03:18 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC14F231E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:4f23:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	g185sm650954wmf.40.2018.04.09.15.03.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 09 Apr 2018 15:03:17 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Apr 2018 00:02:45 +0200
Message-Id: <20180409220249.11796-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180409220249.11796-1-schnitzeltony@gmail.com>
References: <20180409220249.11796-1-schnitzeltony@gmail.com>
Subject: [PATCH 5/9] samba: refresh patches
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
X-List-Received-Date: Mon, 09 Apr 2018 22:03:18 -0000

For 16-do-not-check-xsltproc-manpages.patch devtool created a heavy monster
---
 ...void-timeout-for-nmbd-if-started-offline-.patch |  5 +-
 .../samba/16-do-not-check-xsltproc-manpages.patch  | 56 ++++++++++++++--------
 .../21-add-config-option-without-valgrind.patch    | 19 ++++----
 3 files changed, 48 insertions(+), 32 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-packaging-Avoid-timeout-for-nmbd-if-started-offline-.patch b/meta-networking/recipes-connectivity/samba/samba/0001-packaging-Avoid-timeout-for-nmbd-if-started-offline-.patch
index 0ab3436fc..0e89a9be0 100644
--- a/meta-networking/recipes-connectivity/samba/samba/0001-packaging-Avoid-timeout-for-nmbd-if-started-offline-.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/0001-packaging-Avoid-timeout-for-nmbd-if-started-offline-.patch
@@ -13,16 +13,17 @@ If no network connection appears within DefaultTimeoutStartSec
 therefore get killed.
 
 Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
+
 ---
  packaging/systemd/nmb.service | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/packaging/systemd/nmb.service b/packaging/systemd/nmb.service
-index 992c0cd..555c9ab 100644
+index 71c93d6..f3d2fc2 100644
 --- a/packaging/systemd/nmb.service
 +++ b/packaging/systemd/nmb.service
 @@ -10,6 +10,7 @@ EnvironmentFile=-/etc/sysconfig/samba
- ExecStart=/usr/sbin/nmbd $NMBDOPTIONS
+ ExecStart=/usr/sbin/nmbd --foreground --no-process-group $NMBDOPTIONS
  ExecReload=/usr/bin/kill -HUP $MAINPID
  LimitCORE=infinity
 +TimeoutStartSec=0
diff --git a/meta-networking/recipes-connectivity/samba/samba/16-do-not-check-xsltproc-manpages.patch b/meta-networking/recipes-connectivity/samba/samba/16-do-not-check-xsltproc-manpages.patch
index c37cfcde4..8ca7a52ed 100644
--- a/meta-networking/recipes-connectivity/samba/samba/16-do-not-check-xsltproc-manpages.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/16-do-not-check-xsltproc-manpages.patch
@@ -1,13 +1,24 @@
-Don't check xsltproc manpages
+From 2214c2d1e455a38c891d17e421b438e3f7c495d8 Mon Sep 17 00:00:00 2001
+From: Bian Naimeng <biannm@cn.fujitsu.com>
+Date: Mon, 18 Apr 2016 17:00:53 -0400
+Subject: [PATCH] Don't check xsltproc manpages
 
+Upstream-Status: Pending
+ 
 Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
 
-Index: samba-4.4.2/lib/ldb/wscript
-===================================================================
---- samba-4.4.2.orig/lib/ldb/wscript
-+++ samba-4.4.2/lib/ldb/wscript
-@@ -65,7 +65,7 @@ def configure(conf):
-                 conf.define('USING_SYSTEM_LDB', 1)
+---
+ lib/ldb/wscript    | 2 +-
+ lib/talloc/wscript | 2 +-
+ lib/tdb/wscript    | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/lib/ldb/wscript b/lib/ldb/wscript
+index 5ea5231..d94086b 100644
+--- a/lib/ldb/wscript
++++ b/lib/ldb/wscript
+@@ -98,7 +98,7 @@ def configure(conf):
+         conf.DEFINE('EXPECTED_SYSTEM_LDB_VERSION_RELEASE', int(v[2]))
  
      if conf.env.standalone_ldb:
 -        conf.CHECK_XSLTPROC_MANPAGES()
@@ -15,24 +26,24 @@ Index: samba-4.4.2/lib/ldb/wscript
  
          # we need this for the ldap backend
          if conf.CHECK_FUNCS_IN('ber_flush ldap_open ldap_initialize', 'lber ldap', headers='lber.h ldap.h'):
-Index: samba-4.4.2/lib/talloc/wscript
-===================================================================
---- samba-4.4.2.orig/lib/talloc/wscript
-+++ samba-4.4.2/lib/talloc/wscript
-@@ -56,7 +56,7 @@ def configure(conf):
-     if conf.env.standalone_talloc:
-         conf.env.TALLOC_COMPAT1 = Options.options.TALLOC_COMPAT1
+diff --git a/lib/talloc/wscript b/lib/talloc/wscript
+index df7e6be..b3305cf 100644
+--- a/lib/talloc/wscript
++++ b/lib/talloc/wscript
+@@ -49,7 +49,7 @@ def configure(conf):
+         conf.env.PKGCONFIGDIR = '${LIBDIR}/pkgconfig'
+         conf.env.TALLOC_VERSION = VERSION
  
 -    conf.CHECK_XSLTPROC_MANPAGES()
 +    #conf.CHECK_XSLTPROC_MANPAGES()
  
-     if not conf.env.disable_python:
-         # also disable if we don't have the python libs installed
-Index: samba-4.4.2/lib/tdb/wscript
-===================================================================
---- samba-4.4.2.orig/lib/tdb/wscript
-+++ samba-4.4.2/lib/tdb/wscript
-@@ -92,7 +92,7 @@ def configure(conf):
+     conf.CHECK_HEADERS('sys/auxv.h')
+     conf.CHECK_FUNCS('getauxval')
+diff --git a/lib/tdb/wscript b/lib/tdb/wscript
+index 4782550..6bb3fa1 100644
+--- a/lib/tdb/wscript
++++ b/lib/tdb/wscript
+@@ -89,7 +89,7 @@ def configure(conf):
          not conf.env.disable_tdb_mutex_locking):
          conf.define('USE_TDB_MUTEX_LOCKING', 1)
  
@@ -41,3 +52,6 @@ Index: samba-4.4.2/lib/tdb/wscript
  
      if not conf.env.disable_python:
          # also disable if we don't have the python libs installed
+-- 
+2.14.3
+
diff --git a/meta-networking/recipes-connectivity/samba/samba/21-add-config-option-without-valgrind.patch b/meta-networking/recipes-connectivity/samba/samba/21-add-config-option-without-valgrind.patch
index 025ac2775..6a7f8facc 100644
--- a/meta-networking/recipes-connectivity/samba/samba/21-add-config-option-without-valgrind.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/21-add-config-option-without-valgrind.patch
@@ -6,6 +6,7 @@ Subject: [PATCH] Add config option without-valgrind
 Upstream-Status: Pending
 
 Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+
 ---
  lib/replace/wscript | 4 +++-
  source3/wscript     | 5 ++++-
@@ -16,9 +17,9 @@ diff --git a/lib/replace/wscript b/lib/replace/wscript
 index f0040b1..aca73af 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
-@@ -101,7 +101,9 @@ struct foo bar = { .y = 'X', .x = 1 };
- 
-     conf.CHECK_CODE('', headers='rpc/rpc.h rpcsvc/yp_prot.h', define='HAVE_RPCSVC_YP_PROT_H')
+@@ -101,7 +101,9 @@ def configure(conf):
+     conf.CHECK_HEADERS('sys/fileio.h sys/filesys.h sys/dustat.h sys/sysmacros.h')
+     conf.CHECK_HEADERS('xfs/libxfs.h netgroup.h')
  
 -    conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h valgrind/memcheck.h')
 +    if not Options.options.disable_valgrind:
@@ -26,12 +27,12 @@ index f0040b1..aca73af 100644
 +
      conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
      conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
-     conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h malloc.h')
+     conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
 diff --git a/source3/wscript b/source3/wscript
 index bac3dd5..a5c51ea 100644
 --- a/source3/wscript
 +++ b/source3/wscript
-@@ -1016,7 +1016,10 @@ syscall(SYS_setgroups32, 0, NULL);
+@@ -1070,7 +1070,10 @@ syscall(SYS_setgroups32, 0, NULL);
              Logs.warn("--with-dnsupdate=yes but gssapi support not sufficient")
          else:
              conf.DEFINE('WITH_DNS_UPDATES', 1)
@@ -44,12 +45,12 @@ index bac3dd5..a5c51ea 100644
          if conf.CONFIG_SET('HAVE_VALGRIND_H') or conf.CONFIG_SET('HAVE_VALGRIND_VALGRIND_H'):
              conf.DEFINE('VALGRIND', '1')
 diff --git a/wscript b/wscript
-index 7679c0f..681ac17 100644
+index 542a60c..22e6116 100644
 --- a/wscript
 +++ b/wscript
-@@ -72,6 +72,10 @@ def set_options(opt):
-                    help=("Disable systemd integration"),
-                    action='store_false', dest='enable_systemd')
+@@ -86,6 +86,10 @@ def set_options(opt):
+                   help=("Disable RELRO builds"),
+                   action="store_false", dest='enable_relro')
  
 +    opt.add_option('--without-valgrind',
 +                   help=("Disable use of the valgrind headers"),
-- 
2.14.3


