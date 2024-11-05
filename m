Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA80BD35E20
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:55 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.27817.1730831884258417662
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DV0Z2uFC;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6ea7c9227bfso12396517b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831883; x=1731436683; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2LHQfN6ZwsiyvEitp2x4O2EVQLU9eBq90uWe2qGOZao=;
        b=DV0Z2uFCAHbF7Vm25K5YGj5r+fBdzKQ0HK8sQ4wzeTu8Bx12QoremAGdSrJ1gDQBp5
         NDOnvAtqOH89n+gUsswd6uXh+48ZTdMc71cmoCODFnR1rSioMmI4YbdfM1OW/LxDamBB
         rpQ4cpwB5a2g8pTJQueWB8Mp+Jwo3H78Ia8yBOVSnB+RwjRzdh7U080ihqjgkujMeKhJ
         aKgl1nb9o3iIPUgdSNQt/QijO1L7zY66enz4L2Ylk1MqX6sr7YvvytjgJ3ARNZoqxGfP
         M3RibesbUTuDfs1laBujfYSQ3uzc2Iqrrz8bQLPsuWbgj2/Stetz+8EtHH3iobuimRA2
         a5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831883; x=1731436683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2LHQfN6ZwsiyvEitp2x4O2EVQLU9eBq90uWe2qGOZao=;
        b=U8cmBbrLu4Mi8afd6lZxmAmXheboirwJ2K5D/IFDfq1QvttqB5f6ODr4OYg4ifhCPO
         Hhd8P6glVw2IxDXX3Z54yG3HzXf+tSHE57sttQH2NNMJMuJKZtNjp7dIDiL04VB42jaj
         yCXNBufvuUvfu/HzOdAbtSAFvixGDCXy6RfdZ/EHyfus50RlMBknM2L5HUXGGj1myO5T
         VUh8LGa946nTZszQcoF+3LcOu84Q07zxChqys5Q8tL3f8hnHvgMDJlCoxo5YXqDd+mDg
         x4LxQSzwyq71A3wqyFEKP2E6Rp9Ohq6ci/thGY8NJrM8d2PbkAAQxkKobzzti9VXdfd1
         Eapg==
X-Gm-Message-State: AOJu0Yw2OyDzlypBFpjO4DoTPj7RhP/GzjdqdXXQfiwQDBxGJ90I5h0g
	xtUFrdVyL8HCOusw8wAl7SIIQL361maDaNfIH1x3VJFwwldOIf46LVz6hbri
X-Google-Smtp-Source: AGHT+IGvhqA64YPf86JIJWMN0ctHxZlbcmq4pZail+ZiauV3Q4rYssFcl5ExPqspfklCDnRYjA37FA==
X-Received: by 2002:a05:690c:5:b0:6e3:29ae:a3a5 with SMTP id 00721157ae682-6e9d8b001eamr369420217b3.34.1730831882812;
        Tue, 05 Nov 2024 10:38:02 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:02 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 007/161] lmbench: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:24:43 -0500
Message-ID: <20241105183658.34982-9-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113522

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index 6729e81fa..2533f6033 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -30,7 +30,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
            file://0001-bench.h-Fix-typo-in-specifying-string.h.patch \
            file://0001-scripts-build-Fix-the-tests-to-build-with-clang15.patch \
            "
-SRC_URI[md5sum] = "b3351a3294db66a72e2864a199d37cbf"
 SRC_URI[sha256sum] = "cbd5777d15f44eab7666dcac418054c3c09df99826961a397d9acf43d8a2a551"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/lmbench/files/development/"
-- 
2.43.0


