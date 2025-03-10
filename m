Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87CE9C28B2E
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 08:08:15 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.32361.1741594087919030646
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Mar 2025 01:08:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=AucKjsSw;
 spf=pass (domain: mvista.com, ip: 209.85.216.41, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ff6e91cff5so5408131a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 01:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1741594087; x=1742198887; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B7I5FBanFayck/4h74icGJx7PyWXaP4gxOMFHjrY490=;
        b=AucKjsSwmxUW2d2hTj5cT2uFiZe2QBPJ6C7L138E15jJju+1hKZuOoLJhK0oAmnMt/
         hxPk0c4B7BlG3hXUf9pcmDznOrempqq6IhfoXhPhYp7sj95BPFuC9LxlPvM8441o7uMx
         rouQzDEZl/k/b/Bm0d0UYW2uaJ+CTiHTiccMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741594087; x=1742198887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B7I5FBanFayck/4h74icGJx7PyWXaP4gxOMFHjrY490=;
        b=pTBpA2XJTRAOPm9Ah59o32bec/JRvGfGXwjVgAVudkiCAFqwmZpwGUbHDB5Ym0eNdk
         FjIZvgyi+qo+JP9jw9dMpsrAfAFyalNzZ2FX2aWCkEczAprvq02i8DTXw0O+PThf/s87
         +0qEGRG2a5BS0ZNVVzekkyI307bBnZH+DOVUPnFmVSk1VoNyTcp76ISTv9hH0wn1/0xC
         0eETk1ojJHIf4CC9ygme0U0J0tBiiMOJTVXzGCgP/AR7lXmiKDCeOdzD3O2+0BNkYzOk
         eQGaKfK3Ue1l3+JaztJLQScaxs7cUXp6/bmShWkB+zrmT04P6SNX/uG2mvVSO0XL20Ve
         U2vg==
X-Gm-Message-State: AOJu0YzJURfds6OlzQFjzK5WE+AfWQDayipl//IMQd0a/x0aE0ILCYZg
	Bu7wwNfDOjhPSbp64vTr1huW8xfKdSUZ/mCkgUf1HtjtsthwwSBY2fB0nFXFN/v3jJsoENMq+jM
	wWZI=
X-Gm-Gg: ASbGnctXl7+R4PChw6twMZSPRhog6foEpOeY6/Ys2moRuv06mGJ+ZYXtgutkG+n1itq
	Qm/dxKsCrPOU8WtVIoMP83wj24buW+m2AGMTCsq+zLjqXXoF9B9rwRCjzRH09GjnAIcFwCEXPFd
	yXsJvqj1NTfCTAXovyZPKDqrpPL4NTTPG84yed3nH8HDMQcAQTAWZ5TOP8HqC/o86sgHdyQTqa4
	ftdBWH0axldPXqWIhbpO3DDrNuGuxpNpKwJT2lBe9x3l3g/InuKl03OWT0hZ8q4oiugImhV8ZD0
	gknaYcteEES1LFOvFDyYjfvFPwAn8TFLb34dYaRNUwKQpNn28g16fMd/
X-Google-Smtp-Source: AGHT+IEOfkd6vCMyiBOoaIBHA2C9zx2VJesIX3jF3lDrmMNQqDhnLx2ZvfyzQkg17Wo6ai40JICHNQ==
X-Received: by 2002:a17:90b:180b:b0:2ff:5357:1c7f with SMTP id 98e67ed59e1d1-2ff7cf3d0bfmr18054945a91.30.1741594086827;
        Mon, 10 Mar 2025 01:08:06 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.233.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff4e7ff96esm9187409a91.35.2025.03.10.01.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 01:08:06 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][scarthgap][PATCH v2] postgresql: upgrade 16.5 -> 16.8
Date: Mon, 10 Mar 2025 13:37:57 +0530
Message-Id: <20250310080757.166674-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 08:08:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115822

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
 rename meta-oe/recipes-dbs/postgresql/{postgresql_16.5.bb => postgresql_16.8.bb} (75%)

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
similarity index 75%
rename from meta-oe/recipes-dbs/postgresql/postgresql_16.5.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_16.8.bb
index 76498375b7..918ad13e63 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_16.5.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_16.8.bb
@@ -1,6 +1,6 @@
 require postgresql.inc
 
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=89afbb2d7716371015101c2b2cb4297a"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d5dd73e90ee1a572679460ee67233fcc"
 
 SRC_URI += "\
    file://not-check-libperl.patch \
@@ -11,6 +11,6 @@ SRC_URI += "\
    file://0005-postgresql-fix-ptest-failure-of-sysviews.patch \
 "
 
-SRC_URI[sha256sum] = "a6cbbb7037f98cb8afa7d3970b7c48040cf02b115e39253a0c037a8bb8e778f0"
+SRC_URI[sha256sum] = "9468083a56ce0ee7d294601b74dad3dd9fc69d87aff61f0a9fb63c813ff7efd8"
 
 CVE_STATUS[CVE-2017-8806] = "not-applicable-config: Ddoesn't apply to out configuration of postgresql so we can safely ignore it."
-- 
2.25.1


