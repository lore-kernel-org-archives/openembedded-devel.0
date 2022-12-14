Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E6C7C4332F
	for <webhook@archiver.kernel.org>; Wed, 14 Dec 2022 11:27:54 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.100811.1671017268509597324
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Dec 2022 03:27:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Qbu978ci;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id u12so18935578wrr.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Dec 2022 03:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F54fHgiOU2o8rugYZVEKFTjaFkKAz7Gy8DHf/uNvivM=;
        b=Qbu978cijlxR8885wk9MoB0mSwAEt12BXiIFYbULCqL4NWfMx06Xc4q+YtRp4hjDpZ
         eef6uZOnl5aPl8duHN01KH5hfDC0zmzt4PAb5AHN+nKhltL1e93Yd+euZGhZZVFSwyNV
         JQA5wR8mvK/u7ZfxW31Z6k4PAtxZ3kOxEi5vAUTp/t1D6gl3fxwerOdBuYOHfT12PNSC
         PWFzNnbAdzykGUhyIu5CTcOgOIz/0DSPuZfDPin8kJWX/Pg8yEa8VipF619CZD43ybo8
         3g5SAxmpeh40T8Ygu+1bNx8/imMEsM4DfX05Ukei3Jt+0oc9GIO1Billhvk4Bl7MtekJ
         ihLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F54fHgiOU2o8rugYZVEKFTjaFkKAz7Gy8DHf/uNvivM=;
        b=yCksY/X921kxQW8PhbFmgvBJTjxpn5XPqd9y6Mhl6jqtflDkeHWsKhBwO/w1G3fvrS
         9sYun9rbKp3xers1zkr3egaQU/kqFOoM7A/aT24jX/i5w/rQ5gngeE8NnmYGp0/k0iEI
         R44lAHI/u3mDc63SNKIZLkG1wYkZuuWt33W3E0mbw85uX8GWlDopEBuW3jDWOVlKgqFE
         RUcbc7PURzCdZtWREv+0Yr5kINMToSfdAvsCvTHzEz5xVEftuaxg1lY6PiN6geze5vM4
         Y03L5tmykefu4gG+qGpl++EHGN8+Ke7FpEutQ7vO3/gfyMi2RbTTx8kXdcDsBahaF8hu
         L98w==
X-Gm-Message-State: ANoB5pnovhCBtYq4TbdDwAFFlc9LqFAuF4a8Ot0Sxr0EeMG5tvBSmoDy
	Ignl730bbRlf+BVxPHb76psDMqbZkQQ=
X-Google-Smtp-Source: AA0mqf4t2bIaTm7BkixlOzSQEoeTJDt6+NOhE/VGDsuZ9FKapQSBQizPKztRBqfyedE2htvjf7ADEg==
X-Received: by 2002:a5d:5d0b:0:b0:23a:5a31:29f5 with SMTP id ch11-20020a5d5d0b000000b0023a5a3129f5mr17730186wrb.23.1671017266767;
        Wed, 14 Dec 2022 03:27:46 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id bx5-20020a5d5b05000000b00241cfa9333fsm2763058wrb.5.2022.12.14.03.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 03:27:46 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH 2/2] mdns: Upgrade 1790.40.31 -> 1790.60.25
Date: Wed, 14 Dec 2022 11:27:35 +0000
Message-Id: <20221214112735.21135-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221214112735.21135-1-alex.kiernan@gmail.com>
References: <20221214112735.21135-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Dec 2022 11:27:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100078

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../mdns/{mdns_1790.40.31.bb => mdns_1790.60.25.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-protocols/mdns/{mdns_1790.40.31.bb => mdns_1790.60.25.bb} (98%)

diff --git a/meta-networking/recipes-protocols/mdns/mdns_1790.40.31.bb b/meta-networking/recipes-protocols/mdns/mdns_1790.60.25.bb
similarity index 98%
rename from meta-networking/recipes-protocols/mdns/mdns_1790.40.31.bb
rename to meta-networking/recipes-protocols/mdns/mdns_1790.60.25.bb
index eb4d3eeaa561..96eb4e50c74d 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_1790.40.31.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_1790.60.25.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=31c50371921e0fb731003bbc665f29bf"
 
 DEPENDS:append:libc-musl = " musl-nscd"
 
-SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https;branch=main \
+SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https;branch=rel/mDNSResponder-1790 \
            file://0001-dns-sd-Include-missing-headers.patch \
            file://0002-make-Set-libdns_sd.so-soname-correctly.patch \
            file://0003-mDNSShared-Drop-MacOS-specific-__block-qualifier.patch \
@@ -23,7 +23,7 @@ SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https
            file://0008-Handle-errors-from-socket-calls.patch \
            file://mdns.service \
            "
-SRCREV = "806254210edec4cab01f794f6fd28658aa6ba59d"
+SRCREV = "e48e3a58b763a0d7b76a14f7f309e24d7502e796"
 
 # We install a stub Makefile in the top directory so that the various checks
 # in base.bbclass pass their tests for a Makefile, this ensures (that amongst
-- 
2.35.1


