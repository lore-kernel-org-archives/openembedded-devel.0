Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37945.1795594094856095734
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=DILZUbM4;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3282db206d3so5126380eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594094; x=1796198894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xnTpmB8V52mGt8G/W4HPJNXpIMK1HtzSHOxikOummow=;
        b=DILZUbM44hunyJ8brAN/ze7UQUIeC0NLoBA0r1hAE7qVa3GDlWXdaWdqhrbqHtTp9h
         Lk2WcHnqI2dH+QMncxtiTu43T1OrEV9SH6vn/TGyfIMPK+DNw5piOTpcxn7CX1ULE/Uk
         Cs3O6QFHCU1xEogf6/XYQVQY/xJjlqiD8kHcAt0NvsIZoS20VerKWzqDU/b/X3tY9+Jh
         8vR0IUMo8LEwMxssp1/lisyh34hbdFvYQvNwlTeGR1LIcqLIN6VFNBzNeHRR8fPMubIB
         WonKM1C5ZRfG531GcvqkgQyoA0Jrl/tBFDBeKNdXLKnsO94TkWb3OHhRUruFAKwfYDw1
         3Aow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594094; x=1796198894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xnTpmB8V52mGt8G/W4HPJNXpIMK1HtzSHOxikOummow=;
        b=rtpDlpjVBQ0YdwrkNZUPFcY5Q5VLyPmFcZcQgbcobTc4VveLNBx/d3fqlPGZ9SEZwF
         isInsMiurCh03Agm4QJcpmH5BY/t1Kudhero13UjyB81yNW1oZ0rS6SjRoybOHx+0Vig
         gXXCzHf0VJuloBxde4xRp5gERlg6RL6em7LqV7FYUr2tLOUp6rW+rQfl8ATafJCMi+3a
         H4k+QUhEhQpHfORymlqCHqfHQ6Ea6eNKdEpvdP1l/FsBx9V/Vo23dJFB0e5KwUeMBUqM
         pXOT8Aw9YkkVthreZ3axhjBBuLPQtKumwIo9UcjyM3pb6P8NAMgpt45JHZ4S3+z6+Wkx
         SDyQ==
X-Gm-Message-State: APuU4Z+iTiXGHL+7qO1A5bCMszXdkTblDqsg0CO/SbqyN6JngCreB4bU
	sGXaPhaPGKfQGJqJR46YqrdyCL6XDKDLJhcsASiLfxbCdbkOsnZrwAUf45kVomzN
X-Gm-Gg: AZFdTZeJh5fqtAHUnVSFINE+IlLGoZni4VG2uA+uZdzuoNJ74MBcjhKYLwnc85IZmsd
	q1f2Ep4WuSuZjEE4M6ND01AroFO8Sms7bwqJkoOhRiYI7MHax3N39S8mLyNymJhXM6KKt407eOT
	gCRj4RH2xhVhdVOdheUpysHFVhTJP4HW6jfHBaVel1X0tcAR22DQ8Rl60wCQXCK0NlWvwpSwrZ1
	CVumTyhnrV/479RNcJhX3cDAyW6lKP2Yq+3AULwT513KlTcC9tfd9iOB2qScx5rnzgdBtTfoDlt
	g0ahTi9WW6AXNDjoA92fRtsdePcuD3RECmNVfmUxCcocxUF7VthkQswkRkQSvlunCSyKQ6Rayls
	vD/XNsKErZNqdBtSc2yNpxlmB1crhy65ebtPn+w+JFTaqmCsHxcoY6NpCY9nLp3F4+9KEqUs6L6
	YpIoJvzbHP4F7lP2jhe2qXGwG+sACZ1V1gCSOJSkmGt/ZHXfeeJxR7AHXW4CGkApQSBNp+KrMc3
	83JC27NxzQlhjLUneMw0APv/qkehbn7muXrW2eSm0t3n+IpZKrSUkl/SVHaww0e0aOkX1W5GOqv
	DTiCsQUCRfKKosfuoFgn2vQAHLBUhSwZisgTR5GyZbEYVvD4LxHYH9yCI/wpG/bjWCMbt10E+L9
	p25vv9P55PsG+gPKFkJljFh4IoBncMhxWZ8nJpOz1obHRhDWsSpPeL1uWakVUIOQgKdtngeFEFg
	awbfo8pBnU3CdAglKXCjpndDjOnJM0d/n467vSdWa8H5Ku4bB52iVFgr8Y5+H7+KfvdAUHmM1pK
	qvAsT4xh7bXh/aY9NljbJ4ZnVc5mNj/l/knAFzc6B55TV79rfvKoTfRggQQMUHAfN92HxpncP0S
	7sEG
