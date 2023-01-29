Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 635DAC61D97
	for <webhook@archiver.kernel.org>; Sun, 29 Jan 2023 21:00:53 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.25728.1675026047623323710
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Jan 2023 13:00:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oBnWjCl4;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id bg12so1935139oib.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 13:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hjOVi9DPk/fYQlxNq3TvZxw5kGNRksFLQGYRzNYMXz8=;
        b=oBnWjCl4mS9AEA23EBReVmD/whHcxNu9VSEXiedD1m2wNqvgnBbh4HdIhzj039E3uj
         xjv6xkcSvJ6nL2x6WbSwxirKGOYsVR0e89rP5HyUS5JfW8dS3nHJVSWDlh0b3qz2Jlp0
         MMUcUvUgIjVNI6qTkvNi3+46AsifX/cKD4DWsIo+ENHtSmyX8OgXKUQieuymiVlYdm70
         ciY+CurNoos8l5QNNTpVMrn8uIc7OFuLGNek3C6rDt/kI3vlaLNsgGjJ1f9cX2BjjT8w
         5DW0wzKE2tCfpppcgjJtv/WwMeI7UPoPfnpKj10k/iibNBOUwO4tGCCvdfU2z2U4Nc4q
         HK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hjOVi9DPk/fYQlxNq3TvZxw5kGNRksFLQGYRzNYMXz8=;
        b=7njgbPgZOiSGP5ogXjkeTevTviu5jUxprWVI0yP/8pCZiSp/WQpxBeZezuUJ71AYWU
         QW6UM/uZkBgItkDzZF+RQBcXhWPJZc4bk5ygRjeFW8SKW7d4poR5wbESc2UAVHp5iyLO
         W1ObDA1GQboIRCUa4ALMnw5HhHsq38zxM8ZUxM5JYEBk9Fc3fENeOgShL0gteNnhicrH
         hzmGZJH4Wzh0cDR5/eZROIcnh1uYvXgGguuCcajBX8zwqZxKKr3JbIYRsR05kSLoHnsg
         DpnfGOiLBWhMcyUt23ElZ2tGg0mGdABP5najE4gXv682rg+Cz4CpIUNd8RcpKgEp5KAH
         ykqA==
X-Gm-Message-State: AO0yUKUW0+YbG2mcd1nJNet8r/A+uTfBQ1ZITlfDfCAi1CGThXa+GORW
	26pPblvXLBvJPLSTVvulgSmKGtFLGas=
X-Google-Smtp-Source: AK7set8Mo4LVHqXlkeinjxtgAXgJ7pKi7bmHAs+olLTqcrkYvCc+Ina4UnI5fqtSDi8kfV636+GZ0w==
X-Received: by 2002:a05:6808:18aa:b0:378:bd9:b9ac with SMTP id bi42-20020a05680818aa00b003780bd9b9acmr3036441oib.57.1675026046740;
        Sun, 29 Jan 2023 13:00:46 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:9bdc:8bb4:6dc0:aa04])
        by smtp.gmail.com with ESMTPSA id m17-20020a0568080f1100b0035028730c90sm4024065oiw.1.2023.01.29.13.00.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 13:00:46 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 06/10] redis: upgrade 7.0.4 to 7.0.5
Date: Sun, 29 Jan 2023 16:00:34 -0500
Message-Id: <e54dd6ce648c0853065bdb25999743bddad1ff7f.1675025970.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675025970.git.akuster808@gmail.com>
References: <cover.1675025970.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 21:00:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100840

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c8d9407eec21e1eb3e34b66cac8d11fe13c6e63e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-extended/redis/{redis_7.0.4.bb => redis_7.0.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_7.0.4.bb => redis_7.0.5.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_7.0.4.bb b/meta-oe/recipes-extended/redis/redis_7.0.5.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_7.0.4.bb
rename to meta-oe/recipes-extended/redis/redis_7.0.5.bb
index 6eb6573768..921f3282f9 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.4.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.5.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "f0e65fda74c44a3dd4fa9d512d4d4d833dd0939c934e946a5c622a630d057f2f"
+SRC_URI[sha256sum] = "67054cc37b58c125df93bd78000261ec0ef4436a26b40f38262c780e56315cc3"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.25.1


