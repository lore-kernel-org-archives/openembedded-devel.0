Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA1B3C2A062
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 08:32:08 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.60301.1767601926372213335
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 00:32:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gayffuHV;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47d182a8c6cso65033935e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 00:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767601925; x=1768206725; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ui4nDPnzPHmSwIy0qK1sWi7/zL3EApFAQR7LwdAWtaY=;
        b=gayffuHVMrvs5UyXUDlkvm3iVSRq0jk8SPpKfGmpJe/hhq6utLB/aS/MLx+aIT2DEc
         Pow1snES4zxhq7CTxGVNYsAEDgUJWMCQMXZQByapJ9bZ2WKc9EvAQijE9L6hDfmHS9XA
         ADi2szD6quCxUo4X2/FQWqwwkVoChMLvAM9tIe2FzCg2NUiJMQNViO2ZFrb3/gAxDCc8
         R2FLl0nIER+Q6UZiECZkmVYstm5CQKjDtu5xYSKm0q8IliEVfBHf0C23+WNiXZ4VuFs1
         09WYoJAfAtBHFk/3YDse371QKpixpkKMRViAtt9EUnNw7IvS0/1u9Eh1ZZAc/P7uJNit
         EXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767601925; x=1768206725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ui4nDPnzPHmSwIy0qK1sWi7/zL3EApFAQR7LwdAWtaY=;
        b=RuohrOFZvrXrCwXJmX8nRUCQsdpdGSG7y5U2x6HG9jay2/IVmisDjii9fyz0MnijYV
         Llmv5gUxiTgJDF4olwOY/sAh5OyredjIfCGDcnmr+XHit5DC46JNkhyam8l2fvsFFrMm
         Uabv6SN/Le31tzpGAPgDstJTbZLmRCvQgh4DHArA7oKlUfAjng1QjrCrgVHe43Q8vPcK
         zRIGW4XGFXhUX+6hthaxYHMQ5LW8ShlUYT2zByllFHqvY/lF7N1WVOB+B5dKxf4LqmKc
         1fR7m/v+iwXdmXbLDqshBbXWlmrAc0lkptfy3escZ6o56XvypbO0GFD+GSgjl989WA6x
         +guw==
X-Gm-Message-State: AOJu0YxtsWvlHC2FgO4zAP4rnzE8RIpqD29udMTUcA7dPUzHoS2RpgdM
	yPUDn8OqAHVXyc4yW9Tja+dygBrFTsr3AKRkUKiRGidex6orkixu4r2Vb0fa7Q==
X-Gm-Gg: AY/fxX4Q9Prrq2gt6LRfSqSDv2wxtVvUU4fRS/Dg2PVRdIZzGQb8uWOu1vNWdDrdHqu
	fKfXZ3dt1G8relxlrh/SQzM62rEVOQvpwN8gmixQfChuRv9dlc6WdkXlYwMyu8dOTI6FcOy4AHd
	w45xW4eedNy7Mr1EAGToIh9zI+POj0yWUERB0Dd29vjyazvujTS4Su5VKyeyi5R7SPWr3Nkp1dN
	7JiZGZc2TIGzJhmGEHjoFBRjC6Vyx1N/savTzyi7WNNUbQ/uEg+NUPnR/puWFpe/41A56DDvqIk
	rSkPDFbUUxH+OFUzVpXKp/fjQwJJ3XxcsBPW/VtmQ79pROjjXtlhMw7TDv9SKNLDrnx2KRLP5jA
	Va8N0QflGV3Jlqvm04EIip0CgFthb8QxGCOPcOieR4/nPtOWcEZpj5FEcAxNXrHDg8JFP0xttb0
	b0PWsME/Ap
X-Google-Smtp-Source: AGHT+IHiGer0qKHzojfLeV6G0hXk+RMSSfR4OJ6vsJ8Os0Hvi/zWLMQ26ipqRgGJYkvM/IuFB2rn9w==
X-Received: by 2002:a05:600c:8b13:b0:477:73e9:dc17 with SMTP id 5b1f17b1804b1-47d2d2a68f3mr501395425e9.35.1767601924600;
        Mon, 05 Jan 2026 00:32:04 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6be53a0csm54867635e9.3.2026.01.05.00.32.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 00:32:04 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 3/5] python3-cbor2: ignore CVE-2025-64076
Date: Mon,  5 Jan 2026 09:31:59 +0100
Message-ID: <20260105083201.1225143-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105083201.1225143-1-skandigraun@gmail.com>
References: <20260105083201.1225143-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 08:32:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123129

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-64076

The vunerability was introduced in v5.6.0[1], the recipe version doesn't
contain the vulnerable piece of code.

[1]: https://github.com/agronholm/cbor2/commit/387755eacf0be35591a478d3c67fe10618a6d542

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb
index 0d0ab6af37..bbdeca7adb 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb
@@ -12,6 +12,9 @@ SRC_URI += " \
         file://run-ptest \
 "
 
+# not vulnerable yet, vulnerability was introduced in v5.6.0
+CVE_CHECK_IGNORE = "CVE-2025-64076"
+
 RDEPENDS:${PN}-ptest += " \
        ${PYTHON_PN}-pytest \
        ${PYTHON_PN}-unixadmin \

