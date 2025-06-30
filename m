Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45867C83033
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 16:57:51 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.41258.1751291659177526114
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Jun 2025 06:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K3XQ7ieD;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: yishai1999@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45363645a8eso30646685e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Jun 2025 06:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751291657; x=1751896457; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c82ZZviZMG5FaScl9MUn0uhrTWEeTLB8g1SxIZNjc7o=;
        b=K3XQ7ieD3jpUA5uTou/M3FJ5VxViI8e/jfdOx7UZ4uK7yADMkyvsazzw/u55XgLcOP
         b8Cundjvnbi2CAfLVGoEjb2mFMWvs7Lj5vZPpWf+zHROyqq2dhlY+TOdKgcZiIAaH/Zr
         K85b6A1B3aQyAaOJ5+HI7GuYHLOgZLhjfDpjlZ00HbQ+pBq58MxxDOImHRs8E1J2JpRJ
         QiBOD2FC5tfzckU7xPYErh3M0CYxOsRpnU+NvqIrzM/ex1YJvD6QzM3eyv07AsE+mwWE
         grDQznk0g73sybMn1NPFHg4vXYw+Z9xadMJFgNcwP9MkgmdlLFlyJGqRTNly0tZjf4Jk
         AHxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751291657; x=1751896457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c82ZZviZMG5FaScl9MUn0uhrTWEeTLB8g1SxIZNjc7o=;
        b=KtgzUgAG0sUHJZUGv2xDgApnoGLCdiAO6JqR/3E8WftLWQ3ZTIJoFjNXY02j7BihbM
         3RLFSNxJDcXjV4mqxImXJ1cvw02OKsoSdUp8vUqgjbHHEFcUQcwiItMK5GurgHa+MmBB
         s+mcFr3sArmGtq37Zx/puEJgQuZTcvEAhkucBUIyhaGeCaJoQHFZ78KixmPC2x2gO7BX
         Gt2FFpH8hGUP4WCbNiS8FArvIYsTD0MuDNyKQf+cxegT/gTV/57UVxvSAeZE8wPKFBQr
         NzM4jAZ69P5eMrxe3aSZoIBhP9HTsfJQVSN2WGAa4hwjHk0+weMpcfEKA3yJGLgdkU9v
         37QA==
X-Gm-Message-State: AOJu0YyZzGKZn4v8QQKq89PJEHTpB3/t5VSLmFovlbQTkar5JJvNx7ne
	+m/TJ3PoJB4WZszx5q7sORV0OzD0K2IJs1w4hBdx4Nhx4EmocDv+KVE9hnzH7g==
X-Gm-Gg: ASbGncvtg17u8DuItw/ysD6454KSBG0Zr56LIbgrjMdByc4L+7AuCo9j77P5ugbXXZR
	s5JPAN3S6vBm9oni89+oPDOdNEgIwk3YMtVdEPfIo+uF3pLtv34TbVm91AMji6J6lITvnIQYpsb
	GVgmANucaCzmmZvmbIQ3tsJkepvIPvpWeN8y7n16eNwqGenpUVgxywd6M+dzcWcXPINFB72yY1c
	vm5+IgZPz14aq9Jw0mK3C+mNxtFGtGDhrwGV6WLKLwIpB9W1z/HiAz0dVlhM4xC7YNKWCkpdG45
	LqRIl7Lk29D4V7l5y8CKeOBF/uglAg48F9oltYkCkL5ZCde5lPlJlejhkGtMX4RtrwLtEQ==
X-Google-Smtp-Source: AGHT+IFWeAjo0Cgt9KkfzBrPy52h8EDnb/tSQiX/q9LHCHfo2nmSk+UBrfZGms7KE30N8yWDqWmekA==
X-Received: by 2002:a05:600c:8505:b0:441:b3f0:e5f6 with SMTP id 5b1f17b1804b1-4538ee62345mr105888285e9.25.1751291656900;
        Mon, 30 Jun 2025 06:54:16 -0700 (PDT)
Received: from bigboy.CASA.NET ([199.203.94.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3a5599sm139020195e9.13.2025.06.30.06.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 06:54:16 -0700 (PDT)
From: Yishai Jaffe <yishai1999@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yishai Jaffe <yishai1999@gmail.com>
Subject: [PATCH 0/3] Adding native support for a bunch of recipes that are missing it
Date: Mon, 30 Jun 2025 16:54:06 +0300
Message-Id: <20250630135409.2425189-1-yishai1999@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Jun 2025 16:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118177


Yishai Jaffe (3):
  zeromq: support native build
  json-schema-validator: support native build
  python3-pybind11-json: support native build

 meta-oe/recipes-connectivity/zeromq/zeromq_4.3.5.bb             | 2 ++
 .../json-schema-validator/json-schema-validator_2.2.0.bb        | 2 ++
 .../recipes-devtools/python/python3-pybind11-json_0.2.15.bb     | 2 ++
 3 files changed, 6 insertions(+)


