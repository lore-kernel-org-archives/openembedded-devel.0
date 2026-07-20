Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8053FC4452F
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 23:38:31 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11271.1784590709649332878
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 16:38:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aY08Myt6;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cacf197759so120595335ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784590709; x=1785195509; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nX8qk0cULuLnlmTSHodSh0IFeSJ+uf8nfKBEC7kXfZQ=;
        b=aY08Myt6EhUpL8Qfw2YtbD0mRQ8Q5dacNmq95IEfpHrMBCWij52hyk+fZ+aOOKo4Ev
         V9UK1N2p+kA/s6OuAIR5XLQWzNxNKUIipMoYcSklj2PJ7+9XQFM0Fzm2u/scPArUlf+z
         SPcEikkbzYUylYCB5Ryp5ZjaYvWll6/bm14+mlXsDm8PXxymf3fN8HQwOcqB6QqhdhEN
         4jx7W6Mhx9S0IQNwImr2wzLOWpW5UqN/1tjmn1XZ7Tk/CkF65j9FVdx+gWFyf0ZKburZ
         l+UjjKiI048FdSs/TNqq4pJoEF5XUSypDy+WvPSBgndL7D1ikKHbJXMW2+dChQJjgUMw
         0ucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784590709; x=1785195509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nX8qk0cULuLnlmTSHodSh0IFeSJ+uf8nfKBEC7kXfZQ=;
        b=kYR0Fvc65lMhqBCpo3EJ7u9yrw5/7KT6ihuFV0miaGWdUI1nLgAK9WpsCpkcpyRWSc
         ZA+aOE3dKG2Av86PT1gRc54Ti8u+AL6ObbyzvM/kajzeWQQvmqXmoV2K14mowu1+HZjA
         rXn/SrWqnZyLBaNXDQosQIdlreIi+Z0Nu9zGax0g/tQm8hD6gXScx+ip8meS/UknABAM
         lXPare05t98EJvxBui2tBOrloJt142nMMpMZXAUziQb5tHOefPzXkOhV9QryFLDYcMIi
         lD2uLyZCb0igNTx2LMPNZarzgL2uBRwamB6zsCdW4C+v/ZC2ZTSEzsbFRb55/O+YKnEw
         Ldmw==
X-Gm-Message-State: AOJu0YwbzaONc/i3hVWwzVXswh2EGJ2ewCLpXoyaJUalgoZvmQHDFT5H
	sA4ofyi8lveiio8VkFeEt9vXurKfP5So8t5Y5J9GD/w8BW+7aOOh61eQB5Me8Q==
X-Gm-Gg: AfdE7cnQ6MzoZYMugzad400iN0RJLlRnYFzqqBask8C0ZGs9v841f1DjhSYKX8hoFVx
	adAk1Io4AdvJTXc9aWFkiFLj2Tl5DeiI12ExC1wSm0nvUQqOnubl4/N5beFBmwaVq7RVvHRIl/2
	6GLR7VpcIPdsl9Eprok23fCAAQwj2ox6BxxAP5TQRaaHgWX4cKYzgnW//Rst9r4vdEfOrCzx7nY
	1nIdSiFK9ABmFwcyBgl1sEb+nNwWUtNXauvJJtpXKgCagr1hCG464ujsfv8e5QTbo2UeFMRyBZ2
	Lbx0t8lKxHu2VqxEZGH9HVH06Y2ZCkchphMyAYZudIbpHU1hbIhXnsMbcGEMVz8hXKShcxoTfQu
	1oC4jUt6xwEx1s1G33V++HsiymDq4FYLKeOzZpvptdqDHNGdepbS5Waag/uANOzqpJeZFj8Gg9h
	Vz+hAvOOfZP8ATCbU=
X-Received: by 2002:a05:6a21:9147:b0:3c3:875d:c53f with SMTP id adf61e73a8af0-3c3ad9e7e7cmr18087474637.69.1784590709078;
        Mon, 20 Jul 2026 16:38:29 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm36926061eec.11.2026.07.20.16.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 16:38:28 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 3/30] imagemagick: upgrade 7.1.2-26 -> 7.1.2-27
Date: Tue, 21 Jul 2026 11:37:44 +1200
Message-ID: <20260720233811.2324493-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
References: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 23:38:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128304

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit c63bd731e46fad661404d4fbe580edb7e3f21b9e)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{imagemagick_7.1.2-26.bb => imagemagick_7.1.2-27.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-26.bb => imagemagick_7.1.2-27.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-26.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-27.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-26.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-27.bb
index fa4a6dfef8..cfdff227db 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-26.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-27.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "38ba210c5e5a660013d632a3d33c431e658befcc"
+SRCREV = "b661ac969aa3a0d326690f95830aab246569f090"
 
 inherit autotools pkgconfig update-alternatives ptest
 export ac_cv_sys_file_offset_bits = "64"

