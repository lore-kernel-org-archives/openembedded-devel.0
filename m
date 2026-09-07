Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A128EC79FA7
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:24:39 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31705.1788776672481622207
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:24:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kAUWFXLP;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d5335cf904so32741005ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 03:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788776672; x=1789381472; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DaUz7eGZUstvPyAv7Q8oSHcEzEsvpIuLpOqg0brqCcY=;
        b=kAUWFXLPCytvyoEwkPkqXTfQ/wgN5fRsIB7qusrKgkfWCoDOcK6HgJZZo5O8CYjdQU
         DrxSWHbQoJOgQ+cQ9A7RHO6BRkigYbu2uZaScYN8Ww8vixDtE+HMX65P5DShVbKnSIGK
         GKD8i+WfX2Zc6MATlSG6NbHswfPtK+Kl7aGPkHmlFsU8Z9tDncOOyNa8/rctld8sd5iW
         g48XKrcsJ0r0FGvU5CT/uLXftvFhrRP4D0Fdq6r8siwh2zXREnoOs0nNOZRnC7/4tnSX
         XpWQrz9unYwoYa75TBgxh5OxN40JmHmfV4OKvczxSPCUdIiDnrATauE3vs6l/qe9v2C7
         LDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776672; x=1789381472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DaUz7eGZUstvPyAv7Q8oSHcEzEsvpIuLpOqg0brqCcY=;
        b=J/SdlJH0sjmTxbjY5Lb9tpF6XwTAJjzEj5vGpPlDqsswwXWz6exSilplHv3bfqYHNZ
         0mBgZtXXU0/2lPAv1eB/B616WOeurIFzB5MG+JDw2M9N8SOEyemxeQFzn+9MklEAuJGI
         UV6Nv7slKD4nNqN1lf9SSDNln4wCUMOlrUjYvwwIT5p8Y2sBHTzCyQjc1LalfzpEyUA2
         YOu0QiMeo0x9FBxiLpmC91TvQ1oUHV5yfboe6dI4ml7mV8yC25H3IKEtls/RsxqVzcvN
         nReVxfE7DSB/gdzSUGT4jhAUNAjeANEpwlGkmHWJi78PFp8nzMyxtlgWqv6mwmYpt4Qv
         FNBA==
X-Gm-Message-State: AFuF++lESB3Qo92hMxtR1fkxVgw4QyGBXlr9xsBgGceWyUxeS7O8FDYq
	LLCcxGd+VNjPlvhP5axnVxSFKbgaaM8rvx6kZbAsFSxAvRAJorSCL5I2MpB+B/sb
X-Gm-Gg: AYBFou2u+MD1gR8FtzmP/iEplIftDCs9fL+aK+BzNo3SB7/VwB/BvaVmBDweA+FvG0i
	0VcssjaRUSUjgG9AkfFhLlS2Fs0m17VMfCwsSOXuadIWrh3UwXNV7zVawtGyD+lGzUA5b/c+SYA
	VvTmr/eR+lNlAa2VL+maPpgSrze2fNfH0dv3NGfwHZ3xaQsN/+E8DCEBiI6mDROysDmrfnMChjO
	aYTf5XzEBJIKUBjkemtoQ0ZLLpmHSGoOLYYiZPsr4gIgjjIk8bKRy1WVNvSIwYdu2RcjSjhkdXE
	b9JePG9uiWjZSBVhinLLnajA0lV6ZulL23B61b9BeVEwiDrlbXDejERDCJ6O20Aa8/2czYU1uDz
	ZRASvReO+M8DpL7QdV8tYDcvnZfdo7MoQjkKpfHIWGq4J0RPI0mzPZm92O78RbG3TCaMzA9r2Xi
	28IyMCXu+Mebk8YmH8vb9yC4lHgm091ynFJ1Scg+vIzwL7En/hyIsUf0d4zA/P/3NrjW8N3hAp
X-Received: by 2002:a17:90b:2b43:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-39b25ed34f3mr38494247a91.0.1788776671853;
        Mon, 07 Sep 2026 03:24:31 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm30215104c88.15.2026.09.07.03.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:24:31 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 23/33] wolfssl: ignore CVE-2026-12340
Date: Mon,  7 Sep 2026 22:23:07 +1200
Message-ID: <20260907102318.2459883-23-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
References: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:24:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129835

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-12340

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
index 4f6ae56567..f69497a80c 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
@@ -74,3 +74,4 @@ CVE_STATUS[CVE-2026-5772] = "fixed-version: fixed in 5.9.1"
 CVE_STATUS[CVE-2026-5778] = "fixed-version: fixed in 5.9.1"
 CVE_STATUS[CVE-2023-6937] = "fixed-version: fixed since v5.6.6"
 CVE_STATUS[CVE-2024-5814] = "fixed-version: fixed since v5.7.2"
+CVE_STATUS[CVE-2026-12340] = "not-applicable-config: this only affects builds with SM2 support"

