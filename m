Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30287CAC5AE
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 17:51:42 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.4059.1758649892304933119
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 10:51:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZJo5nwGX;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b0b6bf0097aso1066232866b.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 10:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758649891; x=1759254691; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AK3Zygy2r4rmihzOs1IMNSeF1IDWUKd9Y5M2crjFW1c=;
        b=ZJo5nwGX6Fgv2y3FZZy6viwKm+sqOMc5bxc9sK9ug1mEdWLOBJp+OGw6/qRfBWV5zk
         BgLgWOuiu8wBs4LRG8BY34yio4JwBJKObltjRBfbevegS7gaK3VdNHsEnaAdNurUpyHc
         ZyLM6/H5UembAwIClLaWn8JA0M/XxGXmzFeUwH3b+Q1J4e8RhXmLw889EhRCDyqNVEkU
         0wAlrRJR95NpkdQs3ARMleUMyHG4EdTr10yIhFDdqAU7VbwVistV6TI8v1facpCYmNF0
         7gOZGgW5Mv87CrwblnOaigiOmMgJPs0tmALSjyRZAdv7yLYAc4XY2kPe+WzNsTREpD34
         pK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758649891; x=1759254691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AK3Zygy2r4rmihzOs1IMNSeF1IDWUKd9Y5M2crjFW1c=;
        b=TXrH07nB3zEcem7elBf3LMm2bsmq05BnTH+0D+W8Ub2lLWvoDSCYqY0jwMKTGyLwkS
         Sjd9T1+TSRMcPwB5OBvprG/dr5pZKrDd14O5MlS9cDZExiqDkIsVfShUF+4WX3rWRMjE
         EupNJ9bCGHAcv/ASbo8M98MmH225tkQ4kR6TWyquLdxiicNrOSXb+5s+BhBm1fSxXO9H
         933KBgXYvUdbBqvKvKoSvQn086D+yncuITgP36qGMSg4itq+AWYxmNT1ijytf7eLm1OQ
         xEeyALfe+t8EZzxzYhGWJHBG0IcRFHb9tYSeJXUDAvjvUhGA6ga1XJctmDjYZPvq4uaH
         DbDA==
X-Gm-Message-State: AOJu0Yw3XU63HyCYrLj4Cz7I+OwRCpv685CPVNM5ap6MJ4NcP2q9Jvm2
	yF6H8Z+JoxOrfjeQ6ccK9EBbZitcUaprDGUMQYfkCSHd/uxj4VTT/FIawDRJDzRz
X-Gm-Gg: ASbGncvdre5PRTKOJW1ArpjbYtFxHPwA40fmZVb2/dNPo5yBotEQRZj60Kgedf/7Hnn
	JIRvRc/hrawGDhiKFnzkYQTMC0lsSJYmIU5dpXFV1zQs1I08Fo9H96MnbDikJ8h2tbMYLV1NidZ
	JeEuefgds8YIxxIXgeGXYChoJNYwGeNXqZ8QyF81QpBv07IZmM3mbfM5xxtSaYFsmmAV95D9AmE
	sTQXwAuOBn4oT8e599eHOPDZ2yG9eJFSKD08F5jdzgFgRl9VBIQgq6l1d5S0Ojdc4KkMM0t8Ri3
	PJNBkna4HqWAHgHZTZJl2S7UoIXCHoco3iZs88pjeFZpftVHPylQnX3U3BNa3TAhEU7e0h+waFV
	P9EGhPKf9rich/RZQ5Tse
X-Google-Smtp-Source: AGHT+IF4i3t5vaNn1+5WKtOXW1wMUJzxakNfFKDWyXWU0WOUI1ijNGIxFnuOsNX8KHF5SBv7abuoCw==
X-Received: by 2002:a17:907:9403:b0:b04:c373:2833 with SMTP id a640c23a62f3a-b302a1795e3mr320648066b.32.1758649890327;
        Tue, 23 Sep 2025 10:51:30 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd16c01b5sm1358840566b.93.2025.09.23.10.51.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 10:51:29 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 1/2] tokyocabinet: switch to working SRC_URI
Date: Tue, 23 Sep 2025 19:51:28 +0200
Message-ID: <20250923175129.2292937-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 17:51:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119724

The original source seems to be long gone.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb b/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
index 22cbcc0f2f..039e360fb1 100644
--- a/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
+++ b/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
@@ -15,7 +15,7 @@ HOMEPAGE = "http://fallabs.com/tokyocabinet/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-SRC_URI = "http://fallabs.com/tokyocabinet/${BP}.tar.gz \
+SRC_URI = "${DEBIAN_MIRROR}/main/t/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://remove-hard-coded-include-and-lib-paths.patch \
 "
 

