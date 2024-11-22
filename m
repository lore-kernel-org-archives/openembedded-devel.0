Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D527E65D1E
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 04:11:43 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.16891.1732248693862310844
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Nov 2024 20:11:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nhXCev3r;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6ee79e82361so25345687b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 20:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732248693; x=1732853493; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZRJYb32ImyBJveZbsG0n5VothU8jvpa7dE/eB8Ugng=;
        b=nhXCev3rOLAAMwOf38sRvzBqzDEI7DKnjSPGp4sXVCKmc+WWB39KROA3ZwdZ/pzWZ+
         WCQRUtMBon28MlBkJRVHdQRHazWQTWwLRJSsp46CXZRAX86CtqxhpU55r1KDTqKxE1Ws
         jVwqDpBh9EQoEQyreU7DtoHIGEUEMLy0A8KqMi53pEult402WBK5t5Wvb9GpaAiIoVkF
         qm6hxEeZYl6N2N4Uq/WLlpLRgmO7DjTV05pivRJNv6zkpxxndcSq2ttu3wnrZsEeKOR6
         pSNs6Kggeh7Y3tCeZt0jjWlq7RrUfN9GvGGwtUV5qHRaXHtebB9zfvhDxqPuXD4laKDB
         69jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732248693; x=1732853493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZRJYb32ImyBJveZbsG0n5VothU8jvpa7dE/eB8Ugng=;
        b=sm5kczMOmfCCAA8vcOBpI1wVKcn8auiM3HTZt+qOR/0KIOb2Ut2pv+dmpI4NBHfyOv
         kM/Iw+kNxFHG1QbC/Zui6myFdcoy6x41r2iTrtUH9VxE4MxMaUvHUqK+dGoYYdjPl35f
         MVV5YJT1Qhyt2zx2Zwl7U/CYJC016tuqf16l/SSP6zrdwvn1s3Gt94d+KwISmwd2L4En
         yoVn3i3KnOsqsByaHKHda3fZNIXEjkbpm/80d6xwJlmYJMLwYyTY7Cgi4FxzS/n73EJf
         W9E4AxlUAP5vqoBmfeJJ8ou9XUpukcDGLbQ0zw5e+mPN1QQPeosdU90GcgB+fauvm24X
         2pJw==
X-Gm-Message-State: AOJu0YyjvrYZPGPTzB2fc5GC+3S9K/ZE8Mn1OGzju2L3LdexmRk8lAj5
	7V9lG3fcyg1IukPNkxWVsEHwVkQmVY45yCh6+I0cgkFr6MsBwctSF+dOgFWZ
X-Gm-Gg: ASbGncsRe4j7oq3dcds5KYisIDcSOrp8HhAd4gRr7uAUMLcbcrJe4wNb8ltjgeRxp8s
	8vmhwFKkqxjKJzQ5X9P7B2yYhGou4yo/Ay6b/69mIxSu2UjLOXsCJRWRd+J+ZF5U0jqrlMuaHst
	1cDqcrw9QVkzqqN1hTokWTKiyMCxguVwNg8v6jUN9Vb5TBYbfTKYRy5r9M2uJR5iB7jjgR23E9q
	UVaht9tZmJxZkCwRuGDaGcn9sV86HUzadKZUJSa/qI/Y8T29h/5Ch20
X-Google-Smtp-Source: AGHT+IGTGqP/QfFF4pnA9uSJN2SmJoS8is8HyE+51nhd6RIsW8kTKazxjYpfVcMj0/UTZCeuAQWHlg==
X-Received: by 2002:a05:690c:4d44:b0:6ee:8364:6001 with SMTP id 00721157ae682-6eecd27f3f1mr46061177b3.11.1732248692438;
        Thu, 21 Nov 2024 20:11:32 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eedfe42061sm2828877b3.54.2024.11.21.20.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 20:11:32 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 2/7] libmozilla-ca-perl: Upgrade 20230801 -> 20230807
Date: Thu, 21 Nov 2024 23:10:39 -0500
Message-ID: <20241122041044.1111236-2-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241122041044.1111236-1-schonm@gmail.com>
References: <20241122041044.1111236-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 04:11:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113982

Changelog: https://metacpan.org/release/LWP/Mozilla-CA-20230807

    Prevent extra headers in tarball and make it reproducible

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...zilla-ca-perl_20230801.bb => libmozilla-ca-perl_20230807.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libmozilla/{libmozilla-ca-perl_20230801.bb => libmozilla-ca-perl_20230807.bb} (88%)

diff --git a/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20230801.bb b/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20230807.bb
similarity index 88%
rename from meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20230801.bb
rename to meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20230807.bb
index 906faee0d..9e8a27e8f 100644
--- a/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20230801.bb
+++ b/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20230807.bb
@@ -10,7 +10,7 @@ LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://README;beginline=32;endline=39;md5=51e666dce556490a1132e937ad3f8729"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LW/LWP/Mozilla-CA-${PV}.tar.gz"
-SRC_URI[sha256sum] = "8066a15bcbec7bcf691e756ea07c8b710e754c76a5e73ae20ac32298f30dd56a"
+SRC_URI[sha256sum] = "cac569d2f73337e6314c0a73fc12f4f6648b7fb3941b2e82623df8e1573b69aa"
 
 S = "${WORKDIR}/Mozilla-CA-${PV}"
 
-- 
2.43.0


