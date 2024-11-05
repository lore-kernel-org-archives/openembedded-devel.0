Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC5FDD40CFD
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:09 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.30392.1730838942245265800
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:35:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S2Bi3Jw5;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e38ebcc0abso67503237b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730838941; x=1731443741; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/ya2LC/ossj7+V6I+x2r6mIaCKqqJ0aTxRz1wAOVBY=;
        b=S2Bi3Jw5iXAGQMFMC8PLfz4wPuGG8/OuK+j6iQaTcqAqc2qkma3ZXbMuNdO9TLrYZ4
         2nlZdkTve+OkhGN8K/ZDMdbL50XGp+EP0UmCHdIAWHNBVI2hK2+EQqHOiuX3YEMuywJd
         Ad+6/nBI/yXRlSejs9jZ4Javcm0i78mLlPq8+BUExtIYIYwiPCI9PlLKGyn7TQ72XtyW
         djdpVTVy6tIQyZRnCCVQbH/HcWh1lJdKh8xIWwOnffvUG5uZGhZOyotj1Lw3lXHfh6Z3
         C3RUdYxFPTllP78OgA+w7QSAmGKHcnUsn8Yb/ZDElUSapD59ogAdAWEdKAdJFiZ8IwXo
         8TYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730838941; x=1731443741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/ya2LC/ossj7+V6I+x2r6mIaCKqqJ0aTxRz1wAOVBY=;
        b=VvaCAoj6nqh9tbDF2LR74JxzX5F8GaI77McFd/X0hEDEaPRUj82ulAYQUm4lNPrA6M
         N/i976IQ1VXYCR0CSoFiIjEtQDh9lq5qDIuzvDQAGMHxcRkJFThXVuJuOwuI7FlBx2sR
         hM3VJa2FmLCVLNTVqq0xrBXb+8iJkafXfX6B9fP71WZLVQ2VZPnMgg0GRmzXvtbEYezJ
         YCrJGqnnx6tr3Niz4Ail2uEsK+ZHk5cB0w5pvIHegcNcyLZc25qukSv0t6gQ0ig2MHbz
         DZQRUyR1aAw8vJCqC1sSQoeAUyBx4P65+SkTjO2BuAi5y5v2d54zE2N4MhfikNq55L+k
         kU0g==
X-Gm-Message-State: AOJu0YyXXeL0ioJWxejNw7c+/1VtO9n8TapCFv1OeBCqHMXEPa0vg5PP
	SZ+S0E5qx1LisZJ2vis3oF7Bpn9foj/b7Qg/x6IEKAyQfONlKgudq237AJPY
X-Google-Smtp-Source: AGHT+IG2y5bDmPYwxwnLsVNoCdkzChT+orNK/dOtfy/NQGscB+yXXb4yYMT4iwj6ba5mSFZtj7dbZg==
X-Received: by 2002:a05:690c:c94:b0:6e3:2cfb:9a86 with SMTP id 00721157ae682-6e9d89970dfmr408342957b3.26.1730838940861;
        Tue, 05 Nov 2024 12:35:40 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9d34sm24295827b3.15.2024.11.05.12.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:35:40 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 128/161] lcov: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:27:53 -0500
Message-ID: <20241105202827.3104-128-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105202827.3104-108-schonm@gmail.com>
References: <20241105202827.3104-108-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113645

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/lcov/lcov_1.16.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/lcov/lcov_1.16.bb b/meta-oe/recipes-support/lcov/lcov_1.16.bb
index 4f35eff90..11440ce49 100755
--- a/meta-oe/recipes-support/lcov/lcov_1.16.bb
+++ b/meta-oe/recipes-support/lcov/lcov_1.16.bb
@@ -47,7 +47,6 @@ RDEPENDS:${PN}:append:class-target = " \
     gcov-symlinks \
 "
 SRC_URI = "https://github.com/linux-test-project/lcov/releases/download/v${PV}/lcov-${PV}.tar.gz"
-SRC_URI[md5sum] = "bfee0cef50d7b7bd1df03bfadf68dcef"
 SRC_URI[sha256sum] = "987031ad5528c8a746d4b52b380bc1bffe412de1f2b9c2ba5224995668e3240b"
 
 UPSTREAM_CHECK_URI = "https://github.com/linux-test-project/lcov/releases"
-- 
2.43.0


