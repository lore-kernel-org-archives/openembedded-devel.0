Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89372E6781E
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 19:41:54 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87248.1766432506430439102
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 11:41:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m2szWqBJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa4so3506594f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 11:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766432505; x=1767037305; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VgRdyheUcTkvftvrpgSAQiky0LZuaFuNu0zE5VZFtak=;
        b=m2szWqBJZbDKoJyviCKCquJQv8dIewLFUYPLBSu1xda7M6qCOwkzA3KhHtgAFmTc3T
         1bzzePPFYNGsHfkAhqmyzELuRbvUFhazx+7myaaKE/KCjOWLAwhP4gacg50vaz3NpeUf
         npcmYgxEC5APUw/7dKkCJ8hwQxWRQkGQ+psGgMxvcA8xvTrM5xnU4dIvyVZb13BOK9nU
         kZLZQWT+KwB0qEvA1NsItwHwb7qbjNGFpLD0yHSpWGdhUCIPfz22yA+AdydF+Cyz6sAx
         D/ST5eFlV1911l2+6PpIAgAKxKfY3wNcl1R5/Yz0Y5Tn00zgmwodnMreFEYgxJGyqHjJ
         H9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766432505; x=1767037305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VgRdyheUcTkvftvrpgSAQiky0LZuaFuNu0zE5VZFtak=;
        b=ElAXqZjXVyTdk9OSfB5su3Fs+554lahpkw7e1Kng2PI5/kFsVkzKxsdRbUgRMwqan2
         DkW+tjft5RyWvGHtWcTg6fBzmEu3dnFsZn4OkTVtQoKggZ625iVfAmhS9MqxC+H5bR96
         V77LoLs8dqSC3H5EcFFYqXT6NhZXmK+Ad0+Qrzv2PgNuJX4z+Hf4yUshahS1oghUmC+w
         axCl+jOmPc51BSyS239SlGE1PWWtvqjrfqMHaYzYkJY5cZl6mKgPNHtWMRw7lol9E1NM
         gAQL2U0sVyaETiTzkytUMYXZvMF/B13GtdG6yqoU/KnQtuNsGKPfAlfgEJh6H6qaKcxm
         Yc4w==
X-Gm-Message-State: AOJu0YwkNPZC6ReYYzcO/uryrIJQHuz6HnA9fFmGEScaMYOijWaeTWma
	JLX0HAuoY31aFMGGW6YqQiWW2bQOvfk4UK272BFsaTcY1bojpGoBKG9a13qxvg==
X-Gm-Gg: AY/fxX5WKt966BYOeZs3RlHu4T+qjB8EMSn0FX5Fg6U+FuKxWJa3g9mjR4RADHq11h3
	0EFwEoQ2phhNi+sDGkJregZnqyYcHESjuMWvI+3kqp/67Fx8qYJTo/cu3TedYl8CVyhyNrMjbSh
	9IaziXJGMyGRWLLSGTFPBk0bZ/UbNWklpM1gfBiZK+i/4QSfbWDh8AAd5wi2SWw6UTsTJawrAaP
	pRFSdZ+7y4HKB+vOyN4YtAlm2AseIIUTlHWa0740tsfbZZZKg0KrVjy7I56NPLqg8ZOwGSENxXE
	T/SNPwVqrI+qohdNmsDkxYEmkCH2LpnfhGz03/lbfcofF5RPCkBtZmWFkt+CrYIX7JHV/TnU0nJ
	3hzXCuV6NzBhePQSGEIMZDrReJEk0TXyIySyeHv5ry4nfvHmeDBCChLjy8aqt9A3e7BXiwEWOYm
	sUMdx5BO0IF/bHvK+VRBA=
X-Google-Smtp-Source: AGHT+IFxo/yfUVE90zNJQT6yHSHVYFJRTMDvsFi0PjTwlwc3qSuH/x/k3fVA/7gZ8h3lB8EMW/uu+w==
X-Received: by 2002:a05:6000:2303:b0:431:342:ad42 with SMTP id ffacd0b85a97d-4324e50d6d7mr13476167f8f.44.1766432504506;
        Mon, 22 Dec 2025 11:41:44 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm24064349f8f.27.2025.12.22.11.41.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 11:41:44 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/4] nodejs: remove extra CVE_PRODUCT
Date: Mon, 22 Dec 2025 20:41:40 +0100
Message-ID: <20251222194143.1725064-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 19:41:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122800

CVE_PRODUCT is specified twice - the second instance only duplicates one
value from the first instance.

Remove this extra CVE_PRODUCT.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
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
 

