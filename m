Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F28F2E7719A
	for <webhook@archiver.kernel.org>; Sun,  5 Jan 2025 23:24:16 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.48452.1736119454831053370
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jan 2025 15:24:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XJ2GxXZC;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e54bd61e793so589811276.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 15:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736119454; x=1736724254; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tNL8g6yQ8ZIn0LQxZcY6OhMyHEMPrw1TWswVWziWz0A=;
        b=XJ2GxXZCszsric8bHecpiTBNlXmAzRJa97A/rnVw4Tosjm7LGEfcRBxNzfh6NH3Fsl
         1UU6b9Nk3HcKTn6ytbC8oPxNc/Pwdxb7rOvP98uaS6REQkKZfuIASoh5jbz+G8M6MclZ
         uJXvSQ3xgisLmMi0RPs6BNRqPitepfmkDP8975cUhtTo/aNdeScFz3Qk9Ay2DFclVh7R
         XVIRhSMxxRMh1pUtkWuQnKLdhBnRYouKtRzLVIh8t/+ZIGbLt14kmmauif2UDAFYw+/z
         2hSMmahVyp9hWQja70iHCBeKFkOc3COiVlzuGVPEAgz0ohd/YqDVXuFTCnFI67ixuszo
         /MIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736119454; x=1736724254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tNL8g6yQ8ZIn0LQxZcY6OhMyHEMPrw1TWswVWziWz0A=;
        b=pSTK8nzrcLXckhFEjiDlVwb4wyban01jZt90zmCAcOcY98fwb/aqCHvUgDLA1PbOBK
         U9pRHMgyn4JUQVX4Co98eAHOajGxkY4mDBpbkKI594ztoETLu646vfrQLgBfpNO8wJ5r
         rlMdbrrDPmaVbjWqeFcps0IF+CEmGFateBOz7eXjWNaeXsGDlg3v/4vpxaH18RSPODPS
         dIkbnzsdq1NLJ50xVwwMf96fopuF60BYLronogg2Jb0eVOdZBQieaI/vWKjuhQ8INDDP
         OhwA4VU5/J+C8WA8w7KnfrnBahRFODWLGUsPAnaUK0i8K2LTPZhQvpfKrg1VsparEP/t
         bh/Q==
X-Gm-Message-State: AOJu0YwDAPs0BV/9llvNKzaDXhYhwtx1iVW7y1cLfPCPiM/RGhXE8hfi
	ahFnEEXMptR3EwiHDekTKMlFM+l1Rp6cAG27utNHItW4O94Mihgl3WTz3PN7
X-Gm-Gg: ASbGncuDC3utjwATyOtEzorFa1HEmSwbNF344M6SqWOEJriQPsucrwbMCRSjHkQHVBD
	mVnHRH9N4TZuJdEZv9TqG9nUNRdOxnJzCtsCVA+1h+q5N8z5dwywKxjqihWiR7w2ulSNSuhxlkT
	rUXLcLcURyNCtFQHYIRseKBRi850bCASeNIm7crR47kHBVkoohdD2wtzQCyPjRCvNQEaoDEU0mF
	zDsBQyYD6Rn4mb4GGAPRdPSP899xcztpb43BU7EhBrbhfo2jibs0L7OgqYdWJgyKFWSzg==
X-Google-Smtp-Source: AGHT+IHnLt30HZcl/iXoH2cvCL6inyU/sp3f3GEnwoo3MmDd0Ri6EU1A/lRYnaIDRJ85b0+SxTvlqA==
X-Received: by 2002:a05:6902:2582:b0:e4a:7154:9245 with SMTP id 3f1490d57ef6-e538c4235e7mr36354390276.51.1736119453923;
        Sun, 05 Jan 2025 15:24:13 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:fdb3:610:ea25:f87f])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e537cc1e91dsm9043004276.19.2025.01.05.15.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 15:24:13 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yogita Urade <yogita.urade@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 22/24] postgresql: upgrade 16.4 -> 16.5
Date: Sun,  5 Jan 2025 18:23:55 -0500
Message-ID: <20250105232358.1502946-22-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105232358.1502946-1-akuster808@gmail.com>
References: <20250105232358.1502946-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 23:24:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114652

From: Yogita Urade <yogita.urade@windriver.com>

Includes fix for CVE-2024-10976, CVE-2024-10977, CVE-2024-10978
and CVE-2024-10979

Changelog:
https://www.postgresql.org/docs/release/16.5/

0003-configure.ac-bypass-autoconf-2.69-version-check.patch
Refreshed for 16.5

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 54bbf1a630d9d4bf70afa4b184ac790b51d09d65)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...03-configure.ac-bypass-autoconf-2.69-version-check.patch | 6 +++---
 .../postgresql/{postgresql_16.4.bb => postgresql_16.5.bb}   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_16.4.bb => postgresql_16.5.bb} (86%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
index 342aeba85e..0388bc1b40 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -13,12 +13,12 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 65715a4..4ad6340 100644
+index df61ab4..b795f8c 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [16.4], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [16.5], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
@@ -28,5 +28,5 @@ index 65715a4..4ad6340 100644
  AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
  AC_CONFIG_AUX_DIR(config)
 -- 
-2.34.1
+2.40.0
 
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_16.4.bb b/meta-oe/recipes-dbs/postgresql/postgresql_16.5.bb
similarity index 86%
rename from meta-oe/recipes-dbs/postgresql/postgresql_16.4.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_16.5.bb
index 1a47369e4d..76498375b7 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_16.4.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_16.5.bb
@@ -11,6 +11,6 @@ SRC_URI += "\
    file://0005-postgresql-fix-ptest-failure-of-sysviews.patch \
 "
 
-SRC_URI[sha256sum] = "971766d645aa73e93b9ef4e3be44201b4f45b5477095b049125403f9f3386d6f"
+SRC_URI[sha256sum] = "a6cbbb7037f98cb8afa7d3970b7c48040cf02b115e39253a0c037a8bb8e778f0"
 
 CVE_STATUS[CVE-2017-8806] = "not-applicable-config: Ddoesn't apply to out configuration of postgresql so we can safely ignore it."
-- 
2.43.0


