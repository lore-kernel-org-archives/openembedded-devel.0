Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 964FFC28B2E
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 07:56:25 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.32257.1741593376308562849
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Mar 2025 00:56:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=MklBzBi3;
 spf=pass (domain: mvista.com, ip: 209.85.214.175, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-224100e9a5cso69875625ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 00:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1741593375; x=1742198175; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B7I5FBanFayck/4h74icGJx7PyWXaP4gxOMFHjrY490=;
        b=MklBzBi3pW+MpAXG9zXKEovS6CtBGhSJJ178CaKg+j0BD4cpXlIRu15V6Qg6evAXOO
         jqMOPFwbSICfypMwdGumZC3fK5EAGeIK+4RpqTxwn+uo/eZCcNO+N/8RLQD+xdfWE9gX
         n7Fz5eiCGM0PMMvDdg3RuJWAI3BEsfSpgh9Mw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741593375; x=1742198175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B7I5FBanFayck/4h74icGJx7PyWXaP4gxOMFHjrY490=;
        b=HJJQzuSLFj6y/gw2sc55z5eScJ5JdkfbEYmVMy7/ifBfjZMgBmz2wamvecGdgxT4fy
         Fv7nH/YJKCOf0rbMxdksp6unPkq59XeOE1g25E257TBGsw/kdIXS7Cm1qitQko21ZH2G
         qfWFX+KCuFUqoJ/sldfflAiOqUH//yYRt4nweZDyrl5qQPqMezGU7qPB7JjyTGGi2U6F
         bfHNkgAfC26deQM1n9/Ejvt5+1chLJj8iwRvhHojWwcarSyxMCzli35+3qaqogOM8QPR
         hDng8OqIfvPDJsPXdjXIT+ei01Z26mUarnpCNAhjchkmO8bS6INdq/Z9p1uh/KCscAqf
         OZBw==
X-Gm-Message-State: AOJu0YwVc5HFpfKxIFhyzU3oNBtZ5ES9qVD+tcHnUA3/6BuoxU+gyiWr
	zHsMSnX1e64dUEFUWAeolXxeipqF8v6E9Ac5icoUghXt2LLrSxM39rZthSRfzDnmTbp7Xg1mZ+a
	qerw=
X-Gm-Gg: ASbGncuQXEGm6HcAfbpx0j+56PVmI0q/Avvp0CVLyQN/LCVZKlgxYsYVIHKdQEF55g3
	M1UriqKqWn/8xPt7TBin2nz4KoKrXU2JKDji6GNZplvpfp63cuhWb/ba2J7XQhVAHsGVgi6nh05
	nwAQrQApSu1P7drhvZVP872As/FaZEoZsdErOeo0yRIG//gr15q/tYGkq77LLwMk+F7UAPXEknT
	ysCrdb/lMHx/eLCpbymDMesqxg6kfq4SjGDrNQUcmjMhrTy+lM/XKhhEHe8Szvt0YeQj4A0uLDR
	9is0lEY+i4p+jFJXaTA76r1TeNZjyr38AD4+W4KtceKDYlNzr4eUkRLv
X-Google-Smtp-Source: AGHT+IHbeAfLmCVDHGmzrholsM55XLRoyug8WUnf/dtpjexy7ik5R0HNORisMCp3O+rkqz/8G/L0eA==
X-Received: by 2002:a05:6a21:6186:b0:1f5:8605:9530 with SMTP id adf61e73a8af0-1f5860595d0mr1420631637.28.1741593375106;
        Mon, 10 Mar 2025 00:56:15 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.233.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736c486c490sm3393303b3a.168.2025.03.10.00.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 00:56:14 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH] postgresql: upgrade 16.5 -> 16.8
Date: Mon, 10 Mar 2025 13:26:02 +0530
Message-Id: <20250310075602.132528-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 07:56:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115820

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


