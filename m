Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F885EE57E9
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 07:54:59 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.81875.1767167690515545936
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 23:54:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HonvbKeW;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47796a837c7so68190555e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 23:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767167689; x=1767772489; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jMvsw9P6MIKDqhrhw33gzDfroxCn+whAxqk2Qvy65rE=;
        b=HonvbKeWW7r4kcG0v8ETDokMS7H1dztkhmapXAeQQZMVYF5KnfaMYClBm/YlCHmXL2
         ENol86LpBwgYpjxcTo/s/tFHc7MSHMVwMVMVEANlpZXLzr0WZXIkIow/BavvgFcZoaZF
         GXKlFQeuL2FdGPhFitDom1A8NwTKPW8ergTxETjw1iC8y7TBkLXmWauzc7oLors+dukP
         s+F73/toqWyIUueQ1MpjwVeTC5xGXcfFjkjiLq2SYX4pCq6efoWYPOVk3lL96TU1Blcb
         195SVYzTCtGV4LIKw9GWiDlPDeGtJLNDlv4xWWOUPexsin7/dzR5dOFQ2SqrVXAT3H6B
         Rkng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167689; x=1767772489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jMvsw9P6MIKDqhrhw33gzDfroxCn+whAxqk2Qvy65rE=;
        b=uir0i9Tcoh8u/o0rSfcixQ+niN6SVB8Cz6Gi3QvcUtjaRA5FvO1YOgEIDP0jpEy+Gw
         T7lycmfS8ZedFcu0nWkW4ibY1bVR9BV3eUwh4NugAxpVprnyUpGWDGCcx7P36QjHbsrZ
         YxFMtIiBAWFjcWFxlYkrBlZndaDHn6Mi4rmPZ0D754ZUj8VdcxBU3dtkim6UuF9q0q9J
         YtBOtZX9eZJjBJA1Al+zi0kg7eFb9aq2JJS3rnGfUoMEwjy3xBoSSg5zDCcv2v0eGT3u
         qgAQW6iZOX8Tx97oi1jOF8UiUku5LclM4gvB1Dr72CosyTUrDdd7ku2IGArN45O/2F36
         LLOA==
X-Gm-Message-State: AOJu0YzMoWYFrBeKfYDno6grf6umObH8UCInZvUPptFwUBgnI+ZqpCbb
	KeWIPXlk6RjV4X6F+HRo2i3dZ4MFkX/7ELldvTqrJEcbbUCDv9Yu6lVVq+QraA==
X-Gm-Gg: AY/fxX4wj/+rzdqFoEL2/uSkQAryu6xyyKJIUQddo6yBMIYv4VeH1Eg0tlgBzsBOPHg
	FCCjfMTvtseyNJZo8f98TjjjtUiYcQjgO0sb2WtWVF20v3OOcTG+Tiu2Qu+j4sEOCEkaFCShyqC
	MjxzQ1FF7EGcOJ4cLq4H13//jMnVQ2znUNZbqbt0wQrG3ei+IAUYOzl8XDv5WQ0KGtz14EV1oJQ
	CRy0uMYFU5Z066L/xQBw6t3B5EX1a26Wp6zpWjHXeuJizG/DiOQjKuLjjBZHjKJYrarcwsX6zhq
	88JJTIzdeSOhuTKVTOQLRI8i80E0ocwXc1dwxHV9ARhssaPP8y0RiNyiXLSNt8+N1t1aNGNpURW
	nJwJU88PQl9V6TDIGRhTlcTV4ZKTjIRqAjeYGIR3VXouDpTwz7ReAmIrMvX68GqtI/Zo9nMxCwl
	6/JO7GST3PRcSoPIJ5oVQ=
X-Google-Smtp-Source: AGHT+IEQGN4jZPz/dlpJe0cxLR+nfZsy1llCdMtRI2MjO0WYsIEHqiF4E2wSfWQrpqT91YETPBtGoA==
X-Received: by 2002:a05:600c:4fc6:b0:477:7b16:5fa6 with SMTP id 5b1f17b1804b1-47d1953b3bemr392233065e9.3.1767167688778;
        Tue, 30 Dec 2025 23:54:48 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm700559825e9.7.2025.12.30.23.54.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 23:54:48 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 17/34] python3-cvxopt: set CVE_PRODUCT
Date: Wed, 31 Dec 2025 08:54:19 +0100
Message-ID: <20251231075436.771395-17-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231075436.771395-1-skandigraun@gmail.com>
References: <20251231075436.771395-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 07:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123057

Set correct CVE_PRODUCT to be used instead of ${PN}.

See CVE db query:
sqlite> select * from products where product like '%cvxopt%';
CVE-2021-41500|cvxopt_project|cvxopt|||1.2.6|<=

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-cvxopt_1.3.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-cvxopt_1.3.2.bb b/meta-python/recipes-devtools/python/python3-cvxopt_1.3.2.bb
index 78402d50f4..3573d7719f 100644
--- a/meta-python/recipes-devtools/python/python3-cvxopt_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cvxopt_1.3.2.bb
@@ -7,6 +7,7 @@ SRC_URI = "git://github.com/cvxopt/cvxopt;protocol=https;branch=master"
 
 SRCREV = "3b718ee560b3b97d6255c55f0ed7f64cb4b72082"
 
+CVE_PRODUCT = "cvxopt"
 
 RDEPENDS:${PN} += "lapack suitesparse"
 DEPENDS += "lapack suitesparse"

