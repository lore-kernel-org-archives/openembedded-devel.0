Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F42C433EF
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 02:03:44 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web12.79647.1656986617834701547
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 19:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LFkf9HR/;
 spf=pass (domain: gmail.com, ip: 209.85.160.174,
 mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id g14so11884589qto.9
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 19:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LAcu89e211xndPkhWxFXhziRuZrxBGRRkQwWgwTnjDc=;
        b=LFkf9HR/ZrNsHJ4Q1pxDApWJLLc37njS2hnLHILS87vh0gpg5VVUclNa6oqdaP+laS
         D9kPAe0ALAlMI1Nf2xRfWJb2uC1KXzEsbyBMM5LNmbjIvqcyAcLxXzkgovAfsV6Rq7fR
         VrcKRhGvAUA2SEcXewzMgfjoG8xP5BwJdWbSMFzZ7r8MRZFhgPxYwiQGGsmOdBxsRxjq
         Ar1v6eJ3afxeTX90fTjDw9RAkn0gQNf2vnffRkhrzlcubIsw2hQJRod6pHQB19/s6BL4
         jh/HypXbxcPv/x21XdGuuZTQXJT9gz9NpHnYbk4vWJ+ztpTHfoU6LtmhgL7VNR8/oOXr
         2+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LAcu89e211xndPkhWxFXhziRuZrxBGRRkQwWgwTnjDc=;
        b=EoXstHu8EgmOwjEsZR4NWceUYFl6q4TTQZhOyOIGJxViDa9C8AmmyQ4t+kITiD7hbr
         IN7EZyEAxhT6o3BENFRQSLPO+HYRFe8ElCDK4I7F/JC/VnpiZHQMgl+kDRZpVM9P0M58
         yQeZIyWzHUugZ4BTE1h6EaL3SwYSiC2mQDq3B2o6Tc+hx4ePDQtMspfTc3NMrFuKjc6/
         8mGgly4TR+1CooyfLI7IGAny1+4c3auL4hXZxb5fdPDJejmtid/gtcItwqtQFoxH4sC1
         IXhFAihy8+lnrYbZmLpbgh/oSlQQGc+VJWUjCHeBpNDiz6BCK7OwZeB1lZyCkBpE0PO6
         s/Yg==
X-Gm-Message-State: AJIora/w/Nq3aZGc6Z/LlgzYJvEN4cKz3tvu5liZdYp5NABEh67Kfpcp
	+6vz3j126anuaXYE1zXNh4okbeGWukM=
X-Google-Smtp-Source: 
 AGRyM1uTR6gkE3b3gQxyKBxO8yOnt09dzw6uYcyyrK7CZqpFfT9u0Ip8dNHv6ImmnqvOia5dBZrcog==
X-Received: by 2002:a05:6214:19cd:b0:472:fdc3:9226 with SMTP id
 j13-20020a05621419cd00b00472fdc39226mr3921689qvc.81.1656986616548;
        Mon, 04 Jul 2022 19:03:36 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:14b1:7390:8d3d:13ec:9f3e:a504])
        by smtp.gmail.com with ESMTPSA id
 br14-20020a05620a460e00b006a6ce613c7csm21725220qkb.89.2022.07.04.19.03.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 19:03:36 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 3/5] postgresql: upgrade 14.3 -> 14.4
Date: Mon,  4 Jul 2022 22:03:27 -0400
Message-Id: 
 <e4c5f5b3593c4dc058053e92b28306bf7e765d75.1656986538.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656986538.git.akuster808@gmail.com>
References: <cover.1656986538.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Jul 2022 02:03:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97698

From: wangmy <wangmy@fujitsu.com>

0001-configure.ac-bypass-autoconf-2.69-version-check.patch
refreshed for new version.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a9db38fa9a1fc50eca653816a7bfeda0251f0b6b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...01-configure.ac-bypass-autoconf-2.69-version-check.patch | 6 +++---
 .../postgresql/{postgresql_14.3.bb => postgresql_14.4.bb}   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_14.3.bb => postgresql_14.4.bb} (80%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
index 78f24585e8..2256bccece 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -1,4 +1,4 @@
-From f7084ba49758a6b8db46b917b7c0f831bd65a08f Mon Sep 17 00:00:00 2001
+From 07e605015fad0621c3e67133ff9330a5c6318daa Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Fri, 5 Feb 2021 17:15:42 -0500
 Subject: [PATCH] configure.ac: bypass autoconf 2.69 version check
@@ -14,12 +14,12 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index d3c55f2..9120184 100644
+index 04ef7be..0eb595b 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [14.3], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [14.4], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.3.bb b/meta-oe/recipes-dbs/postgresql/postgresql_14.4.bb
similarity index 80%
rename from meta-oe/recipes-dbs/postgresql/postgresql_14.3.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_14.4.bb
index c686c9b358..01a6ee635e 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_14.3.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.4.bb
@@ -10,4 +10,4 @@ SRC_URI += "\
    file://remove_duplicate.patch \
 "
 
-SRC_URI[sha256sum] = "279057368bf59a919c05ada8f95c5e04abb43e74b9a2a69c3d46a20e07a9af38"
+SRC_URI[sha256sum] = "c23b6237c5231c791511bdc79098617d6852e9e3bdf360efd8b5d15a1a3d8f6a"
-- 
2.25.1


