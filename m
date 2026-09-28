Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C1CCCA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 00:03:36 +0000 (UTC)
Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46618.1790553812169765109
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 17:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sUfugsQa;
 spf=pass (domain: gmail.com, ip: 74.125.227.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2ddaa08c890so9837975ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 17:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790553811; x=1791158611; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nAGl7Zd4yjh/3LLd8/C7oP1H1vK0lvY263sqSU0xp7w=;
        b=sUfugsQatvoDWXYFXZJv4qtIwKHstVhBZ4iDjvaRuokBvitKwRW/WNV3EGrGUooRB5
         rFcl/dXVJfZ6oUMQ4Jz5qoxJprhg8mwFmXu7XiUwsdNeraL6WmAu5ol6oJFRjvQmUqbZ
         pPxgwUK6369fySKsaxGh1ENWSFz1WUT2Tt0KxrJjRpwbS3MmObwW11xJOT12KVx/mPyc
         NsH6qVNbunpeLUmNYB+rISCTr1wRjjMmAEpXSsFviJrjrCyRYY7BYXIwj8EnXc3612Bs
         UNRwgbI495fDXtcdtfe+KyJ0vSblIF6LWzoDvqOhdEhwjeUW5/kNBpl33pEhtj/RAASt
         nCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553811; x=1791158611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nAGl7Zd4yjh/3LLd8/C7oP1H1vK0lvY263sqSU0xp7w=;
        b=SLt12cRvKYBO1q3PihnP2V+8Ydf2L62BOfxFwP/wUPASHLzTJRgv1gqrFJuV1wqiPj
         WlwUo1jh2VeoEmrMmGOKuPVa3ENccLH6+2pIboGZrH0m8FhAg+HfK1oKawMpme1vIDRQ
         yQbsxWNmTz3ZFp+p3xtCzMxjOwuL/KZmHP74+aha4lqj/mFYt4nTXHnSYm67SSuvsZHE
         k+HwSQgf/Q3PH8UYaiPxeAmvKWtq9cYjvCJOzp/AOnxkp4IKYXaVj+ACUAB++8AfKOCd
         3onO2tZb/2c/QvujSV/YB3QGjD0WeuXvCRIGQFTVN9UP1O/Ipo2zP5T0aWeo9S94G2Gi
         judQ==
X-Gm-Message-State: AFq9FYIbhHTG4UwTFVma3leqKmqHdeBzB32xxFKHtoDokXitPg+hRCHB
	VdobMWJVnV/v0tFsBk1Pb0aPExs0qMQGHTcxqGF98/RQ/Mby+Kkdt244vIWYjA==
X-Gm-Gg: AYBFou0l1HPN12LS575KzyRgcX5xwWv516DVz1YZdM2CP7nG5tvsNcFhdYUs55UHA7G
	L3iw47MEcr3cTA0rAQ9FJg+i37GXpxc8H+H7qpmm4ArDOjP8bbRdlgIcNiC9tbWNy5zaN0KOZrW
	9e+wEEu917Jv8FvnxVEJ+wSgvLhGb2n2BPCwq+6EnAmVfYBhMNRorwXrC2YdsO7mTjDm2MaEXyV
	GczjlXVXpl4oRn3KC3GLQfoAlMrPIxUDpxu4v1sQ1Ki2YKc91vCqyE++44XOAiTPbc+XAP6Tyuo
	3JUpCjRcF1qqhpIpiGe5xCT+RHMGi074dQDO9z8B36Zn4bB2WJd9t/AIigs7P1EXDiDKl1eXCrg
	CLQOHbadxzdlgZNtfR7HwkXGL7vUC1oKDp1tlN3MVcf86Dh18w1MJlzEEUckjlGa13e/McBFHi/
	RpZvMqT0hIhdaiDc4ggLJ27m0VChwkT2tYNq2I4TICPJ891zraa3m8qH9v0+LugmnPW5jaGc/NC
	EX4p5zfFVjM0h5rJ9aOyHE=
X-Received: by 2002:a17:902:ec8b:b0:2dd:c100:7cb6 with SMTP id d9443c01a7336-2df7dc514b8mr85218715ad.50.1790553811479;
        Sun, 27 Sep 2026 17:03:31 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913fcbbfsm32347775ad.30.2026.09.27.17.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 17:03:30 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 11/30] python3-cmd2: upgrade 0.14.3 -> 0.14.4
Date: Mon, 28 Sep 2026 13:02:43 +1300
Message-ID: <20260928000302.2528437-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
References: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 00:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130398

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/python-cmd2/cmd2/releases/tag/4.2.4

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-cmd2_4.2.3.bb => python3-cmd2_4.2.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_4.2.3.bb => python3-cmd2_4.2.4.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_4.2.3.bb b/meta-python/recipes-devtools/python/python3-cmd2_4.2.4.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-cmd2_4.2.3.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_4.2.4.bb
index b1de6df644..beb5dd02b3 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_4.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_4.2.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f2a861642858e0858af9dd4e4716bae0"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "b5543c81e01eea9445f1248879855b727c949d5af27c0390fbb8796f782783e9"
+SRC_URI[sha256sum] = "9aac11583994f6b22fab6464180490cc3a336d46eb682f1438acebe3c0bbe53d"
 
 inherit pypi python_setuptools_build_meta python3native
 

