Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 503D0108B8E3
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 09:50:27 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9169.1774000223774036060
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Mar 2026 02:50:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IIlm7Axm;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-487012ce896so1606375e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 02:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774000222; x=1774605022; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jcdt2rjBxWTSfTZbqD7Z0W4vhOMnTsk3wdtlrYrwSmI=;
        b=IIlm7Axm6srWXXWBje9kQtQh0CsZTb139tkEu4SCVRQfpKCixpDs7S+u34iD2QqF4Q
         S89sdPizEhTQc1QBpUnlODXaob0FGsz9HUnK+wvz0hPAAV/NursdkIbY83B2ILWGd5VQ
         CIsmrg3DzHCTTxrvxPUSQC5RX4TXG2h7xoFjCfwHtuX4MlMdDRjEtu7od/4+F4gcWSlZ
         LYgBfGDI42IhijCoX/+iDZwN3fI1pKsYmC4Sjdfmy+c1Aj9KjsI3xrGQ5PnM6KfAzzhN
         mH6bOnuljm+tcz3OhaSI+/7/DCFElA4ydfDa8J1HBUotjy5y2Hrs/2uw1bRABo+pn0xm
         0qRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774000222; x=1774605022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jcdt2rjBxWTSfTZbqD7Z0W4vhOMnTsk3wdtlrYrwSmI=;
        b=kxrlFhlGoSaNsxE8aVbC94uK2Rnvu55BQvj1Um+S0PnFQORcGK9MttlF3fNCXDFInt
         AYuEHm8mBWJ0Gxct43napO2Y55cpXYuZj8uZGW8wrGH/6egWx0e0uVGY/HBf72RmIzJZ
         t34Av4BPFmK965Xe/WMwJSEAeBBtCd91e6Zh4JDpjpbHMfE7acDbykwKo+enqBohHZKQ
         Io5ynH9yA4xjsSZHBKiZSQeUrLiqqyd15CHgpphh6AEyvPQcgz9ofQLbfanRs8SYYT78
         bGL0wf0zFJ4k8GmUGH15yFKQjzF4lpOiO/SIA2bQu/KVrlVK2g2bdAC0VCYSV5nYfq08
         tqww==
X-Gm-Message-State: AOJu0YwFyBFthRAPty9KDBEA4/YxfE48yp1CnWVNYlrEu5BQ0e/iE4Mj
	JbjRhHkdbZ86oDlP6wj4SlEMNzg9ko/94R/cMmeDp+S9h3g/swkqIy+zH//7HQ==
X-Gm-Gg: ATEYQzxQWcoRWPU9qZ5X8XOagDjO2mj1EjzRFg+wkNAmo3vr3wQPc9D/AmSif0Rpq66
	0e6FVaW7RnJowKLdhKxjlCJN9JGVhztfaqHdpvjgXrl2nMLwlurdqIQiTz0QbLarpyLd3VmLk3e
	MoDOqjvE1zGKlfojvv9pMdFBFguUblyNKZenNBCRvMJN5kFdl8Wtd2+YIxk7JECgX6KrJcv94kE
	G9Q8mpbmw/367/R5UoiVgshdHC0bMXmzxNmM5Cnv4xX+e7xUX5nOHmXANur1ib5ydG9fTcxHK+1
	BkXfaGdVzFXQl+LB3ZLE34c3MhrERBX0jcDfvOe7GMLlNpkXhviL6CLNa56TOS4jHdW3TlMQwjK
	DYHdVeAfoQ8VQo6RvkmeyMdLrsvyGx7qd22kB2pzdnEXjznpbFz6lt6wheHmdZ4XwjKB6rXsRX0
	ZR+7lN73KyB5y70PQrwSCo
X-Received: by 2002:a05:600c:a31c:b0:485:2a4b:7bc3 with SMTP id 5b1f17b1804b1-486fede723dmr27219255e9.4.1774000221633;
        Fri, 20 Mar 2026 02:50:21 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff19d452sm12747245e9.19.2026.03.20.02.50.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 02:50:21 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] liblc3: add DEBUG_PREFIX_MAP to LDFLAGS to fix qa error
Date: Fri, 20 Mar 2026 10:50:20 +0100
Message-ID: <20260320095020.2744127-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 09:50:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125430

Fixes:
ERROR: liblc3-1.0.4-r0 do_package_qa: QA Issue: File /usr/lib/.debug/liblc3.so.1 in package liblc3-dbg contains reference to TMPDIR [buildpaths]

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-multimedia/recipes-multimedia/liblc3/liblc3_1.0.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/liblc3/liblc3_1.0.4.bb b/meta-multimedia/recipes-multimedia/liblc3/liblc3_1.0.4.bb
index bcf91b5453..1baa84c330 100644
--- a/meta-multimedia/recipes-multimedia/liblc3/liblc3_1.0.4.bb
+++ b/meta-multimedia/recipes-multimedia/liblc3/liblc3_1.0.4.bb
@@ -9,5 +9,7 @@ SRCREV = "1a5938ebaca4f13fe79ce074f5dee079783aa29f"
 
 inherit pkgconfig meson
 
+TARGET_LDFLAGS:append = " ${DEBUG_PREFIX_MAP}"
+
 BBCLASSEXTEND = "native nativesdk"
 

