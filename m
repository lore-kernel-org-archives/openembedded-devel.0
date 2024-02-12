Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86163C4829D
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 20:59:21 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.18021.1707771558212626093
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Feb 2024 12:59:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SAyMCPXm;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a3ce9a35a6cso41867666b.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Feb 2024 12:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707771556; x=1708376356; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZzmZPPY9L9fG5hDV2hM7Rhf0YmFnXdzteeWyUPExqjI=;
        b=SAyMCPXmoQgCm/j537oOuVHJnzeEwBaQA/zUzBUt1F9n5qULqEkm12eotJUrQv6EDN
         uDwhDrIRiSF2UHUva5eiUi1z6DHBikyaiWZf7M68HOHUaSv9zlC9kVXNXYTu4gNcafbY
         IU7O0AvbxIis1tHUfYee1ufaOjBRCm/byc4j5UPnfQ2kR7g6RwUcYTc2xZpP2D1jVQ7M
         pKKJV3sSExE3bxQo7vkeGP9ZlqLa1SSo0WrCl0UO8TVAQsMODW6UH5MRz/HlRUqdj5Kl
         rTl0vQR+e3w6seTo8DYTbrU/MqU9NM6FAkurrbrpk8zu/PWgjU3bJm9B9F/7c5y+tAm4
         Etlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707771556; x=1708376356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZzmZPPY9L9fG5hDV2hM7Rhf0YmFnXdzteeWyUPExqjI=;
        b=PvbPEgddnKFvVJg722BUtovvs9+OWSOwcSjGEGkH8dzefti+eCFWynWTmcS/piVo1g
         j8UbNPSsaILhOtecWACeMpPv/p5U4VFcUB4ST0x3IgUqr46+IBZIOR5PLGD/NBYNaqu8
         GfsieRKTrLyDYqAeyBx5D9n0rP49Eov5stUPnqxTKiOdTnpPpB8OKVohZ5Xy/pwur5ah
         nfkVmKdVY/ffGVyLw0WeqPPCqlk3aDmJf4kgN5g1kup7jqQ7IZjeoG/FFOyI1njVHKZY
         9SnK5gYmZ4ZnsHINejmPbbqpIBsumnOZdPnjfkWb+cAa8z3F+3GP+uqUXTJ5szk2JoYs
         ZOwQ==
X-Gm-Message-State: AOJu0YxjaoSdW7si0EbA0fEuabK8EyVIp5Q82TFII78B2yxz8XaXJe5G
	RHHrifMBCtgtJYitILlTGcHb7sJghQFl102+k7ojTx3okLfZQ1PRvqI7q3NRNcc=
X-Google-Smtp-Source: AGHT+IE8GenmmHIeAQrUFy5ICT18vJfbOwo7HBasLK9CPSzrJycph6bBEyUELa3ykALfDn7ssiR9GQ==
X-Received: by 2002:a17:906:3c5a:b0:a3c:f8df:970c with SMTP id i26-20020a1709063c5a00b00a3cf8df970cmr43417ejg.0.1707771555799;
        Mon, 12 Feb 2024 12:59:15 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id y7-20020a170906558700b00a3bbf725080sm569592ejp.55.2024.02.12.12.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 12:59:15 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-werkzeug: add missing runtime dependencies
Date: Mon, 12 Feb 2024 23:59:02 +0300
Message-Id: <20240212205902.433511-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Feb 2024 20:59:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108716

ModuleNotFoundError: No module named 'json'
ModuleNotFoundError: No module named 'logging'
ModuleNotFoundError: No module named 'dataclasses'
ModuleNotFoundError: No module named 'zipfile'

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-werkzeug_3.0.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_3.0.1.bb b/meta-python/recipes-devtools/python/python3-werkzeug_3.0.1.bb
index 6e500dde8..0c3308d65 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_3.0.1.bb
@@ -16,4 +16,8 @@ inherit pypi python_flit_core
 
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-markupsafe \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-profile \
+    ${PYTHON_PN}-compression \
+    ${PYTHON_PN}-json \
 "
-- 
2.25.1


