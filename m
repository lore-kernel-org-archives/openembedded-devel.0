Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E8CCAC5B0
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:06:41 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.14115.1758625600695685317
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LixfAhFW;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb7ae31caso961080566b.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 04:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758625599; x=1759230399; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YT159Lub6qRAQOaBM3c2tQNs29dhGM5tHtDTMIE0nfE=;
        b=LixfAhFW06LIp5zAFupEzS7kaOFeh8ePR0IB9JkWAY+Fxuo1dbaHOvGIetS9Z5Vxq+
         hVDgkS4jH3o6nlATaEq26dQqw0wR/ghDzQLAlWCpIqWqDoj5nEqUY1/1Lf5HZsefmvek
         yidVn4DS/lHbCYmigrBzdE04/WEyUO7dIICQjOahlvt5OLlbk4NQ7p8o25GAD3CrVkoh
         SAOJteQ7fmHmKWMvY37L+a3nVBSH5TOi2pnn9Iuk6NsgJNp2XzXa3bG7Cvk2101vP/mX
         N9wwkJ1tBEcsCr+d3BMzlm/1TsFX8WcuNutRnzjN0cIzHXKHqUbsfPxVWA/g/Z7bvp7i
         mH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758625599; x=1759230399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YT159Lub6qRAQOaBM3c2tQNs29dhGM5tHtDTMIE0nfE=;
        b=JlWGm4JhgxnN8EDMHWY42PvCrz8Lw7S10DjVdQevOd7K+qMV6+m/v7f58PYz/nkjG4
         v8QPd2SZyMeUF8NgqfHQyGfRv+zElPX/cE68CmV6kRQWKRUKpXlWReqFF7MXrZhT3Nxk
         u9Nu+ZL2qiSQ/BfQaX72E5M1Yyo1Aaa+TvmqgoVuRNrEFQ1v3d2+rjLNnxdcElOp2Ot8
         rDrG0q9UW0WahhyQSpTv6ktwciWYSR+OSA10B7ARSizsAv2CHN7zKrwzR950oZ911M+B
         3NdW0hLIBzb5b6QIm/DFiZUV3hXOgqZPU53WywUy6ArGf0CxncP7rmowPwgQcHiQO+Vj
         xzAg==
X-Gm-Message-State: AOJu0Yy6m68a770ZkFYyKRTPdtBtITwDlCsXPfOsZrFdF3VSWjTwviWM
	9LesjmX+lbrkA6XMtfyh/5vLSqcdotnhSDAon5lWrSTxsqHmEMcCdXrvZs8IQQ==
X-Gm-Gg: ASbGncuv/6tUh7fsaIyPEhJzYM9ymNVPuIslYoZdov4vIHeDw93mpTTzRsG9gUb9JWc
	eOKEhcZTIaTB2w4B85XFuSf8EN+CoUCxHbYWliweOcEUs0Uy3jWsCQE+fv4+smTUi0pSivM4e66
	5r6CBYA/73E7OQpaxIWXar72JspkgsXohmjl4JZ9g1DZO6GNxh8ZFT5r3TdRb29p/Kn8fTd6G2x
	l+B6I6L1TbqORCF0+WCZuc+ZZ3nwHZuuoX1XIIauHexY1q0A1EVi5I7eYAY9cPat2KPqt2FpZhs
	iNQIVb9YOAQDw65WkWoq1ZH2Z3njuVl2A7ryA6ZTyfD5VdRbk5aKAisOv3aGdj3fK9EEfm7JG8y
	/R+STSGbgLhjKkJdqQDL0u2hur3wZ37Uw345xj4Q=
X-Google-Smtp-Source: AGHT+IEiurCkXeOCrSw/bMrj4O2s5sAup0zUkYeYVfA4P9bFQKQJ2QGiqBjfj7dtmKzTy07M792niA==
X-Received: by 2002:a17:907:2d87:b0:b2f:d237:80da with SMTP id a640c23a62f3a-b302b50c632mr203635066b.54.1758625598807;
        Tue, 23 Sep 2025 04:06:38 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b293fa07816sm709263166b.50.2025.09.23.04.06.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:06:38 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 02/22] yaffs2-utils: update SRC_URI
Date: Tue, 23 Sep 2025 13:06:16 +0200
Message-ID: <20250923110636.3413021-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923110636.3413021-1-skandigraun@gmail.com>
References: <20250923110636.3413021-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:06:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119666

From: Yi Zhao <yi.zhao@windriver.com>

The source repo has been moved to github.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 49c7edb304c010620a8c8f344f9cc4b7c3707480)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-filesystems/yaffs2/yaffs2-utils_git.bb             | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
index 6bf321e237..ec03e971fb 100644
--- a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
+++ b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
@@ -13,8 +13,7 @@ PV = "0.0+git${SRCPV}"
 
 DEPENDS = "mtd-utils"
 
-# Source is the HEAD of master branch at the time of writing this recipe
-SRC_URI = "git://www.aleph1.co.uk/yaffs2;protocol=git;branch=master \
+SRC_URI = "git://github.com/Aleph-One-Ltd/yaffs2;protocol=https;branch=master \
            file://makefile-add-ldflags.patch \
            file://0001-define-loff_t-if-not-already-defined.patch \
            "

