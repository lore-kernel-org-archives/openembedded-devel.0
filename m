Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web08.10700.1618586993223576461
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Apr 2021 08:29:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ccg7BPbQ;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so14823398pjv.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Apr 2021 08:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=erePMjNQv7zBt7Ih/3vuPC7aNskvkgJoADKFDLwEOCM=;
        b=Ccg7BPbQ/kh7zVwQgp0bAmSkV6bGPiKXxKe4IOYWGw3dgLQ41crzbM1pWKB1dXy9hb
         LJ51x2HhcZLfm35jgxqwhpLDuH1Y+4fi3lQSvXgEDgvxp66how+YL3cwzBuIyWdkNv6/
         VjZmN0C2B0im/lRuCvo5cQsKvODuj0NkZ95GeiBjVgH5qGktw5dXbnh2gU93yxuTXfEr
         uDrQqBx9ZZvJKFvmHgIN5opNci5x8t1xVBghhV6YV8Ne7GOuuSWAAbH68YRICBsqVH3n
         K518exACGm/OY1MdZ18SCGKljm/SCyfLfXJ9Z7rUn5XfQARi7ER/8N6NcN4CjKTXdak0
         B5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=erePMjNQv7zBt7Ih/3vuPC7aNskvkgJoADKFDLwEOCM=;
        b=Neab8FP3ToyuOOyUvrOcVQsYHubxWJ13Np1LpYyrJrN5TkMERYZI/YwoqubiKakgqL
         CTvGTh4MlwXSIiIRJy1ikwUH0f8uesisn93jkHE2/H9uYeh02H8FRIkmA+JABQW1vbqy
         QQSvTDISFVTm7YqNXVJzp+z3AkmcUCcrAvlAkQLE1aXQoc9gfMEa4OSQjY0daOBtyxiq
         TupXVPJa6dR4PNWKdQxSF0mPB4ztiDU6nLUZV6wMowenoDEQ4raY12tMjUowpWZnkVKb
         2t/AjQrmM00PA5N+8r/oB/9KAuam/vVo0RkDV4DEhqWJn9GcGKEGo0KVrlIsYhJGH29V
         tsOQ==
X-Gm-Message-State: AOAM530rJzjpzmn08K1raSdj+vm87u450MRKBOU2XFweJCjNZfTh+xAN
	Cwlu4JYf+g0JRKXePd4AaZuKLj59GfHfvg==
X-Google-Smtp-Source: ABdhPJzOJBzap287Kc6ScAfe1LLWdNiYeL3foLlL9FaeU9LNMpF2179Xmd+ESOGdovP1+Q/GW0Mw7g==
X-Received: by 2002:a17:90a:bb0c:: with SMTP id u12mr10491655pjr.234.1618586992428;
        Fri, 16 Apr 2021 08:29:52 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::630])
        by smtp.gmail.com with ESMTPSA id m11sm5784310pgs.4.2021.04.16.08.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 08:29:52 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] nss: Re-enable -Werror
Date: Fri, 16 Apr 2021 08:29:50 -0700
Message-Id: <20210416152950.1879518-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GCC-11 has fixed the problem [1]

[1] https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=da879e01ecd35737c18be1da3324f4560aba1961
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/nss/nss_3.63.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-support/nss/nss_3.63.bb b/meta-oe/recipes-support/nss/nss_3.63.bb
index ab2c43d019..b7192a46d1 100644
--- a/meta-oe/recipes-support/nss/nss_3.63.bb
+++ b/meta-oe/recipes-support/nss/nss_3.63.bb
@@ -121,8 +121,6 @@ do_compile() {
     fi
 
     export NSS_DISABLE_GTESTS=1
-    # see https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99420
-    export NSS_ENABLE_WERROR=0
     # We can modify CC in the environment, but if we set it via an
     # argument to make, nsinstall, a host program, will also build with it!
     #
-- 
2.31.1

