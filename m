Return-Path: <sam.van.den.berge@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF2C6EE642E
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 07:07:40 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.15413.1694761655117092836
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Sep 2023 00:07:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P3YVV8Vz;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: sam.van.den.berge@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9adb9fa7200so324625866b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Sep 2023 00:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694761653; x=1695366453; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ECC8P/3runjX01+83tDVyPH6fo7Q6coatKjLJKRauKs=;
        b=P3YVV8Vz/KFr3I2dQalIdARqIffi4U/HV8Wwn9Hmm8ZZDW/XEAMQvrPms22XcDiLTr
         awizjrEB0DsXoTC/YasPdEELXFi4icfXcKN44UMHXwGE9KxrV6TCD3kXrv2+qJIYzP4V
         XLxm3JfMWBTdGkZZnFzH5RhcPKCLNNX2hWXxxDu5nfQ//V1b/waP5hZVfls34XVHonq+
         k9I17MnM78YixoP/sgz0o+vmAs7qQaK60pTw4Sy2BeyIYm8AsvLSZq7gWTphinsRAr25
         /VNvV23HKXd+PKLpiUaijrRtxZZ0gnjQ4e9XAJwX9zqj9RamuOTLKVlbxCNugxKhQqKJ
         mCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694761653; x=1695366453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ECC8P/3runjX01+83tDVyPH6fo7Q6coatKjLJKRauKs=;
        b=vJd2PdJrKB7yQQMUNqNHhPXg/yeg2VIDpj0HbtcNEX9At0Ef0wB1blbal89Y1YwRTw
         lNiFLLDmYDTSOk4VaGpRGIbq+jrjOmZorYsjg6eaMSAx7aekphky6ryTt6oHvkIllD8j
         Wkx0uIPVzEh5uItVTTg823R7PvUNABpMBOaWtsk1etQqM0vR5X2p5080UFIGD82wUuVp
         QH/5DtLzkBZy7rri26Jx0iRyFnWQyJsFUzW4LONRVTyVjXU+AFKK3HCWa7W6psCeqoqM
         k62okQEzSdSDvikKj0NKFvJHlTZhpt2lkDb5cKKK6ytKaJmny6gjMiqlYcekezO9ii5m
         2Tqg==
X-Gm-Message-State: AOJu0YxSlk2B0ymAwd5DTQEd3UoPdUj9EKUUsODAsKDf+nZSyIdVWSVX
	/wc41T5y8DQneO6oyTXhMYFrrhSKvQ==
X-Google-Smtp-Source: AGHT+IFvGmHgF5fOeP3XEShqWxmYIMd8CLk8/hLxweQZLoOp3n3f3gGGnEGwGdaNb9ZfvbVbjb0bJw==
X-Received: by 2002:a17:907:7618:b0:9a9:e858:e731 with SMTP id jx24-20020a170907761800b009a9e858e731mr1049256ejc.24.1694761653389;
        Fri, 15 Sep 2023 00:07:33 -0700 (PDT)
Received: from OP01518NB.WTSOUT.OIP.LOCAL (mail.oip.be. [81.246.50.154])
        by smtp.gmail.com with ESMTPSA id lc3-20020a170906dfe300b00982a352f078sm1969889ejc.124.2023.09.15.00.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 00:07:32 -0700 (PDT)
From: sam.van.den.berge@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Sam Van Den Berge <sam.van.den.berge@gmail.com>
Subject: [meta-python][PATCH 5/6] python3-apispec: add recipe
Date: Fri, 15 Sep 2023 09:07:26 +0200
Message-Id: <20230915070727.4026-5-sam.van.den.berge@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915070727.4026-1-sam.van.den.berge@gmail.com>
References: <20230915070727.4026-1-sam.van.den.berge@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Sep 2023 07:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104889

From: Sam Van Den Berge <sam.van.den.berge@gmail.com>

Signed-off-by: Sam Van Den Berge <sam.van.den.berge@gmail.com>
---
 .../recipes-devtools/python/python3-apispec_6.3.0.bb   | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-apispec_6.3.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-apispec_6.3.0.bb b/meta-python/recipes-devtools/python/python3-apispec_6.3.0.bb
new file mode 100644
index 000000000..fcdcd7a80
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-apispec_6.3.0.bb
@@ -0,0 +1,10 @@
+SUMMARY = "A pluggable API specification generator. Currently supports the OpenAPI Specification (f.k.a. the Swagger specification)."
+HOMEPAGE = "https://github.com/marshmallow-code/apispec"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=824d596e050c0d5e3361efb438425945"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "6cb08d92ce73ff0b3bf46cb2ea5c00d57289b0f279fb0256a3df468182ba5344"
+
+RDEPENDS:${PN} += "python3-packaging"
-- 
2.34.1


