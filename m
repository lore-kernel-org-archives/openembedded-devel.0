Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DFC8EE57EC
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 07:54:59 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81807.1767167689047253920
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 23:54:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ayRIAqzV;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47bdbc90dcaso65952165e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 23:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767167687; x=1767772487; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VJIUfZDPH8QFwpmlNEtj+ritJJVT4M4JEjt5lM2/aBE=;
        b=ayRIAqzV2FY4RqY2z525jx6E7Cg8NB7YdD/kmLzHwrEPUf6Z84H5qnkPWNdivSKS48
         MuEc/IotNI5gPeGan2XXrCOcUNiojTh5VeYp0vsoVX0vfNtPtU3Ty7uilaimGO4pqN6W
         XmttL7jWbbPf2JJV8obedCKGz8ziAbVGXxwm9wfQXQWjHUD2mdxcwd4soaOxFr6yCG3F
         K/F8Yuood/ZWv45m2QhmtZwQl03ncmw+KjIdhOeKLRi4K2hIm/Vr19PXjcynHCw5zlCo
         bywg9G5YocBTARyguxUqgoaYscALLCLwRvTIlRAAW30HZ9XjOHgXNDVHAiZ1eN32PCR9
         AefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167687; x=1767772487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VJIUfZDPH8QFwpmlNEtj+ritJJVT4M4JEjt5lM2/aBE=;
        b=RJRpueMsmnPMW9Oz+ksE2Q23meZNFjFsbI5AbDk4FaR8EmRCs2l0ED/cBh7eqSRRqy
         TpYiZLT82izeYMptOosxqsfWEhtIn8+aknq/Gu3jsHu66k0P3sKOLNZ51LKF1R9l/h4C
         oxcg1HnBXFMoTVdWQC/1aCMq/AZtjNn9PvaO/B16NjAv5hcsRdfTBoAIuK66fS2e162g
         YVpoXPxuVccgR899T5J4s631zsK5vpcAMdQdKBAlTjnI7rVj3KQOmfx0hbojMwc9GJ5u
         jS7sHH06IJ5/dAat3MjM9RJrCyW6XS/YwOAf8wkFaACEBmAjDfjylrMEyfszivhmtqNG
         9EQA==
X-Gm-Message-State: AOJu0YwL1wNWUWbM/fF/YKF85RnkeRTTooM/f6/OjPUQj/Xm+Oj+PGmd
	jLiuLs3kwQ03RtT6NIEP05jGkkWwfs2uDNoJx5DQN4FBEL3TL0pjaP1j/ecYXw==
X-Gm-Gg: AY/fxX69iethEu8SCzTiKhUWrovu84MldFjrHmU1vGQzXnnNGwRwK83ur+Ad+haTxL6
	FRwU1QvKi0xdAiCFA4TTu4DbEgMFB+HmFIM8SSQC4bMCfg3AfXQQx6xwgud1g7ygZ6t5gJhVk0g
	2YUuVf+pUiNTwYdVlMSJIh0G9iBkCO7QRQZ2AYcZMyxXM0LwVpN8nxxGKNEqCCSjcTkSAvO12n+
	x2ZX7aV7PAaUlpHkdaHdPiKv6qSrJ02xfIwINghES9tkKvnGJ+zZ2PGUtXXxhL0TpimZae0I7Ed
	ngLE3qsqm2J/IcfhOMMyC3wOkaiYSFu+A9c6g/LudFXRr2//Vcfkac5RIJ1LzeFFU0dlVPxCjbT
	paNTSvZOQ0U3MoRsYdGhZOd5kS7pNzAAHD6lTpQqVJ+2wvIKnJHFFD9a8jVfcl1IiYPFsM5DakM
	e/F2NhFwb4
X-Google-Smtp-Source: AGHT+IGHOwrk7Jr4dcKjF6ZFGnfHvsdh5QsdGfue1MtZUi9ZjUHFbKE0aPN9cHDumxqb7NVkU3QKVg==
X-Received: by 2002:a05:600c:4fd3:b0:477:9cdb:e337 with SMTP id 5b1f17b1804b1-47d19532e14mr361108985e9.7.1767167687330;
        Tue, 30 Dec 2025 23:54:47 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm700559825e9.7.2025.12.30.23.54.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 23:54:46 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 15/34] python3-flask-restx: set CVE_PRODUCT
Date: Wed, 31 Dec 2025 08:54:17 +0100
Message-ID: <20251231075436.771395-15-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231075436.771395-1-skandigraun@gmail.com>
References: <20251231075436.771395-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 07:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123055

The relevant CVEs are tracked using flask-restx_project:flask-restx CPE,
which makes the default python:flask-restx CPE to not match relevant CVEs.

Set CVE_PRODUCT accordingly.

See CVE db query:
sqlite> select * from products where product like '%flask-restx%';
CVE-2021-32838|flask-restx_project|flask-restx|||0.5.1|<

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-devtools/python/python3-flask-restx_1.3.2.bb        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-flask-restx_1.3.2.bb b/meta-python/recipes-devtools/python/python3-flask-restx_1.3.2.bb
index 87353a50a6..bf0f3b374a 100644
--- a/meta-python/recipes-devtools/python/python3-flask-restx_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-restx_1.3.2.bb
@@ -4,6 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c96dd911c6d9e32868b6bc667a38a3e2"
 
 SRC_URI[sha256sum] = "0ae13d77e7d7e4dce513970cfa9db45364aef210e99022de26d2b73eb4dbced5"
 
+CVE_PRODUCT = "flask-restx"
+
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \

