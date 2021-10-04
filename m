Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AFA8C433F5
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 20:21:42 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.15739.1633378901047011107
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Oct 2021 13:21:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OjFchGp7;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: uvv.mail@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id y23so37417656lfb.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Oct 2021 13:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QRCuVQQKBbXaulJhq0vRT7qRwNLctshbkwJhywNzT4w=;
        b=OjFchGp7GasEz0I6dl7IBrxtrArt/34oyQkVGJW5ez4TEqwUQ2mOwKOI78yIS/5ohS
         ywMhISM0zrHJYV50feRO2XOsL3scY+qIFiglTzmOwS8A/H1y7cNAIxRt0vDICMYvqPYo
         xDTKATxUwIpSmPHTClXV7cYeBXk+brUulTLOhgyYHiqHD9RXwJF2K74m0DCfXx1KI3MR
         LDg8MoLOFrbKD0u8COV3YzViC3irk2taeNBLel5X/u+1Dandl/O8+8Pm6A7S4IBp13SJ
         so9Ep6FQ8PNg2OOFW90Yo27pfHqFacYvKItR4mztoXmf/UjWMzV7PjyEgnvYGCVnFrCX
         EzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QRCuVQQKBbXaulJhq0vRT7qRwNLctshbkwJhywNzT4w=;
        b=YDXSQ1IbrcsfoidYdVZMJp/JuV1pptxmti5o/nDVEFDTqI6P1PFVlYkupaYpjgH3HB
         RSQHueSP7YLWOnmoFXRme2k5ZogQkTnbociYAONqsVt9M7qPNw87O+tSwKX9sHY83tP0
         0uekt4FhE4quINLDc9EYaSWA9IbhuQF52EFgS1umwMgyN2tgkuVjrI06zIsneVeGFPKn
         xohVxkzW+z75vRarVluhtpWVzwlA1/AbPPFx9IefPQwnDtfKcNCgMhlQsNqUG3Yyeor2
         yKnb40Ar3xT3Igz0t0d/a9KaGdFydS6SrRijfAcF9Dnk7diI4/9wUvs9jr0rRRjqpO0n
         W54g==
X-Gm-Message-State: AOAM531AzmPR8ItDMcpRriOWdwHmfwOUUBZS8d95EkNH86xY6iCN6HgL
	cl6ZhsjiW1Un0EtZqQLJX5J5L7H15Z4CPA==
X-Google-Smtp-Source: 
 ABdhPJxSXd1E2Aeew7o1JUWkFlmfGhnzYKQcTchQ6xrF/G0c0XTfgDRahagtn4T/JUu+vBeQfbjNzQ==
X-Received: by 2002:ac2:58e5:: with SMTP id v5mr15203272lfo.589.1633378898705;
        Mon, 04 Oct 2021 13:21:38 -0700 (PDT)
Received: from slackware.local ([185.253.97.13])
        by smtp.gmail.com with ESMTPSA id
 l6sm1689988lfe.218.2021.10.04.13.21.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 13:21:38 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 0/2] gRPC Pull Request
Date: Mon,  4 Oct 2021 22:21:29 +0200
Message-Id: <cover.1633378334.git.uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Oct 2021 20:21:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93197

The following changes since commit 037f38cc68aabb9e36e92862af258f46874e0c13:

  gpsd: inherit pkgconfig (2021-09-30 11:04:32 -0700)

are available in the Git repository at:

  git://github.com/UVV-gh/meta-openembedded bugfix/grpc-sdk
  https://github.com/UVV-gh/meta-openembedded/tree/bugfix/grpc-sdk

Vyacheslav Yurkov (2):
  grpc: fix cross-compilation of grpc applications
  grpc: fix cross-compilation of grpc applications

 ...compilation-with-gRPC_BUILD_GRPC_CPP.patch | 55 +++++++++++++++++++
 meta-oe/recipes-devtools/grpc/grpc_1.38.1.bb  |  8 ++-
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc/0002-cmake-fix-cross-compilation-with-gRPC_BUILD_GRPC_CPP.patch

-- 
2.28.0


