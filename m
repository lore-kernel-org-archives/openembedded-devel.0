Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA6BEC43219
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 16:26:59 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web08.162.1651422419039829561
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 May 2022 09:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=i520Jj/s;
 spf=pass (domain: gmail.com, ip: 209.85.216.48,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 cu23-20020a17090afa9700b001d98d8e53b7so11145960pjb.0
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 May 2022 09:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ReztLPrqSoSV4D6o1pTjt0iOxfV20SET0oR6bQKi9NM=;
        b=i520Jj/s20o+eGp7ZAR5SvtYIO9UE3P7dNZTj/9EZKbfN+jfNq0YV47pFFrspV7aCa
         O0VkOXIz4ryUTRsWPH/KcHEFbMvaxe8VQneKqXykd8UgwpbyppUQh83hpI3MLQwf4ayP
         uogNv0cHQBaWztRwkhFmO20/HbdyrhHshKjZCepuRVFLz4FnV87U3cWNQdvKxsU5mDPM
         J0g9ACvqmedQv4C28wbDtC1klq4W2AlFt8G8p20VVh1zRTsdxRls80Lx/8JzQD5hP6FO
         0DQ5T+4VkOjE8k+hsOlrhJvvaoW+j76l3HPQHzyeBhmvaPaUR3Bhzp35/e93EWW8zM2T
         cBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ReztLPrqSoSV4D6o1pTjt0iOxfV20SET0oR6bQKi9NM=;
        b=GBlnt0IEfEljpUKyLGNj2I8y8GKKTr/FVAxLaUfSlgQ8bGWJqnQyyVnqNqVd0RGkpC
         KjFSlC6/NurZVHk8RgEKyvW288Bo0fvTWWH8vZ0UpeTWZuBElZ6lc8CP39HI4JQG7pzy
         3NJ47BCC1CTyBVDUxEfwbdGa5h3IDnMz4jfIVvHPnPRSncMO1mH0wwgxgdVClm+yrdDz
         My13IL5+FW7zJQQ8YF66cBrg1pDP5o9neEerlkRHmN0rzdL8Sv83HNIJiDSsFgPoQFLJ
         pWhU4XL2+JVXMYRjDb6d2bGP4lfY2v7HpYL9nytb8gwgsweSO3fyVUKgKwZdENp0HkUe
         Jaog==
X-Gm-Message-State: AOAM5302iKlgII35xXgO7LSmx7X7nvC+mG0y2CVebz79ejmP7lQ2hFpG
	nlBCl2YF/pdRrLxKbJLIcUuP0yncx6iC4Q==
X-Google-Smtp-Source: 
 ABdhPJysWdGfGIUjQUm64nnq3PkfCVnBwIXjNAKXrcCT6WOQbMphjeLFdlxb6ISn7XJO4CcAIf664w==
X-Received: by 2002:a17:902:9a8c:b0:15a:a21:b52a with SMTP id
 w12-20020a1709029a8c00b0015a0a21b52amr8098467plp.86.1651422418312;
        Sun, 01 May 2022 09:26:58 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:9a0c:5968:29f0:efcf])
        by smtp.gmail.com with ESMTPSA id
 h19-20020a170902f2d300b0015e8d4eb243sm3063569plc.141.2022.05.01.09.26.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 09:26:57 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 07/10] packagegroup-meta-python.bb: update pkg group
Date: Sun,  1 May 2022 09:26:40 -0700
Message-Id: <20220501162643.513646-8-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220501162643.513646-1-akuster808@gmail.com>
References: <20220501162643.513646-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 May 2022 16:26:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96919

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 20492e9522..bee5298058 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -209,6 +209,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-lazy-object-proxy \
     python3-libconf \
     python3-license-expression \
+    python3-ldap \
     python3-lockfile \
     python3-lorem \
     python3-lrparsing \
-- 
2.25.1


