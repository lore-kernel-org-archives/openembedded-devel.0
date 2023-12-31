Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7AB7C47077
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 12:23:53 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.219028.1704025430253138078
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Dec 2023 04:23:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BLUajUVa;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50e7e1ddaddso5865394e87.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 04:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704025428; x=1704630228; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5YTaTHZNURN5S0ovV+ncSn13bT6zeBs6C2VNe/xKd78=;
        b=BLUajUVap/2a1LWBTQXAL+5MiETp3a+g8Eo0QysnF0ygZg2gBAkgmqIvluXjZl6jrL
         IU5b6zNjHA78uXnScmnBUTuaiNEa6E+Rdi1+77REJvDh/AieIjf/FtxDCouhjPC02YX4
         poxKljEv5SmN4HVoeRbwO//qXyKHSsAl6KGyV1jrSAakbN6CKDEqz1AwbVLXZwOdfZ1r
         GqpfNoDGbZkmAnH4wY3SsjlJ61Q2JDG4FqWwUwyDCj/yP2sB3pUnxpMvKz80OxeAaB4n
         6V+EfAAqe22ZITc4TyFK2gGzynZDOaOls8f02EjlMabEKtNxIaSW+GVa8yVFyh3lQ2zf
         JKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704025428; x=1704630228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5YTaTHZNURN5S0ovV+ncSn13bT6zeBs6C2VNe/xKd78=;
        b=XMcYSWj5VZtn4TjyKs0H0+8DlKAk3nJHufAJWeRQEeay3bkl0dhe/ikfIuWsgrxEYN
         OZJRy4FEqPtPEmwsB5ZWvdBma3eWOKtQKxR/8q4qJbu7vbQSTza3oaPLgKmUtUvoAmIv
         G1c/Dcq/MPAKI36zuHEGKSkz1O/YCpvXqNDaW7T79UERBz/IEAvvV8o3EQPi4meVW2Py
         lqAPP71wdCHyYBiA+AVz307dO1KR0LitvuwxfvBE4OI5rtPJQjk0McVbn7RxgM+r5ZC3
         QaXvvxsJ3rGwl9WUGxNqhDKH8ygqhlmMKNpiQcCD8ijcoNTxuTWV8+HFQECX822v9vem
         iOIg==
X-Gm-Message-State: AOJu0YyNXyW/CAeNAofzpVfZQtpdEUpt/FOv0yFzEdNCIWXUgp7KJXgn
	eN4U1QMNeWKjMTemIm6BdN56xJkY+OQ=
X-Google-Smtp-Source: AGHT+IFQn6SuZKg2AcH15Xy2kAhM5hYKFRT7y+C5298aN6x5FTAjDXCQU8QFqNzTKtN4UAmTBvHXOw==
X-Received: by 2002:a19:670b:0:b0:50e:4598:b836 with SMTP id b11-20020a19670b000000b0050e4598b836mr7263682lfc.15.1704025428323;
        Sun, 31 Dec 2023 04:23:48 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ay23-20020a170907901700b00a26aea4942dsm9155474ejc.123.2023.12.31.04.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 04:23:47 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 21/23] upm: get disutils copy via setuptools
Date: Sun, 31 Dec 2023 13:23:27 +0100
Message-Id: <20231231122329.405225-21-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231231122329.405225-1-alex@linutronix.de>
References: <20231231122329.405225-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 12:23:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107972

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-oe/recipes-extended/upm/upm_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-extended/upm/upm_git.bb
index 0695f9969..a86f4a80d 100644
--- a/meta-oe/recipes-extended/upm/upm_git.bb
+++ b/meta-oe/recipes-extended/upm/upm_git.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=66493d54e65bfc12c7983ff2e884f37f"
 
-DEPENDS = "libjpeg-turbo mraa"
+DEPENDS = "libjpeg-turbo mraa python3-setuptools-native"
 
 SRCREV = "5cf20df96c6b35c19d5b871ba4e319e96b4df72d"
 PV = "2.0.0+git${SRCPV}"
-- 
2.39.2


