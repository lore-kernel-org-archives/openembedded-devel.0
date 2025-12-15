Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF6D9D5B857
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 17:02:26 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54015.1765818138390352783
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Dec 2025 09:02:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q5PnLUI/;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4775ae5684fso16532305e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 09:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765818137; x=1766422937; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rX+uLAP57V7Qd+BWctkkDAgpyHnYOn6W/7psOCIsjQk=;
        b=Q5PnLUI/oZZfJ7SDnRfCsFnyTA9HAvkBwxImx1HhKdOpvNiVDgVRUU9rUq+j6iZDGx
         vujRW+zJJwbhKYoTkfYhW0GNxOI3JOf+c2SPurS2kZzKjv3w0PbcENw5XK4DfRByNBWY
         8BZ8hP1/1zzCrqmerl/sCl3ZVMiaMzohtHjZUkMuIBeQYWRzexSBbL9vCFr1fmASM9X2
         HVH7RyX45/v+wkScmd+uQs5VHdaUHblCaRN77igzL/SSDKqgYNNgMZD5/uReX6zTR1nR
         7XE2qGh2wMAr2DFdrX6atTFm9dIghwnDc81dN5fsOVbBtYEiHAk1UnAJmTlREc4tt4SY
         NJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765818137; x=1766422937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rX+uLAP57V7Qd+BWctkkDAgpyHnYOn6W/7psOCIsjQk=;
        b=K45natUGBwLcWb0FQB96fIkevnh9/KFRQrUIWSPrvwNahwvLLE4DB/3wyKtlgesggq
         XrFEU+VXWu62fiWEZP1bBgmCckmRA0IyNKxn1cgnNOuHxSbJTxuPYbMVBQDdNeGP/OVY
         vXGyRA/CvTcHZpnhllqQtwi5T4WVB1jWTLje8nKQgWersigkwNwEtEhBH4PH7nzSWD1A
         qptwSLqzTZXkO1BkicZAP3bvZmkq4j1saPNrD3gKXEo+5pFqVC4t/KBsTUCyp5cOxdcq
         vAm9UGc49hYf2DK34I1Gp1O7yMPd6AmWSVzskmt2gF1stlelhZTCdBXGWe9PsU1cmZ/1
         WvNg==
X-Gm-Message-State: AOJu0YxR6Yf2dfj9RLLcmNS9f2dv8ziboFZ4DgnCfjOwo9rq5mFQl2aI
	tEHfkuXHF+rAen3UorOARq6FlybeegLO4NSAs7DeHp49QWaM76PUPUiWEzUxTA==
X-Gm-Gg: AY/fxX7OdT5y2uab5lqgf8SeDGrhH1WDzEPYizbw/nzUOrpENhZaNrQhNBmG2DS2J/W
	YpuAwykm8Y39wteypuCJ6lch8jQPoX57HzGRyz3lkMK6M1yTNjihXsOz7QxFWkoFe2tAdYMnz8e
	xiTvmpwQumSB7nDv+7kJD+r0t/+Uvjehyo+fvF6xn2QcQx4CSXuDUGCTB9PaoKbapV5n5xAB9Gh
	riyq2Fmmxm6lOqbZDsdkJ/3UuwnfgEU55iY/e9Sd+auTH2zjkrEzBKyEZzJ03IIZ7xmabzddY/3
	xmoS12yrSBI808K1B8SWgmYY0ajBNlHaOXqWn/DlPRoETJXUBHeiuOIB82XPjZpEjzly5tPthGS
	HkbKJgLJC5vMC4herUQVEB/iMG5vz5D2FJ4Kj/n55X6vT0a+ZtKTQ7bM121lOCilGRJ7hcpU4T4
	D9kSxM6ABZ3Mzu/u0Otjk=
X-Google-Smtp-Source: AGHT+IEo+qQEhO7ebXxubnVXDCsZhD7y5vmmEhtohunW4vFQY7GfHLOOHiDFJGapNdgd7J5rpLvj3g==
X-Received: by 2002:a05:600c:37c8:b0:477:1bb6:17e5 with SMTP id 5b1f17b1804b1-47a8f90d9f7mr130074855e9.30.1765818136586;
        Mon, 15 Dec 2025 09:02:16 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4b6e43sm74418205e9.2.2025.12.15.09.02.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 09:02:15 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/3] postgresql: upgrade 17.6 -> 17.7
Date: Mon, 15 Dec 2025 18:02:10 +0100
Message-ID: <20251215170211.573880-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215170211.573880-1-skandigraun@gmail.com>
References: <20251215170211.573880-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 17:02:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122662

It contains fixes for CVE-2025-12817 and CVE-2025-12818.

Changelog:
https://www.postgresql.org/docs/release/17.7/

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...0003-configure.ac-bypass-autoconf-2.69-version-check.patch | 2 +-
 .../postgresql/{postgresql_17.6.bb => postgresql_17.7.bb}     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_17.6.bb => postgresql_17.7.bb} (69%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
index 95070b98c5..ce19bacc47 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -18,7 +18,7 @@ index 642dbde..af37179 100644
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [17.6], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [17.7], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_17.6.bb b/meta-oe/recipes-dbs/postgresql/postgresql_17.7.bb
similarity index 69%
rename from meta-oe/recipes-dbs/postgresql/postgresql_17.6.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_17.7.bb
index 9ddb40fefa..81b096194c 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_17.6.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_17.7.bb
@@ -12,6 +12,6 @@ SRC_URI += "\
    file://0001-tcl.m4-Recognize-tclsh9.patch \
 "
 
-SRC_URI[sha256sum] = "e0630a3600aea27511715563259ec2111cd5f4353a4b040e0be827f94cd7a8b0"
+SRC_URI[sha256sum] = "ef9e343302eccd33112f1b2f0247be493cb5768313adeb558b02de8797a2e9b5"
 
-CVE_STATUS[CVE-2017-8806] = "not-applicable-config: Ddoesn't apply to out configuration of postgresql so we can safely ignore it."
+CVE_STATUS[CVE-2017-8806] = "not-applicable-config: Doesn't apply to our configuration of postgresql so we can safely ignore it."

