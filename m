Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5106D10BFF
	for <webhook@archiver.kernel.org>; Sat, 26 Oct 2024 16:08:46 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.13492.1729958921390749651
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Oct 2024 09:08:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EHihOJdh;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7eab7622b61so2040082a12.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Oct 2024 09:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729958920; x=1730563720; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=auNjj63WWaR1NNC9I8SqHU7v6hEovaCCHtmEDhDtNlo=;
        b=EHihOJdhFqWMgMvVIoFiiJJZ2NXPtK9oW9teTrE44LECcwxlT9RQEyQwBz39aEMWd5
         KY171kuvgmmtjb0Iab7p9D6Yr4OWO8+//f+af7G8HUg6s6eJmY0xnNMaiPowZAwL7L8g
         a7G4L5YGXB7pe7tO/v2NAvNEewLjr9l/Wr4dwLhrdWVpiWpdyFCa00g/eEz3tfP2xbKf
         HOad9zWk84LlCxroYGiLJ3UZm3N8kj5sRj6nLsdImsmRjR7rhKJdu5y8Zp0t3Z58KDqo
         3Zl0FryRGzxLD2x9dDsfhJCpICZuh1unzhKSj0B33hOTrxxDGOGgh1ddAybsIKiHBxmY
         Dr5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729958920; x=1730563720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=auNjj63WWaR1NNC9I8SqHU7v6hEovaCCHtmEDhDtNlo=;
        b=lfJJ2FrzvKuezpAW1jixp75j0+fih6Ea864CGUD0ReRflmttwonw5ErKZMW3mL1cUy
         Gt3llu+VXVeJ2PduxYga7xQPVNJ/Cu7Hzofp+6YKtB1uZV+fwzhWnbj1f22NsEyUqiEy
         jNMAkXQexhJA6h3YAH/vrn8XDeibQUDuLCy7zVXsLArwar5CMWWCr/3ImRNh0W3CGbFF
         DVucMZyFAkwHGgWtXnHWU6vAggJuafj+1JfZ3JmedBehahBc+P8ImmFbEpMDiV+AMdGm
         fqEVKRMo6Ud5ISRLOlDgBmiT5RnA0SiIuS9/12FsKfk01ecWwHHjiecSM1Pnco5/Ct2H
         Tqmw==
X-Gm-Message-State: AOJu0YyUQf/b6ufdiGXU9FMhKneAK547VeRHKa+xc8gG+gyjWBALw8Vn
	mZtqWKEkXO8Qc1ViuamJMw9ArB1/aq9EBwF+BJKXt1bunee8Npv6RqptoJAV
X-Google-Smtp-Source: AGHT+IHP0aCnskAutKn4ZGhO3MnO8oaDh53+FUYJriM6eCXCun48xeaJeYV1g5JJDUeYiZKQ7cO4tQ==
X-Received: by 2002:a17:902:ce90:b0:20c:9821:699d with SMTP id d9443c01a7336-210c6c9354dmr40043465ad.51.1729958920303;
        Sat, 26 Oct 2024 09:08:40 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::f344])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc04575esm25668135ad.235.2024.10.26.09.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 09:08:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-pyroute2: Add missing rdeps for ptests
Date: Sat, 26 Oct 2024 09:08:37 -0700
Message-ID: <20241026160838.2872370-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Oct 2024 16:08:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113236

These are needed with python 3.13

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyroute2_0.7.12.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.7.12.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.7.12.bb
index cf9885df71..a12fa0ac4c 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.7.12.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.7.12.bb
@@ -28,6 +28,8 @@ SRC_URI += " \
 
 RDEPENDS:${PN}-ptest += " \
     python3-fcntl \
+    python3-html \
+    python3-netclient \
     python3-pytest \
     python3-sqlite3 \
     python3-unittest-automake-output \

