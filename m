Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.6278.1622029986247796418
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 04:53:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mMA7o0hI;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id q25so745917pfn.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 04:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=PcndndtMOOmfGlqhT2juaFltQaSlh8hly6eBWUF+d7k=;
        b=mMA7o0hI8A8E60HbtXYj66f9QEBUImk/JPpFsazPXI+sI8FiN1Kuk+yoXgwph/wnCw
         xd1vHPo+dE0SRu42Ryd0Kr4jk1RZgi+TQWbuW9HVMBvKPMVe90CQWdhvsl23wR9IHqZv
         UrF2QQvRKT8M1gfS5WNHjJQCJre+bNqm1aftzmRZ5Kwnoe4vgEM0XGOK3AkBN6b6BnzZ
         lRpFlv2iqR9UNa53gd1jSSk/TtaLguTyYbHNEMIU+YMffMlTxbaCdj7xHEA5ncsRbuqg
         C7J66Fkni7hCkdEYu66PxQhZUM06jJ20oMqjMH53tlPdxmAXJOVHfI9cTGGhiNqTUaXF
         uF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=PcndndtMOOmfGlqhT2juaFltQaSlh8hly6eBWUF+d7k=;
        b=cfnW8jGdXRBB9gicbxNLUs1ZrsXRmG1XR7BxPDkg/OpnOWZ7sToqZ4XtYrT0gNz/Yh
         zQldRfwYSgf3jyz/iXGhUp71Tz8YjjwN4wmHmMshPrAT8vkbnLpqOSdJNRi9Bs2wZrrv
         B8LEHADX8EZzOxqV3MJQptJKW3IbEU1BIxyJ38/IDPFBjlUv2MRlQMl5ooHrVPHmxeHh
         9DK+G3idsAxa+M+wC/9E2PD04IwUUT2YK+b52rmqZnMZv1K9/AY0XlYFGoVvppAhy4Kr
         S+YGcWGv+kQjAzl6lKK3W+xus0GeOfh3SNj6Eb3IW9Yniv3tvXMDFQt03v3uRzBBKnA7
         3Q2Q==
X-Gm-Message-State: AOAM531STkVNSDpaMnJLf6vlMpWt7QVzQuwcJU/t/QD8tZlkq0PQbYd0
	hpw/Sbb1Z/mcaxKChMRHeHHxd79CBdTilw==
X-Google-Smtp-Source: ABdhPJzLKkd1DqwT6wr9DLytuMOlo6C089eVEpr8lb2+27/lFZEUXJXrgunaIaG+mhFryq93h2oYJA==
X-Received: by 2002:a62:ab10:0:b029:2e8:d5a8:d635 with SMTP id p16-20020a62ab100000b02902e8d5a8d635mr17133008pff.74.1622029985680;
        Wed, 26 May 2021 04:53:05 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:68d3:e59c:b64:76e3])
        by smtp.gmail.com with ESMTPSA id h22sm15408818pfn.55.2021.05.26.04.53.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 04:53:05 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [harkknott 20/23] postgresql: upgrade 13.2 -> 13.3
Date: Wed, 26 May 2021 04:52:35 -0700
Message-Id: <5aa0e96d7ab3b2734335e6a9ba57a1ee34139d55.1622029873.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1622029873.git.akuster808@gmail.com>
References: <cover.1622029873.git.akuster808@gmail.com>

From: zangrc <zangrc.fnst@fujitsu.com>

Refresh the following patch:
0001-configure.in-bypass-autoconf-2.69-version-check.patch

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 48cb359db26f4fa0efb811c24a6306a56bf60483)
[Bug fix update]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0001-configure.in-bypass-autoconf-2.69-version-check.patch  | 2 +-
 .../postgresql/{postgresql_13.2.bb => postgresql_13.3.bb}       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_13.2.bb => postgresql_13.3.bb} (78%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.in-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0001-configure.in-bypass-autoconf-2.69-version-check.patch
index 970d750b13..45f283a02b 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-configure.in-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-configure.in-bypass-autoconf-2.69-version-check.patch
@@ -16,7 +16,7 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
 +++ b/configure.in
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch un
  
- AC_INIT([PostgreSQL], [13.2], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [13.3], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_13.2.bb b/meta-oe/recipes-dbs/postgresql/postgresql_13.3.bb
similarity index 78%
rename from meta-oe/recipes-dbs/postgresql/postgresql_13.2.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_13.3.bb
index ca8a6c7cee..862dd61bd6 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_13.2.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_13.3.bb
@@ -9,4 +9,4 @@ SRC_URI += "\
    file://0001-configure.in-bypass-autoconf-2.69-version-check.patch \
 "
 
-SRC_URI[sha256sum] = "5fd7fcd08db86f5b2aed28fcfaf9ae0aca8e9428561ac547764c2a2b0f41adfc"
+SRC_URI[sha256sum] = "3cd9454fa8c7a6255b6743b767700925ead1b9ab0d7a0f9dcb1151010f8eb4a1"
-- 
2.17.1

