Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA3FC531DC
	for <webhook@archiver.kernel.org>; Fri, 16 Aug 2024 05:49:42 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.141983.1723787380531667234
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Aug 2024 22:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=d7rS2W03;
 spf=pass (domain: mvista.com, ip: 209.85.215.182, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7c6aee8e8daso1123914a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Aug 2024 22:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1723787379; x=1724392179; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qKezbrD9aDtRf0EVNqJ6lRIjys7ndb45vQlGACBMZ+E=;
        b=d7rS2W03ZKggIJD94xBf4ISY1nt+Owt/9F09b2zAYNRwQKLieXa5jHzCnQ2D/N5aXc
         rPlH2dbxM+Kcf39DmURI1qrUDQGeXquH3gybp3wRgjjSUvgNqDgWCvomNT1tTaZdr2HC
         UqUwiz3olQOsn49kBas58vn9l/H7tfHmtjhJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723787379; x=1724392179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qKezbrD9aDtRf0EVNqJ6lRIjys7ndb45vQlGACBMZ+E=;
        b=RLmdP/ry74zGB+L3D1Gat05WVRKdCrboT78IkdarK/P1o9OJjVbN74ir9dLY6kVEak
         okARmNQBdEvPcWDv01sXFpX/3cWNlQOP/me4cZUryPhA9c+rlgcNd4nHkqqd4qoc8AaU
         4gl5hhvar9pfzsOXPlLm3GwCKbbmubYi+wMjfobGs3REetjb+zf5Uz44FH4hjb8E0uOW
         q6JjVlwByUKW79rzx4pe5bUOyFCojgP0ZpjMUHCw28peNFfyZoAOc6Gr3z5sZ1LJ3Kuz
         6XC64hc6li38B6pcq/w4KEaRl56k1u6YwNpr48/4LSLdTQ35HhNa8lrntnmkJ493N7VQ
         dmRA==
X-Gm-Message-State: AOJu0Yy29D7ywm7em8vhPXeDSA7IhkIu8RRCA3dJi3rJBIjW5Id5xAud
	UoYqnCiO2GCsMDNbAqx6VNUSIO1GK82t83KyWycXUvVuyIJU5kQi8SWISeRfcxlo7maMGO2+lNP
	LMY8=
X-Google-Smtp-Source: AGHT+IHuapYzJdwBh3y4jz/DxNrEh9k290sZ4doKoxZSawBUwVSqufvjT+wTi/shvxE0F0R33wtFig==
X-Received: by 2002:a05:6a20:6f05:b0:1c4:ba7c:741c with SMTP id adf61e73a8af0-1c904f91357mr2553604637.21.1723787379279;
        Thu, 15 Aug 2024 22:49:39 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2401:4900:882e:6861:ce8e:8795:7d71:6257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f03a16b2sm18583745ad.268.2024.08.15.22.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 22:49:38 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][kirkstone][PATCH] postgresql: upgrade 14.11 -> 14.13
Date: Fri, 16 Aug 2024 11:19:18 +0530
Message-Id: <20240816054918.164662-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Aug 2024 05:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111828

From: Vijay Anusuri <vanusuri@mvista.com>

Addresses CVEs CVE-2024-4317 & CVE-2024-7348 and other bug fixes.

Release notes are available at:
https://www.postgresql.org/docs/release/14.13/
https://www.postgresql.org/docs/release/14.12/

0001-configure.ac-bypass-autoconf-2.69-version-check.patch
refreshed for new version.

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 ...0001-configure.ac-bypass-autoconf-2.69-version-check.patch | 4 ++--
 .../postgresql/{postgresql_14.11.bb => postgresql_14.13.bb}   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_14.11.bb => postgresql_14.13.bb} (84%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
index 807eac219..d0a343491 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -14,12 +14,12 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index e59dc99..41b4732 100644
+index af01483..0a62ebf 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [14.11], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [14.13], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.11.bb b/meta-oe/recipes-dbs/postgresql/postgresql_14.13.bb
similarity index 84%
rename from meta-oe/recipes-dbs/postgresql/postgresql_14.11.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_14.13.bb
index 8a8c3b9f1..989e9777b 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_14.11.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.13.bb
@@ -11,7 +11,7 @@ SRC_URI += "\
    file://0001-postgresql-fix-ptest-failure-of-sysviews.patch \
 "
 
-SRC_URI[sha256sum] = "a670bd7dce22dcad4297b261136b3b1d4a09a6f541719562aa14ca63bf2968a8"
+SRC_URI[sha256sum] = "59aa3c4b495ab26a9ec69f3ad0a0228c51f0fe6facf3634dfad4d1197d613a56"
 
 CVE_CHECK_IGNORE += "\
    CVE-2017-8806 \
-- 
2.25.1


