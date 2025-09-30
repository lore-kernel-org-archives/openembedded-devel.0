Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E61CAC5B8
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 09:18:59 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web10.21057.1759223935033800590
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Sep 2025 02:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M+4eWr8D;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-9194a0241aaso140213339f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 02:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759223934; x=1759828734; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqEVaSu9/Ahj2M5PHlQjOAEtq7RCC6e/NRH5TRIX+KU=;
        b=M+4eWr8Dyod5Jow89bKsJLEJDvm9eqkSKlbyYdn/Z6mrah3CYLdxUeSTwzZNyOI6Z2
         +EEKEV9eb1AfdmkLv6hKjxepHwcbPyfVvMDlzox79xS5XvLYYrArkN7kJgsOls0mq/bS
         6jecHAu51kKP5hWzHjTMXsbdop3hFwOaIDrH6F1xChLWOQ2HH4+NK9LKT3xG0og/v/7D
         Duu33x4mxcI31nh9p/TJ9bPMQlPTSsWhwQNx7Qgdy4cJczBJq8RCU/QREMzN5k34wtqR
         pQJ7lxhKVmS6HHH0GItEcrVK9TilcXMkAV1l9SKxrKr2ekCVomF+s3I/+OocJawslQ4c
         CM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759223934; x=1759828734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eqEVaSu9/Ahj2M5PHlQjOAEtq7RCC6e/NRH5TRIX+KU=;
        b=ZzrDjdtTR/wwM38Or0pWLVYqaQPoxwOD+gNiO45ezvChiwg0GnBS4UsXbqbNOlB39c
         AJAMi8LjMEARSowXAo/nXD2ciBJEQymaxzZMTiY7WXIhcBYewVper+taYw0NqITqb3ni
         CWvk4fDv5sRYLLTnLqhLm39VVjLMw+OZIX9nwd53rCu+7MegCkGDjhJW5LtImfCM+e4S
         wodU2H1BKqIZTa8i1aTfAF8W9Xdtsj82IwNcgrgEwmpJYGJkdsM4GwMmCCMbtRFH16g9
         LGN47Nj7Wqhm5VvrNrBkzKtiWH10c2qF1o1hKJ5HS/NJNF5viBeErLm3zfpyiKm7kdmA
         Dm0A==
X-Gm-Message-State: AOJu0YzepW+jIfksuupupj4AukI4jbfs4WPDHLUD9fSw9bnSW/QuwKxV
	986OUfU4sNuQcdPF7ZbWWfsR+3EG5WnNmVP9SYOlzy/bWtdiOIZKGKzdOY+JkFCG
X-Gm-Gg: ASbGncu8HAX2yqrMzQocJ4DarG+IPiDqOIcEC6mpNz40q+5vdBh0j+N816HjP9zTdTa
	YAXk8F2YvY6kS1sXOIoDxzvkyUo4ts2Qnln7+yOp7Klul2hQmlTUXN6UuxZxx8o4Rni6cv03pAn
	51xO7on3URc+RtYqjGUyyjqCJRQDjbV8w8q/654APrE3T2B8z5xW8filSAfxukQPti/5+aaQI3x
	XIagvSIhpWGHnZ+LpREGNpth55GjeEUZ2uOM5MT4cRXdAdOu7txV6Oj/SD4jZZk1BGVRnDd6Gl+
	wx/oK7ZgX7bsGm2IKQff0CJk45jfuBgw4VagZjrjqPjM/CnYpPLddTStjJHoiVM8kLOz9OIZDDM
	zS3EfhTOWS12Ekata63uY7X7j0NRKSPqTEbolmQcYIkMmNQGnDzP91LJJ4o2oFq25V7jou5XXEL
	4=
X-Google-Smtp-Source: AGHT+IGgFoHqurz0EDP4x25xdsswZjG/S4/u/k+X0klKQ/H16ytjDg0DnJOGM8vqf0Rv0YJtU1rQOw==
X-Received: by 2002:a05:6e02:3c83:b0:426:c373:25db with SMTP id e9e14a558f8ab-426c3732a86mr237144495ab.4.1759223934046;
        Tue, 30 Sep 2025 02:18:54 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5742a4afbc3sm1837064173.2.2025.09.30.02.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 02:18:53 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 02/22] parallel: upgrade 20250322 -> 20250422
Date: Tue, 30 Sep 2025 22:18:21 +1300
Message-ID: <20250930091841.1693131-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
References: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 09:18:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120054

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit dd4e71817df9ba6dbf1797689bd4e3da063d249c)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../parallel/{parallel_20250322.bb => parallel_20250422.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/parallel/{parallel_20250322.bb => parallel_20250422.bb} (93%)

diff --git a/meta-oe/recipes-extended/parallel/parallel_20250322.bb b/meta-oe/recipes-extended/parallel/parallel_20250422.bb
similarity index 93%
rename from meta-oe/recipes-extended/parallel/parallel_20250322.bb
rename to meta-oe/recipes-extended/parallel/parallel_20250422.bb
index 8767f2946b..88d1cf040b 100644
--- a/meta-oe/recipes-extended/parallel/parallel_20250322.bb
+++ b/meta-oe/recipes-extended/parallel/parallel_20250422.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "c82896e779b18c2a157527f32f35de9a6d984f8b8ebad2b41dbc78c33adbaabe"
+SRC_URI[sha256sum] = "10f0a7b7fbed87edcbd63a403fdc0ee1a1f86c241a3605f33162b4b9aff248dd"
 
 inherit autotools bash-completion
 

