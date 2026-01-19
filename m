Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7911CD29C57
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 17:55:12 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40588.1768845309023611256
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 09:55:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JQSBxFfo;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47d6a1f08bbso15467985e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 09:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768845307; x=1769450107; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tT6DxfSZ03FqHl6GnjJAgrXDfSlV9bipnsFqHVyPN3I=;
        b=JQSBxFfo08IYv+rbWdX55aOUP4Cl+je/05TgbTYYYQA6Yq8gWTEs8BRINLWGKWdgp5
         zmHEX54rEE2lVptnfjT7Q8sBW/KS1cBqJRA6FtkPeShXpVpuVmLFK3gCvgS4g6IcLa8U
         5rKgyU43IHE4Z4iejANW9v1OyzxEMnyMIcHa+1oEcEn9XPI+B0Y2JhEGyh0z2urJWiMP
         luz8qIXnFPAlQi5GZv0O7p35QJUAjWl0a61GD0/gU0cR/AuPORTxi1qtC4H3W1teVh0a
         ptqsWl831pjIFUFvndoi0i86Evz3uGOU9qqsbJTdyYKI+btRmbGbTnAo9JgqZTZdvEdc
         Qfgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768845307; x=1769450107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tT6DxfSZ03FqHl6GnjJAgrXDfSlV9bipnsFqHVyPN3I=;
        b=J9FswIuSFSWCaOn5Y4DfCvuT/+jZSzL+ej6JPFsPMAOUXSr7qxSWRsBkgBgCM9L+yW
         OnJVkC9DPTzZPO5jpFFyORAcZRglEknQyqLmcjwArofDDAS2wCJJde+iSqp0FLvxwwG2
         jJG8OCsOORsV7ASikwuT52mRjOX5e7rsd2Dptsk+/JV9kl+ilJ0jupbBWpj/wUeiXNCx
         /aHuchQkjDYMMzW/+siUK/AZgEjv86S6cETALyTHCzxTaKKi5mjDNk79SkfmsdWCEF3g
         jf6r13UMEgJk3F1/XY2+3EnIyW8QwfJllY4yJgPQWlH0/Rp4Dwwh24pn97ek25W77a+s
         3LJA==
X-Gm-Message-State: AOJu0YzAaqumD6cjU15YlqOv0SShpa19JuM5k9mRb7bmiEpkoVGG+oyJ
	Tqx6KGAX2sfHnKHuBKjBf/wqE/AZ7LuRTlGWyYaYi2xYzuFSX3lgyUZeZfKwKw==
X-Gm-Gg: AY/fxX7qHxfVdW7Gti1KMLFLaXuJVfYywyayr/moX6SVB1E6p5+wpoLho2qSyvP+ImQ
	zGGc+Rkh9ge5w7U48RKWy1x0jVWEMCKuHps2qvq8+ss/00zsmxuGJoj7viWOQBkLcCL22Xkg/LE
	Mjna62gldNQ2v1PTROWniDDYuqXoHIs2WpnO0p1r6aIkwCNIuEtlWFVwdzvu4cx6h2Mgcf+Q+SU
	CJHHGFQnYrkYuhpdr6YSQORqZrxr6RBwXJjmID2y7c8W84fkFH6m2KAdA507mhP3Bqe1AsmqSNO
	Ok723EkaTqWRLb7CudCHUaj+97q7mbEjHwOhWnLPko3vigy/MnYjkzDLZ7ryxMRaRXyp7oXB3Gp
	jq4AQyKuPtReeA4aomn9MuUSQJa3AjHifylpKk/W1lCPUjzJpK1s/OGDNKE1GGW6B4aKj0NA96g
	/ejzNvSymu
X-Received: by 2002:a05:600c:628d:b0:47e:e779:36d with SMTP id 5b1f17b1804b1-4802827162cmr80004935e9.23.1768845307380;
        Mon, 19 Jan 2026 09:55:07 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8795f1sm204201785e9.6.2026.01.19.09.55.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 09:55:07 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/4] python3-py: ignore CVE-2022-42969
Date: Mon, 19 Jan 2026 18:55:03 +0100
Message-ID: <20260119175505.777598-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260119175505.777598-1-skandigraun@gmail.com>
References: <20260119175505.777598-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 17:55:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123645

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-42969

Upstream could not reproduce the issue.
The vulnerability has currently the "disputed" flag in the NVD database,
and Github has revoked their related advisory[1].

Ignore this CVE due to this.

[1]: https://github.com/advisories/GHSA-w596-4wvx-j9j6

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-py_1.11.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-py_1.11.0.bb b/meta-python/recipes-devtools/python/python3-py_1.11.0.bb
index 143f7ec555..61f3873b4c 100644
--- a/meta-python/recipes-devtools/python/python3-py_1.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-py_1.11.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
 SRC_URI[sha256sum] = "51c75c4126074b472f746a24399ad32f6053d1b34b68d2fa41e558e6f4a98719"
 
 CVE_PRODUCT = "py"
+CVE_STATUS[CVE-2022-42969] = "disputed: upstream could not reproduce it, github also revoked the advisory"
 
 DEPENDS += "python3-setuptools-scm-native"
 

