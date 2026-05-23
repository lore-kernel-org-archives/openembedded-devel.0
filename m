Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE7ACD4F54
	for <webhook@archiver.kernel.org>; Sat, 23 May 2026 05:01:22 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3037.1779512481401465335
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2026 22:01:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HF3YRPJZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-83945063f70so4293811b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 22:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779512481; x=1780117281; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqGhMObn1dShxsFHZfy6KGywkMrpq38Ynf1qR1bqIi0=;
        b=HF3YRPJZ+9pKNPNOsbmYGxPgvZ3Pqy2ZM1XyMXPh4a+f2/n5kTEGnCt+bAn4GGZyXG
         4fF5jx0bRMmePJ2NhiFsUrwOZ7BelJWTv0bBSC0c/aNacmQmMXiHpIINUYCQ8miq2Ypv
         5FN1mRrwe2dPsGYoZeN0JSw+FpuisIOwIEO13bzJye2drb6pcJGv31de+f4dP57PX9Rw
         PlR/pPCKHk4Q/VD0p9bdfDtJowpUTUskt5TmRd1qzqbLcwWvKV4i70o3Of2mZ1MP52ID
         bQ1JJSvStlDfKlOH/BjmZckcucKD9mmmQ740pCZsVb+RUGria3nMLcHbDddJxuG28V4q
         gFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779512481; x=1780117281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YqGhMObn1dShxsFHZfy6KGywkMrpq38Ynf1qR1bqIi0=;
        b=G31E+eq5qeq4/h1rgOhSg/U6edjxpwgR8tT66FsYuFQlywheeR78OKtd6xh1k66ZYE
         7IoS9Ljg7aSwCKOHVlQwL/0QWwq3LDFs8kR+ufUuYCsqFsvOWMIlYrFS1dZNpoKx5cgI
         br3ZkHUHdLGda60R/xzZNwNEHfR5b4MWNB/KazVV1FkYliWvbkAIYmxbyRYmu3LNqr9m
         Oe4iyWMB9+NINgFrCUBHnxJRYvur/JnDrKXnTewcdqP0X6Imj8xZT8AOHpMU2HtYq7NW
         bOu50qfeW5bGPUF9wjYTuCPecRRlWfTXQhYSeHhN0+X81X008bAeIqusNQGu832fqx/D
         wYPA==
X-Gm-Message-State: AOJu0YwM7dVINXdd7/dEaNQHQS3qrX7WTS/WcnC5aK+D+A9avtDMzmOD
	JXaByYr31qkn62pEzUgfiFloYFXpq460uo2z9fUTxg9u1TnNHy/Cs5K/cwKaCluc
X-Gm-Gg: Acq92OGdzhJvyV36S5ar5k1E0TovjOVIzfFCrYLPhJiVFnILJiR+Gg9mQvwLL1BbATA
	7E/tL6CBASvWE8x4iuAip01UGVSgkqmZWZIwp87IxVxuT/9oLxHmNv9Quc8wWu/1gwSWUbbJnvG
	sg/yxjTOI91NUl5G4WZBl9IQlCN9WPzSK+CR04SHCRQymQBwuMcGXMUQ2R4RAqKDb+Is0kHGny4
	3m2Nz4y0CVRVnle3p4/sxMGzdeg29eFiasFwQz/PAJFj63FwSi6ih5vlt0r6YPwsrQ1qBaDJbZu
	n24p4Y9IdfMWQ+EjgFPQqHlvIeKjt6aPWkz/AhgwjVJt4Un74FNspB9Z1UAMl6YZfz97xutkuuP
	P956H55LaHCmpKl+xg5nFKuIHPoIMncj3c7FfxBk4mGebM/+hcHfipksLuh1Hq3IgsgtOKzjAW9
	pMucQLzgctFSWYkZiVJmfvGvzrgZKgMeeKabRI
X-Received: by 2002:aa7:8894:0:b0:829:8083:472b with SMTP id d2e1a72fcca58-84160b84e5cmr4805215b3a.4.1779512480785;
        Fri, 22 May 2026 22:01:20 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ad2ca6sm3423107b3a.5.2026.05.22.22.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 22:01:20 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Guocai He <guocai.he.cn@windriver.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 15/25] postgresql: upgrade 17.8 -> 17.10
Date: Sat, 23 May 2026 17:00:17 +1200
Message-ID: <20260523050028.848327-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
References: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 May 2026 05:01:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127165

From: Guocai He <guocai.he.cn@windriver.com>

Refreshed 0003-configure.ac-bypass-autoconf-2.69-version-check.patch
for 17.10

Includes fix for CVE-2026-6472, CVE-2026-6473, CVE-2026-6474, CVE-2026-6475,
CVE-2026-6476, CVE-2026-6477, CVE-2026-6478, CVE-2026-6479, CVE-2026-6637,
CVE-2026-6638 CVE-2026-6575

Release Notes:
https://www.postgresql.org/docs/release/17.10/

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 83cad3966c320b236137a5b033374e59f87ca220)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../0003-configure.ac-bypass-autoconf-2.69-version-check.patch  | 2 +-
 .../postgresql/{postgresql_17.8.bb => postgresql_17.10.bb}      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_17.8.bb => postgresql_17.10.bb} (87%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
index b91228aedd..ef8c524fad 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -18,7 +18,7 @@ index 856b091..646394c 100644
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [17.8], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [17.10], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_17.8.bb b/meta-oe/recipes-dbs/postgresql/postgresql_17.10.bb
similarity index 87%
rename from meta-oe/recipes-dbs/postgresql/postgresql_17.8.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_17.10.bb
index ad1e9704cc..98b8d4891a 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_17.8.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_17.10.bb
@@ -12,6 +12,6 @@ SRC_URI += "\
    file://0001-tcl.m4-Recognize-tclsh9.patch \
 "
 
-SRC_URI[sha256sum] = "a88d195dd93730452d0cfa1a11896720d6d1ba084bc2be7d7fc557fa4e4158a0"
+SRC_URI[sha256sum] = "078a03516dcdbdb705fecaf415ea3d13a956c589e46f09fed68a06fb00598c90"
 
 CVE_STATUS[CVE-2017-8806] = "not-applicable-config: Doesn't apply to our configuration of postgresql so we can safely ignore it."

