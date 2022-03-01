Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10591C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 20:34:03 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web08.2366.1646166842012601302
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 12:34:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RAA9kvSU;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id e2so2018964pls.10
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 12:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5glgCRzoLDja0XkJAkW48LPI9PGL9Qheny7Znb60MnE=;
        b=RAA9kvSUo7qegJ6hyIzQUVoTVPHS0Wc8yX0hg0kwNWA17xZa/BsUE1RTaRvctpWneZ
         FbEG4t+abU3h5iNiREBRgnD5/nPvksAdUvxWEG4PZh/yKPtEEHPyQ7FUlHXL6NMM8+GJ
         Vf3bQxzxdZIfKJ9E9p+gGsqMoeMnUaKC0IPcj/6g8IFEyrGftMC6ZHyItHbceGiFlHJE
         JWC2i7EcpytLMVEkwB5O1GF0X7G3ViJdlnNAFptQrNBZvTSzyB10jkdHqEVwZr4y4Plx
         YEmsosJfodYU86NggBsuuOQUW6+uAVHxv2oSVIY7eP6VLDogjonziYD3JecChOjTnCxD
         Gx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5glgCRzoLDja0XkJAkW48LPI9PGL9Qheny7Znb60MnE=;
        b=SqqcXZQ3d9j6WZAdzqkma3kbg7VJWTz+7R7qR42KrY7gmix5susSuGRw2nk7/wUwnG
         cg47sQuUN9Oh3MsRBXpM7VUSGJyxu0SBCDx9CZbIrMVdQc+X2JGxCHJJJYzGbnnjJCGV
         /iXwEWfPZ6xotFcUhpoZY7XjQGPhuFptvZ+/TdYCu5FoLt+OYRdSJ9Hy/P4xorvwge3n
         0T8QOg1N9VXNb+DGAi5+WKd9xNMQpfyCoE4yMtRcRwjhCfDVKABiEr7KcpDWBak+Pjjc
         SM7WIwUAR4EzoiZJ997x4ia1JASPT0S8soW3nTD0JDfS8LGqft9bQhWhRsNFMq6iDd5K
         Wl9g==
X-Gm-Message-State: AOAM533bV3EFpWtUefn5XAriBNrVK/vVa+bSwIN0jGb+lUNNH8p7EYXW
	iPHvwtl98x7ff78+BXaD21Ll3rA3Iq8=
X-Google-Smtp-Source: 
 ABdhPJwpJtF5qNV8UMqz7OpJBq5l8nrhtKk/6+txfypuIjfNlUbwbtOd52OIPrZFMEakazatFavBnw==
X-Received: by 2002:a17:90a:a606:b0:1be:d836:6e3e with SMTP id
 c6-20020a17090aa60600b001bed8366e3emr5562238pjq.84.1646166841049;
        Tue, 01 Mar 2022 12:34:01 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:b4e2:b3d2:f012:52ea])
        by smtp.gmail.com with ESMTPSA id
 o6-20020a17090ad20600b001b8d01566ccsm2896968pju.8.2022.03.01.12.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 12:34:00 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH 2/9] poetry_core: add helper class
Date: Tue,  1 Mar 2022 12:33:47 -0800
Message-Id: <20220301203354.3839755-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301203354.3839755-1-tim.orling@konsulko.com>
References: <20220301203354.3839755-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 20:34:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95649

poetry.core.masonry.api is one of the common PEP-517 build backends.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-python/classes/poetry_core.bbclass | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/classes/poetry_core.bbclass

diff --git a/meta-python/classes/poetry_core.bbclass b/meta-python/classes/poetry_core.bbclass
new file mode 100644
index 0000000000..4b3f9631e2
--- /dev/null
+++ b/meta-python/classes/poetry_core.bbclass
@@ -0,0 +1,15 @@
+inherit pip_install_wheel python3native python3-dir setuptools3-base
+
+DEPENDS += "python3 python3-poetry-core-native python3-pip-native"
+
+do_configure () {
+    mkdir -p ${S}/dist
+    cat > ${S}/build-it.py << EOF
+from poetry.core.masonry import api
+api.build_wheel('${S}/dist')
+EOF
+}
+
+do_compile () {
+    ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} ${S}/build-it.py
+}
-- 
2.30.2


