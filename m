Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BBEAC61DA4
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 17:06:06 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.13426.1676135165782082607
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Feb 2023 09:06:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eV9DWoyA;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id dt8so7080737oib.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 09:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0YvE0AJsotUsASDvhcESwnm5/NzTvbi3QqREZggjgoQ=;
        b=eV9DWoyAgfxD2W3a6dTtXbKL/dqH29TPL2cbCMmrDl44qNqhAXT1/11fOeYMoTXwuf
         +TURHg5AvMvwBv+4xCoXygDvOhBn865jUUwI9WVWoN3SpGHopBeH0avamNn+0ezHENbB
         bjSjQmvJ9X9mwQi5HBRKAIgHveJd/l+9v6Bunj/JVtw5/wnYa/r/ZR7go6KZb4hdjaup
         FSdFgl6N0/00TYac3ZhpVlW/hykF9VzmhpEmouC2yWxsXaFtPe6RMTGwZpMBRosAqror
         SL0BC3AQnedcjNLeOSh7kEfAr8GOj0IofX0nyruHWrEG/rWGSiCBGxwl4bX5GKgmIouU
         Q6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0YvE0AJsotUsASDvhcESwnm5/NzTvbi3QqREZggjgoQ=;
        b=vVK4Vwz6wdjOk83YB0qyk1Jt8HsOf8yqcG623G9/voFDOiuWkVACW64qy1YAIDxEXQ
         vLGL8wyyexTak57EBv+7GNMPe2S9o7xWHYpMC3pr5+rQUNmmrpPZ2VFt2kK68Vsir/xn
         6kv2V5aSBslR5EDqpGwXzx3crrnqIIW/sc8IypmZJo89jYCGCpR1VwnjaQnB34YlmMJs
         NUvnJ3n+dd1vt7TVjN44PDA8C+qw68J5K+M5IbdqAvqYOsobKcxuZNUbN8SKZEQ1eDY2
         b34wSU6/DY8y6mAvGu+w4E8Lm/AaXdUOTTbDy9KLkwvEUUHAgpb9gQHI8LelD8U/gV3b
         ZrWg==
X-Gm-Message-State: AO0yUKWnU/xiZFmBFEnGYFn8/5aW5fdo+9ds0iipaVwjSn9QddYjLoBE
	O6Pb5KMaohCFsuSb+dljW6BA59ah9zo=
X-Google-Smtp-Source: AK7set+zmFaNNo92U762i3C26zo+TpD5dDN6CfQan5In1GGZqmv+WB+yaS0pE2rVk+UpmrDH2lT88A==
X-Received: by 2002:aca:bdc3:0:b0:37a:2bf0:5017 with SMTP id n186-20020acabdc3000000b0037a2bf05017mr4913604oif.5.1676135164912;
        Sat, 11 Feb 2023 09:06:04 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:6c32:d739:9179:1de7])
        by smtp.gmail.com with ESMTPSA id p203-20020aca5bd4000000b0037d8670526esm275932oib.52.2023.02.11.09.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 09:06:04 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][langdale][PATCH 2/6] python3-django: upgrade 4.1.3 -> 4.1.6
Date: Sat, 11 Feb 2023 12:05:57 -0500
Message-Id: <20230211170601.3988339-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230211170601.3988339-1-akuster808@gmail.com>
References: <20230211170601.3988339-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 17:06:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101037

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


