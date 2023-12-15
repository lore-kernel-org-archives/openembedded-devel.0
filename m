Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D28C46CD8
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 07:52:57 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.57805.1702626770961932822
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 23:52:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RgZ7Ner5;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a1e83adfe72so29882666b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 23:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702626769; x=1703231569; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFsHje9COI/b9OIIHvICg/9h2CJC4kLVD0P/odq0XJ0=;
        b=RgZ7Ner5H2FWZgL2J7TQbBFpkXNXwOvk9YdZZU/PLNz816qBM5JbblND1JQirehtP+
         JPRofVH5+WfuEYKoM7vqTkBp6xejkWuy+yzaDOf2t1e6nfdMvzxGe8oQEGbmdKg98bAR
         StKqDCjnrfEyeJoJD80oqmb2d8GCPgNJa9I5621VxMT7lb+V/ThcPd68BzI9wb9SmZyj
         D7qQ/smBD157eMnZRB8xBVRcC8w9xYcxXZUdC0jJ8Md0R46ln8Hs8qhlhWyOcsxS1Fz7
         RG0/Q1v1FbT6PdnbjaDDuJ18zgefK5dbnWD59RuGqHhS9UXZ+8UBcyZ25l/zEBXY8n7w
         CHJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702626769; x=1703231569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFsHje9COI/b9OIIHvICg/9h2CJC4kLVD0P/odq0XJ0=;
        b=ApuyW/OowHxNRFcIrxwlOpsUfET0GeQPUU8IeIphDXOUOJgq5scpcHPhs+dBsx5Tao
         74S5E2mhK8VFsHAeHAEHhK/g6kv61+TMaZaZMufxxjgZofiFernyLIqzd1gHEa0KlIxw
         7VzYUCw8rLwI75HjtfHJ5wxshD5aDVZ1m7Os7U6rxUegGydGKKFzh9lwrQdpTDJMpGvl
         X9+62bFunqRXFZRci6m++4MkPHJTsCoWA5/j0SBZSLeMpSQcRn9K5NbmX/rvXymsICKU
         /oaMNjh9jC3CXDijQsJubA4FIynLqIwnV132h/vl974K/hi0u5MXbSCM4yidYWURULhO
         a6Ag==
X-Gm-Message-State: AOJu0YwNiDoqMElYN6HXqXVAqNKZhX8JNTXXQnk/YozGk43gdcsGLpTe
	Fkp0chdFNpFhD4ruZeyDf52iYywR2Po=
X-Google-Smtp-Source: AGHT+IES0pFRLiGj/hBHBGAIwkqrfWuH+X3Dub01lQNfi0U1bLvKVEIieLrTbsHJrmDXs2AtVtkXEA==
X-Received: by 2002:a17:906:35ca:b0:a19:29b3:89f4 with SMTP id p10-20020a17090635ca00b00a1929b389f4mr6049450ejb.52.1702626769239;
        Thu, 14 Dec 2023 23:52:49 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id le9-20020a170907170900b00a1e2aa3d090sm10348666ejc.206.2023.12.14.23.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 23:52:49 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/20] python3-joblib: do not rely in distutils
Date: Fri, 15 Dec 2023 08:52:26 +0100
Message-Id: <20231215075239.3049865-7-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231215075239.3049865-1-alex@linutronix.de>
References: <20231215075239.3049865-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 07:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107500

Upstream has removed the dependency as of 1.3.0:
https://github.com/joblib/joblib/blob/master/CHANGES.rst

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-python/recipes-devtools/python/python3-joblib_1.3.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-joblib_1.3.2.bb b/meta-python/recipes-devtools/python/python3-joblib_1.3.2.bb
index fe1e68c5a..d68b40e38 100644
--- a/meta-python/recipes-devtools/python/python3-joblib_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-joblib_1.3.2.bb
@@ -8,7 +8,6 @@ SRC_URI[sha256sum] = "92f865e621e17784e7955080b6d042489e3b8e294949cc44c6eac304f5
 
 RDEPENDS:${PN} += " \
     python3-asyncio \
-    python3-distutils \
     python3-json \
     python3-multiprocessing \
     python3-pprint \
-- 
2.39.2


