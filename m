Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2DB9D35E25
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:55 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.27819.1730831885147975264
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m7Tqh0Os;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e30eca40c44so5224854276.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831884; x=1731436684; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nvo55LZgqm6p1EEjLPHt56x0uqZuDDFOq0ypkktbmMk=;
        b=m7Tqh0Os4sQySqd4uQ9khOXtfZV75Z47o64nme8tWXlJXvTq8M1+sdc54uYNVCzoM0
         46f2tHpGF9PmM61WMz3D+AY9MtPC+3x9TbRWJGeqFkIdJqEtihlIZS0HTw6AGZsItCmg
         eVNBtrz572nEXgzM7103wDmtjApz+mXeGnfsV357QuRUImJHKZrYhyO+K1kEplnVNSrJ
         F0u0UEcuqv7wGALOGwJJWGzxZtVrLFDQkRZeZAYgFidVm6T26J9eIOlom40nRbfeFQkl
         D/Z7BPhJqVYKM3Bc7qcqEby5W/tWHJAfqtqJrfN0zSlDKdoKLGoVn3eIpRyllrrvk7Y+
         Yx0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831884; x=1731436684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nvo55LZgqm6p1EEjLPHt56x0uqZuDDFOq0ypkktbmMk=;
        b=d+v7v0Yg30PPCqIuRAR4exDQEem3F3NpA7jR/+xA9CPGybJmeNrxzmI2buj6GYa930
         Fv+B7VYbpbmyIKM+gCmuYvj1Q7dHABAAFdzwkalgsCjqEMq3zGZkt0onnkwGmm9yoqzK
         b5ZCZX74pjkS/CxEZ7agrrmBYjMt/h+cqpfWuYz3j6/eUqNTCD75o95zmYGwQ+IgSYE8
         NOEtMVm/kuxFhovKxisOmmgABgfZD+Ehu8cC3r+hiesLZ6jOkVCyRzJuZ+Jl6Uj9CkIH
         dHs/TBjBb4e2h6R7AoAh6AsmOHkryqqgdUQE8AfVfqnIRLx/lDYUvlbNwrXrNRcJNaXQ
         eEUw==
X-Gm-Message-State: AOJu0YwM14AxocTzYegBdITSaf8cvOlK8hvFbAb8nivgDTQiTgj5JBdh
	hz9tb8MBMqUlO3CZ+edyZ4lL1Teru0CkGGMFsIXL6f8H9r8B0zZnzKXhI1f0
X-Google-Smtp-Source: AGHT+IGyMn5EDJedZRNxpRhAFvRsAYS6E4YHfZzrRlvqm1iszr80pjIK8bBJ+6mGYd060gDtHo6r8g==
X-Received: by 2002:a05:690c:2a44:b0:6dd:76ce:d6c9 with SMTP id 00721157ae682-6e9d8b0eb5dmr268480547b3.42.1730831883592;
        Tue, 05 Nov 2024 10:38:03 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:03 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 008/161] nbench-byte: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:24:44 -0500
Message-ID: <20241105183658.34982-10-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113523

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
index b4d55be1b..9e1cedc2d 100644
--- a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
+++ b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
@@ -11,7 +11,6 @@ SRC_URI = "https://fossies.org/linux/misc/old/${BP}.tar.gz \
            file://nbench_32bits.patch \
            file://Makefile-add-more-dependencies-to-pointer.h.patch"
 
-SRC_URI[md5sum] = "285dfab361080759d477ea1fe7d3093a"
 SRC_URI[sha256sum] = "723dd073f80e9969639eb577d2af4b540fc29716b6eafdac488d8f5aed9101ac"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
-- 
2.43.0


