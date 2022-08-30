Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B27C65C0D
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 07:14:32 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.8677.1661843665690836866
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Elbq227P;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id u22so10237144plq.12
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=WanslvKRrjGdxgZaFHMOLlSr+6TULcxEGc7EN/htRA8=;
        b=Elbq227PzSkfo0dddka+F0hJBVQVW+9C5zZ0nXO2gbJjBt0PctXdkmAtxkionB8p/V
         3RN8NuFYxO8yIs3QKTFpv26S90z5EFsbJq8Zu5OqWKk6JmSah8DTgD/64WHh0UQv18TU
         zuWwIekzG/k0OtKF/5E552GDq2tRcnj36gNb+2mYC6eVsNWDCWFDRN1XOxQaGnJAKhKi
         vHmmf/8AV06gU6wMySwFXuVoZCFgp9TRV/goDCXfurL2e19AeJZeR0U7W+GLwzrgfdn/
         vUNxjlGcsaholqJtIfn1djwVHEZ41H0/0r/mAG9LgUs4zGVSKavOHLdR2JZYitvlzNy1
         yTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=WanslvKRrjGdxgZaFHMOLlSr+6TULcxEGc7EN/htRA8=;
        b=WQcQ20t2ZznJe2sykO7rP4Xwq7CLTiB8ysecgQqmcyxqPWVgp6nP1lNLyAHHrDAojQ
         yeE9eRG20M1vT773yvOLB10PuOQVcYnRWLCjWwyC18x0C9R6NE4DB54EZ131WinvBsI+
         qpg2DSepbgqQYoBjHnGi7rcnTHXFoVBqewIb2YyoD7JaJTIUmK2TLUKxuGGiqhuDshfV
         NGRQpOmGNQzGpUggN3el57wZsMvZ+Y5bwsL/F0r9fsXAcM4y/TctJYXWUoVSLbWtM1Xg
         y2HwVN1sTGhAHkaK4rjrz/UdoDAo/Cb5t+/QepFPNh7VcIV2UfIGWOp2GFoWc3+/9QWQ
         FZrA==
X-Gm-Message-State: ACgBeo2y/5SdsOppF7FsaKcDsJzQYBd7FzRFA+76qxLRMB1awr+3l2+T
	2dT8jmfJByirBL3UYPa+K+X2dmEqAf2t1g==
X-Google-Smtp-Source: 
 AA6agR5zEiF11xnBNtUXNuRZ50bMjcpbXhSJV1iLLCDt5wmbYG4QppmoVFo9/JfnJHFpS4noaG18vg==
X-Received: by 2002:a17:90b:388e:b0:1f5:40d4:828d with SMTP id
 mu14-20020a17090b388e00b001f540d4828dmr22738916pjb.31.1661843664945;
        Tue, 30 Aug 2022 00:14:24 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 z24-20020aa79f98000000b00537f9e32b00sm6041616pfr.37.2022.08.30.00.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 00:14:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 11/21] packagegroup-meta-networking: Remove
 ypbind-mt on musl
Date: Tue, 30 Aug 2022 00:14:03 -0700
Message-Id: <20220830071413.3887189-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830071413.3887189-1-raj.khem@gmail.com>
References: <20220830071413.3887189-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Aug 2022 07:14:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98548

It does not build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-networking.bb   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
index d5a2dfad63..11437e2238 100644
--- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
+++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
@@ -259,6 +259,7 @@ RDEPENDS:packagegroup-meta-networking-support = "\
     ettercap \
 "
 RDEPENDS:packagegroup-meta-networking-support:remove:mipsarch = "memcached"
+RDEPENDS:packagegroup-meta-networking-support:remove:libc-musl = "ypbind-mt"
 
 EXCLUDE_FROM_WORLD = "1"
 # Empty packages, only devel headers and libs
-- 
2.37.2


