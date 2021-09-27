Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D329C433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 15:38:06 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web12.799.1632757085127559708
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 08:38:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Nfr0Itz6;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id g2so12118403pfc.6
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 08:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/e7be613o0+1tA2bl4YyU9VqW4LQKQj+0L8HZ7ydL6k=;
        b=Nfr0Itz6Qu6DYNAyNXSJVkdru1O1ZHldvTcMZtghL263Jtp1qrKmGOJxCWlVwuqKUB
         86fJg0iZwKteO5EGwgArt0ezdJHQjD23ihwWPx9TPfysEE/BiWSHC1WOqzuP2BFBq3Xh
         Aj8jfjoMHbH8JPiyNW0UHtxyBRzn7quWoZVh+So/p5Y1vQpevadDWtz2zJQZceTC9sXe
         SQxdeQIg2ZQwBTcnstSdqjZMPLtJe5+LX7yLXq/jjFAqFGATaI/4qVrwiqS04f1HR+6c
         DlSaSdaXLtSFNmcX7SLzwed8hQF4r0Mqj6hob8h+sSH50Mpmqes5sowJA9N1Z41DLP90
         kvaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/e7be613o0+1tA2bl4YyU9VqW4LQKQj+0L8HZ7ydL6k=;
        b=6V9JTSCAOGIbd1uPkm4jlMIlNPMwH+ADamFj1a0EAXIU7Wo1p90poE4FO74L2hIkaC
         sMrcIlQBeR+SQptU8tKHSkGH1cGEzGYmq2H65U9CK38POLXsGvM7QA4WlUt/Mozz3xAR
         /UKzoqKFjhSBzfJIJaw7Oaq06Y+6ZSoMKQVPaqsBlHxz/aZxHoGxtstqBvfsK8OwYD3Z
         uljIEbOdAiTyxyZTLdvs+8F0GXaII66AE9tiTvNA1wgE1CB8OcOX9DdPMBQI2rFae/jC
         4L/sgek92wagm9QE+2M3wrDBAhBFC0n+bgq4HfKoPLnOq3ES4cFQ3LdeSdH0BWpjDkPx
         vSZA==
X-Gm-Message-State: AOAM533PPR6XFm0LItCMQJUrU9ETIg3iQ7zj+QmIl9705RW8UqUkaVaY
	5UBDNICEtz4gE4vZiVuBOVrXcOMYTLY=
X-Google-Smtp-Source: 
 ABdhPJzEJPu3QNfwbBFZ5hPeFlJnBYKx4vomPYZfYvBMCWHXoRDonkhyAFzZcZnElVJf5YiMXudj5w==
X-Received: by 2002:a62:60c2:0:b0:448:7376:20c4 with SMTP id
 u185-20020a6260c2000000b00448737620c4mr299859pfb.11.1632757084471;
        Mon, 27 Sep 2021 08:38:04 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:6ef1:b2cb:b226:747b])
        by smtp.gmail.com with ESMTPSA id
 2sm19805169pjt.23.2021.09.27.08.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 08:38:04 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: zangrc <zangrc.fnst@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [hardknott][PATCH 3/4] dash: upgrade 0.5.11.3 -> 0.5.11.5
Date: Mon, 27 Sep 2021 08:37:59 -0700
Message-Id: <20210927153800.1842931-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210927153800.1842931-1-akuster808@gmail.com>
References: <20210927153800.1842931-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Sep 2021 15:38:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93152

From: zangrc <zangrc.fnst@fujitsu.com>

parser: Fix VSLENGTH parsing with trailing garbage
eval: Do not cache value of eflag in evaltree

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 633f2115055dbc529f94eb39487e38ba384f6b83)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-shells/dash/{dash_0.5.11.3.bb => dash_0.5.11.5.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-shells/dash/{dash_0.5.11.3.bb => dash_0.5.11.5.bb} (85%)

diff --git a/meta-oe/recipes-shells/dash/dash_0.5.11.3.bb b/meta-oe/recipes-shells/dash/dash_0.5.11.5.bb
similarity index 85%
rename from meta-oe/recipes-shells/dash/dash_0.5.11.3.bb
rename to meta-oe/recipes-shells/dash/dash_0.5.11.5.bb
index 92d9bc83d2..c2d01986ec 100644
--- a/meta-oe/recipes-shells/dash/dash_0.5.11.3.bb
+++ b/meta-oe/recipes-shells/dash/dash_0.5.11.5.bb
@@ -8,8 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b5262b4a1a1bff72b48e935531976d2e"
 inherit autotools update-alternatives
 
 SRC_URI = "http://gondor.apana.org.au/~herbert/${BPN}/files/${BP}.tar.gz"
-SRC_URI[md5sum] = "c7016b513f701d88c70b3082eb183581"
-SRC_URI[sha256sum] = "62b9f1676ba6a7e8eaec541a39ea037b325253240d1f378c72360baa1cbcbc2a"
+SRC_URI[sha256sum] = "db778110891f7937985f29bf23410fe1c5d669502760f584e54e0e7b29e123bd"
 
 EXTRA_OECONF += "--bindir=${base_bindir}"
 
-- 
2.25.1


