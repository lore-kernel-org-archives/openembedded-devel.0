Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DBFFE78495
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 21:40:18 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.69000.1696196410284201539
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Oct 2023 14:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kp0mNTTH;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1dd54aca17cso5934231fac.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Oct 2023 14:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696196409; x=1696801209; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cc8w3y7dmzeNvPDD4qWOI/cBLsIz2w5rVcO/L07bmM=;
        b=kp0mNTTHJV44eixfXBahu38IHku3Z0SUfXXRet+9XLs+01lDb+AXfuNDA31ijNHhJG
         +Aeouonu1+X52PcxCga/dh2CLIDYxcku1uTYpQ02bxPNua9RWzBz6xDGLIecaehFChjA
         Ef1gGbycXe1SMPHKrVmTmhGKraefcJ7IMXQXPqNvUcNyirG/rCtnMAneu5ujfWCXOvh6
         JmoVOzsG8CGJRnAT96EOzw1nTdCzaQn9DpKZM8NnQRoUSNSKCrflIvHfD7l6hkR4vJD/
         ta8qKE5akgTPnQx+43OrCV8elarFbyA9KKV3xymySpLs9TQCM1xCJLWbv6wCuf06PHJq
         FROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696196409; x=1696801209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2cc8w3y7dmzeNvPDD4qWOI/cBLsIz2w5rVcO/L07bmM=;
        b=UCk+Ybjwg4a4OrwlvUteTC1mks9qsaR607dTY4GZGskLYxoDOHw4qYZTqn6F9Sd+C9
         D+A5EdF0912N/YmmtYNNw1VSNJorfFbBFsu644I5plBQumlgsb/ul6QeEsneT7a3tR7F
         xldG/tbFmScBfdQv1bZMa+5viLsKBQiR5B+IcK/MuGODycjECkKho28SeoH90fMSeWis
         P/tECPHi87yOAXgjzE/Lh4Isr0lOG+9VXgLa+an6F3CW1ljcbnFhCWm0sPpXw3UvwbUy
         DrlsU2bRwqsXb++awp+vNOG0EmqTKE4FKvelr3UuqIxLgxescayhq0QiOF9LbmQXpzxg
         BwTQ==
X-Gm-Message-State: AOJu0Yzln31WBMCh9qXnFXsx82urd+6tjJ+iwvR7d4Irz975Ux79nAC8
	yMNdTQO4jt6xIc99CiVBWgpMar1FZ+Fhcw==
X-Google-Smtp-Source: AGHT+IH/A0PLa4C3QrMlzoKK9Mp2hvGq1YOC8Wi4InzVWz0n7IbsxsE8YnGAGTRBxyb4TUNCvZ73kw==
X-Received: by 2002:a05:6358:5e0f:b0:140:f6ab:b11e with SMTP id q15-20020a0563585e0f00b00140f6abb11emr10783273rwn.28.1696196409237;
        Sun, 01 Oct 2023 14:40:09 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::7f07])
        by smtp.gmail.com with ESMTPSA id g23-20020aa78197000000b00684ca1b45b9sm18720012pfi.149.2023.10.01.14.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 14:40:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] relayd: Fix build with clang
Date: Sun,  1 Oct 2023 14:40:05 -0700
Message-ID: <20231001214005.766217-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231001214005.766217-1-raj.khem@gmail.com>
References: <20231001214005.766217-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Oct 2023 21:40:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105299

GNU extention is now in use in 6.5 kernel headers sadly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-connectivity/relayd/relayd_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/relayd/relayd_git.bb b/meta-networking/recipes-connectivity/relayd/relayd_git.bb
index 5105753e73..79e1743fdf 100644
--- a/meta-networking/recipes-connectivity/relayd/relayd_git.bb
+++ b/meta-networking/recipes-connectivity/relayd/relayd_git.bb
@@ -15,3 +15,5 @@ UPSTREAM_CHECK_COMMITS = "1"
 S = "${WORKDIR}/git"
 
 inherit cmake
+
+CFLAGS:append:toolchain-clang = " -Wno-error=gnu-variable-sized-type-not-at-end"
-- 
2.42.0


