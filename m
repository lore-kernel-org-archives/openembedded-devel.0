Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA862C433EF
	for <webhook@archiver.kernel.org>; Sat, 30 Oct 2021 18:06:25 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.22044.1635617184941355115
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 11:06:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PE+xy6WA;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 y14-20020a17090a2b4e00b001a5824f4918so6331524pjc.4
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 11:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g68Hnzm2S2lG9DCQTpz+uWvVuJ7gMm50opUNk5NYFhQ=;
        b=PE+xy6WA5YHaDIpWAb3UczNM88sYxM0iprYnjQXAucDds0WM6y1zkrCXj42WbDe6nP
         Us+7FIzZUyWVp71kQgWJLb1y5B83ieLd7rlt3GpifG80q5qbZ1v+DUmiE51aOxbV/it1
         nySK68fhfIoOiL75O7/FWxZLjhxzaudSUhPss7wbPEjduP731/Y1/C1OshnGKAKjW3NS
         UraxImDLNmqHWWuvb1RPwaePM2vZqZ5o3wCbe6EUGGfuDnDBwBm4gDqULV5Ai7bdzyBF
         FjcC+i7069Sr4ki5z+8+yrKOTGBxTCfn4GmTaHpCSWUkGDp/FKH+x3IIYzpvRBbdFhrZ
         8V1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g68Hnzm2S2lG9DCQTpz+uWvVuJ7gMm50opUNk5NYFhQ=;
        b=RuPM51+RdkjPbRsxuYHNQEdt4m6/bnZQnNaB4KpSSUQwj2yvwmE1yiiworXiRg/WHA
         RT1RisarrmB0RtzRQ5qdDgEU0yQUMlB6OckpiexNGoXpjlMdmjXKmx00kh/AZrLh6Fge
         SfWDkmOv6pltRSv0YRflTWyF8djl5SxZ9CczQSIgUL+m0IWPHGQMIUeW2GtHOe/lJ06A
         d2YCrMjxnE8rNAFXmhvzj+iqW0BVkQpVygBr+pwnaXY/AWEip25AVMVcZ9272qKZi4Mw
         5fA7HgtnfxodWBYB+5XmVcWmu8Qg6YTqUDydqMQ5eDN3h7UkRjky/+luHyLRnht5hB7c
         nqfg==
X-Gm-Message-State: AOAM531s3HOSoHja9kDCgTH/nsqNgZv2fPH0Z48S8zLIzgrgzXPdZLS4
	yW/Za+hHThdbcxUWJb5+W/jr4PBZVcI=
X-Google-Smtp-Source: 
 ABdhPJyCET77MKujWuW7x/uUqtcJFi1jSo0+KGkZqX64a5f2R+svgiwNfAqZUdjzRPnf+VuYiRTk6w==
X-Received: by 2002:a17:902:e5cb:b0:13f:25b7:4d50 with SMTP id
 u11-20020a170902e5cb00b0013f25b74d50mr16030668plf.38.1635617184190;
        Sat, 30 Oct 2021 11:06:24 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id y6sm217346pfa.70.2021.10.30.11.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 11:06:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 6/8] tiptop: Fix build with ncurses 6.3+
Date: Sat, 30 Oct 2021 11:06:16 -0700
Message-Id: <20211030180618.2200698-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211030180618.2200698-1-raj.khem@gmail.com>
References: <20211030180618.2200698-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Oct 2021 18:06:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93677

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ror-format-security-errors-with-mvwp.patch | 31 +++++++++++++++++++
 .../recipes-extended/tiptop/tiptop_2.3.1.bb   |  2 +-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/tiptop/tiptop/0001-Fix-a-lot-of-Werror-format-security-errors-with-mvwp.patch

diff --git a/meta-oe/recipes-extended/tiptop/tiptop/0001-Fix-a-lot-of-Werror-format-security-errors-with-mvwp.patch b/meta-oe/recipes-extended/tiptop/tiptop/0001-Fix-a-lot-of-Werror-format-security-errors-with-mvwp.patch
new file mode 100644
index 0000000000..6d5e293c7f
--- /dev/null
+++ b/meta-oe/recipes-extended/tiptop/tiptop/0001-Fix-a-lot-of-Werror-format-security-errors-with-mvwp.patch
@@ -0,0 +1,31 @@
+From 42e99eb6c727df7c9d49586803a4bf9933a9796b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 30 Oct 2021 10:52:42 -0700
+Subject: [PATCH] Fix a lot of -Werror=format-security errors with mvwprintw
+
+In all these places a non-constant is used as a format string which
+compiler complains about. Fix by using "%s" as format.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/helpwin.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/helpwin.c b/src/helpwin.c
+index 0d660f9..1623d9c 100644
+--- a/src/helpwin.c
++++ b/src/helpwin.c
+@@ -61,7 +61,7 @@ void show_help_win(WINDOW* win, screen_t* screen)
+     wattroff(win, A_REVERSE);
+ 
+   /* screen description */
+-  mvwprintw(win, 2, 1, screen->desc);
++  mvwprintw(win, 2, 1, "%s", screen->desc);
+ 
+   /* max size of column headers */
+   for(i = 0; i < n; i++) {
+-- 
+2.33.1
+
diff --git a/meta-oe/recipes-extended/tiptop/tiptop_2.3.1.bb b/meta-oe/recipes-extended/tiptop/tiptop_2.3.1.bb
index 31d0dae25c..8334bc47d8 100644
--- a/meta-oe/recipes-extended/tiptop/tiptop_2.3.1.bb
+++ b/meta-oe/recipes-extended/tiptop/tiptop_2.3.1.bb
@@ -8,8 +8,8 @@ SRC_URI = "http://tiptop.gforge.inria.fr/releases/${BP}.tar.gz \
            file://0001-Fix-parallel-build-problems-by-Adrian-Bunk.patch \
            file://0002-fix-reproducibility-of-build-process.patch \
            file://0001-Fix-build-when-S-B.patch \
+           file://0001-Fix-a-lot-of-Werror-format-security-errors-with-mvwp.patch \
            "
-SRC_URI[md5sum] = "46ca0fdf0236f02dd2b96d347626d2a2"
 SRC_URI[sha256sum] = "51c4449c95bba34f16b429729c2f58431490665d8093efaa8643b2e1d1084182"
 
 inherit autotools
-- 
2.33.1


