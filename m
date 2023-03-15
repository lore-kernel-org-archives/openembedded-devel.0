Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12781C76195
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 08:04:39 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.2629.1678867476988403263
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 01:04:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bFJmI7BJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id r11so20411512edd.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 01:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678867475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0rEw5cZmVlSaxD3aJx6Uan9IiizrEjlkUl1qATlVjU=;
        b=bFJmI7BJuxOt8W3tqylfyKQBb+eADES6IsvS4gOcF2847odQYtATRDPcxAP6KiiiT5
         SpKkY97QI8YVbnEz7BNthrE2PyQUQb4l027H/Bsw9R1DGIM76SchCC20uzL6sXuO/f95
         EuYL9i9pCmUWusnTbKn8fx/xUcoV8XAW/eTmzW8VB/OgmJp2qpgqjtf/9JqO1p8GQRq8
         YvxJXr54hrpq6sdDyhZR8mBvi01N0OHOBsnYn1hdIjK7AoQaNe+CAUcCJkJsmIipm53U
         JvxORTnf2qwQWjOcWYSVq7E1An1nvgY5gx7axh7Yn2nlJW4Zz9YRqZEM8icu1up5Z7jW
         Nc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678867475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0rEw5cZmVlSaxD3aJx6Uan9IiizrEjlkUl1qATlVjU=;
        b=Q9tEm0HtiS3zZwk/9rwKFWbQs1wqaUn0apgm401Wo17619f9yxfU0FoQZB40vvgRsh
         qnIuYmFH96X2WL6YtlwXMo+pz0IyMolP98cbQbjY+0YUA3IHyLReNicFruIe5OOf5+4d
         Tt67nvebPnDcxWYt9F0kvXNmABf9SIHkxOUZDPmyC6Y+J61fJgTXyCiLLDo8K+W+ckYK
         18v2G2gjJ0bgpUQIQPJ8zG91VQAGmsoeDZXexUdTIKbPct5EpAh7ocoGBelzTzkKICFg
         k6Wib4xOtEzwoxdbDGUpLflSYVA0ecsysuEt0ZwtOlDPTm1ZaelpUkbaxkdn0ZicvX1t
         T5AQ==
X-Gm-Message-State: AO0yUKVVSAjmXNCaI1L6THinehsxRmqxG+jUZ8ryzXjks8eAASm/dRMq
	Q1kRBT3hRPG+mzLfaZKVvgbCXODaJSI=
X-Google-Smtp-Source: AK7set8ratv8KQu9STqPwQ4e9Yy5FRqeV7K1NFTSTb+x5NOIuQe7Rd44g92B06mODkIgigTOWEujUA==
X-Received: by 2002:a17:907:75e9:b0:929:7c30:19b4 with SMTP id jz9-20020a17090775e900b009297c3019b4mr4960005ejc.61.1678867475215;
        Wed, 15 Mar 2023 01:04:35 -0700 (PDT)
Received: from localhost.lan (BC2440CC.dsl.pool.telekom.hu. [188.36.64.204])
        by smtp.gmail.com with ESMTPSA id g11-20020a170906348b00b0092b4602f506sm2136382ejb.73.2023.03.15.01.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 01:04:34 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-python][PATCH 3/4] python3-pyproject-metadata: New recipe
Date: Wed, 15 Mar 2023 09:04:28 +0100
Message-Id: <20230315080429.2722555-3-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315080429.2722555-1-zboszor@gmail.com>
References: <20230315080429.2722555-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 08:04:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101531

Dependency of python3-meson-python.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../python/python3-pyproject-metadata_0.7.1.bb         | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb b/meta-python/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb
new file mode 100644
index 000000000..32938421d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb
@@ -0,0 +1,10 @@
+SUMMARY = "PEP 621 metadata parsing"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=310439af287b0fb4780b2ad6907c256c"
+
+PYPI_PACKAGE = "pyproject-metadata"
+
+inherit pypi python_setuptools_build_meta
+SRC_URI[sha256sum] = "0a94f18b108b9b21f3a26a3d541f056c34edcb17dc872a144a15618fed7aef67"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


