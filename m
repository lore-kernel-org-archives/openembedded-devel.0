Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83907D3E19C
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:42 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web10.29946.1729278794036385405
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GfJ7wmJ+;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e2972abc807so2295552276.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278793; x=1729883593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sok2DgYqz3n6PH9vN6m0hSzppzFeMZ2f3aLJTd+1jRk=;
        b=GfJ7wmJ+qZbfy6chhlk1CTbnYWFjV/CO9ckHFlBtr+GgQzo/E+MyE+g+yJccvSLttJ
         j6uhsNqXqou/EpVPV677CXUb/H0JdgcA5WpBmIgQgbhDbI4XOb+5hOqsaMpkNrbDPpKR
         cZ613s7v2yC8qfBU9ZBoX5S362UmnaBoOz/ZJL+J6YfLGPHgOvww699DpucgclbkKr95
         Ejz0n8FEHXVI/jkspeBDSqajtwiVqs3ZBDLBqendaqmYhOiDzTCKnHzZrDZ5Ux+XBbHc
         Pg5krTWuqAUnya7aDkDp1GxTxkqIPA25t5AIAzbnEzYJzkvfLvqsQEk7SN7VsLDGi40G
         Q9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278793; x=1729883593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sok2DgYqz3n6PH9vN6m0hSzppzFeMZ2f3aLJTd+1jRk=;
        b=lJOT1XCMzmeogOoUdwxAcYVtfgVybB4pZ6OTyWf4RdauqUTpai4fihkM8yfrFmmwvv
         +hEM4cvIylWIwHfcJOt0AhVjVsktWVu5fNo3Kcrq4o4LKnT6J7Kh4Y7sN7aXuSEMrQnd
         ManmIynSUYQYMK8roltgl+3QqPZswR7C25N+Sq18ixHdQSjp3i7ku4Cu2YJTwMtMT4v9
         S3sY7aTPh8+3xd3jSUloocyH8rxIc48EJ8pUeNJNxFksWDh+3UDewaMrDz3GxigUvkDw
         nN6Mb/DUAjMe93JW4Ek5ZzCGqOhCAMZjHuiVaENKhjwNiuCmh18ypFafFl/ZUppNgNgu
         3ZcA==
X-Gm-Message-State: AOJu0YzaU1oewbZfBgzU51TiuoR+ZP65sHcPRS+IizVm6+OJH7xUE8ub
	CVranOLm+iZEn0spcWuBBJ0uFozdTgTBaeYCffykggn90HCmO4F4mLC+hw==
X-Google-Smtp-Source: AGHT+IHFWmeYVIxcWLZhdEfrN6qmtn7Hlpteom6TBuIF1S/zybcB/sPmpxARzOnAtAaJhoO13umMAw==
X-Received: by 2002:a05:690c:74c6:b0:6e2:43ea:54e with SMTP id 00721157ae682-6e5bfc73ec9mr36668727b3.21.1729278792460;
        Fri, 18 Oct 2024 12:13:12 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:12 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 03/68] python3-pyconnman: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:05:50 -0400
Message-ID: <20241018191101.25184-4-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112990

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../python-pyconnman/python3-pyconnman_0.2.0.bb                  | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.2.0.bb b/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.2.0.bb
index 359a2918c..040f1acc9 100644
--- a/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.2.0.bb
+++ b/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.2.0.bb
@@ -4,7 +4,6 @@ LICENSE = "Apache-2.0"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "d60bdffbd9c920f005fdc5e05a8b94cd"
 SRC_URI[sha256sum] = "d3a63a039c82b08a1171b003eafa62c6f128aa4eaa1ce7a55a9401b48f9ad926"
 
 inherit pypi setuptools3
-- 
2.43.0


