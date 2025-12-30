Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BAE9E95A7D
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 12:25:01 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63169.1767097497603742463
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 04:24:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VKmIY14g;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-432777da980so2021348f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 04:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767097496; x=1767702296; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0W6WNKG4GU/UPiiFm3OPbGY1G8540rE9Eqp6enl0ep4=;
        b=VKmIY14gLT0/2GcWLi/0LQQTnk5TSwliRzaFOTVhA9CHJsAtHtOeCIJbV0lAQrSBmF
         qaZIfRmXcMyojMfKDMcf7w1t8wj21boOtr6tIqd8W0YMfjT85JTzdEBFbPKzaRC7BCIr
         o+vciNgBKRYv5NKQ16Vre6qnUjuasaqvJ2zJeQdko+jb5CP+ncenGaylOUxSk6AcUXpF
         ETCpvnlP6ojFMvVydfMqeShTLAwMoCz7NnBQCNdJCYeFJOJQbtAsFdzjV2gW3WVk7zQl
         JIARq3voKiu+oNSVT+gLC1YcCaRymDFVN2tXyVebS6scfO82h9U0Ala180FIa8sJk2/N
         pQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767097496; x=1767702296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0W6WNKG4GU/UPiiFm3OPbGY1G8540rE9Eqp6enl0ep4=;
        b=ZrUQE/37FcOawxdKp4PR91uMS0ZwD5VQ8jerRFSQjXBc/zm8ZzCm8ESQYB5udshi37
         Y1Wufz1sCfiHv4+uDBsURMOPfYxSPwJggMfJnAvo1AtLlYiaR+0DVndCr1TLWPTCk/eS
         SZStfP1VcMcI3+Jid9BQ9KbGexSniJ0lHgQ308mhsRhmpOKJrfGm1TZ4GB2L3Z6hO7ty
         RCRw7SQhIwFo6yDaegj6sbrORDEQQdptd1Gfh2brBlYRSdJGb7Fz/oXjwKWDD7DQa/dk
         pZr9wEgxUFq+vH0SC2WsftCChxjCwXS01qIEp62va1g/bQ0Pxt9WmZ/ds35hwJb5aczP
         uGRg==
X-Gm-Message-State: AOJu0YzcT3PnnRtNk9fu+A0a9VZ9EBYOUOpcRMjr+9iGX9cdJh1c7w5L
	N+R3b3Uo73HfwNAjT4DxjJbP9AP53geq2xo2K08jmRqg+Di/ffG8D6wHkMjy6w==
X-Gm-Gg: AY/fxX4tkqI3y0KlxTadE9vQbZfX7Fj+SP/71PIyVtmmRxqpRAKeemShhTcX5Ya/tan
	fX/pV+80Fsi01zZh4hP6Msp3IDapccMW0eaqp1X40HPVSfBj7+BBI7FZJRmI5ihCPdwA4iJ6RIU
	4u64/nrwW0emdc50JZTDfNFAsJGgLUW0+vIpCv+xKt0cjO8vtFZnwhlBBSA+boKjZOxg6jeDvTZ
	zsUeenBtp3FUz+VzU/Kt9C7yfNOfrwbuXJndJY8tUSiskDAnqbhnot6fUgypgPTUgEcT69DKSDw
	TnzXdzttL1kYUZVG1beB73Z3FdNXv1nQdyLoCzuf2fP5sUJe98GUt0dDjN/VwcJu+lZ5ZJKnB7Y
	V7gPH2wpDYI2KjMNv15LgfBHzZzy94jfb3+DcAeXc0z8iHDyPE/PMo6xWypLGnNV/LQKNEzwSfj
	HbT7dBbj2P
X-Google-Smtp-Source: AGHT+IEYnjAWBo36e3wZDVscg2mE6tAEpxO5J3MT+6vdOVJg8msVLswB6XJlA/2v2q4U0RnHaEB/tQ==
X-Received: by 2002:a05:6000:24c2:b0:430:f325:435e with SMTP id ffacd0b85a97d-4324e4c9ddcmr37209311f8f.16.1767097495773;
        Tue, 30 Dec 2025 04:24:55 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa477bsm68395060f8f.36.2025.12.30.04.24.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 04:24:55 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 01/10] python3-tornado: set CVE_PRODUCT
Date: Tue, 30 Dec 2025 13:24:45 +0100
Message-ID: <20251230122454.721515-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 12:25:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123007

The default "python:tornado" CVE_PRODUCT doesn't match relevant CVEs, because
the project's CPE is "tornadoweb:tornado".

See cve db query (docmosis is an irrelevant vendor):

sqlite> select * from products where PRODUCT = 'tornado';
CVE-2012-2374|tornadoweb|tornado|||2.2|<=
CVE-2012-2374|tornadoweb|tornado|1.0|=||
CVE-2012-2374|tornadoweb|tornado|1.0.1|=||
CVE-2012-2374|tornadoweb|tornado|1.1|=||
CVE-2012-2374|tornadoweb|tornado|1.1.1|=||
CVE-2012-2374|tornadoweb|tornado|1.2|=||
CVE-2012-2374|tornadoweb|tornado|1.2.1|=||
CVE-2012-2374|tornadoweb|tornado|2.0|=||
CVE-2012-2374|tornadoweb|tornado|2.1|=||
CVE-2012-2374|tornadoweb|tornado|2.1.1|=||
CVE-2014-9720|tornadoweb|tornado|||3.2.2|<
CVE-2023-25264|docmosis|tornado|||2.9.5|<
CVE-2023-25265|docmosis|tornado|||2.9.5|<
CVE-2023-25266|docmosis|tornado|||2.9.5|<
CVE-2023-28370|tornadoweb|tornado|||6.3.2|<
CVE-2024-42733|docmosis|tornado|||2.9.7|<=
CVE-2024-52804|tornadoweb|tornado|||6.4.2|<
CVE-2025-47287|tornadoweb|tornado|||6.5.0|<
CVE-2025-67724|tornadoweb|tornado|||6.5.3|<
CVE-2025-67725|tornadoweb|tornado|||6.5.3|<
CVE-2025-67726|tornadoweb|tornado|||6.5.3|<

Set the CVE_PRODUCT accordingly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-tornado_6.5.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.5.4.bb b/meta-python/recipes-devtools/python/python3-tornado_6.5.4.bb
index 9b43d98e1c..661ec039ce 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.5.4.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.5.4.bb
@@ -38,4 +38,6 @@ FILES:${PN}-test = " \
     ${PYTHON_SITEPACKAGES_DIR}/*/test \
 "
 
+CVE_PRODUCT = "tornadoweb:tornado"
+
 BBCLASSEXTEND  += "native nativesdk"

