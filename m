Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB2B0CAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 11:23:52 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.11435.1758194631411637429
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 04:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P6X6tAMC;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b21539dfc90so83284366b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 04:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758194630; x=1758799430; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5uaSt0Z2TTWWPiwRdrtyRBFMbTg6HuTh50sD4z0Iuc=;
        b=P6X6tAMCWMGivwzcBEZdkKnBd80VnF2uLyksz4YuoMMQjGsWdJRR9PeU8ZwHAs+oyJ
         TAixgRTkDLTNHMv/mV0Hs68aCRy7KkIW++bdobnPwtKil8Y7fZx9QE8P19hWkEBi/P3r
         S8nmUHhOxTjHiqI88GVgrK4dJ+AJcTAURor0d1mapQdn65+6xKFiJvuEeYodoouTWpbp
         geFBBK63Z8a64auyv9AQRfS/vErQGTA5o1O/A2G508WTjAEEOJmIR4qDSUWvLzaHSIXD
         R7u/3RL20+YODzjscvGIrjeB6uZKKqCT4m1rEz9DnQ8XQyx27ezJRSvHQlcSRVF4z8gW
         fw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758194630; x=1758799430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5uaSt0Z2TTWWPiwRdrtyRBFMbTg6HuTh50sD4z0Iuc=;
        b=vYJRWVbVkPW+PvTf0hOLW0OlpeqEoMijm7//vOnO3Awu/ErrGTP0T91WJvi2QKCkT/
         9nZbesxD1BDeLbTltf38oGFpTP/6qSxx+scqH240vqpLYkKxSlJx+skD7KvNaeBPq/eb
         /LVhMnNxgejbfT0XK9ylXcCmSDQltykgv3PE4dnvbam1fv14UbgXR5RkLM7iHn4DAKFB
         vnNKlXA5J7w+On5T3cOoCAWg9r2Xd05KTimW0NG+d55LahoHr/qfY2iW2EXXKbLA+XEg
         QavPhTfVK3R0m3VHO1toVLWqowzdPAQ6Fw202byId52d41hEM1zfMeXbFiMYXzuWdso2
         NSZA==
X-Gm-Message-State: AOJu0Yxtm04r640pF/4HsRg19XbNubHv9RXN8Zk+LVp5upD/Jir6FLkf
	ksRj9axlZf0wGX72Tp6CNQ/iYA2/Lp86281IcX+on2qv7tUj4FXgK3nIALUd8A==
X-Gm-Gg: ASbGncs5oVyMAFHxgyll2HCX8sx3/mh93eUmImuVH1WJgrUSWEp5YpK1sD5coYcZypW
	F0kg4zhYMe23n9sUwmcs0dgjxjWgOlUJDvtOlMvn4HmP5x/wopZKv4tphEsSfc5/a23K71ugkdG
	PnlyszBto1fmadsnmfhEIj88Qs0ej3KQceUtEjXO4NZOMfPop0kHeNG5idZBzY3PL1IhIaay0Kv
	d4mDUmmJY5WxM7I+QcgePmYvPObN5EVssQRMFxV/tjCVPXYJDPrz6OBHawIfJZiTQSxSAcwai8p
	NydtA134X6QozLYjb8UOqzgZV5XtWCusnbM0UNrLwStd465GnaagQW8tMl8s41krFWvqCfHoJZ0
	b+/5jJDTI5Ot8bMK0M9RbBwBW+skcim8QWE1nWuWqooT13cikWw==
X-Google-Smtp-Source: AGHT+IHAzpVOwivyy99TShuV8drsi57S/uk1kDi/aRbVzOK5f+R7axb4bqg69qUYCmcYsYozzNtm6Q==
X-Received: by 2002:a17:907:6d17:b0:b04:27de:12ec with SMTP id a640c23a62f3a-b1bb433820fmr648500966b.4.1758194629602;
        Thu, 18 Sep 2025 04:23:49 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fc75ac5e1sm180410366b.43.2025.09.18.04.23.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 04:23:49 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 03/10] pm-qa: update git fetch protocol
Date: Thu, 18 Sep 2025 13:23:37 +0200
Message-ID: <20250918112347.1331393-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918112347.1331393-1-skandigraun@gmail.com>
References: <20250918112347.1331393-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 11:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119562

Apparently the git repo in the SRC_URI stopped supporting git
protocol. Switch to https to be able to fetch the source successfully.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-test/pm-qa/pm-qa_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
index 5cb51cb9eb..c638356369 100644
--- a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
+++ b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
@@ -11,7 +11,7 @@ BRANCH ?= "master"
 SRCREV = "05710ec5032be4c8edafb4109d4d908d31243906"
 
 SRC_URI = " \
-    git://git.linaro.org/power/pm-qa.git;protocol=git;branch=${BRANCH} \
+    git://git.linaro.org/power/pm-qa.git;protocol=https;branch=${BRANCH} \
     file://0001-fix-build-with-gcc-15-Wincompatible-pointer-types-er.patch \
 "
 

