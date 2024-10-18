Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A477D3E18F
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:42 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.30075.1729278802642863942
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Aw/DcaMj;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e38ebcc0abso29185627b3.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278802; x=1729883602; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQNbc6ZH2VdZRTs4R6MQAV5IDTORtbw56u6bHfzk9bU=;
        b=Aw/DcaMjuYvG0PLHUtAZygDLhJqr4ID/jMEFFFlXRFyjJJdMvvm4OZlGg6jIGIJIYq
         h4PWLkRX1hqHtNjexFB/tQ5p4HmBDWw4uVXIMF6QZNfEvK0/GT+YtxlQY+CoF8alWfSa
         pvi6aoGiAjyzR78yO7z6KSDol1aL21O17IpQIe8A/OKYBgOkaNSV2FgWEfJofvwIxT5D
         SF5XPx2Vj/c91I04bNJbgqKBcZCQWYKklwctEW3SCXZ5EwQXF/8TG7sbGWkzmOLPhbBP
         zyLR/LHKOuvvKowgW1c0HksWNtPLvfcy/MPubCVD28IsJseyGTTRCsLHggUl62Yy6h0P
         l/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278802; x=1729883602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dQNbc6ZH2VdZRTs4R6MQAV5IDTORtbw56u6bHfzk9bU=;
        b=wBBif1dG/0oDhxxEv+VM4/dMQ7Pw2R3VxYXvnJWPy+IV5sgYN1q5XKe2zg4kKUALSU
         bWqlSqng2/w+W7LDIy9ZNM4y5Q8W+8AT6UTJWJr6x9VdkXC31wL3hv4uKI8NE9RwdVR1
         D95Y0Glhnk6x08SFaFbb47ThcNxS7rL8qJwbfCkCD6nAPwj+/rc9wDp5GlP2Ws7+3QNo
         M9xyYKSxeo0lFvVrib3CWfhQOSVocXyrBgO75yZmQ9z6LNQXt3x5bCWVtTsLkhXDpDQt
         WttB4b2NyXI2rAS5MtLv/UzEL3hwOq4oSv4IlOiMbwvfJxqR29Y9RdHvLqY/agYp36hP
         P1Bw==
X-Gm-Message-State: AOJu0Yz1UDWTe4Z6pyskxg0npYrpTrrc86DUvkPxiu536WkuoYAzh8fU
	v4/M615NYDsoSyPqcsKLDuedE7r3WrN/OSuIrAXp6nBGJcW23hG83jhkXQ==
X-Google-Smtp-Source: AGHT+IEEKoLjrpAj/XbctDMTtbyusYEoP8jllCJwf0R8zMLkrdBNEjoZ1GL+EEZZQjQZgR0EGToGqA==
X-Received: by 2002:a05:690c:f01:b0:6e2:11b7:f681 with SMTP id 00721157ae682-6e5bf632a34mr35241907b3.6.1729278801293;
        Fri, 18 Oct 2024 12:13:21 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:21 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 16/68] python3-docopt: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:03 -0400
Message-ID: <20241018191101.25184-17-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113003

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-docopt_0.6.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-docopt_0.6.2.bb b/meta-python/recipes-devtools/python/python3-docopt_0.6.2.bb
index a2432068c..2f03bd37b 100644
--- a/meta-python/recipes-devtools/python/python3-docopt_0.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-docopt_0.6.2.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=09b77fb74986791a3d4a0e746a37d88f"
 
 inherit setuptools3 pypi
 
-SRC_URI[md5sum] = "4bc74561b37fad5d3e7d037f82a4c3b1"
 SRC_URI[sha256sum] = "49b3a825280bd66b3aa83585ef59c4a8c82f2c8a522dbe754a8bc8d08c85c491"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


