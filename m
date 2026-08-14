Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E7A0C5DF72
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:11 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24527.1786747623316516638
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:47:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rF9CNfcg;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-39266382df6so1322829a91.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747623; x=1787352423; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WGdPGP6Qdgk4CW9euKzfS6bZqb9p11TjWZI8mc5fZuE=;
        b=rF9CNfcgyM1FY1Y8C82LGmdngoExK736q+GfaVO65GIpIvhKH2xJEGrLfTSkPgqvjN
         pmfmRTQMKt5dMxEIBxYszfFkDci/0U1yMaejc6GiQukfoUF0ps8LCPzd1Z1mBQwi+Ka0
         /DWAsOxkR3hsL0P79WDOowPXS4pN9KMz07xeuXiUwkCeY2I7G7nBIPfbueUbTlI8U4ZZ
         RJ5gdSy3Z09pUr9R0zQ0Za0ePjdswgk2lX2Zo5v8LovDXcpENXHsWBo5dF1E3ir8S6Hh
         xwjcXKVqa6OTBBqx03b0NOSypfMs3GqA31VP9DK2uVeUiPyfKUeLgNWW7Qskg9OdjYjx
         eHiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747623; x=1787352423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WGdPGP6Qdgk4CW9euKzfS6bZqb9p11TjWZI8mc5fZuE=;
        b=rI4RgYm6DDF1XtZTLFm5xBB2lHcx4zYZyit75gVxndaRhD0KLTSsRuoT0kSfZm6MSZ
         r58WRbh08Q/rBOkjEtlVUrCRnzGbCiwX2NomCbPJMvGiy6XvTRmOUGnmGswodrUOGQfm
         nWvHhyNhN8mBNXtXFrEV7gMYdPV7e1xQ1BAxl6iRNQkbaOYnHZqfsdSTxRTasNZ7V9kR
         72ZbkVOeakikv6MM6Wz6NZ/XK7GehIKfIjms2+aSa6my/bY0b330nhLIs+qKfjtf98Ww
         buP0YSXn7IXQr0Qt0GYhKALOjFpXNtcUBNQ0hpDoKcKWd6fBhCcInrDdDKlbFyQgoLFT
         0c/g==
X-Gm-Message-State: AOJu0YwCPgY9V+XTJySPg8LgGc9f+JnJICbC1X3TGaALZFW6BMZBmbJK
	ldZMEOJhDhUAP2RmekbS3kk9maUjHoKKtUzRHWIbAADdr6K8p1zh+p0MjzFPxulh
X-Gm-Gg: AR+sD10a0+AX+maPFzyYPv2pQuGUkCOm3I5IshTmZiQXt6/541HnOsdnCdTLHAIKH9C
	MDCs3VnUoRcfHxa1HurLV/Yk6tXgJWa9B5uKJHnM2IoYWCFl21NWN0iEu7UhthjSSue1SDmfAFT
	X6Vy3DRKt/YwkKkxeQ3Vdy9YGxUUeN1p7OSjGVyUNMrg5kgWzkDi1KyZpZRyRb+d6tNK7VDESHD
	B+PuU2rAORifzxp4nyneAfzwXzHp3UcRjENarIubN3r+r4/of3F5ski1Oa808zhQN+ZheI0kSqz
	gS8+W8JY/1XDg4yd/1eAVM9Qsao7wOr8WEx4pd8xEWTOMhCrz4Z43Kbyxx3fZkBQiKdLjr7Lqgz
	QN1QDfgvfSAzMRzKpbAH3lwc5P/uRXE6FvqUaytD99N0LyiYWSD9yecFF2R6bpGqkdQ33LZ48n6
	0w76EGdNwj23DN4iysVCN93EqiD3b9Ns8Ym/+gJLRBqTGWijX476w2Njz021uQTbUZRzqmH2KXP
	CPMWXp+RXosLlSXeVWGTxasFDlsTjXfRZIwnTl7bpK0bNQQwDAtluRfVPaTn3WV91yJLaHvFjfK
	1Gl/c1HL6IbAtz/NxhlnRT/cV4bu/BO1fnkpxRrPPyFhBpoa8TaQ89UDCAXJJ5QfMniggzO3rEV
	Yug6q/b+pq1axgUvFRdqYjgCvzF1Kg55U+wdXlU9a6ABByA==
