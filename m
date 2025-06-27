Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB7FC7EE31
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 08:15:45 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.8343.1751012144444184354
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Jun 2025 01:15:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JhmTgd0C;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-748f54dfa5fso1496014b3a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 01:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751012143; x=1751616943; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cxNEPtGQZe0ViP/KVkDrTjQ92frCIE01BsxwlhkpMRo=;
        b=JhmTgd0C6tRzXXIx0oRZlGiOyah85OkaT8wucTA63LjACUsvzHmBuDNhvTcFsjaaa7
         tur+NrrPuJd2RSNJZozQ/TBQzyKv0+r4sIAHYP4IzrBzUATmbpvGFxj+mVLKqSSJ8MUK
         zY9oyL7RZs80F8QFKDbMtToy0YHFiKErrXYHpvFxUg3TSHBAVr7O4YRe73+OuLZoPJ41
         t2WC7oBvQcAdF4z9gmEHtz9osXmBD+xIPpVrUfFqcCpORBSS5wzb4hdP+/Wyv07iyIDj
         /WUWa+Dwo0WjIOqtYxl83/GUU8w//AEUtqI/VrO2ZHFW8tOtrG4VCo4nyaaQ8jXOy+4B
         xBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751012143; x=1751616943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cxNEPtGQZe0ViP/KVkDrTjQ92frCIE01BsxwlhkpMRo=;
        b=NbucSlIHr8MAgKEBJhurUyVDlDhG/h422tHenlOwFQMBpcVZXzCE16fDFLhwZLhpph
         2NliNGtQxT3nhmYu4lqWmbX5Guwe+7tOzpYbg0Q9J1dReUtd7M2+Iq+N/h00eFXjoYNq
         ZxJ0ANyVqLL5BeiWZiLlxHb1Ma/9gj7Gp7UMm2gytDBWQ2FZkNAKxe7vjN+5Am2SaPCo
         v7syJilWVt3OcjFZQMuL1CXov6cMoH06zGTPLHu/9Kvcs0nOQtkZEE3MWcZ7WBt2/hDO
         w9eyzK5k0Cfm+3PRIx13JkF19a3rPms+91FvaHN72Bp5kcIbz77gUwjEbKFOVD33YjZT
         8aEQ==
X-Gm-Message-State: AOJu0Yypm0K2c9lieqaSf3fQdw9ZLNiISyCZj4Qlf87+pGpWB5gV433C
	sDtOysT6gnv+CSXmsdGa28+wyb82DCp/m/dROKzgBZxNDDCQkOTa40QhkEMZs7WL
X-Gm-Gg: ASbGnctraqsui6dEygv7lf7DQXifpZ//3BPwjyGxTD+JVQhyBKjdEiBtuiWX9oXJnOE
	frPAElKMehMofhA0fFRyaiIPDTGiXSvsvbfkSqoYBq6Q3fKN/9AL3CN/mKDoJNvuiyiH80LJbOE
	2H+BbH8h3lmyjTJGyxaOxHKZ7ZHkKepaMrL4c6GFZhIJbRws5L1lYvCkKKtiZAROsnv+qtfMtDy
	OfDR/CuryMqcGx1ekMpY3n1h82p6T3mqwGU/x26an7QHIm8kXQvw4HfdKDIu02x+eRmfrsrCMNF
	TFeI8c9JT3RVeviF0pP66ju6z5hEaQlVSDvHxxpQQmw359HuoOoSXQ==
X-Google-Smtp-Source: AGHT+IFYTz2L/XdJbXPZlPoUF84Fj85x3qVtTrV8uyyuK507+fBMiMA7Q3GaSmX1v5jwn2I+vihd7g==
X-Received: by 2002:a05:6a00:2286:b0:73d:ff02:8d83 with SMTP id d2e1a72fcca58-74af6e6633cmr3544688b3a.3.1751012143549;
        Fri, 27 Jun 2025 01:15:43 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::aa8c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af540a82fsm1612862b3a.5.2025.06.27.01.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 01:15:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] kernel-selftest: Remove duplicate setting for S
Date: Fri, 27 Jun 2025 01:15:40 -0700
Message-ID: <20250627081540.2829636-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 08:15:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118142

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 648a5d7c5a..14aa5d0c0c 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -45,8 +45,6 @@ do_compile[depends] += "virtual/kernel:do_install"
 
 inherit linux-kernel-base module-base kernel-arch ptest siteinfo
 
-S = "${UNPACKDIR}/${BP}"
-
 DEBUG_PREFIX_MAP:remove = "-fcanon-prefix-map"
 
 TEST_LIST = "\

