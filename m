Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF10E7BD8F
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 10:59:01 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17272.1771239539863859209
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Feb 2026 02:58:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=KDjmHfxR;
 spf=pass (domain: mvista.com, ip: 209.85.214.181, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ab39b111b9so13308195ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 02:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1771239539; x=1771844339; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ie60jfQlzY9YlaS9ZawCeY3GB3x2qwMpGnvTfDWt1AQ=;
        b=KDjmHfxRSS/jRd7KpXOxVYaB+mgXhL2HyfZylAyPI4rfunYUMpT8UYEvmc1GWPW7RF
         DDAFvM8Vy0MmHFvQRalDD2mE5FQbRpgwfzgKYwQTC99uJCZ5lPRmhkuPn0NWRW0pxmX8
         WUUHYnwCT8acccpY/f5EpKhSJhUt7MO3nY/54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771239539; x=1771844339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ie60jfQlzY9YlaS9ZawCeY3GB3x2qwMpGnvTfDWt1AQ=;
        b=drSL0mwRnkAydvZlkGot0XKhO8yQ4XP7du1FlBvwrclQ5OdAyuBPeA7ax/ZHCBfN7X
         RKbGzMhHo4Dl9l67nV0q8NhWZCDk7IIeVJ7leJTR7Qm5clw7ZaQANj2SPagu/cIktIQF
         F0zNQQBtrr9r4E3dUXcVKXvx+aGXTlSlpZnqzRChF4YrE49nGYGwCG9KW2786+WVd3uz
         1Oj64zMOYGt9csFHghrUnUwlnNH1yQw6L2HMfvwbLIKJI5/MfIdwnANZhFQmtEAJYgp3
         Nc5naLmL7oMJmxYPPVD8B51tKN6UYB0bYYIEEmqGAvV18ZDoJM2qBze3iwZh198AkSyo
         sT8Q==
X-Gm-Message-State: AOJu0YxPYmUuA/GXRAowM/hOVk5p0VPyvtpoBnh/7ChAdaGJsxYvw/jr
	OPxsxc5ao4q0DSsJjLls5msadseVaUMkSzpEbYKmTZKjVAeKllkGJcliSaq/XEMJ2Gz6DO8qok5
	uT34n7XM=
X-Gm-Gg: AZuq6aLIH9nDCYY3P9U/aC9fWrRuYqSq2Hj9NbFAxHpiVIeS/1qy6qw3NMlRhic4NR8
	VUJGBUiEkm5fr/hA0mFSIE7cS6LsSVN7JAnVLY5tejThfMgwlr/7vdP5GGHl5E6kOxrLFj56zeh
	moZt9I/MTY4yV//HlooBoR3HdfmtLjumokVoj1LpIbwUY+ZTnwWUIOa+gg4g9Y5C3ybubbtdLpS
	u6RevIB8TpyG8S5/YLxgPwQd59BDHvq5l/gYtMWEJdCEjAtvHihNJdj9LUGIYJUQypmc9oSsn8U
	AdpkD6i+zoNlfc1AL5VhhoxFp+joNN63A81nVNK9N9o2bMC7drNvYxYU37Y2OCym1ixlIYXrsG3
	3ogj0YInEfpZd+HSShMdK5vqBi29ujmJR832aCRj9KXCq3mkcW/6L+64pLquOURUw/9Q3IZWhlw
	VxsxpVwClDhxtUPuODV/+hRtUb1UyH2VZv
X-Received: by 2002:a17:902:db0f:b0:2aa:de68:98c8 with SMTP id d9443c01a7336-2ad1740c141mr74061845ad.4.1771239538790;
        Mon, 16 Feb 2026 02:58:58 -0800 (PST)
Received: from MVIN00352.mvista.com ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d58dcsm67345575ad.48.2026.02.16.02.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 02:58:58 -0800 (PST)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][scarthgap][patch] postgresql: upgrade 16.11 -> 16.12
Date: Mon, 16 Feb 2026 16:28:50 +0530
Message-ID: <20260216105850.174837-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 10:59:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124413

License-Update: Update license year to 2026

Includes fix for CVE-2026-2003 CVE-2026-2004 CVE-2026-2005 CVE-2026-2006

Changelog:
https://www.postgresql.org/docs/release/16.12/

Refreshed 0003-configure.ac-bypass-autoconf-2.69-version-check.patch for
16.12

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 ...0003-configure.ac-bypass-autoconf-2.69-version-check.patch | 2 +-
 .../postgresql/{postgresql_16.11.bb => postgresql_16.12.bb}   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_16.11.bb => postgresql_16.12.bb} (75%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
index f5ee9a2e2b..64d82e52c6 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -18,7 +18,7 @@ index 4f25567..b6b1eff 100644
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [16.11], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [16.12], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_16.11.bb b/meta-oe/recipes-dbs/postgresql/postgresql_16.12.bb
similarity index 75%
rename from meta-oe/recipes-dbs/postgresql/postgresql_16.11.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_16.12.bb
index 11c830c820..fca2a487b4 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_16.11.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_16.12.bb
@@ -1,6 +1,6 @@
 require postgresql.inc
 
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=08b6032a749e67f6e3de84ea8e466933"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=55760ee57ce4e51e4b57f0801ff032dd"
 
 SRC_URI += "\
    file://not-check-libperl.patch \
@@ -11,6 +11,6 @@ SRC_URI += "\
    file://0005-postgresql-fix-ptest-failure-of-sysviews.patch \
 "
 
-SRC_URI[sha256sum] = "6deb08c23d03d77d8f8bd1c14049eeef64aef8968fd8891df2dfc0b42f178eac"
+SRC_URI[sha256sum] = "b253ee949303ef5df00e24002600da4fb37e5ccfafa78718c6ea6a936b4d97f1"
 
 CVE_STATUS[CVE-2017-8806] = "not-applicable-config: Doesn't apply to our configuration of postgresql so we can safely ignore it."
-- 
2.43.0