X-Received: by 2002:a17:90b:3fc8:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-3933b762b96mr11004949a91.7.1786747622582;
        Fri, 14 Aug 2026 15:47:02 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:47:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 072/109] postgresql: upgrade 17.10 -> 18.4
Date: Fri, 14 Aug 2026 15:44:58 -0700
Message-ID: <20260814224539.1523174-72-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129136

Major release. Dropped 0001-Add-missing-include-in-Cluster.pm.patch, which is
no longer needed / no longer applies against 18.4's Cluster.pm. Rebased
0003-configure.ac-bypass-autoconf-2.69-version-check.patch and
0005-postgresql-fix-ptest-failure-of-sysviews.patch onto 18.4's shifted line
numbers (context-only changes; same single-line edits as before).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...01-Add-missing-include-in-Cluster.pm.patch | 38 -------------------
 ...c-bypass-autoconf-2.69-version-check.patch |  8 ++--
 ...gresql-fix-ptest-failure-of-sysviews.patch | 20 +++++-----
 meta-oe/recipes-dbs/postgresql/postgresql.inc |  2 +-
 ...postgresql_17.10.bb => postgresql_18.4.bb} |  3 +-
 5 files changed, 18 insertions(+), 53 deletions(-)
 delete mode 100644 meta-oe/recipes-dbs/postgresql/files/0001-Add-missing-include-in-Cluster.pm.patch
 rename meta-oe/recipes-dbs/postgresql/{postgresql_17.10.bb => postgresql_18.4.bb} (81%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-Add-missing-include-in-Cluster.pm.patch b/meta-oe/recipes-dbs/postgresql/files/0001-Add-missing-include-in-Cluster.pm.patch
deleted file mode 100644
index d4e6273e6d..0000000000
--- a/meta-oe/recipes-dbs/postgresql/files/0001-Add-missing-include-in-Cluster.pm.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From eb5559b7df98581bd9a5142433122d1ba076d568 Mon Sep 17 00:00:00 2001
-From: Michael Paquier <michael@paquier.xyz>
-Date: Tue, 12 May 2026 16:44:28 +0900
-Subject: [PATCH] Add missing include in Cluster.pm
-
-The postmaster test 004_negotiate.pl could fail due to IO::Socket::INET
-gone missing, in environments that cannot use Unix sockets.
-
-Oversight in the backport done in 6dffaeb8e54c, so like the other commit
-this is applied across the v14~17 range.  Per buildfarm member drongo.
-
-Security: CVE-2026-6479
-Backpatch-through: 14
-
-CVE: CVE-2026-6479
-
-Upstream-Status: Backport [https://github.com/postgres/postgres/commit/eb5559b7df]
-
-Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
----
- src/test/perl/PostgreSQL/Test/Cluster.pm | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/test/perl/PostgreSQL/Test/Cluster.pm b/src/test/perl/PostgreSQL/Test/Cluster.pm
-index a8635f4e6ad..4c2428a9247 100644
---- a/src/test/perl/PostgreSQL/Test/Cluster.pm
-+++ b/src/test/perl/PostgreSQL/Test/Cluster.pm
-@@ -104,6 +104,7 @@ use File::Path qw(rmtree mkpath);
- use File::Spec;
- use File::stat qw(stat);
- use File::Temp ();
-+use IO::Socket::INET;
- use IPC::Run;
- use PostgreSQL::Version;
- use PostgreSQL::Test::RecursiveCopy;
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
index ef8c524fad..8d1263432e 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -13,17 +13,19 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 856b091..646394c 100644
+index 636ba54..14dc382 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [17.10], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [18.4], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
 -recommended.  You can remove the check from 'configure.ac' but it is then
 -your responsibility whether the result works or not.])])
- AC_COPYRIGHT([Copyright (c) 1996-2024, PostgreSQL Global Development Group])
+ AC_COPYRIGHT([Copyright (c) 1996-2025, PostgreSQL Global Development Group])
  AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
  AC_CONFIG_AUX_DIR(config)
