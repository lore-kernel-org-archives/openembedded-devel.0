Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E63C3D16272
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 03:09:47 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.4727.1728961781666128182
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 20:09:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cX6nso82;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7ea8d7341e6so980461a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 20:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728961781; x=1729566581; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=anSU8F1Ty4J0YShtubaIh09QFUo4uCx2mu1rqP6nJr4=;
        b=cX6nso82StUpG9JY3iTWj8YCbEMRcpCkE09h3LhXZibogQVsWuErP8FveMnXQjv1Hf
         NocklIseO+CgSIqQfWQY/ByE951J50mFBKCGqezod9PVmm0wEDTIf77uess9bb3y5mv1
         ZxdpIBYPaseQLTV8I9elG0MxeFQl41oOrJYlFyLALeWfXRFgk8iWKxPuvoBrKAW8xL4N
         /sLGchapOXKvU/SgcC1l7ZBc+16vR8miK5Ftztn5fTTsN9rySsn55NQ3vpeVJ7iDVZKz
         fLqCRiALRzgRME7+Zbx+cmHHx34qExwzL7QBVAawOVX5lsOeCVaSIPtgIiI0l+FQWWww
         am7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728961781; x=1729566581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=anSU8F1Ty4J0YShtubaIh09QFUo4uCx2mu1rqP6nJr4=;
        b=xTDWuQ+ObhHJ/WKPr+CzXH5ZFX8oLxCGreMPJJOhwX8QD/9nkaudbUQW1rRow8WaUE
         UQ/Km6WFiKOaM05Og6e7hfrlfbalozMTKhikAy1y5tXNfxSwePWHmRadVnztQdsoOxkf
         mlebICyyGVzZJrrEhZuJovZYprt0HAw9Neu4yMIvVNnIFcE2SEi0R81P1Nf4fLKqqZFt
         wLI7ELIAJjCerlkwDnN/utM7KFYG8T84KmdqUoxQtrwsiez5luUQmhmsqh+OPzlqW0IU
         7DgVOEB3awwh2IyQsFczRoxxp0SRgVu5/Z2mxK3TP+WUnNa5vwYzk1DrGwxtkLUVSRSe
         11kQ==
X-Gm-Message-State: AOJu0YyoF4UCO7sWFqaQHh78teyk3K0UTaoA2GXytLUMPT5c537oabVM
	0I5qEEkJniQrkGA5jg7BV1qoN4VwuXZW/iD5yu+fOTV8sNYXJbVPkFGzljyW
X-Google-Smtp-Source: AGHT+IGzfWAcxQ2RqsHBL/VN5MnZ1IM4AjVgt/N0B6JEiPStZ5N43qSsJxSD+yRs0l+Ill05Bly0kw==
X-Received: by 2002:a05:6a21:393:b0:1d5:14ff:a153 with SMTP id adf61e73a8af0-1d8bcf12232mr19890886637.12.1728961780878;
        Mon, 14 Oct 2024 20:09:40 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7932])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ea9c728767sm286105a12.93.2024.10.14.20.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 20:09:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-yarl: Add missing dependency on codspeed module
Date: Mon, 14 Oct 2024 20:09:37 -0700
Message-ID: <20241015030937.3585151-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241015030937.3585151-1-raj.khem@gmail.com>
References: <20241015030937.3585151-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Oct 2024 03:09:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112918

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-yarl_1.15.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.15.1.bb b/meta-python/recipes-devtools/python/python3-yarl_1.15.1.bb
index 0a15b2e34c..475c71bba7 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.15.1.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.15.1.bb
@@ -26,6 +26,7 @@ RDEPENDS:${PN} = "\
 RDEPENDS:${PN}-ptest += " \
     python3-hypothesis \
     python3-pytest \
+    python3-pytest-codspeed \
     python3-unittest-automake-output \
 "
 

