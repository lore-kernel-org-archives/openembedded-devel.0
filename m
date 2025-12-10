Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9FA0D3B9BE
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 08:16:20 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10967.1765354573328225237
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 00:16:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hw8mL+MW;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c03ec27c42eso1504371a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 00:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765354572; x=1765959372; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0sjHqfihAC6OXVeQFzgTQ/SzP7lJYfmKWFi4COnDZI=;
        b=Hw8mL+MWCeFse3JmrPWCiTqREQLNypFlBAkWk7h/1HEmAYW0BxbrUnl1FYX1CEq6si
         Q+tbF6iKM3tmHrkUY9adW+jXgRdpIZ9MNm8OPO/VFNEOXR1Y6zAPgWRvJA0hPqUR+EeV
         6lSN6Z+GJQfE2QdSl6UqDrZKy2NDnZ98pqQSGQLbs6uwNbmNZNEGB3uW7LwL1WRzUU4F
         /WDcG3B1T9ZPVdIswahNEbuujfA9vwqwYWsH+SzhO93PxgcvPEUi6Mcj9fgKVRPLjrJg
         KeWYsqDewv0Qlh7erPWp9JQXjhFMKnyLIsBiWVGFv5wFZ8bVGIq9+h9mKVwUQynSNcHK
         MIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765354572; x=1765959372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y0sjHqfihAC6OXVeQFzgTQ/SzP7lJYfmKWFi4COnDZI=;
        b=Yo4eqGbfDKEBp9ZjWpT9JjGpZ5vyaE8ucp7XSt5LuDJN9FQsx4R8qz10Q3lcyY4vj2
         DYTctRlYL8KhpwnzUEXAMthWtHtBIHXBxmew9uikMS+OH9VopDNkWbqMk7OzrvecoL7b
         7IsDBIiOC83QWj0RAmDD9IuRzgWSNlGJz6YLP3v/aiwurvbGFFyfnHmaE3L74IpqRk22
         SrDMzbh6qg2ZR/xPn244jvmjs3MC4QMTIG557rkLNV1/G7HqvY285OIlmq7x9iJdGBuv
         PchVzwVbFtmfoq1Vo499tEGt1A9Hs1ktbxNNHtjFXlHd240/45+mrrjnxWzuD9JxLHFT
         ed1A==
X-Gm-Message-State: AOJu0Yyth0lQGAWSZSMRM2tO5TwqoR2VSglfajWybPR0MluzrAYNt9Hj
	cnFWBddCh8DGZQ9LDM4TWj2awQsKveBlypnfyVLdqAnsU593BRhvtsxLqKQeNBYf
X-Gm-Gg: ASbGncsu0jhCIHmy5LF23vmVmzI13Rv3MLOG2Lp7H6FP16MOEQayu4cXh9uytsNXsNa
	W2rejboeYAqxpUzjTuSe4ZVbzhBhCtxljxzB03z1pQps5T0RXKPvg/8mCRrFtdS+ZgzTOW0CozV
	fs5QGMh7zEbGJYureE8EaxpLnSqrQyeFdk1+fruyPJyGuCeTpRnjrMqWLlXwIsgNF3qscCHrw7d
	vVju9DwTMU3wOS0EtdNf775bN3ujZwgEAcwOwt36QPPazhGDHK+AsHBGclLojyO6hU75ZE9YvfB
	WQ6ASDx7Stp4SR81HhbC0N3bybsXUzZRWCe+0e8AiyTk3u0+8S2G8Z23fzkgo4ouac3Y9DNVx9a
	C0f9CPJJD3RHCPMLUswKJjq1qXMVVJN4YOwiAuVpLy9Zj0i8PJT7y8rABk7IH9sLeHo6nmVvyzI
	j1YWaSYTbJD2D97I5YpGNuLI6LRFfTTw2Mi16iPYtiTAIc+OyDsmwfDWuhTtrbuFMV8hEJc1edn
	MEh111TvjvqboCPDz95hv0rjC2pT8eVmYxo6k8BRqc=
X-Google-Smtp-Source: AGHT+IFAhpV1INyrFNEEU5Mb0aktYBFDqUGV6BD+iPIrwwt08IYgO83tJPvq8Dl/+6GFO1APRyByJQ==
X-Received: by 2002:a05:7022:1004:b0:119:e55a:9bfa with SMTP id a92af1059eb24-11f29696922mr1225590c88.22.1765354572337;
        Wed, 10 Dec 2025 00:16:12 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::69b8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df7703bd7sm80613086c88.10.2025.12.10.00.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 00:16:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 4/7] dante: Add _GNU_SOURCE for musl builds
Date: Wed, 10 Dec 2025 00:16:04 -0800
Message-ID: <20251210081607.3196421-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251210081607.3196421-1-raj.khem@gmail.com>
References: <20251210081607.3196421-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 08:16:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122491

This helps build fixes e.g. cpuset_t definitions etc.
glibc builds have _GNU_SOURCE defined inherently.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-protocols/dante/dante_1.4.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-protocols/dante/dante_1.4.4.bb b/meta-networking/recipes-protocols/dante/dante_1.4.4.bb
index 7aa1103855..52cfba4c5f 100644
--- a/meta-networking/recipes-protocols/dante/dante_1.4.4.bb
+++ b/meta-networking/recipes-protocols/dante/dante_1.4.4.bb
@@ -29,6 +29,8 @@ CPPFLAGS += "-P"
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"
 LIBS += "-ltirpc"

+CFLAGS:append:libc-musl = " -D_GNU_SOURCE"
+
 REQUIRED_DISTRO_FEATURES = "pam"

 EXTRA_AUTORECONF = "-I ${S}"

