Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C347D36112
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:17 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web10.27878.1730831934636250182
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R1nhPE36;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e30cef4ac5dso5217025276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831934; x=1731436734; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=izivvE2Cult3vabuCrm98kLz+KQAkMGzrLfJqgwgmVg=;
        b=R1nhPE36DVDOh6J0aEeH6YBHV+1+VJOcVlgNYCkVj78hk8CVfmyXfRMN8/4cINJkXt
         LSjkFDeyLCZFWb3fkC6SDkLp6NX0MiljcC8owZ3P2R1Wo+yCcwayB6iRWRfrpffKocKy
         eMglg+drm7wsgYjwv61hhk3n3QoacgYZZ8ib0mueMG68D0VCP5koLPJqx+3It0V63WJF
         tDtPOg0+W/PCAvPX48RNrsYPC2YXb1FPjHbCzDitXLl6KTYPwl6URXM7qm2/ayimLpP7
         QaVBHNHEvui58wCMxCqMIymdi1dSSSO+y98LUtj4AL0nCQxkB3rKAHZsKFg00lgdK/kn
         geWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831934; x=1731436734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=izivvE2Cult3vabuCrm98kLz+KQAkMGzrLfJqgwgmVg=;
        b=r3XKW9xzz5uJOf3W8YmDhECZe3k4m5Ei5I2jCqJxEKFIfhssiR0cg6WCfGIrVRmVqF
         WldWhWYwrVHX3j8bcx08rFlwqbgB4LRotpg1gHdiCdPesDpLxpfyqhD3kgLRSdIQIqs7
         BmydoTAEGedJqexnb4yle0xbTIkYsMwCumj31h3ImTAxTZl6h8xDQVLcNvrWN5oC62cw
         u97nZxfkaE1LlatTsNaBWX++BU9opmjCHaDQCEED1UHxENrGXwUlYAyD1xJsZX8Ke64n
         4hYt/wwqudaZEFsP2ePo4w/grQg6QOxorILqi44Wv/wq9crtaKQ6FlvlXhRFzsz8eqg+
         NxSQ==
X-Gm-Message-State: AOJu0Yz/MguSbCdT/pdEH9MW2XvOQ2LoopBB+avhnSm4KLZeO3oKMRUK
	SJzmmmM2FOZ+jSfRgNHe9JDWyXOohB0yRBeVPBY0YPV3b+IYYK8lCZWfK0Ey
X-Google-Smtp-Source: AGHT+IFl/BXZ+SqmaVdd4zdf+7qcTvP9h6EapXmAvafju3LUNaWvJaR6SFl0vA6mNwyfd7QHdZQomQ==
X-Received: by 2002:a05:690c:3005:b0:6e7:e92d:6c0c with SMTP id 00721157ae682-6ea3b8954cdmr187063327b3.10.1730831933353;
        Tue, 05 Nov 2024 10:38:53 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:53 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 067/161] directfb: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:43 -0500
Message-ID: <20241105183658.34982-69-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113582

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-graphics/directfb/directfb_1.7.7.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/directfb/directfb_1.7.7.bb b/meta-oe/recipes-graphics/directfb/directfb_1.7.7.bb
index c6c070eda..15f22697c 100644
--- a/meta-oe/recipes-graphics/directfb/directfb_1.7.7.bb
+++ b/meta-oe/recipes-graphics/directfb/directfb_1.7.7.bb
@@ -4,5 +4,4 @@ RV = "1.7-7"
 
 LEAD_SONAME = "libdirectfb-1.7.so.0"
 
-SRC_URI[md5sum] = "152cf1863b1a3a28aa1370e9053440bf"
 SRC_URI[sha256sum] = "b785c638dc31b8fe3a7c81be1475c89b2255ab3d67b777c747d3fbc52f8027a3"
-- 
2.43.0


