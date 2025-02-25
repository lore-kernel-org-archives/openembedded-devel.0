Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D9CC021B8
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 06:35:19 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.2656.1740465317216593556
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Feb 2025 22:35:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dOTyuc/T;
 spf=pass (domain: mvista.com, ip: 209.85.216.44, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2fbfa8c73a6so10424136a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Feb 2025 22:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1740465316; x=1741070116; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lgQPw8bYFmFOTuc2z+r9vFkqdL4jRs9P2fpXVGa4vCU=;
        b=dOTyuc/Thl4MZH/v1ItdyShxhjgYLYhkUo8R7CRdNwixawkVcVOHRVhrcdEviZupgR
         jty0LdjLr7hmtAuu7wFQlbYJ5OrPgSRGgjX6EdJpa3CyFRyYcgK7CorcLdiKkcZS5QLA
         wu7QmAQaLfvjIeQ0u7q8fGg3ZVeqzLJj+/mO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740465316; x=1741070116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lgQPw8bYFmFOTuc2z+r9vFkqdL4jRs9P2fpXVGa4vCU=;
        b=OXRtcXfEo2XqtQIaO313NgvOHQtb2eJ5BT+bsQfEy5Mvv/38sYc54etpbEfhkpM0Fq
         wYyGitK5s+b8rC3pkpn2rDOs0wvVXUFDKHbJCENp6Thdav9ruQKFxFbqoy6ADS5ae0qg
         WFoqdn4W8j+y72GbsOhTMjqye+LvEP8dCSK9kHV1NN9GGDO2I69uk8ECpD7tnSV78VLz
         uaCcs1VMdutxv0xej32HYVxU5OjRkYZHlbv8Nrxf5AKxFRCYXxF2XYPK57KaFtpYJR3h
         fC+Pi8XOlB+793pQBr5wg8gEc3Oyf7iHxKoWPu7BbFE5M36wATbUNWxWjqJk36PzPam6
         nQ9Q==
X-Gm-Message-State: AOJu0Yy1Srlw9Uz+vHcHqfLQjcgIC8ujeYCiGTk1RrNLxdl4PxnpSqzd
	Fn9aeMRY4C7TLkZcVIEHycvmgqauq0gYcXwVhZ8TpH9u7EGs/vSM5qE2wD0G4k26gCPMlivYqk1
	KL1Q=
X-Gm-Gg: ASbGnctcl/XoumKJqbqmlihmY9Fihxv+KA1LK48NsAKsRvSrv9xYSuE46BQO9Gjh/y8
	41KzlDe2WwurJdJ3TJG3eU8jQF8xNhRalgcTyUJxNxXTn6IrsAqaE1QhU6Ja0tONmmKvXKLfrgm
	//CzGwRTF9EpOdcDUReC3wsKSPStvPs70m0gzQ8BebJnvjWY6sIDtEiqcT4njj7aoMyg9i0LV5+
	34VTVaBliTOdblKqKZrZUu7HqtRAMZtp1DsEuByv8c1yXe39+aPBZk22jgWEixxzNZ2///JrMyH
	s0xR+jw7rGjGAClss0w05vFNMvm7IOR33+XHiQ==
X-Google-Smtp-Source: AGHT+IEt2hGRaZkim0Ry6QfiOqFI21SGkcfcOOFc7ynRe7jTSzxquMOYGrpIhAEKNfnV4IBeSu5InQ==
X-Received: by 2002:a17:90b:2d87:b0:2ee:d024:e4fc with SMTP id 98e67ed59e1d1-2fce8740f48mr28971089a91.33.1740465316078;
        Mon, 24 Feb 2025 22:35:16 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.200.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a000846sm6757295ad.2.2025.02.24.22.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 22:35:15 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][kirkstone][PATCH] postgresql: upgrade 14.14 -> 14.17
Date: Tue, 25 Feb 2025 12:05:00 +0530
Message-Id: <20250225063500.66826-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 06:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115560

From: Vijay Anusuri <vanusuri@mvista.com>

License-Update: Update license year to 2025

Includes fix for CVE-2025-1094

Changelog:
https://www.postgresql.org/docs/release/14.17/

Refreshed 0003-configure.ac-bypass-autoconf-2.69-version-check.patch for
14.17

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 ...0001-configure.ac-bypass-autoconf-2.69-version-check.patch | 2 +-
 .../postgresql/{postgresql_14.14.bb => postgresql_14.17.bb}   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_14.14.bb => postgresql_14.17.bb} (71%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
index a8d320fc1a..fc3b1db6f6 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -18,7 +18,7 @@ index 4653dcf..72e4dad 100644
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [14.14], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [14.17], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.14.bb b/meta-oe/recipes-dbs/postgresql/postgresql_14.17.bb
similarity index 71%
rename from meta-oe/recipes-dbs/postgresql/postgresql_14.14.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_14.17.bb
index 342b78ae90..a7563c3f8b 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_14.14.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.17.bb
@@ -1,6 +1,6 @@
 require postgresql.inc
 
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=89afbb2d7716371015101c2b2cb4297a"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d5dd73e90ee1a572679460ee67233fcc"
 
 SRC_URI += "\
    file://not-check-libperl.patch \
@@ -11,7 +11,7 @@ SRC_URI += "\
    file://0001-postgresql-fix-ptest-failure-of-sysviews.patch \
 "
 
-SRC_URI[sha256sum] = "84727fbccdbd1efe01d8de64bc1b33095db773ad2457cefcedc2d8258ebc09d6"
+SRC_URI[sha256sum] = "6ce0ccd6403bf7f0f2eddd333e2ee9ba02edfa977c66660ed9b4b1057e7630a1"
 
 CVE_CHECK_IGNORE += "\
    CVE-2017-8806 \
-- 
2.25.1


