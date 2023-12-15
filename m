Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F15C4167B
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 07:52:56 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.58185.1702626772542314119
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 23:52:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mfkOSNFu;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a1e35c2807fso41080666b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 23:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702626771; x=1703231571; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C280Cc1OFkkhB5p1zbZFaKaRRDRlyLByGGjvrvOh0qY=;
        b=mfkOSNFuLuO23hR/7jd3sMUz/CjwQb06tiVi8I8RKTM1s8eagGqcsBy86fBWNoDttt
         KnJ7KTeduFp9DMEgZeqxgCo1m07B/gSaaynwC4MMmsVgQ+XvoFGdTCr4196eqRd783dK
         iXXJK22V1tOtYxw++DG1lRUmT8UFBeGedocskk5mSAiMuMpRqOl4dEjhQziVK83B0kXr
         OKv1/T6GrpaBfMpfjzpu3nd+Oh8lOc/vDaD2q7f+iyaR5iv2PJZwnBnZWkeDjXdcSZkO
         PWz8r1TjJpjgU2SQYBVhZ9Gv4OKXKKsfLIvtG6s5iMVJzEbVzpRdVW0A81izFfzhnf3v
         U4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702626771; x=1703231571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C280Cc1OFkkhB5p1zbZFaKaRRDRlyLByGGjvrvOh0qY=;
        b=geuBGnpT2tMRC7C0ftvHWbneqYxlbZMfuZhOFGUzs5/pffclvwRg+1MkZplfBaUD7R
         ie7N24c8YsEmJcP6xJ4Q3IunARN2qb81CyLXjTLX2Fyzo5NPfxeZi8Ant8DoRY05cHtx
         /Ne29fYoGb4wVoLqLKaLaspBlBqjVeGEKfDH1BVgIaX4HmV1xy+AbCPdj4G7jr8Eyi7J
         Ws9iZqZbFmv2WD9Dc9lK3cjga1pZ03eO1g1WY1ZVNBr7h1ykj/zaqSaE33G8dVYali97
         YfNOEXv8Enp1LslGR1qgNY7hXaU4McjLsh0QZmPaQQGPS0EZmq0xIvNn4S37YPKfCpv4
         qKew==
X-Gm-Message-State: AOJu0YzirI9W5r/8Vc7HA9JmtLV954lqSFgY8apMmXvsJ4DDGT1sNOUc
	moL+vrTj9QarZxE7oF1+WGmlmKk9l0Q=
X-Google-Smtp-Source: AGHT+IGHRpmyZBdBnamXPCiyiKrnM5efpUySm7Hg3z7VHu/6aufVjL12vxFo9s8m7PP+dXx5z8SimQ==
X-Received: by 2002:a17:907:9710:b0:a1d:1b0e:45ba with SMTP id jg16-20020a170907971000b00a1d1b0e45bamr7415783ejc.93.1702626770947;
        Thu, 14 Dec 2023 23:52:50 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id le9-20020a170907170900b00a1e2aa3d090sm10348666ejc.206.2023.12.14.23.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 23:52:50 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/20] python3-pyroute2: remove unused distutils dependency
Date: Fri, 15 Dec 2023 08:52:29 +0100
Message-Id: <20231215075239.3049865-10-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231215075239.3049865-1-alex@linutronix.de>
References: <20231215075239.3049865-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 07:52:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107503

It's not mentioned in source tree.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-python/recipes-devtools/python/python3-pyroute2_0.7.9.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.7.9.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.7.9.bb
index baf3cf8ed..9365a330e 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.7.9.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.7.9.bb
@@ -10,7 +10,6 @@ inherit setuptools3 pypi ptest
 
 RDEPENDS:${PN} += " \
     python3-ctypes \
-    python3-distutils \
     python3-io \
     python3-json \
     python3-fcntl \
-- 
2.39.2


