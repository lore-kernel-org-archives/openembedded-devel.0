Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17EF9D3177A
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:01:44 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.26695.1730829696166605787
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:01:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QvZKSD8W;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: flowergom@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5cacb76e924so7792369a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730829694; x=1731434494; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pV7r+czY2dA3JiEJLqgUIvee4K5EsZtiEWfyPiAzqYw=;
        b=QvZKSD8WjkywKv3OspszkgZJlc2vN5x4HJ9ZVdeeMHkzVUYbGSXI0DplJxd6psOhOC
         f/okR/SOzoHO2YxYneYQjEbjqbVz9k4Ls8YQrx0lA4FoTsZKKHtxsMgK7dh5lcft+Q00
         fbvZBKMzKjW0o5eIQhqB2c8Ln4nb95VXHj6onkzEZlZDUiZ6e+vwzx7dK2JZARCyqWM3
         JLBcQF8WGco9BCD72SVuEB8qFEv6k0lz8ggf8yZKXBYDk65ATdYdXQIxNfLOMuaFxgsm
         q62k/H4d/6tmin1Xwj2akLT4aOk6LN6By94WwoVit6uhiZ9OAoy2s5rDGT7AGDnddiEm
         oZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730829694; x=1731434494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pV7r+czY2dA3JiEJLqgUIvee4K5EsZtiEWfyPiAzqYw=;
        b=sVtrMCfivu2zRmZCZQGUpzBgcSrmagZh/CHHzq6McW0U0AKuLEN2/7tcadXQodLJk0
         l5QFyOO7AiodWqtnkAslcCSuiA8Y4OoiIZOcj5v8uVHDbNggHdBziCAkLG7jV9xiBwex
         v9u+ZYkMTPl+idWKrqcn8xCe8x9dwyLIwKQNn5ANaJlyjHHDOW+vSMNguNQ0pXDWGTXL
         uyCCl1XjFmcgJukdcgwGdvp0lTaeeCsndCiVZxQlEqTJNV/knq1qdyfQchPHQ+0ak6kt
         RYcj+/hB+PSgf9dn/1bSvrjxg6e6HqbpNUj2xLyCqH6EskaxZwojyLd98yS5mOSGJndA
         nPlg==
X-Gm-Message-State: AOJu0Yxjl/cuF9WXEJNKpd9faFmbqTUm5d+m3ARlnGFskGPtiMiTFliD
	GkeZEVqo+lXQmXChk1ph4/mAVMxptrQ4V4cXGAasKw8SHL87UsiaOEzfJeyb/mdHtA==
X-Google-Smtp-Source: AGHT+IH4VqGIi8WQclqJu7CPLDRjMd/PtBPiwTJylITYc8FPomn1/m2VePo6zkMDzdLCefdWYN8xow==
X-Received: by 2002:a17:907:7291:b0:a99:8a0e:8710 with SMTP id a640c23a62f3a-a9e6556fa89mr1694114066b.14.1730829694069;
        Tue, 05 Nov 2024 10:01:34 -0800 (PST)
Received: from localhost.localdomain ([146.52.197.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb17f6087sm166980366b.142.2024.11.05.10.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:01:33 -0800 (PST)
From: flowergom@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: henning@itconsulting-heinold.de,
	otavio@ossystems.com.br,
	richard.leitner@skidata.com,
	Minjae Kim <flowergom@gmail.com>
Subject: [meta-java][PATCH 1/3] xml-commons-resolver: fix SRC_URI
Date: Tue,  5 Nov 2024 18:01:03 +0000
Message-Id: <20241105180105.4721-2-flowergom@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241105180105.4721-1-flowergom@gmail.com>
References: <20241105180105.4721-1-flowergom@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:01:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113511

From: Minjae Kim <flowergom@gmail.com>

The archive URL has changed slightly, add missing /binaries/.

https://archive.apache.org/dist/xml/commons/binaries/

Signed-off-by: Minjae Kim <flowergom@gmail.com>
---
 recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb b/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb
index 42ce703..23e47b2 100644
--- a/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb
+++ b/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb
@@ -4,7 +4,7 @@ LICENSE = "Apache-2.0"
 PR = "r1"
 LIC_FILES_CHKSUM = "file://LICENSE.resolver.txt;md5=d229da563da18fe5d58cd95a6467d584"
 
-SRC_URI = "http://archive.apache.org/dist/xml/commons/xml-commons-resolver-${PV}.tar.gz"
+SRC_URI = "http://archive.apache.org/dist/xml/commons/binaries/xml-commons-resolver-${PV}.tar.gz"
 
 inherit java-library
 
-- 
2.25.1


