Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C4F4C0219F
	for <webhook@archiver.kernel.org>; Sat, 14 Sep 2024 14:40:48 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web11.96603.1726324842595338361
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Sep 2024 07:40:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=O2ZQhXWz;
 spf=pass (domain: smile.fr, ip: 209.85.167.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-lf1-f67.google.com with SMTP id 2adb3069b0e04-5365cf5de24so3912476e87.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Sep 2024 07:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1726324840; x=1726929640; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=knY6uwXfK0hqDOANt60GwsxjX44tt78Yg32ySHwBmTY=;
        b=O2ZQhXWzcAhHfDRb4lj2lUcSyUO69/7G5mdxNu8lTEOoItl80DipUf4qzysYvZvWtm
         Pn/0qYIIwOLbRL36IfEGrG1puqFn2+v+npp2pLv3ZNnM/68RSNmk27JHx+F1ykTZ3lLl
         Hk/aE6FtJQ9LtA0TFDXeAysdwggUAWO0C9k8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726324840; x=1726929640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knY6uwXfK0hqDOANt60GwsxjX44tt78Yg32ySHwBmTY=;
        b=CBfuSa95brg9kX+ONfPBNbA0O9FXmbtSFQlIbVGoDQ4gB28em6cY16STFsLptUxlIj
         GMZhGm05RztVBXJnXmJ7KMWHqSK/vXpH81yNe9tGqxnt06GgbPl1SSK7TnFKnI4l6zcg
         mHso6SVcLKwFdNZPnBVF0S1z+AHtVuU3rgyrKzq/uE+qz5cHlRPCmQO+nz+4+Mrbvmu7
         RG41UYxeWzEhqoG21kiaFewUgalovShf9MhuWJ7TgCDnxYhoqiI1KK5F+VQ1Y14PX2C7
         JAnb0D0hlfi1BNCs36NpjJG2WeyBUtIiiZgOrnZVTzrwAvcoi6BWHbKzui54j0qo9YwC
         IEKw==
X-Gm-Message-State: AOJu0Yyebne/FvRcwhVL82hytvHHg1AxsPRPs+Gk3eqGXhxDoEl1g3Fi
	OAAtkh+PQXjjYBuh3RDm5Nlj7y+WcJyWYVP0jwDIsFi/my9EI4p521Id0FnntuVJUCFZNtLkrO/
	ACBZdJA==
X-Google-Smtp-Source: AGHT+IH6sX7jUAFSkTwapi1S60VdISx6oxAxrS3m4MET/vcXETWQOoj3xkT9bGtQmFjLH9WIMyG/ZA==
X-Received: by 2002:a05:6512:3350:b0:536:7a88:6185 with SMTP id 2adb3069b0e04-5367a8862e7mr4274424e87.15.1726324839628;
        Sat, 14 Sep 2024 07:40:39 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5368704665bsm273543e87.55.2024.09.14.07.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 07:40:39 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-networking][PATCH] non-repro-meta-networking: exclude packages that failed previously
Date: Sat, 14 Sep 2024 16:40:28 +0200
Message-Id: <20240914144028.2211626-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Sep 2024 14:40:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112287

From: Yoann Congal <yoann.congal@smile.fr>

Those are the non-reproducible packages from:
https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/43

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-networking/conf/include/non-repro-meta-networking.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/conf/include/non-repro-meta-networking.inc b/meta-networking/conf/include/non-repro-meta-networking.inc
index 45eed5398e..0564e1ced8 100755
--- a/meta-networking/conf/include/non-repro-meta-networking.inc
+++ b/meta-networking/conf/include/non-repro-meta-networking.inc
@@ -47,9 +47,12 @@ KNOWN_NON_REPRO_META_NETWORKING = " \
     proftpd-dev \
     rdist \
     rdist-dbg \
+    rp-pppoe \
     samba-dbg \
     tayga \
     tayga-dbg \
+    udpcast-doc \
+    unbound-doc \
     wolfssl \
     wolfssl-dbg \
     znc \

