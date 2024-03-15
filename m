Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C6EC54E67
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:17:08 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.1883.1710523018971545763
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OYUGuqzX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-413f76ff0daso12088245e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 10:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1710523017; x=1711127817; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t7Lge1QJe0wadzOalIRALWwIWFj5qYnoYXzG25Ci5Gw=;
        b=OYUGuqzXnQ2QsWYzilaKqLkNZ5/V67aMCYLfmgdXi4OUSrn6RwzYiXVItfPRw+fZGr
         g4URGEqKpAzSSzi4ZoSpG3Q1AotrW6ky9ALQ45qlavfwOwAjcKq/IYQLlN1A3yS/xZ9R
         1bFyGsyQdc5SCFbvy+LoLDlrHv0+dIsA2wmUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710523017; x=1711127817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t7Lge1QJe0wadzOalIRALWwIWFj5qYnoYXzG25Ci5Gw=;
        b=gtY5eY7IN1Su6Jys5/g6U3rHe4qK53i6jIcCGPbu+Nm3lBDVyAG+8X4cCai7iE5viN
         KeUVUiOtV7ZyCguQOUlxAPkyMagb2DhJHh5M4b0cGYFqC2prrVME6aFbV0/EXWbABAtj
         KrKl5rYYMz/lor0w83vwGQLwlTGzu+pcvJbXCPcst3neURDk1ewDHVAR65ll5/V9cfhn
         jOwJ+TlahNLinfoYSwjx3yPliB/NuJh0QTS0d3EVOsF5ndE5+ltE1yweWQlqWXvCeHfR
         ZImVRRYMnRKwcoWq3JNCQpYx5e7wUpzIm0X1ySYiXtsbPe1DL4ygJwcrR4gjqbXRSzMB
         WkQA==
X-Gm-Message-State: AOJu0Yzc8/G0e/XF8qD+T7T47uFe29qeZ709IqSehtRg5Q8dy54PQbP5
	igEUGbVqx6LitKb0P858PpU+ekvyfjuo99BYlQu4BUdp5Ye4M585o1ZHD0ndja3d8LjTP9ZUTFn
	3
X-Google-Smtp-Source: AGHT+IHwWTv1XJ3CViFEDGtruvI67mlIhwNaxF0/DEahJXmEwPoR2ABsOzdilCsDk/qb8Dd++DcgWw==
X-Received: by 2002:a05:600c:1e0f:b0:413:f034:da6d with SMTP id ay15-20020a05600c1e0f00b00413f034da6dmr4374360wmb.33.1710523016910;
        Fri, 15 Mar 2024 10:16:56 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6f03:430d:44b8:f326])
        by smtp.gmail.com with ESMTPSA id f16-20020a05600c4e9000b00414038b4d64sm1731678wmq.27.2024.03.15.10.16.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 10:16:56 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded] [PATCH 2/2] buildtools-imagemagick: Add new recipe
Date: Fri, 15 Mar 2024 17:16:51 +0000
Message-Id: <20240315171651.3850535-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240315171651.3850535-1-richard.purdie@linuxfoundation.org>
References: <20240315171651.3850535-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 17:17:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109339

This is useful on the Yocto Project autobuilder to allow automated
screenshot testing/processing during QA.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-oe/recipes-core/meta/buildtools-imagemagick.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-oe/recipes-core/meta/buildtools-imagemagick.bb

diff --git a/meta-oe/recipes-core/meta/buildtools-imagemagick.bb b/meta-oe/recipes-core/meta/buildtools-imagemagick.bb
new file mode 100644
index 0000000000..d59f7a7a52
--- /dev/null
+++ b/meta-oe/recipes-core/meta/buildtools-imagemagick.bb
@@ -0,0 +1,10 @@
+require recipes-core/meta/buildtools-tarball.bb
+
+SUMMARY = "Standalone tarball of imagemagick binaries"
+LICENSE = "MIT"
+
+# Add nativesdk equivalent of build-essentials
+TOOLCHAIN_HOST_TASK = "nativesdk-imagemagick nativesdk-sdk-provides-dummy"
+TOOLCHAIN_OUTPUTNAME = "${SDK_ARCH}-buildtools-imagemagick-nativesdk-standalone-${DISTRO_VERSION}"
+
+SDK_TITLE = "Imagemagick tools"
-- 
2.40.1


