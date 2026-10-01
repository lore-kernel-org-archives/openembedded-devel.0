Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F4BCA5FCF
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 10:06:50 +0000 (UTC)
Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7529.1790849209450983912
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2026 03:06:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Iz0VJwHW;
 spf=pass (domain: gmail.com, ip: 74.125.227.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df4aa80a73so41528705ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 03:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790849209; x=1791454009; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u+B3KlyMtN2/84v8WtRv/Kp1POEl1nToS26Ts29WfJc=;
        b=Iz0VJwHW+9fTTX5F1OZuqbvlTo1haFoOOyMOcpBhLMr1O2s3M6fa9hQy/6tF9Odeiv
         wzBcUlgvsv+p0TIACLOfTBPSf3YngR8K2NecPh6AebMNKr/bXXv3E++k2wqBaid3yjul
         S3FmA4XExiArtbGVxemZT2lFNPgxArgctckgndu9hP7k3gimimPVpMFw6Fe5ZOuvgd3A
         7wQmD205Gnyi/jmTYYn8V6yRihJ8Ip0sRL65YJJo9CL+j7IM/XqbXpsKfrs2TTzQqJpe
         06oj7HHA7zou0OqnYxZ+Hq5w7ZvWEL8RyGyrtym3Oup0yAFEjXkYs+iBonxB38hqIBIY
         cfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790849209; x=1791454009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u+B3KlyMtN2/84v8WtRv/Kp1POEl1nToS26Ts29WfJc=;
        b=d7SG48hExwHO4AbmiMwXB7TefNsEcGihqkGPR+5+aOUMrH7eL6oeOzWmnkmFg9zfPZ
         f/B0UpWHRsY10Ai2QWLdoCBWoZG9h/4Vs8tms2v7RYzczhY/qorBXmxTnQoVzSD/PyGe
         nYO4ipp0UtrbvIfg9WtlibXgggWNUJV09lxj+iDvtwaqqYzxHoMjs2sC1okJgDjC0tXH
         55Bn8MGv5g7GjVExmDuNs1tyXwJt2vXGggVemyMJeTVYDbDLfa4nutAwSc2q8dmTGODQ
         paP3ccFfGHRMEuF2XiFzGBT+PKcx8AeaO3uQgKBkaEhlj76GYhpTYk7NxpwCyJUq8uE9
         ziHw==
X-Gm-Message-State: AFq9FYLLF02IMbUwqSb1CnI18j6MrUvWOSwBsaIlO0RBGO7oiwbXzMKw
	AOnqG03ZG9WQ2Hw1hp4cgLQ5kpO9KdBI66LXgo2e1KdtzQPZ/uT+wzkdOCBA1g==
X-Gm-Gg: AYBFou3aDP5iFs8LpgbLsLR/DCUpovXNS4OFzmEH8yh7ZulUcxsg4XZDiurVc5pF9IZ
	lPwhcMP1YLp3+vyNaU2+eCCQV2uF00m/1llkUfckI5C9iQmiEZfbTYq8UjXNkD366n3rLU9aRLQ
	76OqGufa7rBjE3GOMNPod6/hZYHSXr57Ppqw2cUN1BQJMqGgJjSJiH8je4DeIkaAzf7L3yoEEuv
	0BP4ZqYe6mHnZwVO0Tz0KdoLPKnaHCw3BI/A7APO+M8xSb5GN2Gtwg1JScP8GkXhlVqud7jD6iA
	ftjcskKDhr4+HqOnxPppCjcs1CnuNH3mlJ1/AwrYMFV+kmFI/0gQYQoGawwz1g5duvS9UN6VM7v
	lJ+RGHisAVCmDyxlV8pcChLcSxhbX6qKtMeRCF/uFvhBWdSOjyYWRmSzpgzd3U7KTjGMH9jFkOJ
	UHE6i51cwvMjWM4yYsplh2Opqihvd/oJWucnsVrxUjw6m3604UqWQYrOihzYOazLPl9pOcjvKhM
	o1P+MfF5rX3a9Cp9X1qRLo7Cw==
X-Received: by 2002:a17:902:f60d:b0:2e1:2ed2:7cee with SMTP id d9443c01a7336-2e2e4b96b47mr34290625ad.52.1790849208698;
        Thu, 01 Oct 2026 03:06:48 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e30058a6d7sm8697765ad.4.2026.10.01.03.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:06:48 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 4/11] parallel: upgrade 20260722 -> 20260922
Date: Thu,  1 Oct 2026 23:06:27 +1300
Message-ID: <20261001100634.1992725-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001100634.1992725-1-ankur.tyagi85@gmail.com>
References: <20261001100634.1992725-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 10:06:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130570

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../parallel/{parallel_20260722.bb => parallel_20260922.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/parallel/{parallel_20260722.bb => parallel_20260922.bb} (93%)

diff --git a/meta-oe/recipes-extended/parallel/parallel_20260722.bb b/meta-oe/recipes-extended/parallel/parallel_20260922.bb
similarity index 93%
rename from meta-oe/recipes-extended/parallel/parallel_20260722.bb
rename to meta-oe/recipes-extended/parallel/parallel_20260922.bb
index 1d4ed737a2..c536df7ac2 100644
--- a/meta-oe/recipes-extended/parallel/parallel_20260722.bb
+++ b/meta-oe/recipes-extended/parallel/parallel_20260922.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "afe4b572a4334aac3a002a080ad618249f00b84d7659d03e77412727d18f1ad6"
+SRC_URI[sha256sum] = "54837e9e8c16134a3c2e95f91c5fe2f7893d4cc89f252b26735713ceca866387"
 
 inherit autotools bash-completion
 

