Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BECFDCAC5B9
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 07:47:36 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.7570.1758959253788009518
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Sep 2025 00:47:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hw/ffQ4J;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b346142c74aso561918266b.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 00:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758959252; x=1759564052; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=S8qcDjpC8JXqzb+WJ0ZiDuwaQM8sSyRJMikn7ngARpo=;
        b=hw/ffQ4Ju3gILaILWIn/d7C4j4NN9s59lmlWIRp4ebbM6EYrfHEdxgOVg+71vX2GCN
         MlZCznAP99OUH4YFAuODWWkIzQy28woAhu26dKViToYZvK2pXeG9QbLSiJvZY4NEYdGu
         u5Zz4g3UAVXrbWamz/TGvzxbYYHva8PDjCSYzNz5EnNdliBrOia8YZNneq1qWptYqasa
         rjGdY9hf0PVoeCKkJSgTj+jC3+Zrlx9xC0gAmJhsnVcsyCA7AtEjksNR4Iu85lF0I2bV
         zxPcaQ1PRZSkH75jGOPa+OWwfQCnHoRK6Hso+AonuAMBRDqzcqIDmjpEClveo7pcOG7x
         iA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758959252; x=1759564052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S8qcDjpC8JXqzb+WJ0ZiDuwaQM8sSyRJMikn7ngARpo=;
        b=UChxO4xEJ68hAIdjMrRa7ssXi3UlQ8oN+GbEfIA5RscV6oC1NXqWOwtKuPaChO8tLf
         NWsnVBQ+8xO/r0oUuSvMsc//r1m1bCcXKXY9wVU916Jc0h3oKmIxkByF0mKrVXXEsxJZ
         CyfJwEbJxa2WdMeGXtR/HvXqaiNj015IXCAC0Ntnf4ruc9iVBAn2Wb8ThGs9JPhQ7U5x
         lV1MyU+NyDArHL6yYHHK5niY4RU1KHT0kZtJVDlMU/kSbIPWwn0l471kDWiWGDsivMIC
         +SeOp0NH5FbnhOot/18Oy/p7kWI1kpJY6DrAAkA5hEaP+T8MrjPDsssxbf47YcR75QJd
         uoqw==
X-Gm-Message-State: AOJu0Ywr3KfyJpdKOq1pciNkc0ANf9d+H4r/1VRfyAVBhzCbEzG7pKvQ
	UGTlWqA0/yDqEgXKLW1WA5zEfXABKbhr194YdbnrsUmsjVIQEoRar6A06kuVCg==
X-Gm-Gg: ASbGncu6t7BaQeCKiwrhsQ2fgflZ8icffhbsAJpo5vEoAL/inWMTajIQNiDwh3qiDF5
	ru/iPI3O6+7N0AEPzIM/ouq4O6nn6JbWuCRVBFWHKgy993PahQKJJ/INa/KpjbGOv/p0SqHba4c
	OPfllinAb192o7xfDsNlZ7ki+RGUCt4FWdBonn28/mnJhHIYHZela0LkhPl1nTJxiXk2Vqf2ey8
	CFwz0jEHGTie95JzTbO8WvvRVy4p9vHf5YqGIQnGJburgBbRJbwe0nClLmFjpQW1QCjTZg2ALhU
	8TUtnN3VBBqP6b0PRAaYg47sqCHFz3P9BEMs2t4iUMI3JEDuldnH6ws7Ng9mfizEyFa01XeD8/5
	ksBHi2jlRxbY0Z/NGmckyQx0HnvexQp9Z7YZAI89h1A==
X-Google-Smtp-Source: AGHT+IFW4L0yrniJMdG9NuMbJVXKqydttinWcTsFBiMkQTpQaZIWaJEPxHCDbO4+/4/hKvUClzCffQ==
X-Received: by 2002:a17:907:7247:b0:b2d:604d:acc8 with SMTP id a640c23a62f3a-b34b644ad37mr1113321266b.12.1758959252052;
        Sat, 27 Sep 2025 00:47:32 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353e5d2ddfsm512795566b.14.2025.09.27.00.47.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 00:47:31 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] psqlodbc: set valid SRC_URI
Date: Sat, 27 Sep 2025 09:47:30 +0200
Message-ID: <20250927074730.175471-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 07:47:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119978

The old URI stopped working.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-dbs/psqlodbc/psqlodbc_09.05.0300.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_09.05.0300.bb b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_09.05.0300.bb
index b0fc35eb97..ce50a4df48 100644
--- a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_09.05.0300.bb
+++ b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_09.05.0300.bb
@@ -3,7 +3,7 @@ require ${PN}.inc
 LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://license.txt;md5=6db3822fc7512e83087ba798da013692"
 
-SRC_URI = "http://ftp.postgresql.org/pub/odbc/versions/src/${BPN}-${PV}.tar.gz \
+SRC_URI = "http://ftp.postgresql.org/pub/odbc/versions.old/src/${BPN}-${PV}.tar.gz \
     file://psqlodbc-remove-some-checks-for-cross-compiling.patch \
     file://psqlodbc-donot-use-the-hardcode-libdir.patch \
     file://psqlodbc-fix-for-ptest-support.patch \

