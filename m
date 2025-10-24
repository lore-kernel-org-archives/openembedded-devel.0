Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB98CCD1BF
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 17:57:56 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.24.1761328672220323522
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 10:57:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NrYaU4IM;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-475dab5a5acso1500765e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 10:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761328670; x=1761933470; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5aXTSomiMgkE0qx1lMjqH53UPtcHI3tn+40tWBpaHmA=;
        b=NrYaU4IMNDDiWdKuqrBfrmV2qVcwf6cmbUbgYZ/EhrJHFvCTuGd1+O/NA+nx0ZM9vu
         TbGJ1VfgyxyAmVHkBwFyD2ENLdDYhwNvymsXQEkCS6wyoDxMADNnBxLu+yKn3SM5k6F0
         eDQ3mL2JU3yjK7Xf5Jd1t69rXLIrzE7ItpJbc3LGsckaRUwZ4hPw57e+Tu3t/9tUnGrD
         /nIlYHJv4bTiCEJko7WFB53RYNJbDH6t/kus31Pa7Tq8HKg8xNUFLHKRBwZP81velDD2
         xzCwMZJ42NBBhe6Eq8I1N05mHi5REbdlXmJRD5IxQ8ZMNrUVEzcZvAAiCdAp5iGRe/dK
         9NsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761328671; x=1761933471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5aXTSomiMgkE0qx1lMjqH53UPtcHI3tn+40tWBpaHmA=;
        b=VA1gXJCSUALmae6JyVGoI/6KYriOH1gNutWdXhO3thhWyzxTauskCKFI6kRKR9Zp/R
         k4qb5HIAxKYHR9+UoWLXHJXOBIjsdMARaekCxsA3bu6ifJ5TGJx8lzbftmvi5l74o6PR
         +/qEmUMp/OrTB+1Nc736TdrTKV7yK2Yot3g7mFtma1MJeCpQTJ1oo6kcWy7BGrSVseMu
         mPhO683ZxMYoSHtQjDn74M2j2lm5Ls7T8oyNri6Rz7Pew3olcWZIJ0mpWmGlgJnqcYck
         IxFrQWNIuPXvA56ZAECij6U0VUswCX8IDU0fCs16066W/We6hRUZvzz4vZgcyMj9plSv
         l5ow==
X-Gm-Message-State: AOJu0Yx1tw8biLKwr38zP3B9xTF9DsEM1VgSsyd2iRZ7TEO6YMsJOu05
	nZcfb+4/3cgoIvO9C4hHcodt9CJ3xv4FvpggA0oN9HuHTtpqKbh22/0VajkYXA==
X-Gm-Gg: ASbGncucpTeeK7gh5mt1bXYlQ3Eo+jA+B1+lblZfc6LpjQ2sYFujTnwnKNVotXx1k8U
	oDwVzmLnuWDG3NzWZVr/RSNoVtUAZxBQlhqR8NO08A1pCR22v7EAJRPb74WPrRxJPruYrnHgLYr
	DerH5ELOc6QuNKZswn31S+xZzyQqlcDlCRYaDWDGWDROjl/AfMQ59NzZB3B9LOPoiAN+gOT0D5f
	VjqgwjfCj3HhiOJpmipGYiW/UrwcqwfDy3iRAJtppAdKvbmJLJcmD5XNQxomyK+tFuUt9XoNo7s
	exsibUd1S48TNEF5HdpN8bM0KT0F26cMLKPOBZd4qlzAtE5Q9NbHrXvPicVbUQRUK2WHnTf1vCl
	dg0AWZ5OHmhs+WmMaPzK2dbSKdN8UBeZB7vZArg6r6CDi1i+01ZeYuYXz3YZpQuRIY+O0hARKNQ
	==
X-Google-Smtp-Source: AGHT+IEr1buOfxsMlBjrOnBrvCb2tTQTW8L9zHDddJELXsgdC4bO59NXN4feFAcOYHuubhwcSkzt9w==
X-Received: by 2002:a05:600c:828a:b0:46e:39e1:fc3c with SMTP id 5b1f17b1804b1-4711787617amr211175975e9.5.1761328670547;
        Fri, 24 Oct 2025 10:57:50 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c43900e1sm192686925e9.17.2025.10.24.10.57.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 10:57:50 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 03/11] libdata-hexdump-perl: fix ptests
Date: Fri, 24 Oct 2025 19:57:39 +0200
Message-ID: <20251024175747.704498-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251024175747.704498-1-skandigraun@gmail.com>
References: <20251024175747.704498-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 17:57:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120961

Add missing dependencies.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-perl/conf/include/ptest-packagelists-meta-perl.inc     | 2 +-
 meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
index 62b984dc70..f4f2116569 100644
--- a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
+++ b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
@@ -13,6 +13,7 @@ PTESTS_FAST_META_PERL = "\
     libcrypt-openssl-random-perl \
     libcrypt-openssl-rsa-perl \
     libcgi-perl \
+    libdata-hexdump-perl \
     libdigest-hmac-perl \
     liberror-perl \
     libextutils-config-perl \
@@ -32,7 +33,6 @@ PTESTS_SLOW_META_PERL = "\
 
 PTESTS_PROBLEMS_META_PERL = "\
     libconfig-autoconf-perl \
-    libdata-hexdump-perl \
     libdbd-sqlite-perl \
     libdigest-sha1-perl \
     libfile-slurper-perl \
diff --git a/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb b/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
index 793889de6d..961478c15e 100644
--- a/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
+++ b/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
@@ -29,6 +29,8 @@ do_install_ptest () {
     install -m 0755 ${B}/t/* ${D}${PTEST_PATH}/t
 }
 
+RDEPENDS:${PN}-ptest += "perl-module-exporter perl-module-carp perl-module-filehandle"
+
 BBCLASSEXTEND = "native"
 
 ALTERNATIVES_PRIORITY = "100"