X-Received: by 2002:a05:7301:1a84:b0:386:abfb:4a2 with SMTP id 5a478bee46e88-386abfb1a83mr10133981eec.11.1795594094019;
        Wed, 25 Nov 2026 00:08:14 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 25/55] postgresql: upgrade 18.6 -> 19.0
Date: Wed, 25 Nov 2026 00:06:41 -0800
Message-ID: <20261125080732.2419614-31-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133028
Content-Type: text/plain; charset="utf-8"

- new major release: REPACK (CONCURRENTLY), plan advice extensions,
  logical replication of sequences and without a restart, WAIT FOR
  read-your-writes on standbys, parallel autovacuum of indexes
- removed RADIUS authentication and the MULE_INTERNAL encoding;
  standard_conforming_strings is always on; JIT is off by default
- C11 is required instead of C99
- the on-disk format changed: existing clusters need pg_upgrade or a
  dump and restore

Refresh 0003-configure.ac-bypass-autoconf-2.69-version-check.patch
(copyright year context) and drop the line offsets from the other
patches. The configure options are unchanged and none of the removed
features had a PACKAGECONFIG. Add UPSTREAM_CHECK_URI/REGEX so the
check looks at the source index instead of the v${PV} directory.
pg-cron 1.6.8 (which declares PostgreSQL 19 support) and pgpool2 4.7.3
were compile-tested on the host against PostgreSQL 19.0.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../postgresql/files/0001-Add-support-for-RISC-V.patch      | 2 +-
 .../postgresql/files/0002-Improve-reproducibility.patch     | 2 +-
 ...03-configure.ac-bypass-autoconf-2.69-version-check.patch | 6 +++---
 .../files/0004-config_info.c-not-expose-build-info.patch    | 6 +++---
 .../0005-postgresql-fix-ptest-failure-of-sysviews.patch     | 4 ++--
 .../recipes-dbs/postgresql/files/not-check-libperl.patch    | 4 ++--
 meta-oe/recipes-dbs/postgresql/postgresql.inc               | 2 ++
 .../postgresql/{postgresql_18.6.bb => postgresql_19.0.bb}   | 2 +-
 8 files changed, 15 insertions(+), 13 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_18.6.bb => postgresql_19.0.bb} (87%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch b/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch
index 8ab8f0970b..e1ebbd3fd9 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch
@@ -13,7 +13,7 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  1 file changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/src/include/storage/s_lock.h b/src/include/storage/s_lock.h
-index 2f73f9f..04b0f8a 100644
+index c9e5251..f893cef 100644
 --- a/src/include/storage/s_lock.h
 +++ b/src/include/storage/s_lock.h
 @@ -243,11 +243,12 @@ spin_delay(void)
diff --git a/meta-oe/recipes-dbs/postgresql/files/0002-Improve-reproducibility.patch b/meta-oe/recipes-dbs/postgresql/files/0002-Improve-reproducibility.patch
index 1fa3594b26..c1b0db3ce2 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0002-Improve-reproducibility.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0002-Improve-reproducibility.patch
@@ -24,7 +24,7 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  1 file changed, 3 deletions(-)
 
 diff --git a/src/common/Makefile b/src/common/Makefile
-index 2c720ca..c3d889c 100644
+index cd48a55..49e3c32 100644
 --- a/src/common/Makefile
 +++ b/src/common/Makefile
 @@ -31,9 +31,6 @@ include $(top_builddir)/src/Makefile.global
diff --git a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
index a874db39ff..4e69f6cf9c 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -14,17 +14,17 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 3081ad7..3a0fc92 100644
+index 85150e2..db975ae 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [18.6], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [19.0], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
 -recommended.  You can remove the check from 'configure.ac' but it is then
 -your responsibility whether the result works or not.])])
- AC_COPYRIGHT([Copyright (c) 1996-2025, PostgreSQL Global Development Group])
+ AC_COPYRIGHT([Copyright (c) 1996-2026, PostgreSQL Global Development Group])
  AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
  AC_CONFIG_AUX_DIR(config)
