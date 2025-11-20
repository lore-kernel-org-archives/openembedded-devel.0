Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90DA1CF8868
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 15:26:36 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33339.1763642767601192674
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Nov 2025 04:46:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VQDhZjGS;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: nmjain23@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7bb710d1d1dso1245106b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 04:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763642767; x=1764247567; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Lm2pftBgwNZCLy5wEQtN3zFOGLwk6QdguEJ9EciznA=;
        b=VQDhZjGSakDK13dNe/cSH+zgG6n+H3iF6i6+orerUDYaHXPyBYdttlZ5qDl9VdS0Nx
         OZjhNnFKUpkllEh1Iiq02nRlnf9Iv/8oLcAa7amaQpAL0Qsu56UAzACkIiUK+mFZ++J+
         BnbGzmuh6ZPiGZBuvh1uSFlv+5aipEX6J+h0JgYtIfDvDwYuiR5KYZ8bm54MulONvCLq
         io5FkYEf7bd9/qlgWXBuprmEVyLFF6WMpA9vFtMjzRhgRrwBCb3FL3AjtC3gaxCAvnWK
         8YZHGoVnZ4kv1mxu3XHMp5f1ddm4ZmjVUIzZ0adV9TfbjbmSeS4VYnB3CtrB1dLLWAge
         0AzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763642767; x=1764247567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Lm2pftBgwNZCLy5wEQtN3zFOGLwk6QdguEJ9EciznA=;
        b=wV+G880LSgPh4cjDaZiplU2Uxms1LFOUR5U2PO9qyVhch+oP0pQ1qfvaSF8he5w9eO
         ydJC/x8LEGhXFeV7oXVyx0Mbo9R/DAA/jjkJLJe2LGHpnRLqZff/yVzyKT3oNZFDaAt4
         RIhlPuM48m7grfFT4Y5WMyyMO55zedlhsKFgSSPinAez7q8PRKiZ48oHCykEZ3SfUgRO
         Nx5RsHbYRLuvMVGyu209kxC1p/ywYyox6aEAMFtOU0GfV9vAxhuwJVYlY9ul60zzRfBh
         QnOof0Drb1j/ANj1FjFDybSTEGqUlqG4Th5SqFmiQzYbCLPdKnQsJfQQJ6jtOpFpbLty
         YACw==
X-Gm-Message-State: AOJu0YyRwyXcJjN2SLpPJVSHFq7inniUE+huLEpk7f44CoZRbfIfYMvj
	/VlHRMmskJYEtngOcjZrITvbnGxE1hVNK8Iu5hfdaR+0JUbT1+uxr2JpWc3VKQ==
X-Gm-Gg: ASbGnct7ya9j6FKvYV48vJ1rdJH3Rb7ZdcZ3xTLQFy889RO2mLqchoNwwXSPeVLZSuO
	oZKc6a4PZuWvPeu3063MKOTrbDku108e7u7PR2BHs8jJVN3eTMMw1NaklWfbfeu4TcrozTqvEos
	QKcGV+FeT6u2epFeqcvbOu1TsYV7f7vjIWkhZEcatzn5CCkSRH+Z7LJ6eRxYe9AhRX9+TlyXNk6
	fll9vdxFsK6fFAYjWbdTkre+HgfuqoVLKUfDxQiju7/pLzj6WKDP63YjE+a5MhbwP1G3o3KXNb0
	Ugoq8oJgrCI44qPoc1k2ARpsP/XHV7kK2TNTcgBTcALSKJLmKRo8N0NqWMHxv8i71e29FZ2lvs/
	8VHoLuk3PLqmxG2tYDVoNv9jDz66XUJ287XxGtZIar8jcIQP3aAfT/3ut1FyImzpEE3ehhggwrl
	9mDOKMCQDeGTL9JozairLd4ODD304=
X-Google-Smtp-Source: AGHT+IHzbpkIGFsLy9KZCKhkm8xS0YnyNSUUkyJIRBFC6E0ESUmT+hdDekYdSuSqfiBfzm9H2h4r3A==
X-Received: by 2002:a05:6a00:12c4:b0:7af:19bc:ca71 with SMTP id d2e1a72fcca58-7c3f07672efmr3484135b3a.19.1763642766701;
        Thu, 20 Nov 2025 04:46:06 -0800 (PST)
Received: from LL-3450LLL.kpit.com ([2405:201:6807:1a2:20e:dae0:8c5f:eb50])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed37ab1csm2771780b3a.17.2025.11.20.04.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 04:46:06 -0800 (PST)
From: "Naman Jain" <nmjain23@gmail.com>
X-Google-Original-From: Naman Jain <namanj1@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: Virendra.Thakur@kpit.com
Subject: [meta-oe][kirkstone][PATCH] p7zip: ignore CVE-2022-47069
Date: Thu, 20 Nov 2025 18:15:39 +0530
Message-Id: <20251120124539.430386-1-namanj1@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 15:26:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121950

According to debian, this issue is due to crash in CLI tool with
no security impact, hence ignore this CVE

Reference: https://security-tracker.debian.org/tracker/CVE-2022-47069

Signed-off-by: Naman Jain <namanj1@kpit.com>
---
 meta-oe/recipes-extended/p7zip/p7zip_16.02.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
index 31a12fdb04..cd92e73c12 100644
--- a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
+++ b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
@@ -42,4 +42,7 @@ do_install() {
 RPROVIDES:${PN} += "lib7z.so()(64bit) 7z lib7z.so"
 RPROVIDES:${PN}-dev += "lib7z.so()(64bit) 7z lib7z.so"
 
+# According to debian, this is due to Crash in CLI tool, no security impact
+CVE_CHECK_IGNORE += "CVE-2022-47069"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


