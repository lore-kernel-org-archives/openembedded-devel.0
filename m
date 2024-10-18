Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84663D3E1A1
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:42 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.29959.1729278805136045064
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R+BPykF9;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e290d48d3f7so2165140276.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278804; x=1729883604; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dbSLUc14dmV+tOFLUZS3CFHrPzgquCvTwcfHm4+0sPA=;
        b=R+BPykF9csgAKP237NefULk5xZegzGcOzmEScnl+hRwj8HP3C5nfffxBAFy+s9FRNY
         t6g0ermxNsjYbRBAVtBVCyXF7lN3S24YwTFF/vElIKyUfkt6sGrdwCSc6M5d7atTokcs
         AI5C3AvjvFuH/zOMr+Z0kYb5l9g2qNFLK8v+fqigVaiH7sLuW7M1PPGRfggHAX0l1SZ2
         1+jp5dS/+6FKnv29iVRMhWl8YTNjaTIyhWZdLdsoZxFVcZtYPj9fB1hQzNsKx6P1TGn9
         GYMxbFUfaD0iK7F0ZD1c01Gj91NBXJbKQB/GAPq/Wqqyk/mkwkhzPmjzMlc39hlrQYQ7
         8emw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278804; x=1729883604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dbSLUc14dmV+tOFLUZS3CFHrPzgquCvTwcfHm4+0sPA=;
        b=SFeNCmHErzRxZxGbSuHx5NZpABF6pAhJO5eVJDq6Zl90GCaaHUfePTXrafCIW76B5/
         mDdZvk06KmxROxG6DQLqV50RkfdNvTh9JsT5RFQcdtKyu4W+I5UzqJU1Y+quarix5gWP
         YifdufCdINYIO5MstU3/Wc8Hu6g78H41x5RrvqTAaYb2sYEKH2mQMbQnvZhFhlQZxPKH
         F4WNK13iTCIq523MNRfHI4yc0QlWw7wMlM90g4VMNdRlXecHBrscfjZXWAfT1SDLNTlg
         BtUVsMHJEf+yIbU7GXVkGfNHj8EAvRzCDEEwe7/HXOiq7zEBKJjeHhj9OLsf6LfqPmDv
         NYNw==
X-Gm-Message-State: AOJu0Yw7rXXKdmAnXREHloJNaKyHVfEppk3SlRoB96Io3EhHwjYyhjtq
	F1XPb4KGL0y3kOvCnndCTd2+9OD9DOXF+xjqXwOVpiA2d3B7aupONZImpw==
X-Google-Smtp-Source: AGHT+IH+TAZeAWMAEeipeFeGxScuHgPlxMY3kx6ho3hUgnrV2J3ibUtWoThGXa1bFDkGmkI8A7x1QA==
X-Received: by 2002:a05:690c:9685:b0:685:3ca1:b9d8 with SMTP id 00721157ae682-6e5bfe95992mr38634517b3.30.1729278803799;
        Fri, 18 Oct 2024 12:13:23 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:23 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 20/68] python3-flask-jwt: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:07 -0400
Message-ID: <20241018191101.25184-21-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113006

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.bb b/meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.bb
index 35bcbc00a..f7044b314 100644
--- a/meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ff00db41c47ec84b4567a8b3c246a959"
 
 PYPI_PACKAGE = "Flask-JWT"
 
-SRC_URI[md5sum] = "878ad79a12afa70ad38a12d5ffd2dc1e"
 SRC_URI[sha256sum] = "49c0672fbde0f1cd3374bd834918d28956e3c521c7e00089cdc5380d323bd0ad"
 
 inherit pypi setuptools3
-- 
2.43.0


