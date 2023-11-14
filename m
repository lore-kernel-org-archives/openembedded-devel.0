Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC50C4167B
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 10:07:20 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.9660.1699956438756413319
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 02:07:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=hkvLQbkR;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4083ac51d8aso44353685e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 02:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1699956436; x=1700561236; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHzKS25/Z5UxVkJ+dyYV10XUuu4hSUGD2EIM/5Ez9Ns=;
        b=hkvLQbkREohFVGk3ND7+oZfDfHIakPBVzDZaLXiOSLWzwlNt7ZkfNILbr1c8CMGm0C
         i2dRF5c9HdXI/VzcQ/jx3s+z0eb/uJNGJUg269WAmNmhp/ntUveP2MZDYz06viBa88s8
         7Frzp1w054aSanh1PKjcDnKuF7gNR+sQmCcEqYclWFMvsVzHsnnBuoBPSetVhH2KwhfF
         1H3i8dePyRW6hFGm+BGDKLrrm7o/URXmq3RgAu14T/g0mhsangXvq/MJj7hMj5tBgCMS
         jiDnaI6OF4Bfzusve1ZZ63aYgWBFsThYmgcn3jmyMFtuBu+zUuJGecigWFtlt1z0OSrI
         VKbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699956436; x=1700561236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lHzKS25/Z5UxVkJ+dyYV10XUuu4hSUGD2EIM/5Ez9Ns=;
        b=IDb5Zwj9WYoJrI5vCwne6pvvqaU0WEql5835bvo7CDdw4djLr1ZgPCXJaOlIHB5Fl8
         7IOd3FgRbAlljOUFf5eak3u0ldxnDotguhAw0aoRCbflD41m3zcplL203UGr+uEW86O8
         NEk4p+2d5Q5EEoEeOGYHDaby4PsnePdxRGFaYQfEOxPv3OC4oGUiy2gUP4O1+d8se/E0
         ugEXGNZBiMex7LM36Z1R5Ta6snco0Rj5L0gbnpzvtX6vMydxSPf5LnhkeH3CFxnPv21G
         VmqD2W7MLAwTi1g590QKkI9UbAeWY94Ju3K54Tn+1CPKzv4x3SZWiVs65aYRHDZf+i0z
         ulkw==
X-Gm-Message-State: AOJu0YyAaRO+Fo8SQeWBEexmowuM+/cvQ6S1dRbvWL713ySsqN40tnii
	4Xz1qyST3jgh3ZqMgqofIswY4IwQ0Pj5NvuI0OQ=
X-Google-Smtp-Source: AGHT+IFzPt4ogEQYC5hxXi+sbKkZPPUuvnTg6SQbxwo8PEYV/PwIp691owfoCrJgMuP+uRaS7uooxA==
X-Received: by 2002:a05:600c:4ece:b0:40a:5290:dcf9 with SMTP id g14-20020a05600c4ece00b0040a5290dcf9mr4743882wmq.33.1699956435961;
        Tue, 14 Nov 2023 02:07:15 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id m15-20020a05600c4f4f00b004083bc9ac90sm10862562wmq.24.2023.11.14.02.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 02:07:15 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][kirkstone][PATCH 2/2] emlog: ignore CVE-2022-3968 & CVE-2023-43291
Date: Tue, 14 Nov 2023 11:07:00 +0100
Message-Id: <20231114100700.3273936-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231114100700.3273936-1-yoann.congal@smile.fr>
References: <20231114100700.3273936-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 10:07:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106704

CVE-2022-3968 & CVE-2023-43291 apply to the other "emlog" and can be
safely ignored.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-oe/recipes-core/emlog/emlog_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-core/emlog/emlog_git.bb b/meta-oe/recipes-core/emlog/emlog_git.bb
index 05fa0c334..2ded3e204 100644
--- a/meta-oe/recipes-core/emlog/emlog_git.bb
+++ b/meta-oe/recipes-core/emlog/emlog_git.bb
@@ -34,4 +34,6 @@ CVE_CHECK_IGNORE += "\
     CVE-2019-17073 \
     CVE-2021-44584 \
     CVE-2022-1526 \
+    CVE-2022-3968 \
+    CVE-2023-43291 \
 "
-- 
2.30.2


