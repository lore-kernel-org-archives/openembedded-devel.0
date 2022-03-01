Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AEC9C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 20:34:10 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.2318.1646166849142221284
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 12:34:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RWJfx07s;
 spf=pass (domain: gmail.com, ip: 209.85.210.174,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id g21so9039272pfj.11
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 12:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/lzYEdXI9AckkMjAG3hQPJzybUfhu6CogQRyNbKsASM=;
        b=RWJfx07sqosuAc0PGfMPHaKzN40XBzS8Jmn1UI6zHG1bs/vOdANpYJN15NvDOKY8Jc
         aSSuFwJ0Sr/3Kzicwpu4PsE8HVRZAO+LWNEp8i9MMUp9wND3JfXHvlBS0ubzqOdsL3zH
         6unQh8Eb+e7bLMI0+ykcLkcfWXbtZX2hMi46gK86dS6X+/h/p/ySb446Vi8WoxWxDe+4
         PWsTOP4B8Gb4t4NpejhoVZFBpZfNTjIGMp41oNNtNwkuWGpA4kKlRW20T+WtRGRMFv9w
         LNp64B1+9pfj8kb5byeGb4ZM7X89GnhYuScqNNbnW6LnVMUI9aeUU9ZyVvBF0XpEg0m5
         eHsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/lzYEdXI9AckkMjAG3hQPJzybUfhu6CogQRyNbKsASM=;
        b=M8L9VQUobA+3QMd9EJIzeZn3CqbJ5nRrgBwOEM4OcUHr+Bc1TtHsHFXG+MY/5BcfIq
         9M8147DkN9nDFyAe5QDGj38bSRTZ+lcL4LiIDm8hdF0110LakH9KMGy1tHCdYpCN9tyw
         J04g58fWR9C2s/nJRj+D8HGUvI1XgpIwQwYKczvAxL9k7bH3NuSMF+esavQ2ZGgfGP6Q
         /63S4rtkenrXRz6z5DKxhRf1pfcuolR8U6T36TiCe8Mh9bcTCrNh6J7rFjkNwQvsuPNU
         VkpbqWYQwMZwEAHRWHQWIzpcfwGI6nOnL9tBoHEEGiSEZn9MqfZiDQGkL1GNAzTlmMGg
         Jv/g==
X-Gm-Message-State: AOAM532Z+IFL8we3DpYzWolp5rJ/XAb4u0xr6dOquTKnbMHnwAdER/pf
	cNq8wAcwZB8aNw1pNWive9h9SzN1cUI=
X-Google-Smtp-Source: 
 ABdhPJzK54XvpqM9kDy7PeT1yezz79Iq2QRvRb75FUuhoI33n718oWq6HvgHptADP8YRuUA6xV0q1g==
X-Received: by 2002:a65:5843:0:b0:347:6fca:d6de with SMTP id
 s3-20020a655843000000b003476fcad6demr23074181pgr.168.1646166848204;
        Tue, 01 Mar 2022 12:34:08 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:b4e2:b3d2:f012:52ea])
        by smtp.gmail.com with ESMTPSA id
 o6-20020a17090ad20600b001b8d01566ccsm2896968pju.8.2022.03.01.12.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 12:34:07 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH 6/9] python3-rsa: inherit poetry_core
Date: Tue,  1 Mar 2022 12:33:51 -0800
Message-Id: <20220301203354.3839755-6-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301203354.3839755-1-tim.orling@konsulko.com>
References: <20220301203354.3839755-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 20:34:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95653

Use PEP-517 build-backend instead of setuptools3.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-rsa_4.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-rsa_4.8.bb b/meta-python/recipes-devtools/python/python3-rsa_4.8.bb
index d0a18f92e5..7e572a933d 100644
--- a/meta-python/recipes-devtools/python/python3-rsa_4.8.bb
+++ b/meta-python/recipes-devtools/python/python3-rsa_4.8.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c403f6882d4f97a9cd927df987d55634"
 
 SRC_URI[sha256sum] = "5c6bd9dc7a543b7fe4304a631f8a8a3b674e2bbfc49c2ae96200cdbe55df6b17"
 
-inherit pypi setuptools3 update-alternatives
+inherit pypi poetry_core update-alternatives
 
 ALTERNATIVE:${PN} = "\
     pyrsa-decrypt \
-- 
2.30.2