diff --git a/meta-oe/recipes-dbs/postgresql/files/0004-config_info.c-not-expose-build-info.patch b/meta-oe/recipes-dbs/postgresql/files/0004-config_info.c-not-expose-build-info.patch
index 25a9bff52c..1e85374375 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0004-config_info.c-not-expose-build-info.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0004-config_info.c-not-expose-build-info.patch
@@ -15,10 +15,10 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  2 files changed, 2 insertions(+), 70 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 3a0fc92..88b8f1c 100644
+index db975ae..6afd525 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -23,7 +23,7 @@ AC_COPYRIGHT([Copyright (c) 1996-2025, PostgreSQL Global Development Group])
+@@ -23,7 +23,7 @@ AC_COPYRIGHT([Copyright (c) 1996-2026, PostgreSQL Global Development Group])
  AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
  AC_CONFIG_AUX_DIR(config)
  AC_PREFIX_DEFAULT(/usr/local/pgsql)
@@ -28,7 +28,7 @@ index 3a0fc92..88b8f1c 100644
  [PG_MAJORVERSION=`expr "$PACKAGE_VERSION" : '\([0-9][0-9]*\)'`]
  [PG_MINORVERSION=`expr "$PACKAGE_VERSION" : '.*\.\([0-9][0-9]*\)'`]
 diff --git a/src/common/config_info.c b/src/common/config_info.c
-index 113a8a6..b8f21c8 100644
+index 572ae3a..34a4cae 100644
 --- a/src/common/config_info.c
 +++ b/src/common/config_info.c
 @@ -38,7 +38,7 @@ get_configdata(const char *my_exec_path, size_t *configdata_len)
diff --git a/meta-oe/recipes-dbs/postgresql/files/0005-postgresql-fix-ptest-failure-of-sysviews.patch b/meta-oe/recipes-dbs/postgresql/files/0005-postgresql-fix-ptest-failure-of-sysviews.patch
index 4e9b1a27c2..1c9760055d 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0005-postgresql-fix-ptest-failure-of-sysviews.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0005-postgresql-fix-ptest-failure-of-sysviews.patch
@@ -22,7 +22,7 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/test/regress/expected/sysviews.out b/src/test/regress/expected/sysviews.out
-index 83228cf..c378012 100644
+index 132b56a..318c39b 100644
 --- a/src/test/regress/expected/sysviews.out
 +++ b/src/test/regress/expected/sysviews.out
 @@ -66,7 +66,7 @@ and c1.path[c2.level] = c2.path[c2.level];
@@ -35,7 +35,7 @@ index 83228cf..c378012 100644
  ----
   t
 diff --git a/src/test/regress/sql/sysviews.sql b/src/test/regress/sql/sysviews.sql
-index 66179f0..0f15661 100644
+index 507e400..bebb838 100644
 --- a/src/test/regress/sql/sysviews.sql
 +++ b/src/test/regress/sql/sysviews.sql
 @@ -43,7 +43,7 @@ where c2.name = 'CacheMemoryContext'
diff --git a/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch b/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
index 0a1406bc8d..4ef5d7df45 100644
--- a/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
@@ -21,10 +21,10 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 527437e..3081ad7 100644
+index 3ea316b..85150e2 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2354,7 +2354,7 @@ Use --without-tcl to disable building PL/Tcl.])
+@@ -2432,7 +2432,7 @@ Use --without-tcl to disable building PL/Tcl.])
  fi
  
  # check for <perl.h>
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index 2deb35b065..21dbad30f3 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -32,6 +32,8 @@ SRC_URI = "https://ftp.postgresql.org/pub/source/v${PV}/${BP}.tar.bz2 \
     file://run-ptest \
     file://pg_config \
 "
+UPSTREAM_CHECK_URI = "https://ftp.postgresql.org/pub/source/"
+UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+)/"
 
 LEAD_SONAME = "libpq.so"
 
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_18.6.bb b/meta-oe/recipes-dbs/postgresql/postgresql_19.0.bb
similarity index 87%
rename from meta-oe/recipes-dbs/postgresql/postgresql_18.6.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_19.0.bb
index 278d42ce3d..40631d8421 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_18.6.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_19.0.bb
@@ -12,6 +12,6 @@ SRC_URI += "\
    file://0001-tcl.m4-Recognize-tclsh9.patch \
    "
 
-SRC_URI[sha256sum] = "555610c24d53e4316da5b7d3fc25c279d96856d5e0e23ee308c328c5fa881d9f"
+SRC_URI[sha256sum] = "a89fd70efbad6a08c7dbed8d4872e3af30170d9e5ca9dc7906523be95b4e692d"
 
 CVE_STATUS[CVE-2017-8806] = "not-applicable-config: Doesn't apply to our configuration of postgresql so we can safely ignore it."
