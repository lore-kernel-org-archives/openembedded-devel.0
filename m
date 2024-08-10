Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC88C3DA7F
	for <webhook@archiver.kernel.org>; Sat, 10 Aug 2024 09:04:37 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.2372.1723280667813359681
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Aug 2024 02:04:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E1bAgJZV;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: gudni.m.g@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52efd530a4eso3749188e87.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 02:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723280665; x=1723885465; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ebZKSvPKmPR/a2nooVZOf8WzOYWA53AHlisS4fsiv74=;
        b=E1bAgJZVZKDbVhwoy7YpQiBcV32M987gYiYHRbC+MjTX6Ur3bqOtSKD7XCY5+2jcWC
         dzrCSA7GvV2WaIuLkZZhsofl6DL3cJiOBUyI6mK0VaIcn0l3YsIxYH83+UNC/Z7n3bbB
         Q0XucEejEEItHkb6qwtCmCiSMWGKLTR2a8SiFU4051tD4gaDC2NTofPpDhKDBae6R9W6
         1VxO0HoCvo5ArqONiO4s4LWrKRL8fbDzpbRTHUDeiQiEIIY1UxzM6ieBRER4VnSjdKRA
         +IgNkdM72qGEMbJVLupUtlnL71+Q1BLQUdp7cgUA2RiUOdAVH1wgyt4+2R8vbTPnytA0
         TAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723280665; x=1723885465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ebZKSvPKmPR/a2nooVZOf8WzOYWA53AHlisS4fsiv74=;
        b=rjqgstaF4a6j1gUI+/SZXOfnR+Fs81294EFLHl+amEpETO8L2E46Sh68TeZJH7fe3P
         eDufdHtVKREMd5/6xQdFfhseZhsicoTF0EDm+mECChmwSgh38lkoHyudFJGh/T9j6EYo
         t0cj/h+NyamR+OISsLn6Qk6XtDXK2RiNljxOQr/H3Tsv4y+lKTNOB0lgP3iLhC62FwsP
         l6p2JL0RNgfqYlTJF5RCl23zdQAlTRj4kleAuM075f3gVYecirEjSYLRjhudHBo2OWDe
         ypIww59byQxkzvUqxJL6L9IWsdod4I5g1SEusGCSJtqpd+QtT5YDY/BmWT9cm+hZnAbi
         S7Ag==
X-Gm-Message-State: AOJu0Ywt1o6n/RDZJZcYZaZXd982DKJuDnJBEdn2dWgy3WRrwsva9b8D
	RXGIkgrqUaRGqS0sGSrpgdDd7eDV5B+8SaD5AFnHwZikMHAbhOrH50ZTJA==
X-Google-Smtp-Source: AGHT+IEkJ6q35GLRxssTyU9LJUyBt2Yv6qa8ub1CrzxKf3hz8M9MArv79vOwJmZWpI8exmORAOBSsg==
X-Received: by 2002:a05:6512:234b:b0:52f:1ef:bafe with SMTP id 2adb3069b0e04-530ee9ad0damr2905252e87.22.1723280664845;
        Sat, 10 Aug 2024 02:04:24 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429cbaa5818sm2603055e9.0.2024.08.10.02.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Aug 2024 02:04:24 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [meta-python][PATCH] python3-incremental: drop python3-twisted-core from RDEPENDS
Date: Sat, 10 Aug 2024 09:04:12 +0000
Message-Id: <20240810090412.4226-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 09:04:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111733

More specifically drop python3-twisted-core from RDEPENDS:incremental-scripts

This is a change made in incremental 24.7.0

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 .../recipes-devtools/python/python3-incremental_24.7.2.bb        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-incremental_24.7.2.bb b/meta-python/recipes-devtools/python/python3-incremental_24.7.2.bb
index 0ac76ff29..dc8ecb330 100644
--- a/meta-python/recipes-devtools/python/python3-incremental_24.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-incremental_24.7.2.bb
@@ -19,7 +19,6 @@ FILES:${PN}-scripts = "\
 
 RDEPENDS:${PN}-scripts = "\
     python3-click \
-    python3-twisted-core \
 "
 
 FILES:${PN}-tests = "${PYTHON_SITEPACKAGES_DIR}/incremental/tests"
-- 
2.34.1


