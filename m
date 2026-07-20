Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 845CFC44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 23:38:41 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11389.1784590712482596619
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 16:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=j8fxZ2KZ;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e3617ba36so5070925a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784590712; x=1785195512; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O//WMzlWtAt4C81K1JR82wrW2mOy6ZWQ8RVq1XffwfE=;
        b=j8fxZ2KZIU3XUx3o//TVprb5BTZFkuQvee12cmPGKmTyliJ2VpC5ru1UyqTQBcBAce
         CnS0q9lnZjxrYvGtqtJ3b1zQkcy9WrCSThHHEWy95jTtFw8P9Ru5ak/bfbcCyzHe4hGO
         N/V093AVYSxqujI4vHFlcRGA8a9IvbqiW+6AG+fvZ0wzfHP4pA6LABxH9B5+Hvbx6Hs9
         CiP85rXGWcCZgl5GNixj0rdpaiNXiZRUhAJrSz7j+0IQ+y4Sgghk/AAV0DOEpOOWzB+H
         iilFMfbyb6QnWsCYwq0VxXTrGKrx5+qaMH6wvM/a4KZ81fCUBbABS82rI9UrD66+3wfY
         ocFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784590712; x=1785195512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O//WMzlWtAt4C81K1JR82wrW2mOy6ZWQ8RVq1XffwfE=;
        b=JJc8SabnLym/Z1gJDgG6NxqXrcBrLIOct7gFzQSKn1IN6yGy/PkMTnjcjAL+WqQtlz
         rvbhrMno6FVUYfJq1GeazTAnv3Vjo8Ao2pp2xRGFfBLsHg52JCUq6ekeSLKrWRH/gl6e
         tfGkxuZHwTZvlGW4rk19cTp+SksTOTre/jAmsjZqLZrq8Z7ef5caby7WnNQOKkcGaIwT
         aF81QY5CXH/lfwmXHUBpWatRX097UagVSTdLVWJm/ar9waxUFDDj83YDOgTW6XmTc2i1
         1Vg/6JX3dOxcQphdDcvoc0xkkGWYN4k7uAYSP/2KTc1wVOJ7fzs+hyuKtENsTAMX7Td4
         y/qA==
X-Gm-Message-State: AOJu0YxHM+0ctHIthzGEfV/lCpbjCWgRT/QxiCGg2OS1mEmrtrYtjvE3
	pPISI/MNCorRWvobndOG6uheNwNxzGyf/9FW6HFCInybYNMkuSiQYtpnILDBqg==
X-Gm-Gg: AR+sD11cvK4QLWDQfhxsH8A9XudgBkVytgqSg6QLcyA8cboNP5U3WtU53WEJ6edR4tc
	5R+OhnCTV/0eb9zMdTwvC+Q4eya1RghrFhhu/hxBpHRL1uVO/Gmt/gWX5tyHR7J2fBYGcZkk5AM
	4SFLbtCjkm1CV4hEL5IMweam1T2IbKeOl1v4REsMWBEll2F0sl8PV4nyHngWzxOQlr3wdbBluj2
	wMuvQi1AEYRnLE5MMD4xKEU2HHyotXQ1B4zcwOxvSg2hLMwKaetGJEl2Yji3pEt4wa3b5pJvnTD
	Pb07vit6c5w0WzvBptO8DDY+s+smZq5iU5PBj8BVUXp/OICHQoL+Aercsu7ZJfJkoFIc+7jnvAT
	uQn2zD9B1M8CkEEctYGZrUIuCPPFTNVvJ48xJDdPLtvGRnR3E7qMdZkdDzaSc3hZv/LACOpzWTc
	TLtykeWWkgSziwIT2hPU9nF7fhOA==
X-Received: by 2002:a17:90b:2883:b0:37f:fb1d:63fa with SMTP id 98e67ed59e1d1-38e4b431219mr18646703a91.15.1784590711880;
        Mon, 20 Jul 2026 16:38:31 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm36926061eec.11.2026.07.20.16.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 16:38:31 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 4/30] python3-tornado: upgrade 6.5.5 -> 6.5.6
Date: Tue, 21 Jul 2026 11:37:45 +1200
Message-ID: <20260720233811.2324493-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
References: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 23:38:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128305

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 7efb03070daff539cdaa8f525844e5b8224c6d4a)

ReleaseNotes:
https://www.tornadoweb.org/en/stable/releases/v6.5.6.html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-tornado_6.5.5.bb => python3-tornado_6.5.6.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tornado_6.5.5.bb => python3-tornado_6.5.6.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.5.5.bb b/meta-python/recipes-devtools/python/python3-tornado_6.5.6.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-tornado_6.5.5.bb
rename to meta-python/recipes-devtools/python/python3-tornado_6.5.6.bb
index fb9067c90e..bb363fe1c1 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.5.5.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.5.6.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "192b8f3ea91bd7f1f50c06955416ed76c6b72f96779b962f07f911b91e8d30e9"
+SRC_URI[sha256sum] = "9a365179fe8ff6b8766f602c0f67c185d778193e9bdd828b19f0b6ed7764177d"
 
 inherit pypi python_setuptools_build_meta
 

