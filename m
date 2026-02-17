Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1FD0E68178
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 11:58:55 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10431.1771329528130405387
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Feb 2026 03:58:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=KJiVR1/y;
 spf=pass (domain: mvista.com, ip: 209.85.210.181, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-823210d1d8eso1989718b3a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 03:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1771329527; x=1771934327; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6oq0JmdQW87cKg+tsvrvCBgr5ge4Opklion10WGFXiI=;
        b=KJiVR1/y8ZPHRYmUAaP4HanKCgCnWDbVEPf15FgxUcqh2QtmfFMZ/JRyi6Wd9Z2SUC
         suX+PJNZaED9Su+apfOyp/+cApBi7mdnBeYWc2hD2CuNv7ipAMb5Yvsrcl/1stJKLKGq
         2t5wysxhLynqRnd30HgFmhMr3JNq39/EYMgOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771329527; x=1771934327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6oq0JmdQW87cKg+tsvrvCBgr5ge4Opklion10WGFXiI=;
        b=MZouw7LFzIgwFU4t9vbqdlC3HxWAxEmpjFj3pVoec4WsnEb/vm0KRSxThWBXo2x5gd
         b9syHe3pbm7hwkYgZQReKjVaPKaGgvmxXdj4+jeNDU0UueYjyJSEXOfN8KRrTtSvYUc0
         oX2FhgsTdRMGrm/GfX67cb5EnfPcj17OQTYj62ic95thQOUrxxjIV9gEg9tPtJ2eH0Ny
         hSOs/zED4ciUu1VApQnIx5hMFA9x+5CS26wiXMgVlizxxyX5/c84JB4/HU9JBQduT/6f
         LrNPQ878SVxJp2l8G6V0pWx4qtNhfbC5+P62oO3oGm8svEMoTTR+y8m/MpjQFO8Fp1KT
         phAw==
X-Gm-Message-State: AOJu0Yxl19AosWeEvNnIEPl4rcqdTRCgHEl2+7xMigSOKjetQG1S95W9
	oZVo/TAdeQY42IpyZGfzhh8GhycKQ/2czcFCVf8OfXgeN+puEEaTxOhvSCMrPcRftMkQYqHhjAq
	F1wthe5I=
X-Gm-Gg: AZuq6aJyqd2nbazmudV8NIRLopFGh0RHy9WDP5akIvhIYExGfGwahunAV5mOneIRn+g
	0dPxaNUJGdGciEn7n7aH7vMVsRtg7+eYVP9aXWO73yNIj7L420v5X4PR+O9OPme9gBqrjvyEUhp
	bKWzZfGmSC6zDheUS2LfkJv2HqQ+NNYJP0FrtAwdhMYADhwR3Ru4UGN7ihYX+/vQZxvTVfeLW5T
	Uay1FpJ0KHWHCvIQ0bv3FD7VNWbowAHGBmp71eP4XNeaUopgwbvVkI7NCqv3qgK6hWzr0wyKHbD
	CXT/2pS/pckdYAxCw+K82Mb0H3vkdzD/qwp11dKa4ppwlAOpsB7MeI5+GWU4zeSNfE8zvRsm8eI
	yFnILQn5jQ9mU0eelvZ/E/saMt7uT1z4EDcbhlAmsNpBXJX/6CoQQGVzHBblh8Z+Jlzef0KNSwD
	5t+cUU9ZsFy2opVZo/JUoC0QunQhasQsZhOZpP+c2Q9Y7s96A=
X-Received: by 2002:a05:6a00:194d:b0:81f:5acb:55e5 with SMTP id d2e1a72fcca58-824d94ce27amr11054052b3a.2.1771329527290;
        Tue, 17 Feb 2026 03:58:47 -0800 (PST)
Received: from MVIN00013.mvista.com ([103.250.136.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b94009sm13777577b3a.52.2026.02.17.03.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 03:58:46 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-oe][kirkstone][PATCH] postgresql: upgrade 14.20 -> 14.21
Date: Tue, 17 Feb 2026 17:28:33 +0530
Message-ID: <20260217115833.113044-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 11:58:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124449

It contains Security fixes for CVE-2026-2003, CVE-2026-2004,
CVE-2026-2005, CVE-2026-2006 and CVE-2026-2007.
It also contains other bug fixes and for more details refer Release note.

0001-configure.ac-bypass-autoconf-2.69-version-check.patch
refreshed for 14.21

Release notes: https://www.postgresql.org/docs/release/14.21/

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 ...0001-configure.ac-bypass-autoconf-2.69-version-check.patch | 4 ++--
 .../postgresql/{postgresql_14.20.bb => postgresql_14.21.bb}   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_14.20.bb => postgresql_14.21.bb} (71%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
index 76363cd26d..81cfc47c4f 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -13,12 +13,12 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index bbbb204..0919d2b 100644
+index bc0b44d..1a616ac 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [14.20], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [14.21], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.20.bb b/meta-oe/recipes-dbs/postgresql/postgresql_14.21.bb
similarity index 71%
rename from meta-oe/recipes-dbs/postgresql/postgresql_14.20.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_14.21.bb
index 04d8723f15..64af5fd07d 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_14.20.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.21.bb
@@ -1,6 +1,6 @@
 require postgresql.inc
 
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=08b6032a749e67f6e3de84ea8e466933"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=10ad6fd3d4b124238bc893ba2904cf0f"
 
 SRC_URI += "\
    file://not-check-libperl.patch \
@@ -11,7 +11,7 @@ SRC_URI += "\
    file://0001-postgresql-fix-ptest-failure-of-sysviews.patch \
 "
 
-SRC_URI[sha256sum] = "7527f10f1640761bc280ad97d105d286d0cf72e54d36d78cf68e5e5f752b646b"
+SRC_URI[sha256sum] = "5b30f19347efff32b6e09ed2cdff0b04e9aee913ec9bb7414de2b7c17b17f1f9"
 
 CVE_CHECK_IGNORE += "\
    CVE-2017-8806 \
-- 
2.50.1


