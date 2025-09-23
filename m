Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67B65CAC5A5
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 19:48:14 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.656.1758656887484889061
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 12:48:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pnqofkv9;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b2e168f0a75so354533266b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 12:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758656886; x=1759261686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KWNvlmAefwCVsIc7VkvDPPuwtwqIeu+TEfoYR1Bru/Q=;
        b=Pnqofkv90THmpjdbH2dhLesKGagccVadJSRzY2y2+HB8soimloWyRHjp86n9DrSIZH
         wHij8Bk414awOv3Q0dCRxqYgAtX1AzTKErby1mqXeAS3GxjDr8+Io0fqSjwzss6Cbn21
         WuLcaazHz1pzNuiA5RYBG/Jpe/O+QRaTt91YW7vgqoGrYuzN7LK/6GSG63NbBV9xyz0a
         0I50tOKfMBc2jnexe5XrsHZ61n5yJ/979zPdCbaKsGmf8jg4Ag63PIPlQV+tf18/dVPw
         B7Y1VLLmRGQyDuLiOKhfdxVSgCS9xnlQOk7bnbYldXF/EHHM9T4id/9Wc+I5MdRPdkhm
         XLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758656886; x=1759261686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KWNvlmAefwCVsIc7VkvDPPuwtwqIeu+TEfoYR1Bru/Q=;
        b=kd/UckbZnZkLpwf0GCASM45KU//RUsvaphkBWoojtKehf4kJr6WPF6zbkY6LfMBgdd
         33rbASaqAweE9XBYbEEAl1su89f+QhX60SOUpPIEc1+WauAMNQbh69gOHXI2nTj9r7PN
         C7CJ6s/XnSNkRztv0J54lp6aZHUOxq6wHFPQMZU3auG/aa6SHVUOVUV2hrTbg4ohMlaH
         tvvJKjgnKnmNE8uKwAEHykAddlX1tpRRfIE/7zpI4suJrfvxM5L2KUW5qApM5GysXfeP
         UaatA3nx63R2D3AJxT/v1veeFhXWqIOchpfyKga6Oh7zsiBJmHfOfjuWWEHGmF46vY/e
         5TEA==
X-Gm-Message-State: AOJu0YyEMHR8XQzK3SL12FZzG0X9+essDv9gs4eYHwLM233AIACjyqQS
	xBbgQ1nUe4WIMi5sdn0Qn9eIIAL5fE3e0/Spbp4Af7Gs4aOkcUfOYk2TMWt69Kx3
X-Gm-Gg: ASbGncvNkmkUuz/Feb1JZLvUDPfIptjMUQtGi1wtz6y7CVcWNNo6oLrNJZRgmEWIx24
	RcTV4IBvnfrvRFSIGtCSoGwcRr604OLbR4VuyzlKPlgaEZrQYGl8LyEaRan3VM3qa0gAx4U9b/O
	isY3BoqLRjzyPVkkQhMa4iYMFSHMk6ADxNWFfr19iPndEPP48xP8rFrnJc0pFLkj4uVITNtudxT
	KU+aZmZHsWAdMeHkmOZ0vrLIdLgBVk6pGuSOMO0EMTkSvANhYGFhwEgChsWhG0nNAKWFUEe1jkb
	s7zy85fok8/1J4NrGKN/MneFEGox8P/t8F471dVQN9fK6rh3vJFzEF6KnfJqzOPw2KkUcAguqCz
	r8/1JLa231z36O0/cGpD5
X-Google-Smtp-Source: AGHT+IGDxvji1LmOZWmHCZiJmMPNQlX+97DrGC+L68BUDaVCWK4oY/tIjpktdYq8XwY+n3+xoL665g==
X-Received: by 2002:a17:907:3d12:b0:b04:25e6:2ddc with SMTP id a640c23a62f3a-b30264adbbbmr337483766b.8.1758656885717;
        Tue, 23 Sep 2025 12:48:05 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2d5c22db22sm454747266b.68.2025.09.23.12.48.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 12:48:05 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH] pm-qa: update git fetch protocol
Date: Tue, 23 Sep 2025 21:48:04 +0200
Message-ID: <20250923194804.3259900-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 19:48:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119735

Apparently the git repo in the SRC_URI stopped supporting git
protocol. Switch to https to be able to fetch the source successfully.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-test/pm-qa/pm-qa_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
index 482e5694f6..fbae409292 100644
--- a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
+++ b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
@@ -11,7 +11,7 @@ BRANCH ?= "master"
 SRCREV = "05710ec5032be4c8edafb4109d4d908d31243906"
 
 SRC_URI = " \
-    git://git.linaro.org/power/pm-qa.git;protocol=git;branch=${BRANCH} \
+    git://git.linaro.org/power/pm-qa.git;protocol=https;branch=${BRANCH} \
     file://0001-fix-build-with-gcc-15-Wincompatible-pointer-types-er.patch \
 "
 

