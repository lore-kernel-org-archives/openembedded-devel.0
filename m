Return-Path: <debrabander@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A54BC3DA4A
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 09:44:56 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.55946.1723110290694932075
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 02:44:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EBTnSHvE;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: debrabander@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a7aa212c1c9so103159566b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 02:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723110289; x=1723715089; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EpnzUT9OYfbqUYa1mpOPbPvO3QN8SlSe1yZKxBY1syI=;
        b=EBTnSHvEq99B6+BsMg2sAjQRibZw3WWTN8r9QNxsH4por9Qda8ZLHCUNRYs5ZUYyfR
         hz9j0w2HXdU76q53KlsNygKZVBQGyR57kteIy+GDCXqKGjccNblfJQd905HTvmnKOc0c
         KWxA6MC1KBmDKBhmID4hav3sLqQzF4rXDlVCYrS6HD43JWfgTLFz+9jeq8l16oLs4pVq
         PWejn7fkdlJZu7K9i8x9dN3NqBk0WvJOM+X4uLKkrfVTcS5H8mXSTrnfYe5hNY5Fjifo
         lgZr0a9ObSYbvJaSrzYVCJ/CEW5zcRIgrqzV+G0Jv2aqMrQ2BbtFhy1sEq1TJo/vnlsM
         t9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723110289; x=1723715089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EpnzUT9OYfbqUYa1mpOPbPvO3QN8SlSe1yZKxBY1syI=;
        b=pv4iafni08LwwrNgl9vxwiwmg2ELE1C/QnYh4setTkVh4P1j+AXgbIxUAHXnYPD3Po
         Za6UQ6UxHnxfmBlvdAt+Z5LRgR4wztO3nins1tYN5ALXpEK6pVy67dINpIZBDepMupUW
         gIHM6m3oDfSP4DpDfhczWfJIoMBNbKqqanLzz1SjizR3EANNcpp7uy+UKo2FbIIzwT5b
         28a/FA5ZzFYgmDo+7xmbkTEF4LzysPyKn09QH6k+2Pi/8tDvkpv4xgZUlLaj3pi923AS
         ZLdV/vWe9VklqeCCMbdIHeD5fRuRJ2s+bMCsiFlpWvsKBcU1c7BThynu3pJbjtJ0SSN/
         RBng==
X-Gm-Message-State: AOJu0YzS2IxN56OrtNXmXdtI/TS+IDJXlMNmRW41YLD77Si2xwtD52i3
	iQtjrZGENBjCLMwwDz06/IJ1F2RGyF+m5sViMHuuFHqhLZEBl+thE5lqzA==
X-Google-Smtp-Source: AGHT+IGeeOarzyloSBF/EGGyvCej+a1XG1Z7j+I/icUQazTetQgJVQrv9kkjJfI1wxFmswYg2gawiw==
X-Received: by 2002:a17:907:9450:b0:a7a:8522:5eec with SMTP id a640c23a62f3a-a8090e63164mr87130566b.53.1723110288750;
        Thu, 08 Aug 2024 02:44:48 -0700 (PDT)
Received: from win95.FOX.local ([89.205.132.222])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e49sm720593666b.180.2024.08.08.02.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 02:44:48 -0700 (PDT)
From: Frank de Brabander <debrabander@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Frank de Brabander <debrabander@gmail.com>
Subject: [meta-python][master][PATCH] python3-pydantic-core: add missing RDEPENDS for ptest
Date: Thu,  8 Aug 2024 11:43:58 +0200
Message-Id: <20240808094358.1236-1-debrabander@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 09:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111649

---
 .../recipes-devtools/python/python3-pydantic-core_2.18.4.bb     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.18.4.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.18.4.bb
index 0ab1873a0..37a4440ca 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.18.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.18.4.bb
@@ -37,6 +37,8 @@ RDEPENDS:${PN}-ptest += "\
     python3-pytest-timeout \
     python3-pytest-benchmark \
     python3-unittest-automake-output \
+    python3-zoneinfo \
+    tzdata \
 "
 
 do_install_ptest() {
-- 
2.39.2


