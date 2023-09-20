Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D08DEC04FED
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 19:08:39 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web10.4596.1695236918752999870
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Sep 2023 12:08:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: straka.derek@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-d818d4230f6so265764276.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 12:08:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695236917; x=1695841717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HPT9oaZe8QnLzhDdZnwMLk1+E9/12q/siwCvD8DdMiE=;
        b=DLA8md7k0sR92dAp67vvzNReXVO0MZLKxjc516lTj99gGq9r/2AEV+65uZzi/GOqsH
         6vLIcSDT4+Ea46k0oG3ZsJFAUo5YE3L7loFTqaqhRFkfJV+xrnSCwAWE+J7s3VTEtipX
         kXiLtZj7i2b2eKrRBfKaGsD7WQTL+WjygyW9Lw+pleKcyUNKjcppzcbM82eJvQe60zCF
         Ip/BwsCK3RUHEy4wFAzfjGB2tArqErXzr9aMmMx4z35gRbFf9bHxDWBfROxS2Qlt5jwn
         hbDnWzBpDUJm4IeUjMvCgbNxUG1Hsv4bffMFVJq5j/S5T8Rlp+jJQ/3jF4pcRIetORV7
         rvZQ==
X-Gm-Message-State: AOJu0YxieACt7FFMCIs3uuKgZyfzvd2herIpEjqwjg1OwvyJ+/qY8wcZ
	PkXLc4n3xnjABAgRsOnodVpMDNQMLvmMsg==
X-Google-Smtp-Source: AGHT+IE9jCPa3yPW0r6P6nOEvYTuB3dFzddSKES0N4uG79Vj6TuWktkanZmn+3W8hrNrxD45pAc91w==
X-Received: by 2002:a25:d45:0:b0:d81:d161:eb1f with SMTP id 66-20020a250d45000000b00d81d161eb1fmr3136403ybn.56.1695236917480;
        Wed, 20 Sep 2023 12:08:37 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id y2-20020a056902052200b00d74c43dad49sm3362788ybs.48.2023.09.20.12.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 12:08:37 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-fasteners: Update version 0.18 -> 0.19
Date: Wed, 20 Sep 2023 19:08:23 +0000
Message-Id: <20230920190823.1341128-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 19:08:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105025

Changelog
=========
Adds non-context manager methods to inter-thread lock
Drops support for python 3.7
Adds CI for python 3.11

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-fasteners_0.18.bb => python3-fasteners_0.19.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fasteners_0.18.bb => python3-fasteners_0.19.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-fasteners_0.18.bb b/meta-python/recipes-devtools/python/python3-fasteners_0.19.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-fasteners_0.18.bb
rename to meta-python/recipes-devtools/python/python3-fasteners_0.19.bb
index 5f6389174..a4fece023 100644
--- a/meta-python/recipes-devtools/python/python3-fasteners_0.18.bb
+++ b/meta-python/recipes-devtools/python/python3-fasteners_0.19.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/harlowja/fasteners"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4476c4be31402271e101d9a4a3430d52"
 
-SRC_URI[sha256sum] = "cb7c13ef91e0c7e4fe4af38ecaf6b904ec3f5ce0dda06d34924b6b74b869d953"
+SRC_URI[sha256sum] = "b4f37c3ac52d8a445af3a66bce57b33b5e90b97c696b7b984f530cf8f0ded09c"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


