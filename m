Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC799C47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 21:17:17 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web10.1361.1706303832432645525
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jan 2024 13:17:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7bbec1d1c9dso30691839f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 13:17:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706303831; x=1706908631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rZ7AdU8POt985etIWAybIYodCqkh+gcZBOq5spdZ79g=;
        b=kD8tCA06uma5bn/lYRcfhn0vBD44lV049EiO7/UozRDg7IbWSnD3qyE2Qz/7gJckdL
         IncUCT6cgQH4RRdTR/tacDp27Lv0EydDFbAy6FaI5kxysi1f3nEx+2NjzO8lIZ+dkuo1
         kmZvKPU9IKmUvHyNu1R9SjdF688xX3CZEkEqGF5w6XQdJq6cQdvUjRjDWdpeGnB8Cczh
         qGnrMhn916AQHrW3g/fFyfh/aXSRcmJQeejQBMFZnhPrkGU3sT3Za+b/uF9PRoJ8SWbO
         axKZ9AqfkapRJpgsLGuDl987kuqJG2rHlMLsh4x5IQEp0f94A8fmR6yEQ/9PZHkYdUNA
         kbRw==
X-Gm-Message-State: AOJu0YzKRpx+oOD0C8dhlWLeG0V0CUsyM3iXnxWsYpdeIsLKJZJVOrC7
	cQd47QNdb9yorAsoPELfNu9pgV+BodOtsDB1l7tt8DQ4IT3J4611yMxM7qJ+fN8J+VJQ
X-Google-Smtp-Source: AGHT+IGkVzviOXeA8GIT0NkSVfT4oQafQFQHNcGXlDQEf4FxGqwNqTfD9+d+1dQGqCO6iRdopaXpQw==
X-Received: by 2002:a05:6602:4f9a:b0:7bf:59d5:3b43 with SMTP id gr26-20020a0566024f9a00b007bf59d53b43mr571314iob.3.1706303830866;
        Fri, 26 Jan 2024 13:17:10 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id b91-20020a0295e4000000b0046ee630f7e6sm482764jai.68.2024.01.26.13.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 13:17:10 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-pdm: update to version 2.12.2
Date: Fri, 26 Jan 2024 21:17:01 +0000
Message-Id: <20240126211701.1577535-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 21:17:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108470

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-pdm_2.12.1.bb => python3-pdm_2.12.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pdm_2.12.1.bb => python3-pdm_2.12.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pdm_2.12.1.bb b/meta-python/recipes-devtools/python/python3-pdm_2.12.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pdm_2.12.1.bb
rename to meta-python/recipes-devtools/python/python3-pdm_2.12.2.bb
index 1ae40a7c4..b0849d13b 100644
--- a/meta-python/recipes-devtools/python/python3-pdm_2.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm_2.12.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "39a2aba19986c945a79bf584c3775285e24e9c7f8ed8a603815b61c5fac5db4c"
+SRC_URI[sha256sum] = "b3ca4ab107ad65b57fe1312e4360e1f7b3d7c5ed81a841b6ed48b3777862ed57"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


