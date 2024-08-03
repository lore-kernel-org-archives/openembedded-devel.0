Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 157BEC49EA1
	for <webhook@archiver.kernel.org>; Sat,  3 Aug 2024 17:06:04 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web10.12217.1722704763211116318
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Aug 2024 10:06:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b0NElQHt;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e0be2978a0fso1711864276.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 03 Aug 2024 10:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722704762; x=1723309562; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0ZM+2WNqS7dRyWzpBuAUHcBAIgIGkf/+aTOkrMXWCY=;
        b=b0NElQHtJaxuNto63E7zAIIiYYjW4LpGpBgs4Oy+joGWLahhAieLuGspmh8PaWF0w9
         4rRbREVsy9j3QrxrfG62X7WeIPSNo+mWcC92THfoSWrG1GqnaTNeemDWzpgcn36zYM4n
         NS5bzWV797yJvUXrdBb86HmyxDoSqlNveqvNuCuxD7P3mLYiFNxBhbK/AzRGp5N/p6rP
         Ds4VDx59guDGWjyY6027esvclFjDaO2ol9k7u/hCMU83Y9dES++ONUTLP04aLQA8eV+a
         7+x/m8/cplsRq3T03xS26Us8JOg6qgA5d2+mk1ZU3ZoGLxK2yHvtAxCodhag+phfDUeR
         vCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722704762; x=1723309562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0ZM+2WNqS7dRyWzpBuAUHcBAIgIGkf/+aTOkrMXWCY=;
        b=kRZT1aCdH3FtDqmfFp9fa9KNJYtJC1iHWLw2t0HpMNML8AJ6zl3f2MqHb87otaAJBo
         7eIQqTnoDOQA6TfFScl0wPWn1kGmiHB6SYJ9yndVxzNJxbKuvkRJ8PxB8CWTETtvQrId
         3fPKnYPvzdEIm8iMUj/HeHxIBVwM/G3ayQ52qyK2vGfur4eirWCEAUYTXnvjCxhvNoLt
         VmXZJsIYpYl4B8UABc4e7YngUu4fqTUTlIwB+YcoKgi1Q5SKaF8Po9wLRsNwQSOjTcLi
         scUnhu4dm6DplYDYckNscvKKjeVvYi8xPlGqO7XfAwVvooc9E8rtEsTp7D4q3c550ci2
         gIMg==
X-Gm-Message-State: AOJu0YyXruONy6YE1OorYBT1t+tI7pP/Cfj8PRYRl3AgE44Rpm7jNfUO
	Wyb26pd6rl6XTgf9nC3PZShSYCUZiynNvj5IkIObEIZDkjoizhdahnDi8w==
X-Google-Smtp-Source: AGHT+IEyLiQVHPE0OfbdqhdwzhvR0nr9wj19Zmiahuv+kFwiJz+qorQP8ABmuB/xKW5a8gdw7ruxCQ==
X-Received: by 2002:a05:6902:114d:b0:e0b:fd0e:26ce with SMTP id 3f1490d57ef6-e0bfd0e32cfmr1241767276.29.1722704762238;
        Sat, 03 Aug 2024 10:06:02 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:233c:fb4:252a:b2a5])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e0be530434esm634024276.5.2024.08.03.10.06.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Aug 2024 10:06:02 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 0/1] Fix build with python 3.12.4
Date: Sat,  3 Aug 2024 13:06:00 -0400
Message-Id: <20240803170601.2119579-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Aug 2024 17:06:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111505

Its possible I missed someone posting this backport. Please let me know.

Khem Raj (1):
  python3-pydantic-core: Fix build with python 3.12.4

 ...ate_self_schema-for-Python-3.12-1299.patch | 29 +++++++++++++++++++
 .../python/python3-pydantic-core_2.16.3.bb    |  3 +-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pydantic-core/0001-Fix-generate_self_schema-for-Python-3.12-1299.patch

-- 
2.34.1