+-- 
+2.25.1
diff --git a/meta-oe/recipes-dbs/postgresql/files/0005-postgresql-fix-ptest-failure-of-sysviews.patch b/meta-oe/recipes-dbs/postgresql/files/0005-postgresql-fix-ptest-failure-of-sysviews.patch
index 753cd1bb97..7aab99e32e 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0005-postgresql-fix-ptest-failure-of-sysviews.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0005-postgresql-fix-ptest-failure-of-sysviews.patch
@@ -10,6 +10,8 @@ To fix it we need to reduce the count of parameters in sysviews test.
 Also we need to reduce the row count in expected result of sysview test
 to make the test output shown as pass.
 
+Rebased on 18.4: context shifted (offset only, same single-line change).
+
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Manoj Saun <manojsingh.saun@windriver.com>
@@ -19,12 +21,11 @@ Signed-off-by: Manoj Saun <manojsingh.saun@windriver.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/test/regress/expected/sysviews.out b/src/test/regress/expected/sysviews.out
-index 2176a54..a84bc27 100644
 --- a/src/test/regress/expected/sysviews.out
 +++ b/src/test/regress/expected/sysviews.out
-@@ -52,7 +52,7 @@ from pg_backend_memory_contexts where name = 'Caller tuples';
- 
- rollback;
+@@ -66,7 +66,7 @@
+ (1 row)
+
  -- At introduction, pg_config had 23 entries; it may grow
 -select count(*) > 20 as ok from pg_config;
 +select count(*) > 13 as ok from pg_config;
@@ -32,15 +33,16 @@ index 2176a54..a84bc27 100644
  ----
   t
 diff --git a/src/test/regress/sql/sysviews.sql b/src/test/regress/sql/sysviews.sql
-index b047fb5..d1e3999 100644
 --- a/src/test/regress/sql/sysviews.sql
 +++ b/src/test/regress/sql/sysviews.sql
-@@ -33,7 +33,7 @@ from pg_backend_memory_contexts where name = 'Caller tuples';
- rollback;
- 
+@@ -43,7 +43,7 @@
+ and c1.path[c2.level] = c2.path[c2.level];
+
  -- At introduction, pg_config had 23 entries; it may grow
 -select count(*) > 20 as ok from pg_config;
 +select count(*) > 13 as ok from pg_config;
- 
+
  -- We expect no cursors in this test; see also portals.sql
  select count(*) = 0 as ok from pg_cursors;
+--
+2.43.0
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index e687399493..5f255be33d 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -244,7 +244,7 @@ INITSCRIPT_PARAMS = "start 64 . stop 36 0 1 2 3 4 5 6 ."
 do_install:append() {
     # install contrib
     oe_runmake DESTDIR=${D} -C contrib install
-    oe_multilib_header pg_config.h pg_config_ext.h ecpg_config.h postgresql/server/pg_config.h postgresql/server/pg_config_ext.h
+    oe_multilib_header pg_config.h ecpg_config.h postgresql/server/pg_config.h
     # install tutorial
     install -d -m 0755 ${D}${libdir}/${BPN}/tutorial
     install ${B}/src/tutorial/* ${D}${libdir}/${BPN}/tutorial
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_17.10.bb b/meta-oe/recipes-dbs/postgresql/postgresql_18.4.bb
similarity index 81%
rename from meta-oe/recipes-dbs/postgresql/postgresql_17.10.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_18.4.bb
index 7afd8b4dbf..6bd09b7c1c 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_17.10.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_18.4.bb
@@ -10,9 +10,8 @@ SRC_URI += "\
    file://0004-config_info.c-not-expose-build-info.patch \
    file://0005-postgresql-fix-ptest-failure-of-sysviews.patch \
    file://0001-tcl.m4-Recognize-tclsh9.patch \
-   file://0001-Add-missing-include-in-Cluster.pm.patch \
    "
 
-SRC_URI[sha256sum] = "078a03516dcdbdb705fecaf415ea3d13a956c589e46f09fed68a06fb00598c90"
+SRC_URI[sha256sum] = "81a81ec695fb0c7901407defaa1d2f7973617154cf27ba74e3a7ab8e64436094"
 
 CVE_STATUS[CVE-2017-8806] = "not-applicable-config: Doesn't apply to our configuration of postgresql so we can safely ignore it."

