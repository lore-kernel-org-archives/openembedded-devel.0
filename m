Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0646D36135
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:17 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.27886.1730831942581550610
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:39:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PmPq5pYd;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e390d9ad1dso47727207b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831941; x=1731436741; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P2dt4zaKNva25LhMGELuY2lVDUFIV+0Q4e3T8XkWqAc=;
        b=PmPq5pYdXWvDYBfla7Qmc+QfYRKdnk28WFFzwExGh0pxoC/02arvJ0SgoFRrI/C/3q
         b7fpfRJchoR95pfkeqBGZWwE0ZUurcgCjkD/Xaj0DfSZfbbk0fz2Ao8aB05kD8XUH+Iz
         wupn+cA+SgJzYm2TXvNSX2TiRLQA9Mz1Sn5m+kWSRHjPKEFUVeRPxnCLiDTtqfUrpxCL
         S8A7ToKDtndKx7ugtCTotJmH/w4DqPslfiJGrMvTvURzlXInvpZai3IZa6BUAJuASOQK
         1HNyVuHrcGGCeROQOjujy49LB2daI3AE6c8ptVK93moR24DNYlmswPk0xjMW1ibMsVSf
         MBMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831941; x=1731436741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P2dt4zaKNva25LhMGELuY2lVDUFIV+0Q4e3T8XkWqAc=;
        b=TYj7DP4LRt5xdmkB6nTpx2ggw6vm+D610R0Lb+BPWT5+GYtchSsZ7L72wUpY7UqQnU
         Ssu1udB+gv4bk/YkP9+MDuWOo4xLl0CkhagxTGfQD30oK2nj1Yy+IiVJm8cNOdgs1UHV
         zaYZVTvrUz6ZlNnx+D01mwJHnxocPDOhCchkYWMAicHz6PfPnSxkh6hCX4D6oJU8KrNu
         G3EhNO1jkVNrH9ZwjCX49qKtYDB/nsm+KaawgEKVCg79kuR9uHdiGI9Sqxym3KAEXNBp
         TrP85xFWEphfatPfLN6no8WKQ2pUu6Qx5nihYEM5Ayht8EPXYI78rZnGprJ0i/er8572
         x9Zw==
X-Gm-Message-State: AOJu0YxBcpPggCaJGy2Mf17TY9ENba3k/AzKkCiOsJKtm8NXhNW/wKr2
	z8S6+2l5ChOZlXbOSlE5PkaruWokn6p73RfxleUDy7i9X28T/NM6790RI/an
X-Google-Smtp-Source: AGHT+IF0SLsINs6g3k9JmexO9woIpY4AtQ6qR4mfASlagKa1Gmo6bdToYZwPH1D/gjbgew3zGChHwQ==
X-Received: by 2002:a05:690c:4d87:b0:6dd:fb48:118c with SMTP id 00721157ae682-6ea52525befmr215115477b3.31.1730831941339;
        Tue, 05 Nov 2024 10:39:01 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:39:00 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 077/161] openbox: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:53 -0500
Message-ID: <20241105183658.34982-79-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113592

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb b/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
index 50231602d..5b62b9b2a 100644
--- a/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
+++ b/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
@@ -11,7 +11,6 @@ SRC_URI = " \
     file://0001-Fix-list-traversal-issue-in-client_calc_layer.patch \
 "
 
-SRC_URI[md5sum] = "b72794996c6a3ad94634727b95f9d204"
 SRC_URI[sha256sum] = "8b4ac0760018c77c0044fab06a4f0c510ba87eae934d9983b10878483bde7ef7"
 
 UPSTREAM_CHECK_URI = "https://github.com/Mikachu/openbox/tags"
-- 
2.43.0


