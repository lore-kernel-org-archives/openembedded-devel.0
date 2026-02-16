Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AEDEE81A40
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 16:28:14 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23605.1771259288666821339
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Feb 2026 08:28:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BD3/2HKT;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-480706554beso32280835e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 08:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771259287; x=1771864087; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tMbjVGE16t/e5LK/4zl63AonuL8xCvoeFXsryLANrWo=;
        b=BD3/2HKTK3MqAiGTui1I8kb4J1ZEjSVB9tFSHTdDvoXhBtz59nUfASe/lFpZl6ONLV
         KAPeIhgex3zwEYSXNpEPx0YqCGQxGv3N2gxIJgTggsMGpBiQSYsWVNLUPtU4i1/z+bUQ
         5qEewj4EkPEQ2Fxl9Kg+BZGRf9VVfLqDXAopNYl3buMlw2Ap2FK5ShTWFQGiWylXfXzR
         1Ga2hWdlmEAcN8tzZn0l5jO87H2d/gTN8HNwgFMsDs5IhG4Y/OWyItasMZsRNrBSzXGU
         pqph1j0co1z+iQP3uyQoL0WB2WEzPn+Us3Dtc53Jml+C0gaWNCbo5UTyz+7XqKjIjrzf
         6lyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771259287; x=1771864087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tMbjVGE16t/e5LK/4zl63AonuL8xCvoeFXsryLANrWo=;
        b=afwwyYKMBz0CSiA6lxQ/k4HeKbIW/sTNvfk3Gc/Eyf94fsTRcQouuOhsBJgn+s2+0r
         9NfgRuNXccU4V05AS+89LKFZePCrL7di9mD/+Pqy3o/+MGbkaneO9Wbbrx5C8/Mrk2/V
         FlkcLAxoBd3MNfwuOgp6Hx9n8FswHlo0M9d/DTeuyqd/5SX2zPs4OWLy1jDr1SLRL39b
         mCFraTXUitjBVFKuimuZ/5yT2XCdJ0K8ayjF+FFTl26Y+V150uL7LS68YsGqNnRPtQM4
         5Gxzam/sKw9rGKw6GeYwEqdab3rSesiKXPWOfbMK3Z36m9MOTAC/Zj12d1VXFxB/Sgsy
         azKA==
X-Gm-Message-State: AOJu0Yy+wOCxi32H/BZywfNIftlhJukgn9Lf11O5C8gfH1TFDMoL6WO8
	ShNCflBfHxKCKC7Y/u67Jz/L8+cFzK7iSVlwVFC4rYQdb8cipmA/uQ/PkbeyKA==
X-Gm-Gg: AZuq6aJz/bqFruNSMFVbC9bdYOJu559PA8NDJ3nWhIcfKhqI4cdTfJ5O01YV/UloOUA
	YpERNLjrCXmGQnYwZpA7OMzJhH9jDspRaMj+3q92P+skesD7RJn07ISuKU9miUMtkYCuNh4/uVn
	BDqOyNjyH88q8fzJrXJu9624LmFsyqspKJNMNiWrn4E5WsWlv+40eTneGtN1FTfrU0YJuGA8puD
	XGe82OJ8XRY+FWaK16SsDgwP403YmLKtmcBbcBRsKtEuaPz6aDg9mDN+hnqYX/QU7lxyXfBS3OL
	/Y0v9zxPYKafjPRCx2w2x6p5+mmG6/Uc4xvnSIUabAmL1do067xS0/wpn73s6zNlU2bWQ00SHsQ
	hKYm7oprPP3dyHXhtjKk2o43FWE5cglLXit6RcxXqchAmPQoHAZy/0w+T6QTWIjAaW3CULIdL7f
	FDZqR9Y3s63YPqob329riW248k8FTq9w8=
X-Received: by 2002:a05:600c:8189:b0:47d:264e:b35a with SMTP id 5b1f17b1804b1-48379b9f340mr143400055e9.13.1771259286713;
        Mon, 16 Feb 2026 08:28:06 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ad009bsm27459836f8f.39.2026.02.16.08.28.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 08:28:06 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][whinlatter][PATCH] nginx: upgrade 1.28.1 -> 1.28.2
Date: Mon, 16 Feb 2026 17:28:05 +0100
Message-ID: <20260216162805.1374965-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 16:28:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124425

Changelog:
- Security: an attacker might inject plain text data in the response
  from an SSL backend (CVE-2026-1642).
- Bugfix: use-after-free might occur after switching to the next gRPC
  or HTTP/2 backend.
- Bugfix: fixed warning when compiling with MSVC 2022 x86.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-httpd/nginx/{nginx_1.28.1.bb => nginx_1.28.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.28.1.bb => nginx_1.28.2.bb} (66%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.2.bb
similarity index 66%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.28.1.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.28.2.bb
index eaaf2b75e9..9699b7189d 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.1.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.2.bb
@@ -2,6 +2,6 @@ require nginx.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
 
-SRC_URI[sha256sum] = "40e7a0916d121e8905ef50f2a738b675599e42b2224a582dd938603fed15788e"
+SRC_URI[sha256sum] = "20e5e0f2c917acfb51120eec2fba9a4ba4e1e10fd28465067cc87a7d81a829a3"
 
 CVE_STATUS[CVE-2025-53859] = "cpe-stable-backport: Fix is included in 1.28.1"

