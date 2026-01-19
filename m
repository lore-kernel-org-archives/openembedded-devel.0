Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4295CCA6012
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:28:39 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31576.1768811309314205720
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:28:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RMUBKI88;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a0c09bb78cso30852055ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 00:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811308; x=1769416108; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BgoB7Hlbc3NcbjZ1XY/YSsvgRmFS7HpUFdtchQcCPn8=;
        b=RMUBKI885spQ+Ubf5HykNWO/HE7I1RUfOIj2OdpbbXdjf5y/WmsbrgqAedi8ccrfe5
         Ee33iMdivdA63rvI1ql7UdgBgEJORk+27GXD6MHQNqAVgbpY7mMM6FRUNVbcMa9PA5mS
         MMf46Rz28ANwxedFpZZc49PhiKf5D/y3p/GVPuYjMPnCKrOcJeHVzTFtUbTLM5QbBLL5
         SQT+/IKsxnp5F+0bnoojjcr9h2CJxQqsXGfk2cpQlgPq5/Pst4/hUsA0tYshLenE4pjt
         rCL+6p1dpDmPDg5+TMEYrL5iLqOEruOnAmtz7ANTUqwte+BblXuKCOybbYZdENWuqTbR
         q+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811308; x=1769416108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BgoB7Hlbc3NcbjZ1XY/YSsvgRmFS7HpUFdtchQcCPn8=;
        b=aDM8z62JOrohKP3qCi7tElTeAgRcDk8RT2tMKDS5MR4DmLpmLBHDH+dGQrPVkYTjP0
         oF0HWys9zv0H9WkllC0ADX2hcrKvloEFGHEV65IVrmy7klTR6zmTWY4lUrUZrUBaMQta
         DaxGEsKip2E2rC9Ak8lsPSFBVPEak0IOC2sMGv900JtTnoB/7EGaBeYDxmH9UiiFKl+k
         oWhv1pUfWb1NwEnElaeYTYhxmN+je+hz9xOlInkLPDimzTWeB5bp+E9wtlkWWnSjn0xi
         Jk6Ceg9et+d4hSbluA7nHlfJ89RwE7HV5shIZmyShWjahHFURBLHNFTUuQ3iJdyZcPFW
         SuTQ==
X-Gm-Message-State: AOJu0Yx/xHHTRVQpum7Cca9ZUFHgzutfjOxpoeCldF1Y5IyeePUchl7f
	FgFrnmaKU06u52ZXIJv/JiuLJCUXnNRvYrQsM5n2SyPNG9XoszMOnnCuVHwkxg==
X-Gm-Gg: AZuq6aKEOoYPGI0MkyJ9vR9ZPqviZuaHE8jlbcaLVnDRGqVbfNIsE6grDZT3htywjRE
	aEz6tikTNQwfNPxCW8406jS+/FG6euXD/iQajhY7QG38XMKTeSeWXYB+HbUTDNWm54RwW0qWtij
	Lmz4oKs7tScSApzrzLK3lefa9cJhTtMACZ9yztvdo0DaM0IeHfYRkH7N35iFVBdzj1UaC8qPdqv
	9KzVkvSme8p47njf3McBz3gQmNMn3RW30GAHm+L7ggIKuAVyheiycQju4iki6Q98UP7bOkMJ3/m
	PLhvyeGxjV6ZlfA7nygaOdifkWwr0N/6kJ9F6XlwvJeV9BvQ6b4xTnSpNtaN1Jzt/eDaoKgmmY2
	DtpmT2TB4UzSvaJWo2ly2O4vVXJwYQxhvbWcg0Bjr+2m0fvp6IVNeGqbxikn3D2/ab2eZZeAMLw
	9R8p95WUFvx4jFhCklCJrLW7ziCo+EJZHeEw==
X-Received: by 2002:a17:903:2310:b0:296:547a:4bf2 with SMTP id d9443c01a7336-2a7178267b1mr99534565ad.27.1768811308507;
        Mon, 19 Jan 2026 00:28:28 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fab6esm88002455ad.68.2026.01.19.00.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:28:28 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 11/28] nodejs: remove extra CVE_PRODUCT
Date: Mon, 19 Jan 2026 21:27:33 +1300
Message-ID: <20260119082752.4120991-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
References: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 08:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123605

From: Gyorgy Sarvari <skandigraun@gmail.com>

CVE_PRODUCT is specified twice - the second instance only duplicates one
value from the first instance.

Remove this extra CVE_PRODUCT.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6ff92524842233efb68eb92d4bf7637ef378900d)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb
index ca4001a04c..ccaf9f7bb2 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb
@@ -43,8 +43,6 @@ SRC_URI[sha256sum] = "487d73fd4db00dc2420d659a8221b181a7937fbc5bc73f31c30b1680ad
 
 S = "${UNPACKDIR}/node-v${PV}"
 
-CVE_PRODUCT += "node.js"
-
 # v8 errors out if you have set CCACHE
 CCACHE = ""
 

