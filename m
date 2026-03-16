Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0FBDF506D2
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 13:38:33 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50791.1773668308275366060
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 06:38:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CMxKKyy9;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-485445e80bdso40590005e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 06:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773668306; x=1774273106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+p7wqRsRY57NlkamprLTowRoMknIUNNhigciqJoLp9A=;
        b=CMxKKyy9lbigWymcYniZrzglccj8kNS5h5SHCpsmSIriY0D7ySJ1wuogsuSDraDfZL
         kgUu8sQ4g7ezq1RF8gmPCXbo5HWQkUsW/2l89yFnDGW0j5Lq+0YGZLQA6IyaapZlfF2f
         gjri/r9Aaatfv3mbFcycU0Vmbd2+GN16d5DheRB1Nhc67f2fPcE6or7/U9WU1xqkSELR
         4lRJ8t1ppXLO3+vNCUkNe0lB2l26QauzCK9BIchje7EyG4O/QrwHORdndfIA2tlDkSZN
         ObtE87u/tx5MBD5bwosrlDaNJ4/RlMefCdeGGem3LJyxQCKbHYYmBDUtcTItsFimT9xb
         dwHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773668306; x=1774273106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+p7wqRsRY57NlkamprLTowRoMknIUNNhigciqJoLp9A=;
        b=ppyK1jczCX3OxeS8brzrgyZu/39AdcZmCOLTZRU7bZG5jmiRnsI0H1HnUGYAy1a+qo
         UhTumYmQ+yV0sANxeZgLEukXKSTEMXejvOlcRs3RW2sD6OzSk/NegHxWSjbU4pY25X4r
         qA1Xs6IIItWAS6nkCSRlAUK8ELLk9nm8mNbq/v6MpoFKGZIiSMJtOp6Vg6yXgULeqOs4
         fTocvegR4A8h27VNY6fVmyFBROnWfmQYcycTkJv1bTmNc0cFw+k0gkgeALM9riGpwKpC
         goyzq86XNtFVNCTsxWL9bnRL5LOmrYZO+Q1jMiMuTQ0wRzkG/3SzsAwH8wpe5N1yAaw8
         ny5A==
X-Gm-Message-State: AOJu0YzEjeTBH4t8n+sB1jrIYeakGd+ucdtGs/Q7HOHdcqfrPixxSSFk
	BHR2e1UQjTxvRayiKrINpTreAGhuYok2V2iC8VyJDsZfXSwOnzr6JnWGfwKBfg==
X-Gm-Gg: ATEYQzyxbdFJFDfLP9ieOPcH1yESMYK3gCeXvcRbbnfJmp4/j4oqCOS6/XCW6CIGAZU
	RgnOPTWn4QQsnMTjV6wdngkXhPDWQ2iZpJZeFPSmOam6e7/JMuvjMpjGMDlEIkiIFCEAH4YV7pF
	apuf/JmUbydKLYnpkQNY/nipsmKSTAGXVigiv2poBzvtVD66oSCBHCHeC9ECpcRjvD272SeVS2G
	Ya/vIlqmLQD+niOkJwlyKlw+FxAjIUKLHkZtomEoYCqiIToL7ziFc+ZUKcL/n8KInKMfDYjs1X3
	dyl+CkoguRb1MxF0CCMP5qlqOEk32/kmepLZTXrmN04ymnWhbFEc5mdVLNi8WjXTEkmy+z5rssT
	voY2XFLbVR+o/Q9Nh2v+/+kJBPVR6CCIDHPAyGMheF6Ow1TLKocemBQpKtfQzUw+T9Be6jTrWoH
	zrkI4N5oRAjceFRxv2Bm38
X-Received: by 2002:a05:600c:8b29:b0:47a:7fd0:9eea with SMTP id 5b1f17b1804b1-485566e314cmr221589365e9.3.1773668305991;
        Mon, 16 Mar 2026 06:38:25 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4855777bd37sm150860975e9.3.2026.03.16.06.38.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 06:38:25 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH v2] postgresql: upgrade 14.21 -> 14.22
Date: Mon, 16 Mar 2026 14:38:23 +0100
Message-ID: <20260316133823.1321479-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 13:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125277

This is a bugfix release.

Changelog: https://www.postgresql.org/docs/release/14.22/

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: also commit the adapted patch

 .../0001-configure.ac-bypass-autoconf-2.69-version-check.patch  | 2 +-
 .../postgresql/{postgresql_14.21.bb => postgresql_14.22.bb}     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_14.21.bb => postgresql_14.22.bb} (84%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
index 81cfc47c4f..a6f91c3af2 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -18,7 +18,7 @@ index bc0b44d..1a616ac 100644
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [14.21], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [14.22], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.21.bb b/meta-oe/recipes-dbs/postgresql/postgresql_14.22.bb
similarity index 84%
rename from meta-oe/recipes-dbs/postgresql/postgresql_14.21.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_14.22.bb
index ba7a7bb03b..3cd18f15af 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_14.21.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.22.bb
@@ -11,7 +11,7 @@ SRC_URI += "\
    file://0001-postgresql-fix-ptest-failure-of-sysviews.patch \
 "
 
-SRC_URI[sha256sum] = "5b30f19347efff32b6e09ed2cdff0b04e9aee913ec9bb7414de2b7c17b17f1f9"
+SRC_URI[sha256sum] = "f57938ad30067077720277f6d7db05aafc07d1545efd2ed82f199ba828a7ad34"
 
 CVE_CHECK_IGNORE += "\
    CVE-2017-8806 \

