Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE6FCD3F2BE
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:53 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.30090.1729278820602577295
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AeZrl1me;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e290200a560so2249568276.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278820; x=1729883620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLrPRumN+RBJc7wsQATunlIwQQwW8J7N2FPdYAwe/rM=;
        b=AeZrl1meI5zl2lbjVhUml3Bfk3jZu9HqIMAtOsb/Jltd8p346SPh3Xpm7q/eaPk+Lu
         lanLBTl802UEDQ6GzJQlgh39YL1ILoO7AU2fXYxn6a89xgRbpbohNzMJOMBhpdu9Yk9m
         XT6qMpdwW/XQ9sO/wYTSwK8k3kOtKE9IG702RTXZYZ1GS9LG9a9eGg5iT3f2umFP5Fw3
         Ax1S4jiO9OnWghEbObTxl4TxeUPSs8u90o+emYUYmjFSLgOgZjxpzVtfgaNyXvOZlNXA
         CcYQocM02wqX1JJ5r6B+0udjmv3NotG5ulx6DWvqMQ5BKhQZJ3k4+7z11vyNXtPRby1y
         jc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278820; x=1729883620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TLrPRumN+RBJc7wsQATunlIwQQwW8J7N2FPdYAwe/rM=;
        b=vMwjkSjrrzjMbqrytIdkNpxsnRR7n+HJmcOLxUNQ5rChMeicJn/673Qd0owgV3Bl3D
         z2J6gRLfrxC+7NsYc8wSxuzbN+Whiv+wLvbJodSSCzcvXTmqAfLdA4StZNRKsJLTsoO4
         GEOJKOJKwG339IV16zclZxy3NFBg744OAkFGW8prckFcRwp7l3kyMjd2YqY+zZfZUXEZ
         h7Ljg2q/ZJPCFI9yVEPPP3YooSFPoyDIlOEG+g0B+veCWnobAxLM8ZLvA5fPFvBqEXaK
         xgLUNmCJ7h8tjhOcSy4wz+AlwkY6T8uC6jZqGOQa7Wx3VveRrrQaSewgcauilhq2dw+R
         ijeg==
X-Gm-Message-State: AOJu0YwzpLtENtWt+5MhE1/KO2V/ssE1yKT1A+fTWxyZqkz3E7KGOyqZ
	Ct5VhLQ/cD+jtOT77BB6zasAorIs/BZvuDgABh9cuySdvkhkngRFfYX8dg==
X-Google-Smtp-Source: AGHT+IG3BIQMp9uL/6scipn5xg6JfpV1zxfFxyP1/oXui5cAimMF0Br9CpId9waVBGMyGEPDiN/pSw==
X-Received: by 2002:a05:690c:64c3:b0:6e3:13c6:7fc3 with SMTP id 00721157ae682-6e5bfe959b4mr37644537b3.28.1729278819283;
        Fri, 18 Oct 2024 12:13:39 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:39 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 44/68] python3-passlib: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:31 -0400
Message-ID: <20241018191101.25184-45-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113031

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-passlib_1.7.4.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-passlib_1.7.4.bb b/meta-python/recipes-devtools/python/python3-passlib_1.7.4.bb
index 8b66e2592..6f862804c 100644
--- a/meta-python/recipes-devtools/python/python3-passlib_1.7.4.bb
+++ b/meta-python/recipes-devtools/python/python3-passlib_1.7.4.bb
@@ -9,7 +9,6 @@ HOMEPAGE = "https://foss.heptapod.net/python-libs/passlib/wikis/home"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c8449c5e10474d113ab787ed2753bafe"
 
-SRC_URI[md5sum] = "3a229cbd00dfb33e99885b43325e0591"
 SRC_URI[sha256sum] = "defd50f72b65c5402ab2c573830a6978e5f202ad0d984793c8dde2c4152ebe04"
 
 inherit pypi setuptools3
-- 
2.43.0


