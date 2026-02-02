Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A827E7DF09
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 16:37:29 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57084.1770050240787073225
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 08:37:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GihLcyaU;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4806e0f6b69so34365245e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 08:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770050239; x=1770655039; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gSBhBTi690esTVECfHEuHn1K7Q4BdKWr4bAGqiwq5ns=;
        b=GihLcyaUlF5ihn9aIrEQ7fr14VQ9kERlXQs959ocN3YyyAx9FomTW22EMscNuisEbY
         88EwWq/Ic2DCYrFGc6nms1wc5UKYUUGwboLOSWtDrKLW59ST2xv1aXOBZQFrsZY5c+/S
         +OPCEhlMzUdotyQVzn/522oYMlpRnIZsEE6CU1zdQv3rhNXWVx+42e9HDrU5nOjl6V0+
         ao4MFSYTkO9E7Xf4dPR+83r8ovmaQJe5/+YOzZRjCkDYnTXYh9QeGZJoIsrcQBrdWspQ
         +EDX6l1oywWmToHQrFwHobirXv7DVZa3RYGFQKoB9ifR/8HZKB4ewpzdhgYqBPBxkGG2
         2qdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770050239; x=1770655039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gSBhBTi690esTVECfHEuHn1K7Q4BdKWr4bAGqiwq5ns=;
        b=eoVqafUTNy97ieGkNMQL+JzRwQrxVOQGpIaP2HmlJsauNEp0pmmhpbS62n8LDnkZnH
         uo8fivCqWozpvyFFDJu1uxWWcCYR3x245Lzx2fj84g775Cq6UZf/aBCOw7Fcbzy6/vXH
         8Ve+9jXxiXrAi+xk9op3ivtivvAxJMF3hvBdMKxNzjTjR0ZXjxUBLv2bjgQfYblz7hL6
         HzxdtKRztC1nnObvRJxMaNu1ELDY+bcwaEd6Kst+7ktzsjQGxQuDm5SmxzvC2nZ8Uskp
         QzAeNLnQQNyOZkSc7nqMmpZf8lM/jmjLm3B7tQGnaU/9Ramauwx34AI1mtBo2nufZR/p
         SNkg==
X-Gm-Message-State: AOJu0YxPiiGgWRr+/Hf0CIktLxlVoVCbWQcUqXHftKEUK9H/CcML67BM
	ALhBaZhXCJH0niLUJnQr086Z1W1WdlCm0LhsPFhYfyg2LuKBZ1qeSsHagOlgYw==
X-Gm-Gg: AZuq6aL8bf2Q3CZiwjGU2aJeWWjl5uSBw691O9WWFeTvI+m6UE33mH/IXjJw4CgMMSN
	72DX8iPXo0OrYzPjckatArdpLudCTvxVDiCEc6AMk2BzESFWKCZQfAmB/40Z/3Htem7dhz00ZXn
	8SMgsQNqCMKZNoj5JUawvMsNxbwNAJBfY8pJnswhCSpaVd01VXRWVXt1RBwTC1JnKAIm8N5Dp0T
	iIDvYvsWbpBE1w/pPvkNjU7xfdarGu4ymfFpxBONCGRqNcbiatv4GVTHfa8H2urF106WIm7xfyT
	fXnzhJPGmgVO27r+H/qKIqnIL124WPgsa62wkvp8+p5OYn0b++5tiUzZnTTvIaDcVy/vTCYUib9
	jjqH+WIHhTcQtO2E49YbSdTgLdjL7ER5AxiFHtrDoPJzfc+2X1PdxdNUM/1PJXz1CdyNfWZf+87
	++7i0UPzdS
X-Received: by 2002:a05:600c:6610:b0:477:a1a2:d829 with SMTP id 5b1f17b1804b1-482db4520f2mr136228595e9.13.1770050239019;
        Mon, 02 Feb 2026 08:37:19 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483051372cdsm451395e9.13.2026.02.02.08.37.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 08:37:18 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 6/9] proftpd: ignore CVE-2021-47865
Date: Mon,  2 Feb 2026 17:37:11 +0100
Message-ID: <20260202163714.2359370-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202163714.2359370-1-skandigraun@gmail.com>
References: <20260202163714.2359370-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 16:37:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124067

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-47865

This CVE was opened based on a 5 years old Github issue[1], and has been made
public recently. The CVE wasn't officially disputed (yet?), but based on
the description and the given PoC the application is working as expected.

The vulnerability description and the PoC basically configures proftpd to
accept maximum x connections, and then when the user tries to open x + 1
concurrent connections, it refuses new connections over the configured limit.

See also discussion in the Github issue.

It seems that it won't be fixed, because there is nothing to fix.

[1]: https://github.com/proftpd/proftpd/issues/1298

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb
index 65dd2f9561..d64e0a0495 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb
@@ -25,6 +25,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+\w?))"
 CVE_VERSION_SUFFIX = "alphabetical"
 
 CVE_STATUS[CVE-2001-0027] = "fixed-version: version 1.2.0rc3 removed affected module"
+CVE_STATUS[CVE-2021-47865] = "upstream-wontfix: it is not a vulnerability but inproper configuration"
 
 EXTRA_OECONF += "--enable-largefile INSTALL=install"
 

