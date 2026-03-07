Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 043C1FC9EF4
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 11:41:47 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7648.1772883706298572598
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Mar 2026 03:41:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d1L5pImG;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4833115090dso105190415e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Mar 2026 03:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772883705; x=1773488505; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+3Q5UD2gQQdcY0XYp23RDeF5kYaANo2kNEI6vT0Gh50=;
        b=d1L5pImGDXUmbgzj/kH/I4nb1Ql1VwzsMBtE3fo6K3qUWcjj6u4UcTRSFH5PT5lAzU
         eOU2MTgmEpnkDs8J9brNlVWQ+ywhrRUxubFR4SYrcc/ZiXzNe5xiPp4F1fuuQw/6C8Ci
         yiftaeOaMItQJCSD8lxGO0PJOp2EmOi1Ri2sTKcMLcxeJs/ur+SwWeqwC6DtpiZ9rkOq
         FMqUXxY8VDuE6g9hC7mDyar0Ca/VJj4j59DHPL6VaZufbRMnlH6spUE4yL5V/c9d4840
         lcRKaWXB/AzWJ8enya6GBrBwc6fvJ9wIabX+LTcSiMF8wCe6bTsByqx1XCV4t7s149JG
         yqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883705; x=1773488505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+3Q5UD2gQQdcY0XYp23RDeF5kYaANo2kNEI6vT0Gh50=;
        b=FgKhPihUZLtaRrAoaDGOxaJUSrq0tKs9xGFbe3Ad3QIvicWOAAogrP1eN4tUitJsps
         SwzZePwouSryiI22DsQS76qhcY8ltJPuyj5F+E3plZMClTXk8oX/haWID3WUT0LePnm2
         KWx/H0YBBJusYW3+QbiEm5jNC7yRKbmR/rvY7DA2GjvX/J+GxXxFjVUz/ikvVNwpIBbZ
         lzngEXOfVqjUTGEO4Q2t2JZwNu/T9v7EzTn9bbmcycsm+vh7QaduTp0pJTOTUf4HFzIs
         KbePZueCQqoKSaRA+BaXRfyRvNYfSrNGJdn+ehtnp2XZAiFDtXoozBVs+3y/O3T1jVcY
         PGBw==
X-Gm-Message-State: AOJu0Yyfph2AXWgYXMXUJWeT5xdyJcgbGilO3ECVajmd6FpapNueyjb9
	+qbwtq8WLEO1CbJCr6/ChDvGdQoGBp2MnwcED+B7rNoxPFFGJp4RQYbnlwCvQw==
X-Gm-Gg: ATEYQzwVuPL/rRw+3BSIrQkklfIh7tAwMqIOKbKXWzAaP/pK2f+YbNjQVOUdRX2kVbM
	2wM1d12nEn8IvN5oJ48r9p3EBmfrjUKvrkrBcdnwiIhGe/7B4iEfK8IicCenRXEceM7Jr5wj5wy
	yM6kzjkg0d3ClA6MLaGc1uNkcC9gykp8bUg7Ak3Alz5Cuxdgoh4mBQAGScfaZVf8uJwevlTF9DL
	d6eZQEw5Q54Q9/PxcvQEQJKlHvvR87RCxdHte4NXrVq5fnuzbS8NCHtAZcOELUKI/JvgOoUpOoZ
	tdavVRdDlA5fbpfmbvvGwBy2r6oZs3yrM/D2GTD7GNGnF9abqcmCwbiHiGLAWlkzyhkwp0otJL3
	rGfuTnKnyDiYLjwi2i4vnxRm9q41F64OXVDZVfLUQuCWVl6hnv5JrZrCXi3tnODYVICs6Vs4A82
	sajxCV0lLgnaTqhtvulRngdWdo75TShWY=
X-Received: by 2002:a05:600c:3e15:b0:485:2f8b:55e9 with SMTP id 5b1f17b1804b1-4852f8b5ca8mr21660055e9.26.1772883704660;
        Sat, 07 Mar 2026 03:41:44 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2b9d8sm11170913f8f.21.2026.03.07.03.41.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 03:41:44 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/4] tunctl: update patch status
Date: Sat,  7 Mar 2026 12:41:40 +0100
Message-ID: <20260307114142.3992185-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260307114142.3992185-1-skandigraun@gmail.com>
References: <20260307114142.3992185-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Mar 2026 11:41:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124927

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-support/tunctl/tunctl/makefile-add-ldflags.patch    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/tunctl/tunctl/makefile-add-ldflags.patch b/meta-networking/recipes-support/tunctl/tunctl/makefile-add-ldflags.patch
index c96f538d2d..a556f6eebb 100644
--- a/meta-networking/recipes-support/tunctl/tunctl/makefile-add-ldflags.patch
+++ b/meta-networking/recipes-support/tunctl/tunctl/makefile-add-ldflags.patch
@@ -1,6 +1,6 @@
 Add LDFLAGS variable to Makefile, make sure the extra linker flags can be passed.
 
-Upstream-Status: Pending
+Upstream-Status: Inactive-Upstream [last change: 2013-03-22]
 
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 

