Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C67B5D767D3
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 13:41:37 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.12749.1730382089492716717
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Oct 2024 06:41:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YXpvuoCz;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9a0ef5179dso138601066b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 06:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730382088; x=1730986888; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNEj4i9VsSQXfk/4FIo6mjT/AUko6+39hPGGs3guR1o=;
        b=YXpvuoCzbiLmx2VdgzlaO1sMZtRUpDG8KcKBHBZZZWFqwblV1qfKzi3CkaL6jtbakI
         gVySWlG63feUd24FfPO/SyFsJAIjM5cXlr2HNm3oxrT1kLzqHUPA4acAC/yuXJ98PlTa
         DSU7/6gW0au6SMhM2h9nxUDZSwTIQD5tdnivFbcQoetGpbVjWIuS4cbYZPn9c+LLwJu0
         Gil/V5JqQqUHQCgLKL0192jwA6JhFzsc4bvu9TaI9IgIDYiaFrsvcmSO18Nn694hHjR3
         1MCHl2tVUAbRGsrDqgeBbNPf13WU9yZt+BVmyBvsuehZR71GJ2pabq898PvAu2TKh4GH
         k42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730382088; x=1730986888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iNEj4i9VsSQXfk/4FIo6mjT/AUko6+39hPGGs3guR1o=;
        b=ikG1rwQIR+eyiiMvOWtjer0ESHAmUsSIsmVlKkojEnHssTuTM44kgXFqBol3XjRsgQ
         f5SFGK0hFeKdAHTNHtRxKaFNR/1kXVsJnQ0qLJxGVZgUcPsiH76gkRYL205UWEbPw/p3
         dScjpyDrOwrLDCHZH9ju7Xsvrwi0T9tXyY5NOUZ7ror/m2wI7/KhKpTkhE504TJllikt
         awhXqaO3/2DYpZ7Q9fxbwuPlKEF1eyVo2GUK7GvCguJw4aLnP89p9qbQjIxLPgeJFcHl
         IjOVmPEXH7BAysXr70Pk3K6rre94uE8SskiTWd9eII9Of4rC0w7gSCBdrfXN4/O1J6Ej
         C1Yg==
X-Gm-Message-State: AOJu0YzEhwpdmKXzOp1etdr4LtnOiFJw6GuJKV98+6QciXOmVwGmwblA
	jgDcy5yz0w/UIp1vluAox6Y148okYPIRh49pAHwMb2KpmVGqUIoLn/VEQA==
X-Google-Smtp-Source: AGHT+IFr7a4nIT86q6oPWV6BdqvIvgNVqi1JDph9uSJfZdBWgUgJ+5k7/Ojexu+hum7yOy0ZSF9yNg==
X-Received: by 2002:a17:907:9719:b0:a9a:67a9:dc45 with SMTP id a640c23a62f3a-a9de5d6eb93mr1910255366b.3.1730382087639;
        Thu, 31 Oct 2024 06:41:27 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e564c5369sm70146466b.48.2024.10.31.06.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 06:41:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [master-next][meta-oe][PATCH 04/11] python3-m2crypto: drop unnecessary FILESEXTRAPATHS
Date: Thu, 31 Oct 2024 14:41:07 +0100
Message-ID: <20241031134114.2791747-4-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031134114.2791747-1-martin.jansa@gmail.com>
References: <20241031134114.2791747-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 13:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113361

* python-m2crypto directory doesn't exist since:
  commit b8bbcd4dea422be57123d75fbf77db6d33542b06
  Author: Khem Raj <raj.khem@gmail.com>
  Date:   Sat May 1 12:04:27 2021 -0700

    python3-m2crypto: Upgrade to 0.37.1

    Unifiy .inc into .bb
    Add patches to fix issues with openssl 1.1.x
    Remove m2crypto-0.26.4-gcc_macros patch, its no longer needed
    Refresh existing patches

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-python/recipes-devtools/python/python3-m2crypto_0.42.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.42.0.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.42.0.bb
index d5ffdbc40c..6b178cd127 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.42.0.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.42.0.bb
@@ -4,8 +4,6 @@ HOMEPAGE = "https://gitlab.com/m2crypto/m2crypto"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=b0e1f0b7d0ce8a62c18b1287b991800e"
 
-FILESEXTRAPATHS:prepend := "${THISDIR}/python-m2crypto:"
-
 SRC_URI[sha256sum] = "42b62df2caf623161b1d643a7235464c2fe2a3105049ebc498a6d47dc08f64b4"
 
 inherit pypi siteinfo python_setuptools_build_meta
-- 
2.47.0


