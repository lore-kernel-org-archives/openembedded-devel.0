Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD0AC433EF
	for <webhook@archiver.kernel.org>; Sat, 29 Jan 2022 14:21:56 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.6404.1643466116118883336
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Jan 2022 06:21:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pMhSV2KI;
 spf=pass (domain: gmail.com, ip: 209.85.216.46,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 s61-20020a17090a69c300b001b4d0427ea2so13686708pjj.4
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Jan 2022 06:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zgzSs8MzYNjULrz13bDlT7J5FFkYtj+BYjiyYNdwK28=;
        b=pMhSV2KIPSaZsn7Px3aEGnsD+bgXPmEATfYsLZ6U3wB1wGvreyAilw4xF1GpnXcq6v
         EIo4lZjG2HNsVnc91HD547B0Ex7EhDh/pzSNNBxKU13fXerOBwGaZsVuprk5pZFUnE4N
         xM2g3HIph5YJcX2JQjiDYUZYaFp4d2338owUx5JmXNhKZpFxzmIpPaCT7FQmTz1UyP3m
         OgIh6zGND/9y1JnT84SxClBWoH5u645YovRCR236AB5E/z6Vka/IU3vA98OXbDN7AtuG
         1eSMcpWuynUADNrydTNMg7jftBNKGcDUbI6nLl6U57+8mpHEKPRAfYWmEzA0eUWKXx2j
         41yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zgzSs8MzYNjULrz13bDlT7J5FFkYtj+BYjiyYNdwK28=;
        b=RVY/NwvCp6qSf+NHDzxecFHY9+jW47LenuwDDcJkr/mmHN3+WfMNT7nwIoN7uSuPwN
         ZBZkgdf3ikUH3cQTB07ba1Gmzjig2jYCtSbLf4N7gjRp6DYcTC5mTz53fgLsQPqEhvuC
         SipEgTPjWyOFwh/ozuKUQSThI31xsYp0JWb4dS25iJmT3HfSQ9mgOu6933VzdLC/QbOF
         wRA6/VFJXqEFxWemLbQU5xF8UwgKOjjcm9H4FDtr42/x2ILxlEhBmIW9bBrfuHbQdLBV
         mPYuzXLw8SHAzV/AIZ9SKYPK1rymcTH3OncGfdG+ADsn1OukeFpf24bmWokLj1smtZuP
         SFvA==
X-Gm-Message-State: AOAM533A7iBlMZ06bkvNS0DxgtsyutDdlp4I86Ut8H+v0PqnevkLuykg
	jzWEG4HjEYzYnM8rGvnWWix5nssHMudNYw==
X-Google-Smtp-Source: 
 ABdhPJzt6MsZ4i/CvFYetZ807mProyNyHLZp+VnEUlp83AFPt+8jnmrJ96h9MwqI4HO70F6D2J7/ZA==
X-Received: by 2002:a17:902:ecc5:: with SMTP id
 a5mr12807580plh.30.1643466115504;
        Sat, 29 Jan 2022 06:21:55 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:d32b:593f:f15f:8524])
        by smtp.gmail.com with ESMTPSA id 9sm4498304pjg.50.2022.01.29.06.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 06:21:55 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Daniel Klauer <daniel.klauer@gin.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][hardknott][PATCH 2/3] spidev-test: Update common-licenses
 reference
Date: Sat, 29 Jan 2022 06:21:52 -0800
Message-Id: <20220129142153.3829490-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220129142153.3829490-1-akuster808@gmail.com>
References: <20220129142153.3829490-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Jan 2022 14:21:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95171

From: Daniel Klauer <daniel.klauer@gin.de>

The license files were renamed in oe-core to match the SPDX names.

Most recipes here were already updated in commit ed54f12e19
("recipes: Update common-licenses references to match new names"),
but spidev-test was still missing.

Signed-off-by: Daniel Klauer <daniel.klauer@gin.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-kernel/spidev-test/spidev-test.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/spidev-test/spidev-test.bb b/meta-oe/recipes-kernel/spidev-test/spidev-test.bb
index 6626302919..974cb1e93c 100644
--- a/meta-oe/recipes-kernel/spidev-test/spidev-test.bb
+++ b/meta-oe/recipes-kernel/spidev-test/spidev-test.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Test SPI devices"
 DESCRIPTION = "SPI testing utility using the spidev driver"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 PROVIDES = "virtual/spidev-test"
 
 inherit bash-completion kernelsrc kernel-arch
-- 
2.25.1


