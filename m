Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55DFAC83035
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 16:57:51 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.41292.1751291713244474933
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Jun 2025 06:55:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c354z5cv;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: yishai1999@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450cfb79177so25860605e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Jun 2025 06:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751291711; x=1751896511; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWIxl1I+iFYWqoHK+ENLtC+M/NkNocdsTtZdPI2VOmY=;
        b=c354z5cvJ1iTw+UsuBjuRC7itZjSs6J7y1bfWjmyftu76RntyCLEdZUImwqLlTCNMO
         Lk8gtkr3pjTwgNKVI4vFgm3ElJTm+fos3u/F6fr7R2eLP48NOpkzIeum9mKvoR0tZhI5
         2LOo0qpXAheOTZVLCgdA1bT0thv//OXlTXbkE45+Zv1r1l8aJAQ7mT1+Xmfi64z0/OJR
         X1W/XptdJKwBuzJKUrji21RBnFT+ogydYpZQijk2ZR1ho5nVgzD8gcNAdUxdXQZ3AU4X
         yBnk5LBhHym9YV63AOqib/VnfKUK4kM70mE17HMqynUBwRm5rk0QUehTSQznGsYVQkgP
         /Twg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751291711; x=1751896511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MWIxl1I+iFYWqoHK+ENLtC+M/NkNocdsTtZdPI2VOmY=;
        b=Y7NK5FMnrf7FECsbpkMRFJb90ws3aEdtaidwNixwqpoGdkFzf2goUyzfqnNvNyYrzP
         DRFqnDIOaXijbEMEC0PaxZ5x2LMzxkeLRqWgcQ79ae2elLuSKld3KcOD19uzuCMqh4gK
         ETnQOaHGePg7cmRQFeqQNNN797wfhowRhmKERfDwIHzbfMlAijjYYZ9LRk1TGnceB8hw
         ZHutW7v2QL3n1OqBuVerVmksvkQ/cBU/NSNV9cqx3boDpYD7IEFRkJ7slUmI4Fi0PNON
         x/+1wYtd/l3ZUPEXtYdKyhyeIISY48FNDVaGiD6drheYlXNVj3OeEZzbzJgMrv9aK57D
         9DBQ==
X-Gm-Message-State: AOJu0Yy/r8kWeQiJBVhQ2yy3ZsL8rSbPWwYTg3J0Q4LMMtSFNVKa402N
	/4qmgGBChcLwwtmMNf5+YFz4WBbWoPZexir0CQCoyWO4kBjsR0xlCF8chdGLEA==
X-Gm-Gg: ASbGncvFkUH04gF24068fcs0AezW9oSTYqHcdWpkTs0auZHqJd/dWo+hai6IuO3aNr5
	EX8S8yldxijbLp1F/7RXqzb2VgB5SMK44OnqEl/zltcdDires+zlaOdVKr2mQeXNNW17yVP9pqn
	wjCG6932AR3z31UwShtjeSXEcx/Hw3KP98Hp0/AVzQbfq2Qc2CKGCYDH2/tlkr83q4vcdF9lQ98
	5cB8btunhrm6WuDx8NASw5sl76oCSeR2zflEUN3d1P3k43/hbSppuPj0tpIb9eTLcWQ8lZkSK/H
	8I72gWXGy4iZnLtkELV9ItZL+uc07ZSsujbk6sWmW38Xu2sBT6WHewwzq+KG4WGM4Q1Geg==
X-Google-Smtp-Source: AGHT+IGcaXPZQ9r0xhM5oipJh/BvHUxRgD1tli/6MGJVNeBFbeGgX9/olSgeOjswTpUo5tFWfuOoMQ==
X-Received: by 2002:a05:600c:828f:b0:450:d00d:588b with SMTP id 5b1f17b1804b1-45392bc88damr120372735e9.9.1751291711157;
        Mon, 30 Jun 2025 06:55:11 -0700 (PDT)
Received: from bigboy.CASA.NET ([199.203.94.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3a5599sm139020195e9.13.2025.06.30.06.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 06:55:10 -0700 (PDT)
From: Yishai Jaffe <yishai1999@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yishai Jaffe <yishai1999@gmail.com>
Subject: [PATCH 3/3] python3-pybind11-json: support native build
Date: Mon, 30 Jun 2025 16:54:09 +0300
Message-Id: <20250630135409.2425189-4-yishai1999@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250630135409.2425189-1-yishai1999@gmail.com>
References: <20250630135409.2425189-1-yishai1999@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Jun 2025 16:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118180

Add support for native build of python3-pybind11-json

Signed-off-by: Yishai Jaffe <yishai1999@gmail.com>
---
 .../recipes-devtools/python/python3-pybind11-json_0.2.15.bb     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.15.bb b/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.15.bb
index fa4a74f92..8ad7dba76 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.15.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.15.bb
@@ -11,3 +11,5 @@ DEPENDS += "nlohmann-json python3-pybind11"
 EXTRA_OECMAKE += "-DPYBIND11_USE_CROSSCOMPILING=ON"
 
 inherit cmake python3native python3targetconfig
+
+BBCLASSEXTEND = "native nativesdk"

