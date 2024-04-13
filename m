Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 711CBC04FF6
	for <webhook@archiver.kernel.org>; Sat, 13 Apr 2024 06:07:06 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.5642.1712988416874573401
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Apr 2024 23:06:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U8g83UUr;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1e4bf0b3e06so15594865ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Apr 2024 23:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712988416; x=1713593216; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kK1pL04xJIbAIzeREzIyLls8CZysSWAYT/KhYIS96Yc=;
        b=U8g83UUrRwX05DLEu3KIMgBExL8GwIyb7gFRaOHdiADO1J+Rs8etIUoyEcXXNQdU5O
         t0oiPk9+OSjtbl+iwwmX8lRR7JPMS/cNJP1bUR+Z5qIwuZI1c3D4i0kbrOqaYgvZGJ9O
         ENJq14VO+DuU4GZYwl2W5YA/+ygoOu7PTZnw+nN3tyMu0xI7TChz2bZGORe/Ycr3VqOO
         NB5DUeteoiXF4i/fY0yTCnEgvzIcrFIfW1DxpbQAFEYIdDBHcoYT2y/D62wgQRNT/Nb6
         hYJV8RDG3ikiiUPc/ZvgVmaNkhbhNmsLbQZiUuG+vtIe3BBFUrNzNScLc2mdqb0VZ6ig
         vhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712988416; x=1713593216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kK1pL04xJIbAIzeREzIyLls8CZysSWAYT/KhYIS96Yc=;
        b=RMH0KpSB+9oAzkT5YMWcwHh/LJ3Ex5JtZKEasHkQxnU8p2JANdClRK0WoRM+j1s5Vj
         gfoMXWhzomk28SEC0WeFVlxtEm6I8RyfY7wP/1HimG2hfE3TSnvQnSfd5XWwQoIdKRgl
         6bTWI9CYs+qR5+V0S16jgndndwUmQfsjsGO9+wvjkKGz7w4s36oqhuY/1xpitaoUfzhD
         S6bcJ3teV7JgGZqInDVIjZjRzUYMba3huXPVflvrn59Cfs+taBuapO2NlUkTjl0QCptp
         8IP8kVf9PF6HqeF7bjoKjtaN8dDT0hDeyyGC3xygJBWtgHtgLp1ofVxgs5qYtCDAGqny
         nzKQ==
X-Gm-Message-State: AOJu0YwYtfYLMY0HFwaL2PPDf3f/863HYOt7gIl9uecIzCYZnXZfvil+
	yoAHPF9Z7BPWZW4bwpAx9z+1AUXeOWKHBd8d7qDohp9EKwu+EieM5zMlOcl+
X-Google-Smtp-Source: AGHT+IES2FxXggxOY+m41SVnz3UhxeP8tGbLn0LnKPTNWUXSYF3Vtpz648PWS6q/6a1pKb7aXGdQTA==
X-Received: by 2002:a17:903:184:b0:1e4:3f8c:93ec with SMTP id z4-20020a170903018400b001e43f8c93ecmr5673211plg.60.1712988415835;
        Fri, 12 Apr 2024 23:06:55 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::d35b])
        by smtp.gmail.com with ESMTPSA id ju17-20020a170903429100b001e49428f313sm3953366plb.261.2024.04.12.23.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 23:06:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/4] unixodbc: Upgrade to 2.3.12
Date: Fri, 12 Apr 2024 23:06:50 -0700
Message-ID: <20240413060653.2147909-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Apr 2024 06:07:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109945

Brings
Fix iconv handle leak with pooling
Add windows encoding patch
Avoid failed build if clock_gettime() is not available
Allow passing in a entire connection string into iusql
Allow isql to handle SQL_SUCCESS_WITH_INFO from SQLPrepare
Add extra logging for ODBCINST connect settings
Allow allocated copy (instead of fixed length) for the connection string with pooling to allow any length
Export __clear_ini_cache() from odbcinst to allow explicitly clearing the ini cache
Fix seg fault when used with SQLAPI
Add --enable-utf8ini flag to add utf8 to WCHAR conversions in SQLGetPrivateProfileStringW
Allow longer error messages via GetDiag functions
Add --enable-singleenv to enable single shared env handle when using pooling

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../unixodbc/{unixodbc_2.3.11.bb => unixodbc_2.3.12.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/unixodbc/{unixodbc_2.3.11.bb => unixodbc_2.3.12.bb} (89%)

diff --git a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.11.bb b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb
similarity index 89%
rename from meta-oe/recipes-support/unixodbc/unixodbc_2.3.11.bb
rename to meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb
index 0ab4f8864d..ccdd666408 100644
--- a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.11.bb
+++ b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://www.unixodbc.org/unixODBC-${PV}.tar.gz \
            file://do-not-use-libltdl-source-directory.patch \
            file://0001-exe-Makefile.am-add-CROSS_LAUNCHER-to-run-odbc_confi.patch \
 "
-SRC_URI[sha256sum] = "d9e55c8e7118347e3c66c87338856dad1516b490fb7c756c1562a2c267c73b5c"
+SRC_URI[sha256sum] = "f210501445ce21bf607ba51ef8c125e10e22dffdffec377646462df5f01915ec"
 
 UPSTREAM_CHECK_REGEX = "unixODBC-(?P<pver>\d+(\.\d+)+)\.tar"
 
@@ -44,5 +44,5 @@ do_install:prepend() {
 }
 
 do_install:append() {
-    oe_multilib_header unixodbc.h unixODBC/config.h unixODBC/unixodbc_conf.h
+    oe_multilib_header unixodbc.h unixODBC/unixodbc_conf.h
 }
-- 
2.44.0


