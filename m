Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03180C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 04:58:59 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.1283.1740459533547018424
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Feb 2025 20:58:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=J+AttSM6;
 spf=pass (domain: mvista.com, ip: 209.85.216.41, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2fc4418c0e1so10589806a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Feb 2025 20:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1740459532; x=1741064332; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vKcfBuglMIOqTRQZg0JirBd2oGcwH5d1h9pql1evs8c=;
        b=J+AttSM6UJ6giK5vxhVnhojOrDg1qCxlCP0Pnq67om8ejzDR7unr1uf015dU9ghu5L
         rYjkhZxbJs9XvbHUeBy5z0ebPrKfxFteD1k5PLrVrxYM6r2irwG05c2v2FgibtuqIJLW
         OWFcAyffZ1Cr35cDoBnov9BMhU6S050FnVFUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740459532; x=1741064332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vKcfBuglMIOqTRQZg0JirBd2oGcwH5d1h9pql1evs8c=;
        b=qK9Gj39FKX43dflmvOWrBHKUrzqC7c/L+JibODFzgoJF/3rLGwOYcRmfjNfYvQrgCs
         F0XhVPM7leqrMUKkkuJQCvPSdoeVUvYO7gW7KMHDh8wJ6NuVKjpnErIeRfbenKiUP/FJ
         Tg0CWjnh8+rap7ocjQHriRyqyuqxIMvaH3u0AsW+t8ylsgTI3EzDqIiBe/3g2qf4ANVB
         KAbVwd2kjvjmAHjHUT61kUWk0qk/9o5QP5ON4CwIchnjWEQJMxByHdlqHxkmcXUebTiB
         gGlHah/L5f/mXmKzOU4/A1lpUPGjKKE6YAENsYzYLN988jnSYt5EbX774NW3kumVTCqA
         O4/g==
X-Gm-Message-State: AOJu0Yyw0uwdXvBlOYlfEH7/C7uVIEjqNitAA3+CwzG0N69xNGaAUIjh
	QIYRACMY9eArCsi0saSJIKHC0NXzUGp/dxuYw2C4mAjqo2rNWiqlJHan0cHAJWfbgn0g8fg2V7c
	k7e8=
X-Gm-Gg: ASbGncsRqjLezMti65+5GVmjaU+2+oChQKs8FKmbZ4DXK0OLaARIDlQsiA7fBJ4kXtH
	mXVCUYAVwqQGRiRuh1cpDF7lnPFvOHzCSh46xLh5RQNI04EUpbXZYd7em9b6SM2w9pHiBPh0uYG
	Y1GRPm1I1dfo/jzlEA5GfCaiP+iuLQWFn8quwb7N36uk9KWAsPZ655YgQyunlWs/gIWDabssUvd
	efuiNxXTfw5+5xfAd3bole5Uscoi1FpnBMvrmDHukdhlZ/C4SAaumGO2pNDIortNXoBfga3m7DC
	tI+ha6V8Ka2iIxk3uiU6aomytJpPoaTX7nrZEw==
X-Google-Smtp-Source: AGHT+IH3ygIyuoiZZW9rlE2dxTHO5OqtQ+49ZwEs2UEgnIvoxcAgjpX9Cq6CIzn6GG3UZLj89PS8Qw==
X-Received: by 2002:a17:90b:2d87:b0:2fa:30e9:2051 with SMTP id 98e67ed59e1d1-2fccc114e8fmr31577108a91.5.1740459532481;
        Mon, 24 Feb 2025 20:58:52 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.200.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb0499d8sm7429626a91.11.2025.02.24.20.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 20:58:51 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][PATCH] postgresql: upgrade 16.5 -> 16.8
Date: Tue, 25 Feb 2025 10:28:39 +0530
Message-Id: <20250225045839.10527-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 04:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115558

From: Vijay Anusuri <vanusuri@mvista.com>

License-Update: Update license year to 2025

Includes fix for CVE-2025-1094

Changelog:
https://www.postgresql.org/docs/release/16.8/

Refreshed 0003-configure.ac-bypass-autoconf-2.69-version-check.patch for
16.8

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 ...0003-configure.ac-bypass-autoconf-2.69-version-check.patch | 2 +-
 .../postgresql/{postgresql_16.5.bb => postgresql_16.8.bb}     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_16.5.bb => postgresql_16.8.bb} (76%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
index 0388bc1b40..9584cfcb16 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -18,7 +18,7 @@ index df61ab4..b795f8c 100644
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [16.5], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [16.8], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_16.5.bb b/meta-oe/recipes-dbs/postgresql/postgresql_16.8.bb
similarity index 76%
rename from meta-oe/recipes-dbs/postgresql/postgresql_16.5.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_16.8.bb
index 1379333b2c..0843d90750 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_16.5.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_16.8.bb
@@ -1,6 +1,6 @@
 require postgresql.inc
 
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=89afbb2d7716371015101c2b2cb4297a"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d5dd73e90ee1a572679460ee67233fcc"
 
 SRC_URI += "\
    file://not-check-libperl.patch \
@@ -12,6 +12,6 @@ SRC_URI += "\
    file://0001-tcl.m4-Recognize-tclsh9.patch \
 "
 
-SRC_URI[sha256sum] = "a6cbbb7037f98cb8afa7d3970b7c48040cf02b115e39253a0c037a8bb8e778f0"
+SRC_URI[sha256sum] = "9468083a56ce0ee7d294601b74dad3dd9fc69d87aff61f0a9fb63c813ff7efd8"
 
 CVE_STATUS[CVE-2017-8806] = "not-applicable-config: Ddoesn't apply to out configuration of postgresql so we can safely ignore it."
-- 
2.25.1


