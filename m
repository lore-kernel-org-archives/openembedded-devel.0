Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30CC5CDC16B
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 11:58:29 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88360.1767700702359884959
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jan 2026 03:58:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aWadfOzp;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so8181765e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 03:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767700701; x=1768305501; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ViMSeBgQGhyIT6Ljn1kOG/It/sSOMDQAc70oq5BpcPE=;
        b=aWadfOzpHt4A2a9QC2pDRXbnPEGtzlGPkvYxYKO6S8DOFjoOh0ASJgjNH3HYsq6Zwr
         S2dJBI8BJktbdCWulL/PdjROmGjUNRqSwmMrZ8KlbkYhINa/rmyrl+q8E+UDob2TGoXm
         2mzm84cVNShb9R79Fc9nIAsicXuwgcWSaza6t0joj+YzRteHo7yd3aVHv+b3CPcAaPUR
         ocMseiSxCRGIWuKma8rPa3SjU5uxusdIAC4tvfH11Lr8J/7BhGhV/ayB0kQ8dVoHbgC0
         m2hN5hAJkEvNJPk20pRfM+7s8qj0rACOb1I1hEoyqutVpvD8d3qudO9O7tS032dVBqse
         S+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767700701; x=1768305501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ViMSeBgQGhyIT6Ljn1kOG/It/sSOMDQAc70oq5BpcPE=;
        b=o2r2gGvheaFRWYqkJU1FQgXPSDuDDqGCvscdGttTtZ7wPNb5eTFQ7biAZbt5xrqE+g
         J6pHtufnLIGLhmC/MFOJIY5t3aAJOJetYhXO9MWMqly+uE8pVduVCsx+MgcgytHNwfuA
         2kQx0fzVOjql8Mr++HMTzVT1GtyaAt7Ungy9R10vNJkWUp9gYqKhYn5btTapekEzpGF2
         Tjqi1K2hnC9YzP/17dcj/z8xP/1FMlSDXZVwCbBihfSV6X6LA+xxLFGYXidDXhpfHD01
         mnA+aJX3NLCsqQPQT3dmKz70SS2TX449JzOrECSuq4hFdoyk1sFg+xaFx939TtIzyJSl
         HT7g==
X-Gm-Message-State: AOJu0Yz3wDqXZLNJ+JYP9FCUDZrKB/EVs2hseVKSLzKxqwzyYVLSfCJE
	T681/itRGDQwqnTCzAdGO9Cj8uT6fFclO+ai2FMW0z2yOF9CNQXPOL+BlRDLrg==
X-Gm-Gg: AY/fxX4KuUO986s7A8sT5+e+KHEklrM4HiFNQxH9NtT/wvon0ugd7GXkb/inyDaoRZB
	myqCPrGUP7F8rXRV0LI/JeQuFlGyYVByHbAwQc4fLJokSl4i4XVtAFEbm4rF6s6UCmO0y1bwBnj
	FqR0r6eNtXWJdOnFrSZkalNSe4kQAEAjl8sj8mz+6+wgVVH1rgr8Gv+zgUP46VWmd+wKkaahQOu
	nYr9ICK4U5i3z/zhlJsxTxERdSGdGIaBK40x2AZz2N9KJSsQkm2rRma/RmmHYMe1dglpDfYMol7
	IuFmYoztriGkjYxVGESQE0UHfi6sYxVthgkz+/1QZLEy+IMkPn8hEA/OQ9rmRgZ9YyeaDPgsTA3
	/0XgcFdJgB/EUtZt8Q5VDHeDNFybX9DpjzTbk0HJzrAtnnAIIFNz7zLXhevhRs4TnpStZM7Sm52
	hX3b7CWB4L
X-Google-Smtp-Source: AGHT+IG53d6zwYFl+p5iH6iFEWBHZANKeYonQrK3pkSX+i62Kl64qn3JTNszJ1Mx8bNBSpXA8BPRqg==
X-Received: by 2002:a05:600c:8b0f:b0:477:54cd:200e with SMTP id 5b1f17b1804b1-47d7f0633c3mr29052605e9.1.1767700700475;
        Tue, 06 Jan 2026 03:58:20 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f41f5e0sm39452255e9.8.2026.01.06.03.58.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 03:58:20 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][whinlatter][PATCH v2] accountsservice: ignore CVE-2023-3297
Date: Tue,  6 Jan 2026 12:58:19 +0100
Message-ID: <20260106115819.1262750-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 11:58:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123178

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-3297

The vulnerability is triggered by a patch added by Ubuntu, and the vulnerable patch is
not present in the recipe.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 071a45c9d76c9a222c8fbaa50089a8af44f44e74)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: fixed recipe name in subject

 .../recipes-support/accountsservice/accountsservice_23.13.9.bb  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-support/accountsservice/accountsservice_23.13.9.bb b/meta-gnome/recipes-support/accountsservice/accountsservice_23.13.9.bb
index e3dfcfffff..c024ae3f92 100644
--- a/meta-gnome/recipes-support/accountsservice/accountsservice_23.13.9.bb
+++ b/meta-gnome/recipes-support/accountsservice/accountsservice_23.13.9.bb
@@ -41,3 +41,5 @@ FILES:${PN} += " \
     ${datadir}/dbus-1 \
     ${datadir}/polkit-1 \
 "
+
+CVE_STATUS[CVE-2023-3297] = "not-applicable-platform: The vulnerability is Ubuntu specific"

