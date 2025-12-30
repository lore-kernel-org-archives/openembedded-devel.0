Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B3DEE0204
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 14:29:12 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65117.1767104951676857684
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 06:29:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Imu5ZgJg;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so53869375e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 06:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767104950; x=1767709750; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hMB1gwNPOpOIe6RVG0NYZW1YigRr6B3PQQ3BT52rT+s=;
        b=Imu5ZgJg0DaXdHStL+TD/UvsAq2LW9Y8ND+Hdj2lAIX69vNfn+kYInBNxJSy1bdx2K
         3eher1WG3ekb2OcvQJO5zrGpl+Pzp6BkGU7AgjjqvZ1hGp9jXkgAsRYcr+3c2/rn2BLX
         16Mt5OvRyU7hEdoLM/CJnB04Xk7PENgAhamHAuNtt7dIz2xvxFWz+K46g3+OPgyZYZ+b
         GqpFTYH8VF/ab+ZaHFrxS2NRWUMqCY5VFi4S3v29zeE9NBvMrthK44W5ujfRWTDExn4M
         ZEH9thU7gPrpCcs1sM69GiWYdVNSMduzqfYJzuubLXUW1wYXJfFbuv4m/CcoGPTfWuI7
         8ypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767104950; x=1767709750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hMB1gwNPOpOIe6RVG0NYZW1YigRr6B3PQQ3BT52rT+s=;
        b=giX9xbuIvY/D5BLKbzp0JpViEpz9Klr2glwORiwEpbJaJjw9xn7vJgZWnC8mQgr5Gs
         bBpLBxqoYKdUY4OyZdHpXyrlMQWZnqZ/uqK6mb/S1RTOR/F/J9ZBbWDySZijGeywBRw6
         dxyOCa0xK146+HyhptwA+ndQ6PqZidF+GX4ufgWrIKs9U2zQS8WRNY2cm1gJ5IjA+3Wn
         JFEDCGdsg29SZS6gMWUQQ8fw0Y5awBiS74zPXBtXZgfR99Ea22CSMBqD2U7ztP63XmC6
         OKBhy9+gbCbxuduz5xKt6Vp9QPX9U4vC7UgkbvBR1Wy5rNW1nMGv12+bOJgRMDuAu2Ue
         C4Gw==
X-Gm-Message-State: AOJu0YyZzhKP6Cy8he4yktxekb1QXD4kmKR7ntm1tuC6v0YP3Iy/LGzY
	sgtUIGchk9t4iLESqvIPAK5OGyeTaBP9aZ3f3QHegRW4Yce5a0uD/bFEncR9PA==
X-Gm-Gg: AY/fxX48Uc0Drrfj1+1Pu1C7pmhBmAXyVkTy6boP3aKvcXCHFdeDxJ7EzIjVvrw+tv7
	J7bCd58STeV8Ksu4Pr9G3k/54kxe+IR9ER5BExanv6WN4fAEnWtcA0luw0nZC5c/LZOB5zLZ2vi
	fCj9OQPbkeMtqf1rvUY48XCL/8EwImvKBkv4LVlQieyoQIDSmR26C/WghM6MXvcAv1VGmi0DPZi
	UizHpsiM4KaIUBp/fq8pRfha40dgnmk+J0ZFu/DvsfI09ATmpvX8IBUp9H2RYNEVFJGk71LVFv2
	QSBIH7Q0h3sWMiXFeVR7LWj4AKN3muhau0xlxS2sf/qXfjSs5jMB5jd9v9zmbPZ7a+U+BEDiV1N
	HBB2/ZaoziRzrQ2/nFijkff+xl3jJDNSM52Y1bdfUkKi5ZhhJrL18+q31hy77uuc3GtTkBsugNA
	Bxxre7UC24
X-Google-Smtp-Source: AGHT+IGv29h1TXzLCubmEXXNW5Y+LBCUdItmKqChTf4RekOMCVFyMzivnE1a4rSkKUiJgEPvKrTLPQ==
X-Received: by 2002:a05:600c:19c6:b0:477:7b9a:bb0a with SMTP id 5b1f17b1804b1-47d4cb41658mr182000815e9.21.1767104949991;
        Tue, 30 Dec 2025 06:29:09 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273e4d5sm653345045e9.6.2025.12.30.06.29.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 06:29:09 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 10/10] python3-supervisor: set CVE_PRODUCT
Date: Tue, 30 Dec 2025 15:29:02 +0100
Message-ID: <20251230142902.730667-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230142902.730667-1-skandigraun@gmail.com>
References: <20251230142902.730667-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 14:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123026

This recipe's CVEs are tracked using supervisord:supervisor CPE by nist,
so the default python:supervisor CPE doesn't match relevant CVEs.

See CVE db query (home-assisstant vendor is not relevant):
sqlite> select * from products where PRODUCT like 'supervisor';
CVE-2017-11610|supervisord|supervisor|||3.0|<=
CVE-2017-11610|supervisord|supervisor|3.1.0|=||
CVE-2017-11610|supervisord|supervisor|3.1.1|=||
CVE-2017-11610|supervisord|supervisor|3.1.2|=||
CVE-2017-11610|supervisord|supervisor|3.1.3|=||
CVE-2017-11610|supervisord|supervisor|3.2.0|=||
CVE-2017-11610|supervisord|supervisor|3.2.1|=||
CVE-2017-11610|supervisord|supervisor|3.2.2|=||
CVE-2017-11610|supervisord|supervisor|3.2.3|=||
CVE-2017-11610|supervisord|supervisor|3.3.0|=||
CVE-2017-11610|supervisord|supervisor|3.3.1|=||
CVE-2017-11610|supervisord|supervisor|3.3.2|=||
CVE-2019-12105|supervisord|supervisor|||4.0.2|<=
CVE-2023-27482|home-assistant|supervisor|||2023.03.1|<

Set the CVE_PRODUCT explicitly to match relevant CVEs.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-supervisor_4.3.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-supervisor_4.3.0.bb b/meta-python/recipes-devtools/python/python3-supervisor_4.3.0.bb
index ed5f5d22f2..d504298914 100644
--- a/meta-python/recipes-devtools/python/python3-supervisor_4.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-supervisor_4.3.0.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=5b4e3a2172bba4c47cded5885e7e507e"
 
 SRC_URI[sha256sum] = "4a2bf149adf42997e1bb44b70c43b613275ec9852c3edacca86a9166b27e945e"
 
+CVE_PRODUCT = "supervisord:supervisor"
 PYPI_PACKAGE = "supervisor"
 inherit pypi systemd setuptools3
 RDEPENDS:${PN} = "\

