Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.43842.1589813408738857220
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qxyGvOWu;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 5so2121761pjd.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=uNc0m499lGMUwr7jlVNy1LzMlH63QFTXd/mjOLE+jNc=;
        b=qxyGvOWuOVT7OMY8MHey+k42J7OpvK0hjfNrsmWGwwNEhOo4KRrl58rryJcUZ/omsb
         OXBXQ7mDRPiVTxyLVLcIt8Dq3Skx1XhEx5gXnq66PfNNychczu3qgV1fYckWQuRXlZwT
         lGX8h2COG2Mr5LUxTCYFxkWLygHxLpXkk+4OnRMfqlqWYOuYpSSQkfcMTDbg3TMqxUWF
         AuaMZovhhjADHSPZTVhx04tzhzqts73+/ij8tMEbDQfBo59Q6seBvCGjAwE0OhbSxAI5
         r2Bu7LCHWpi4JhO1rNgI7hkAgJ/sIHO1qv9bUlKfECG9WLpxbyShzbBUnf9N67xOzq3d
         HWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=uNc0m499lGMUwr7jlVNy1LzMlH63QFTXd/mjOLE+jNc=;
        b=tYdBbxnhhrM4hW+Jaj/vg10p+i7XSceYa1fgj8DOnZYrvL2Ia7k6uUPBqCv/QyC/Ee
         8ibWmphDAIHp5LjuXUncRlXs4RULwo+W0oU8qC22G1HIgMwW+oVfPKtJNxyIh4lOguIL
         3r15h/be6vsPwmzwDfoBfOcAUQRt44J48MEAeV9xtIkupQx63CTcXZiwGkt2+UjVcwkG
         EXVZq48hA0Kw9Mv7J7ns1CxUptzDKG00riWoXiNliPWQMMTF0z6ua6e+aJuhZnc2daOl
         Jw3NywY5Vi9ZSfpR7mm1VoDAlkwqrPsBEmQ5fUO6eWBRDo70fys+E2cVxhcu5NTRISY4
         vAEg==
X-Gm-Message-State: AOAM5307zX7uVMAcz7bMN9cO8ZH7TVyGldUbodDIQge3YmVJ3YgpfWy1
	gqATKmvmEEZAffaa7w7m4qvdpNvr
X-Google-Smtp-Source: ABdhPJwYlzQEGtceYaCZ0ZB0Y9M/qFMXN3ct90LCjUdCAgOaYBHptuDSgL51/zHrc/6KO2YwR9zcnw==
X-Received: by 2002:a17:902:8496:: with SMTP id c22mr16745860plo.182.1589813407834;
        Mon, 18 May 2020 07:50:07 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:07 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 01/57] php: fix zip package config
Date: Mon, 18 May 2020 07:49:06 -0700
Message-Id: <99f2050d08dff7bbf4a547ffccb6b30263481cd5.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>

From: Konrad Weihmann <kweihmann@outlook.com>

--enable-zip and --with-libzip were removed in PHP 7.x.
These are replaced by --with-zip --with-zlib-dir.

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6690afa59e5bb698e752c3346b8470e40f9d9daa)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/php/php_7.4.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/php/php_7.4.4.bb b/meta-oe/recipes-devtools/php/php_7.4.4.bb
index ff4c28e133..c1784a78d9 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.4.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.4.bb
@@ -81,7 +81,7 @@ PACKAGECONFIG ??= "mysql sqlite3 imap opcache openssl \
 "
 PACKAGECONFIG_class-native = ""
 
-PACKAGECONFIG[zip] = "--enable-zip --with-libzip=${STAGING_EXECPREFIXDIR},,libzip"
+PACKAGECONFIG[zip] = "--with-zip --with-zlib-dir=${STAGING_EXECPREFIXDIR},,libzip"
 
 PACKAGECONFIG[mysql] = "--with-mysqli=mysqlnd \
                         --with-pdo-mysql=mysqlnd \
-- 
2.17.1

