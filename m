Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16377D33A55
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:17 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.27780.1730831953229746911
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:39:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fPOrfWjt;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6ea7c9227bfso12413457b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831952; x=1731436752; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2SpbAL/MSEj5M6lTbN5GZaHUqWX1mC1nQsa/PZxBTo=;
        b=fPOrfWjtgfr/rxQ6JbXSLdX7/btDd+cVq9sAB50POYTaEeJX2QXROKA1BoNHTA2wDa
         CHblTbtOziqRFwtq1JujV6/0COG2NK4dmCDckN+fYWJtKiT5mI7m4pvWXF9JhpxG7VZq
         33pDNFYpe1b41E9iNaMyfqH19LEqpnsVB53CDrSlLMHjh7PqBAxud0Ynjn/m8RXXiIAL
         BYVR/7SBDEL92ZsLzs2kPIqb+bssR2NkWYxLmrKcTE9+nGQ9qrpdueeEhl0iL1KzuUvF
         pWQKMtyIz06OYcro6Jn5f9CJKHJzfyqFs16ptFEvSDm6U2DbyfxtCRIWN8BNuHn8myA1
         bw0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831952; x=1731436752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k2SpbAL/MSEj5M6lTbN5GZaHUqWX1mC1nQsa/PZxBTo=;
        b=OYszwgKR3BIlBis+f2kqEy855LU3U2tA/FMbKWs+fMVDD1MMHlH7HlyUmxC8mkYJG9
         ZF1ZBns/T1DjDtqp88MjwmnuGOuIKdjhgstx5JmOMQjHK2FxKVXEBx9HbW01mxWWoEKC
         U38gdFbnelf6P8yy51QrDCKTV4Q/NJLQZcoOaKdhwkmJQuB1L1RFgzLmJHIdVI1x1rxf
         CTE5lq7JIOBA+e+1S8y8G1d7njmkZBcRVTbQmCSEfj0PUFvR/MbxxRSPRibMvjkiSg4Y
         5FQrXSpQxnAN5AjRTCBWJ7mPj4aFIikKDCsAvuGn5d+CgpcRTzrcz/l32zNyKR55wTtZ
         s8ug==
X-Gm-Message-State: AOJu0YxnniDo1RH6DDKpccAuX7gO1KBGaJQo5gaxVEaaKZrHhooFAPiU
	YARDxZbu7GYI+3o1LVsm5e+cqYXYJA20qLErVMqiWUDT/KOapZD3K4MWxhXA
X-Google-Smtp-Source: AGHT+IEeQ2MjEwuGzTsvJkM0tvHFxDnTqNbDAiItzy2EVnuelCdjj6OxWWr+5YYxRTr+LttGnqzAtw==
X-Received: by 2002:a05:690c:fd0:b0:6ea:87dc:49b1 with SMTP id 00721157ae682-6ea87dc4fcfmr89598997b3.10.1730831951900;
        Tue, 05 Nov 2024 10:39:11 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:39:11 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 090/161] ttf-ubuntu-font-family: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:26:06 -0500
Message-ID: <20241105183658.34982-92-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113605

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb    | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb
index 0c29a20cd..8512b1fd1 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb
@@ -10,7 +10,6 @@ SHA1SUM = "0cef8205"
 SRC_URI = "https://assets.ubuntu.com/v1/${SHA1SUM}-ubuntu-font-family-${PV}.zip"
 
 
-SRC_URI[md5sum] = "c5a5059d6856b4ddf79d824dcaf5ad32"
 SRC_URI[sha256sum] = "61a2b342526fd552f19fef438bb9211a8212de19ad96e32a1209c039f1d68ecf"
 
 UPSTREAM_CHECK_URI = "https://repology.org/project/fonts:ubuntu/packages"
-- 
2.43.0


