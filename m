Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48790C83029
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 16:57:51 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.41105.1751291706335853472
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Jun 2025 06:55:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gNJcuSlk;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: yishai1999@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450cfb79177so25859565e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Jun 2025 06:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751291704; x=1751896504; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3WSKn+zqxjyuJxeiGwFlKR0w8dseildRAev24T1UFQ=;
        b=gNJcuSlksh1rbbWOPlGvV7rrYdg3xBrbmIwmopXpARBNR+AMf7Yy+LEQikehb7lHoy
         x59yo04fS6AAMlPzNnNUxa1ocKbtBNSmU5kB0re96q+zbA/mEVnmrRvuUfFgqUH9YIRs
         x8lGPJk1+9YCbFHezFRnQBvkYCUhovy62l6HT0BXaDSHJUIxBEq5DVvJFK3H3c9yAouO
         uqrgkUXnEOf2AoV2qn1MQs2DnsryqZY6zShLqx7cgE+HHdlupLQlDAKHrING0gzGxqrm
         /PdqkhNPQGwyDQ1ZjvzdMuAOlyPq3fUxBwQVQ+8yTTCr4LpPxmRdl6ohjmn1GwFDKJbb
         XUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751291704; x=1751896504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3WSKn+zqxjyuJxeiGwFlKR0w8dseildRAev24T1UFQ=;
        b=JrvVnsBAJ8ym0CDPy2PQHcb2dtp07pWMLfFDN5sbhZ4cMK3GTnQA8/gdJNJQhs9hvn
         ce7Xubq570/PU/niLfaQ/zvZLWlFbicnZ3nE/1A3QREM8ZMU7RJj6BnTTJ097WG8UnNe
         xX66hFUulFZgSqO2WUyiwqNVsi9bV64NSlcbyVX5JbGJpRG1ZUk5oxEGCpum5WJyQBaP
         kx7ron0ceYbDUOxPxz51M15+qP8WfyGm9NQ5cV4WIcBR6oczjCOMrFcRYU5SIAONYAID
         8Fc7KGYUc/BXK9VEXDTz238X4I1zvpJxha72zQwWaSjThEnwK7xGi4cW1MqYrX+gTLui
         JhwA==
X-Gm-Message-State: AOJu0YyjjNkYfguk/DvDkZ2yBoUeRLnIPFXTZPBFoCL0e14a+yk77Xq1
	sfNbGLdhrffuGdB7tDcIGiaSBGFXbHJ448SiNve7rkA4bWAxPDnDqEILU9Xdpw==
X-Gm-Gg: ASbGncs89+Fmn7zeDY/wZqxWaoEKorsf0KT+t8AfpNyHV01Oup1E5VKbsEc9KehcQlg
	sEgrAGi171RpyNaaXrXRfksOCTEM0gUcTc8fInreKPruIp97Uj2ov3firQ000xIhRtf7FVual9u
	6zaEUY8+xbFqA0FxlMQZxQVLhvhKLq1jWWWoGIZ705Kl9N/Qc1ESabolYyrwv3kzqyywZ0n8WMJ
	VLIxbSpvtZl6N9jRFreSEu6rLXmHQ5tbzzL73vM72Ockat6pQHWWXqrhG+r5sKGtHteTwX65WSe
	lWsPw6q6I9l8ufDjVCnrNTpOOt57ankoiXXxd2GS9qwYnNXiiHrj4ySGnQfiQvK4hpGa4A==
X-Google-Smtp-Source: AGHT+IGrRp1g5QKgy/D8eh0KSVDrBOGD3kkr8uSxsFwfRQ14/omHvyoehE1f9RBnzPYBjTN92/cWUQ==
X-Received: by 2002:a05:600c:458b:b0:450:b9c0:c7d2 with SMTP id 5b1f17b1804b1-45391b6b96dmr106494885e9.11.1751291704196;
        Mon, 30 Jun 2025 06:55:04 -0700 (PDT)
Received: from bigboy.CASA.NET ([199.203.94.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3a5599sm139020195e9.13.2025.06.30.06.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 06:55:03 -0700 (PDT)
From: Yishai Jaffe <yishai1999@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yishai Jaffe <yishai1999@gmail.com>
Subject: [PATCH 2/3] json-schema-validator: support native build
Date: Mon, 30 Jun 2025 16:54:08 +0300
Message-Id: <20250630135409.2425189-3-yishai1999@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250630135409.2425189-1-yishai1999@gmail.com>
References: <20250630135409.2425189-1-yishai1999@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Jun 2025 16:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118179

Add support for native build of json-schema-validator

Signed-off-by: Yishai Jaffe <yishai1999@gmail.com>
---
 .../json-schema-validator/json-schema-validator_2.2.0.bb        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.2.0.bb b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.2.0.bb
index 241fd328d..c6e910a13 100644
--- a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.2.0.bb
+++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.2.0.bb
@@ -16,3 +16,5 @@ DEPENDS += "nlohmann-json"
 
 inherit cmake
 EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON -DJSON_VALIDATOR_BUILD_TESTS=OFF -DJSON_VALIDATOR_BUILD_EXAMPLES=OFF"
+
+BBCLASSEXTEND = "native nativesdk"

