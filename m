Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE45C53200
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 02:14:36 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11430.1784859269674422081
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2026 19:14:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cfdDrYii;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso1107481a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jul 2026 19:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784859269; x=1785464069; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZlovDU8VonWwHWemxmuYFU5WHVWipcvc0Czh7XW7owE=;
        b=cfdDrYii50p9awXRGZLhKjZ2xqTS62lFl545B6MCFAiqNKO1RoV/Z0FOOj/QGUv3Uh
         SIhKgTtpDy/b/YWV/Ud7pSusUUhzEa82iCat8zpWHTFU4uigagd8saIIHmRfkInOvM0m
         UBZ2xh2tqlfq7OyJgLW6jsCjCSmbujuWj4nfkO56Xka8n0Q40xzlO2zwajxJpHbGr9iB
         Ba9AvSITTHBdIY98PpSvTm9Abj43lK+Gl7WVC6IhyWg+fTQZPAfWqQ7Pk8KZrlT6eEXP
         LnfPbMIvx1C5bN9y8NblgKegoBTSuA4KwywetPyD4WpLs7tI205mhD2c3j1AcoHYBKyC
         Axgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784859269; x=1785464069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZlovDU8VonWwHWemxmuYFU5WHVWipcvc0Czh7XW7owE=;
        b=kYB+YV+mULC9OE4gwgrQnHNsxgDloPceRtjFNQoGR+jixWkkNDJnfsbpfjsrKjWggM
         KglxqJviibKwWD5GnANWjo5U2WXoMPWGW+J0cXmNLiGQYaFAnqzg8LLoE4ayv7kGbWbU
         GfioFhPV7FppcRitBSmxbcj/gyDwIZix+1QnCqdFh1dXEtda0C6Xm3Q6lLnF0LnogzPZ
         q0xe1X5OBAmUJwhZHbfLhmaKgzcddjhbZutusB9Jupl1rJ4eS+hpV1jxp5sc4pgQ3o5Q
         SAukgN2Rh+YF5HVHyeEVxKWS/Xf9fQ9HYB/u2oRggUCKpQB7g2I7/DkmCsCzlwuVdfTY
         Anmw==
X-Gm-Message-State: AOJu0YwbR0IXt4hHYfdT9f5RMcRJTfxqI7T4wg+4iHZ1Yir3leefTSj1
	wHEcFG2ntb1jmUtz5xXLcnG9Rf3G7iqBU3lt1TUnts3DGYpin41Z/XAaWHoHTa38
X-Gm-Gg: AR+sD12tM0CNfKJzmGmWUQm0r4e7LCB9d8LvhCQH+503xwbxpeIbRrn+sO40m9xvfEq
	DYLougw/MiS0Welyffve5U+2DgbJT8n8w5sJoGsu5uyyzWxo2v1Cmua3eCbppdXpgifM7n+KXnE
	tvvx9HaJnVdMcSbYOVwV0a0atE/CFGNP0hdwSHC+bKt7n78qv5RDkUd5tNV4SJsN4FB9ACmV2xb
	vABb3hoqq4ROjupZYHquOTdBDwEjXMIIC0FAtc987ez4/zO9jqbI2NRiJ3GhgdoX2O/4qSowjaT
	y8Z7yXyjeLCTGa+3MvIVzZgp8lJSQPEM7olIitHp3VhIMIPBtk7SDCe6NXUTHun8MJdyqJQNu54
	mU6EF5lRRUCmLfzRnNaa9axnvnwQRKnRu6wSOpxmIM8xC/eC1+nhTlwpUbdIeDMci9tJox4J97f
	w6uxdsqOU3UWwPZu4=
X-Received: by 2002:a17:90b:3b47:b0:38c:cf7a:5fec with SMTP id 98e67ed59e1d1-38ec64ffc79mr5909441a91.13.1784859269012;
        Thu, 23 Jul 2026 19:14:29 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d1300401fsm26824794c88.3.2026.07.23.19.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 19:14:27 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 5/13] simpleiot: upgrade 0.18.4 -> 0.18.5
Date: Fri, 24 Jul 2026 14:13:59 +1200
Message-ID: <20260724021407.2840261-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724021407.2840261-1-ankur.tyagi85@gmail.com>
References: <20260724021407.2840261-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 02:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128427

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Note:
https://github.com/simpleiot/simpleiot/releases/tag/v0.18.5

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../simpleiot/{simpleiot_0.18.4.bb => simpleiot_0.18.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/simpleiot/{simpleiot_0.18.4.bb => simpleiot_0.18.5.bb} (98%)

diff --git a/meta-oe/recipes-extended/simpleiot/simpleiot_0.18.4.bb b/meta-oe/recipes-extended/simpleiot/simpleiot_0.18.5.bb
similarity index 98%
rename from meta-oe/recipes-extended/simpleiot/simpleiot_0.18.4.bb
rename to meta-oe/recipes-extended/simpleiot/simpleiot_0.18.5.bb
index 1ba7c7b43b..e852e3d3e5 100644
--- a/meta-oe/recipes-extended/simpleiot/simpleiot_0.18.4.bb
+++ b/meta-oe/recipes-extended/simpleiot/simpleiot_0.18.5.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=3b83ef96387f14655fc854dd
 
 SRC_URI = "git://${GO_IMPORT};protocol=https;branch=master;destsuffix=${GO_SRCURI_DESTSUFFIX}"
 
-SRCREV = "1a501b7691e153969fa64e9ca58706454b160b18"
+SRCREV = "9addf01e40eae111f59c822141a47aa87caf04b6"
 
 require ${BPN}-licenses.inc
 require ${BPN}-go-mods.inc

