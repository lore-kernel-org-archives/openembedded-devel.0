Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A99C5DF8C
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 11:52:28 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12917.1787485941181365142
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Aug 2026 04:52:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ccXAj+/r;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d530328efbso21209265ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 04:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787485940; x=1788090740; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qssBTwd0XfzRuYAipJ7/agFMCcFvaCrsj/TP3vxFjnQ=;
        b=ccXAj+/rwwziAMTr0j22ttDEeDWbeu2kmwc7Q6G+kv4COgXsFoLRaVimKpMwPSn7ws
         9jF1wRPfgYBD823ne2KYsTH3pFpn9MtQMPYyYSAYPinxV97fekVUTi5cgRRQ66JxsmGV
         Ojd0fAAnJZGaIPRLPwjob2ce/N1OUiuWXWC2g15Wc0q5u5RMxTsYGrT5/Rv6RDgUqtbV
         x1WV+U++jUl4Biei5ZIMV00PUMsSpLrGBysOUsNVvkcj4RIelSKY8uzz3illy+DAsexL
         dtg68eXhD6ht6LZITX8F+DOi8shq+okYLy80SyuamLxPi1BzUJYK33WOyQN3+EsqI2BO
         3NcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787485940; x=1788090740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qssBTwd0XfzRuYAipJ7/agFMCcFvaCrsj/TP3vxFjnQ=;
        b=AK6f/oFVLcxprUz7Ev/OGhgs1fgJmQolmiBlv0O/pDNGjxddUNjIrtIHBbpsRcw0Ec
         56PB+ltrR8kO6HmSeaaHbNG9yzd2m1MCWDSYrGMir9vIp12ILVvkQQs6nso9n5wdF3RF
         XMVGl4f4+5T1p8lqcVymltT7jNF7L1s7+RpOv/mnjWatgHcJdb5onfmsBCxaaqvfC0TH
         soim8Md6MjVQvncSTQ0S1O39HvFz+bshSC96bnRQZUq8roHUvQw9C0HVhXGgoZT1Rl9G
         7Rn/DbbUg4H6By4+I+iQiErdPjAqFWh2GWUe/QAzOc4QLyCkUQRc/yCMtmWyU4vt24Mk
         KPAA==
X-Gm-Message-State: AFuF++moHabq1Cy7nMxLy+zXlARazMEEnSpmp+OgXHM7avN1RRvoz8Ez
	Y5mDxQLAbAH8itDyIHzulnxYFCGU8DocoaWgAdapnq59HsPOi1voQEVOgES/eQ==
X-Gm-Gg: AR+sD10uJRDdTYAdDXl06AuLL7o3Ukl4naSUxu8eWmJkiuDBZ9cBnjkAYtUGdIheVUl
	XZgbOPNDvfNMQDYCQGZYkBpLAXWZEmjSZVo+XU0MME/YNsbgp6yrStjYMBgbPSuujK0i47jb97I
	UxzwS8GRWEf4I3J9IyGUgGquR49/Nmc+8GgFeqpgBQX53p9K/XQ/I+tVNMB5JBVt2pDqih+xmOE
	pBKMjsTCCa0PHz37NDrqQr6X1CfkXxC8sRUayP0/lPyei6U0KJT2WG8C35vkZOQlZimcV3ebuie
	daRv+/N5Bn1Fvwa813q3nae9yN7pKFTakW0KG02xdh/wrOZ8NLVFMHkvChuX+/RZ+eUaGF64Xl2
	88ONXHRCRTfkcauBqdFJIECiKIuod3ZwumIeA/sDD/kb8GlcAPIX6ne+3216njVc9DZY+wG3jqM
	v9eJVbbJgICbfKCVTaSidEo7mLI5G/yVvgGovN7M+pn5HclLqReqcw2vZNDBVfonjKcMtAxsCOO
	Q==
X-Received: by 2002:a17:90b:57e5:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-395c35f0a79mr34671916a91.14.1787485937884;
        Sun, 23 Aug 2026 04:52:17 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e494fa7esm5793398a91.1.2026.08.23.04.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:52:17 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 5/20] postfix: upgrade 3.10.12 -> 3.10.13
Date: Sun, 23 Aug 2026 23:51:43 +1200
Message-ID: <20260823115158.1582363-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
References: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 11:52:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129440

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
http://www.postfix.org/announcements/postfix-3.11.6.html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../postfix/{postfix_3.10.12.bb => postfix_3.10.13.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.10.12.bb => postfix_3.10.13.bb} (99%)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.10.12.bb b/meta-networking/recipes-daemons/postfix/postfix_3.10.13.bb
similarity index 99%
rename from meta-networking/recipes-daemons/postfix/postfix_3.10.12.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.10.13.bb
index 3d78fa15cf..8bb7161e98 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.10.12.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.10.13.bb
@@ -29,7 +29,7 @@ SRC_URI = "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0001-makedefs-Account-for-linux-7.x-version.patch \
            "
 
-SRC_URI[sha256sum] = "f9ff299f92e4179706537bda288971f4b6eff7e70aa912d03da3cd1b6ffd842e"
+SRC_URI[sha256sum] = "de6526fb11bbf20fcfa5aa4b67e88cc6b246cad614a9bcb4b006f457ba3788bc"
 
 UPSTREAM_CHECK_URI = "https://www.postfix.org/announcements.html"
 UPSTREAM_CHECK_REGEX = "postfix-(?P<pver>\d+(\.\d+)+)"

