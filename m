Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.9883.1613844200773461867
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Feb 2021 10:03:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aX5eoQTm;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id lw17so5269351pjb.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Feb 2021 10:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aJP1zLRD/eZ+GEP/jf0d9nKFdOFL27sgC7gjfGkSnHM=;
        b=aX5eoQTmNegyqS1Hzhc1ngZpee2AN+hOz3bM+cbDUw/zxSUBLw7w5aF2GFvAG/NSlO
         JoDgNQNyhC3/bHVohgsVnbVXSUXvhRtYo7wJQPeRZHQIzDPw927Buwgv8kaXsTzJHmcc
         +ADTYZZpXSXBjVK8dklNoMmlK/tNjoLb66//EdVb4YQhD6NtGkzVJx9f/WL/XVz54nkQ
         R8D83iK6AJgj30oC8ev6WtlwkCj1PlkGJrX5Cdv2CPy9mTaUsvyZY0N3u3R4wV+fWg9v
         sL9CsyuibaeOxloUHphM4ld884o7Y3vNmifCSsf/dReAJyS3XPkHKcj+qsuN9VSvkpXf
         xVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=aJP1zLRD/eZ+GEP/jf0d9nKFdOFL27sgC7gjfGkSnHM=;
        b=GfaaBNVmVVfJe+YN74JeHUPoKTW7iZxQLoWGQL4k9BgFX41oMFLf7d+Oflno37DgMG
         s26xOzIxL2ctygRT/eqpYqM8H3kP0GAotPZjq7fsAn7H+U0OP2LZt1iG2z6YQo1hb6YK
         lWYuJyzaf3cUdoFdnDbHminyqG2U9f6Myabgod3/viVOL679QbkWd7t+JCb8MPQ7/+L2
         MYn3kgHXowzF6K7BJRaVBYYKgeiA/gwX9jy8OEh2yVgVp4x64Ytpl8p+tFs+Sa95iyzx
         XzxbGc7cnQ8NGeHY/htNzkvjQlCG7QAAMzfpNjX1q8v1bGeK8uz5yIpf/+uYEGw+pP1j
         4P4g==
X-Gm-Message-State: AOAM5324D+wnA8n8p51AI86Qq/G5igmZwYzpohy8VTfKPgvwKaZAWEwG
	Pjh2LRVOC8/ICpP5SYQP2JNLb0+tB5KLAA==
X-Google-Smtp-Source: ABdhPJxiAh2KP5z/PU+qcE/4pJMNU6xLVFK7+11y6sQZcWBuL9mOy0x5oJZXVjhEU5m4G847CM0kuA==
X-Received: by 2002:a17:90a:a585:: with SMTP id b5mr14883311pjq.110.1613844200209;
        Sat, 20 Feb 2021 10:03:20 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:70a2:885b:8c45:14d6])
        by smtp.gmail.com with ESMTPSA id c17sm12106267pjq.17.2021.02.20.10.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Feb 2021 10:03:19 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][dunfell][PATCH 4/5] postgresql: Inherit python3targetconfig
Date: Sat, 20 Feb 2021 10:03:15 -0800
Message-Id: <20210220180316.17789-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210220180316.17789-1-akuster808@gmail.com>
References: <20210220180316.17789-1-akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

it now ends up searching native python shared libraries and tries to
link with it and fails on non-host architectures

recipe-sysroot-native/usr/lib/libpython3.9.so: file not recognized: file format not recognized
collect2: error: ld returned 1 exit status

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c499aaeef80b5af8d20521658449c4148f3d0806)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 572d4148267c6ff1b43dd3498020349cb0aa77c7)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-dbs/postgresql/postgresql.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index 5b5bfb0886..2294a3de42 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -36,7 +36,7 @@ LEAD_SONAME = "libpq.so"
 # LDFLAGS for shared libraries
 export LDFLAGS_SL = "${LDFLAGS}"
 
-inherit autotools pkgconfig perlnative python3native useradd update-rc.d systemd gettext cpan-base
+inherit autotools pkgconfig perlnative python3native python3targetconfig useradd update-rc.d systemd gettext cpan-base
 
 CFLAGS += "-I${STAGING_INCDIR}/${PYTHON_DIR} -I${STAGING_INCDIR}/tcl8.6"
 
-- 
2.17.1

