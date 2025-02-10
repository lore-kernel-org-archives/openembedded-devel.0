Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B080C0219D
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 10:10:39 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.47261.1739182229884777701
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 02:10:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=mjLnrKTV;
 spf=pass (domain: konsulko.com, ip: 209.85.218.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ab7917fc0c2so483453566b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 02:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1739182228; x=1739787028; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fO5D0xyw4HHckfNToCog9rNWoAAOJaCoqDHUUtI9I9w=;
        b=mjLnrKTVT+PS7j4wGEGsDYhM5jhhD87ehY/+dGe37QrWk+ryBUHTl7cbgfrlWM6mb8
         dR8kMo7u5pHqdm/OZGL61tHRI8lz4+bPTn5/8MTM6UDzQOSBjAWuzjE2ljpc37jGVXgT
         mJrMbAj+mE9EVdvw0KryGBHaBO9HGQbFvTFAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739182228; x=1739787028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fO5D0xyw4HHckfNToCog9rNWoAAOJaCoqDHUUtI9I9w=;
        b=g/xeGVxrVD/4KQMLF/rZDQrIchnENbcgtM4HniEy4OYxKIlrjCuDtEXQC0jOqi5GC4
         M1bMgEtNqKi+jEqmLbVgU9XFnyUysLMQilLq6pTNgEf2408hfXBuF82yJT6yoHZGgL4i
         2mQc1OjlXwXgXgp0fmXFzVMzFEzMx1pttu3p5BtrMeKvqJm85zKz4dgeg/VYaMnBRZce
         kD7BoSW3/o4lybVGsqFdr2dkOO2FWrXgDec9fzQzPkXQ9RPsL1EgfIlG9YmGvqOF97aW
         y8nOiq9d1IDuJsgVJ/Ycp1rEfaJPJazA5T1vPn5HyUm4Sppy9SzG9CSWX3xloolTadAl
         ykrQ==
X-Gm-Message-State: AOJu0Yzg0PflX0WXxfGS/HfwWvNZcJIGH3gaJi+IpyaQMxi76g4JYKTH
	/qPEkGOYBtLastCNx/XmIWWkoDXY1mNMhOWEXoa63/FblrHxZ6pTqCpse7c0e24U/E8+kLoLKk8
	I
X-Gm-Gg: ASbGnctcbGYuZ3PVT3ytg8GN6xTdfwO7o11T/GmmyKWFZscgNB9JO45K67zpcC7eDUT
	0Iu6bHDtHhUwDkCAcS4melWCAHAahjBCOMExI/d21xeOXbNBJ48eVTxeFoB1bXYrThJoAd6uWqL
	s5z/EsNY7tlygQlKgXgtu8WxeqPtStUsPNUHq4FGSoyZPwMUY4nLCQN0xNfbRC4PSmD14XWXDYo
	A+b2303EzRqzUOocgeZbYVZy8pJqYcaIbQHzUvoDyhWLrIuw6nMZZ7O/O/0UkDj3mf9r1de+kBJ
	+hlCwidnkdvFpx5Nx2gF/Wka+HHx8Q==
X-Google-Smtp-Source: AGHT+IHOHteN7etsV/dAXR3V05jLz7nWciXq7pBTB40reABd4DaFqne+3aQSGCUL2Vp+byf90X7DsQ==
X-Received: by 2002:a17:907:9719:b0:aae:8841:2bba with SMTP id a640c23a62f3a-ab789b84353mr1321814566b.22.1739182228093;
        Mon, 10 Feb 2025 02:10:28 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7bb9cc86fsm242747066b.140.2025.02.10.02.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 02:10:27 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-cmd2: Upgrade 2.5.9 -> 2.5.11
Date: Mon, 10 Feb 2025 12:10:22 +0200
Message-Id: <20250210101023.1204349-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250210101023.1204349-1-leon.anavi@konsulko.com>
References: <20250210101023.1204349-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 10:10:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115397

Upgrade to release 2.5.11:

- Fixed duplicated parameter tables in API documentation

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cmd2_2.5.9.bb => python3-cmd2_2.5.11.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_2.5.9.bb => python3-cmd2_2.5.11.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_2.5.9.bb b/meta-python/recipes-devtools/python/python3-cmd2_2.5.11.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-cmd2_2.5.9.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_2.5.11.bb
index b49bce53e5..45644b4e8f 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_2.5.9.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_2.5.11.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d2b71040983a2abc614fc4d0284771"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "09bb13637832bc818aad5577ccdf5dbeb0c9fbe5b9412ff78d5084f7846f83ab"
+SRC_URI[sha256sum] = "30a0d385021fbe4a4116672845e5695bbe56eb682f9096066776394f954a7429"
 
 inherit pypi python_setuptools_build_meta python3native
 
-- 
2.39.5


