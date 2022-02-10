Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F4A5C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 16:15:53 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web09.12147.1644509752817512650
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Feb 2022 08:15:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=Mm/jYpnR;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.43, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f43.google.com with SMTP id bu29so6170604lfb.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Feb 2022 08:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Np5+WQUIreLD1/X/oUMFI+kVmEEsXnegAAY39VP1Jqw=;
        b=Mm/jYpnRGp72tqhrhPsPRORONRhU5aVzAojcIf8xtbVDdU9i+xoJQd0xRuUz3X940m
         xBLOUvQTHOrnHDgIL+NsCJRNwhQxi0FdnLL2jFOffypPz9P6xCGDSv4Z3e0uX/+uaA4v
         uhavYKjC9FV92hJRTsoEYWDg/okCCb7HNya9sF2Dw07gvC9Jeo9V4VV1nN92sZcXNm95
         54u+iAByv/GCSZNPkPgRY6ixHQBMAbgxjSDtT3HRY8jFCjiIR1JHtyRL7uK4qvgVcaJY
         2AiKOZRZo0QnDwQUqgEWE52pFCFrEfMBkhBK91Gb/JKol2ulyKC09T1ECpUApzFtfqLd
         y7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Np5+WQUIreLD1/X/oUMFI+kVmEEsXnegAAY39VP1Jqw=;
        b=7E0bPc+/c6i5S5iURwv2VL8qHfpBXu0owGaAtQoztanTsiU0uV9KRpNDlwyiK3vXlv
         sR3FlmwfG5K/KNu64ftHQZa7iUoIrBmdX2iOula9r9+8LX79498awVncmoZ8YayTvXgp
         1+MrGn5Xf8TuCGrcu8SJkjfKaDuimL+VH3xjQy4vrAifm1/XOakQ6VRHilrimGwfMwBQ
         +70nHVK1118byWzmmwSP29VbhRHLjGQF2jzSip+abwjGHo3Q40xJSn7QfQK5NPIKWBr5
         e1fnbY66bRFk/3DtxgAuy3hVe4aB+pRoxNbHDDkPuIQS9A6Bi9NAwXh1/6mGDOI7rt6T
         Bixg==
X-Gm-Message-State: AOAM531+IKaH/Q9k6wzJOISpIgAxTRD8bDrb6SdvjXtLXmkKtH6P+NeL
	elN9162DFnz97mzU4ewFmBkVAQBvs5/62ufi
X-Google-Smtp-Source: 
 ABdhPJzoB2SE1cN+VMBRfN0a0cA7cBNZGawl0dRq6JKB4OiMAspnv1FpsWukS5vo6eNnlsiMmgj4VA==
X-Received: by 2002:a05:6512:2609:: with SMTP id
 bt9mr5524791lfb.616.1644509750399;
        Thu, 10 Feb 2022 08:15:50 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 i22sm2942813ljm.125.2022.02.10.08.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 08:15:49 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-networking][PATCH] fping: update to 5.1
Date: Thu, 10 Feb 2022 17:15:46 +0100
Message-Id: <20220210161546.2248829-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Feb 2022 16:15:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95289

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-support/fping/{fping_5.0.bb => fping_5.1.bb}       | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-networking/recipes-support/fping/{fping_5.0.bb => fping_5.1.bb} (87%)

diff --git a/meta-networking/recipes-support/fping/fping_5.0.bb b/meta-networking/recipes-support/fping/fping_5.1.bb
similarity index 87%
rename from meta-networking/recipes-support/fping/fping_5.0.bb
rename to meta-networking/recipes-support/fping/fping_5.1.bb
index 541e705c85..f2dd897561 100644
--- a/meta-networking/recipes-support/fping/fping_5.0.bb
+++ b/meta-networking/recipes-support/fping/fping_5.1.bb
@@ -7,6 +7,7 @@ targets to ping.  Instead of sending to one target until it times out or \
 replies, fping will send out a ping packet and move on to the next target \
 in a round-robin fashion."
 HOMEPAGE = "http://www.fping.org/"
+BUGTRACKER = "https://github.com/schweikert/fping/issues"
 SECTION = "net"
 
 LICENSE = "fping"
@@ -14,7 +15,7 @@ NO_GENERIC_LICENSE[fping] = "COPYING"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c6170fbadddfcd74f011515291d96901"
 
 SRC_URI = "http://www.fping.org/dist/fping-${PV}.tar.gz"
-SRC_URI[sha256sum] = "ed38c0b9b64686a05d1b3bc1d66066114a492e04e44eef1821d43b1263cd57b8"
+SRC_URI[sha256sum] = "1ee5268c063d76646af2b4426052e7d81a42b657e6a77d8e7d3d2e60fd7409fe"
 
 S = "${WORKDIR}/fping-${PV}"
 
-- 
2.25.1


