Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A85ECAADA
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 06:12:04 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.33949.1661494318783039706
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 23:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gMRRiiNk;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 m10-20020a17090a730a00b001fa986fd8eeso7157725pjk.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 23:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=4slpqxTNSCHoRy1tiM4ccbO+N2/wsmVkZ+KZyRTD6Fk=;
        b=gMRRiiNktFYMlbquS6deXENYFGHH5lL9SOoXBN7cBdsA8nkKnqnACYW8NHEZG/+d4Q
         ZIyJe3mtwuivM58rDp+ny0iOqNBZ0bBr0h1uKhdi+mK92pjlDGU2tNCsaHJ2nwfjrAP2
         pTxEhbc/WnN3fjStVXE9dWK8cuEn67BLQIMhC2VL9ZnlHxnFhD+4ZsNKtBLokFnkH7vv
         0+qT3J5DhES5TKrQke2pkgXQb20OJ48cypQIzrjg4dS09aUyq4x2k7FjUgD0fpN1kPwg
         aYWPppzE73G5HzG7MY2KRiSTADT0zDs7+59qMovMBNoCbP+I8THK4j1VnG48OOCXdsLU
         sXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=4slpqxTNSCHoRy1tiM4ccbO+N2/wsmVkZ+KZyRTD6Fk=;
        b=f4BujG+Goo5cmAthuNGXXQjLn7b37+oT/yUJ4ci97Tp4npyo2L6iC+O+0yDQe4UQY5
         3hraSkWcpTbq8t0+StslaKiih0SjhneQ9AufGIhBf9ygq7msq23bKCdU+occTjvNO5RR
         G8jhVbp9ooRZQgav4BXSewDL+5OmtSHUPqmTuQ8t0t2ThJTIlQHUuaqzGW4xra1hlPot
         1xDwE0ZpaRrICrK+1zW5cAwU1pVMIRYTNEXfFd0081h5wJ9g2SA1/OEsqpcC6zRxGDUL
         8KSDmNMTslLZsDCVbZL+zLCGFAvUwhuAAB6IgNvwnL5kC1Pq7MXIMvt2xN5B/sNfvKLb
         3KLw==
X-Gm-Message-State: ACgBeo05rQNJE9eKC3N1PR87yPCuPPD5qn2XJ9Mecq+Vf1mfjNqMxjkW
	i+/gtTAGI/L2UtS9cVMGdIA1Lk/JfhmTJA==
X-Google-Smtp-Source: 
 AA6agR7qXf4jJrwrUxfTFOutsrh5+vPCzZSrrXTOtUgwAgJhMLSOEth7gRAVZRB2IDXuM5imJTwpCA==
X-Received: by 2002:a17:90b:3b4f:b0:1fb:5b03:6822 with SMTP id
 ot15-20020a17090b3b4f00b001fb5b036822mr2763504pjb.87.1661494318034;
        Thu, 25 Aug 2022 23:11:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 q5-20020aa79605000000b00537a6b81bb7sm755903pfg.148.2022.08.25.23.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 23:11:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 6/9] python3-grpcio: Enable largefile support
 explicitly
Date: Thu, 25 Aug 2022 23:11:47 -0700
Message-Id: <20220826061150.3030485-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220826061150.3030485-1-raj.khem@gmail.com>
References: <20220826061150.3030485-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 06:12:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98469

This ensures that third party packages like zlib can get this in CFLAGS

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-grpcio_1.47.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.47.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.47.0.bb
index 24c6e53447..0950114b02 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.47.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.47.0.bb
@@ -23,6 +23,8 @@ RDEPENDS:${PN} = "${PYTHON_PN}-protobuf \
 inherit setuptools3
 inherit pypi
 
+CFLAGS += "-D_LARGEFILE64_SOURCE"
+
 export GRPC_PYTHON_DISABLE_LIBC_COMPATIBILITY = "1"
 
 BORING_SSL_PLATFORM:arm = "linux-arm"
-- 
2.37.2


