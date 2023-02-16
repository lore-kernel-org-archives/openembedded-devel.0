Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C91CAC64ED8
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 12:28:09 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.8792.1676550486973091220
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Feb 2023 04:28:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PqM5aUlG;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id m12so1848264qth.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 04:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0YvE0AJsotUsASDvhcESwnm5/NzTvbi3QqREZggjgoQ=;
        b=PqM5aUlGQCAtrjkLXSeAcR8CeUU5SnBkdxpZirZ5l7u7dD9shjnaqBohfvgej6lkwf
         1/KC9P8nkaCM6v+2ylpY6UZ3V6ZgoeBy6fzr6zPG6lYuVLyOxtr7asQAOEnhyHFMdgl5
         aZH6eotsZPteRUi/k8LF0GduO8bRflwWYxkHIcxA81eu+3665cIsCp7mJcVsViX/+TVN
         2yC9+Ue/LstDwfCZLoDwm9RxODPtP1IpKwMYHF+jVNPG9eNTCEVni8Wv7+k86IsXxbEk
         1dynQesSN8/59F+LMWQmHExfdXd3FEupr2irLzCAy+k1DMnIsFaPv2NN8u83JK8ayUa3
         zUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0YvE0AJsotUsASDvhcESwnm5/NzTvbi3QqREZggjgoQ=;
        b=RjPpO8ozCS4U2FtpZqAHiPT8ufAWBLC5A/G8gUorMhySPHeVu2PJZkBAZtLJBJdAb1
         uBFFR+k1Zoxj1XPtppkyrkaBP4ApQ8KIgfX/chBonzgb/ztrPgQFdP9TsOoyetGdj6t1
         i/eCsR3RNpaVDrXfvnj8v1arsBNJE2d4nqe8MMGAhRKK1AulqruHztOP2pjOOsEOnxcS
         oKE6mJ4JW0ORipga4xbrOMqzxM7bmBqnePn+f5BxlDef6ywRrrl17/z1wCIgEOvD3xLK
         rMQYxAZwTk1oDlLE2WT4hsObWDBygmBDwxUy/dArWSY8Tv6+ZHKOavCqUEH5HQ+Kgpts
         A4UA==
X-Gm-Message-State: AO0yUKWzVfALQQ/2fYW4Jz+ca0o3lfcCwCJuWLjWRtqQ/rVjvwvK8T0S
	CvZDMpefY/LZgOvXjvf9J0igazHKXGY=
X-Google-Smtp-Source: AK7set9XoyITh88naazo2TUXkP7foERnLQ/1Y0A5EmWgK94z9IbtH4TEos5tVLyYHiQEoUupRDV7ug==
X-Received: by 2002:ac8:5983:0:b0:3b9:b43e:5733 with SMTP id e3-20020ac85983000000b003b9b43e5733mr9031619qte.61.1676550485916;
        Thu, 16 Feb 2023 04:28:05 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:2ead:d6b6:b6e2:9e85])
        by smtp.gmail.com with ESMTPSA id t127-20020a379185000000b0073b4d9e2e8dsm1102362qkd.43.2023.02.16.04.28.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 04:28:05 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 09/15] python3-django: upgrade 4.1.3 -> 4.1.6
Date: Thu, 16 Feb 2023 07:27:19 -0500
Message-Id: <f0f0be3cda38e3a0c0c3290a65b4aace54f51873.1676550369.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1676550369.git.akuster808@gmail.com>
References: <cover.1676550369.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 12:28:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101111

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c3b0591ddd0c65bc9a75a06dc599a7e90c760dbb)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/{python3-django_4.1.3.bb => python3-django_4.1.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.1.3.bb => python3-django_4.1.6.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.1.3.bb b/meta-python/recipes-devtools/python/python3-django_4.1.6.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-django_4.1.3.bb
rename to meta-python/recipes-devtools/python/python3-django_4.1.6.bb
index 6d800982af..e54398c456 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.1.6.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "678bbfc8604eb246ed54e2063f0765f13b321a50526bdc8cb1f943eda7fa31f1"
+SRC_URI[sha256sum] = "bceb0fe1a386781af0788cae4108622756cd05e7775448deec04a71ddf87685d"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.25.1


