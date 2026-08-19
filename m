Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 749E9C5B572
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 05:37:31 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.841.1787117848616652701
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 22:37:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YLGALxx8;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38dcbade417so794273a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 22:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787117848; x=1787722648; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IRhEZ36UDtYgZ2y7mTYyJHPxc+wdTD6upgNUNNKu/HQ=;
        b=YLGALxx8sZIzcaGLQSFds7Dsk5y8fAjDamIs8vcZDyrB8wmodroXzmlQfXP+Fc1Gco
         4k+Rd5XQ2X4Rt1peL9Lc5PWBD3SwJi563VAhv2g4aWlEybHYBc60bQVdpQEPdgh9GXMj
         5sVJlNFzB9g0TnWIyqhFe5ycHeXBI1syD/+PO9H4rc6G4f75euoN2WTpVLob3qW2YmCc
         B4d4t6aY+SMC9wGQIxikbEUCbcJDDJaqXgh5XA0cxP2GtU53MgPTUsWauyC2RlSCsnzr
         Dhk7H/1u5QrQqbyW/yqtCkKFvxaVWnJdxV9+LXsnPjNFJUJGMEgDwLnfc8GQvwp+J2Dy
         Qe6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787117848; x=1787722648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IRhEZ36UDtYgZ2y7mTYyJHPxc+wdTD6upgNUNNKu/HQ=;
        b=fst43R6cqQyZXePIB+tOG0wZ43wH42zRAS8s5zUkTmX9fxW2e3ir825d50+rK2E0Ou
         60J8iS3y1gzF9oXNVakUNdEsR83eNah/H8EPw4hvKy0yQs2yT+j5gO0TSjGid5WjDwiR
         l21An0bvLEopO+ZPMLDZ/bSMWpUoU3fgnpurc5cNL5ZnQ+JAc138DLlBwG1SKO4cB4ZX
         cEQJvo7rF7UjMIafuZw1cDWPjrAkgtnl4uQjyZ1lR7QjDpgGcEkUQqm7dm217T7lSdkw
         xpcjAfjk7S2q7f0HpQNOtVKexJ3ctgbUOFTZqnmlNsIuNQqWxEhjOvat1WupM7I1rKQM
         6cvQ==
X-Gm-Message-State: AOJu0YxLbzMROontKRW4ZmIPcnE4A3eYNK7lVB3umOs/Ai9Rcn2RsxUW
	IJR3GJWVSemtZVNaFI+AikR/3iDJehaqvHEXCuWG0Tny8kEg0IqnGY/hQQiey0N0
X-Gm-Gg: AR+sD130LTHR+MoeSIQlKqAc9o/YIkggxzNpUFJkjLOTBQtzc6Esn/MpnNdVmdK6hXA
	2MpP1fQ97iV4a0ZZhb1o18Vennu7oE/Nm34bmeXdKgNdt9PXtWv94uN/6jIzbUBRa3jGhVyMJ1L
	9ScJvRVl4sDI787qZvHQB9Y/PGMmbWJMH2g87eBB2L8Q6TOmWxMHHk4FxY49EJGjEtbQ2ZcJZ0A
	wsvt5uMnxlIVzEbC5DexS+KTZG/PYHYVL+H3TlXzg0Qy9YiBVQd30MOpnYji5VXqFVvcu1qHmcC
	WZC0NNCR7+YzdAZs5FMi/MKL9bQYluxOOKt9rdWo6rP5dTlChvJ52RgB4XIR6Vk0tqYFoS2VTx0
	AnUvYoVqpvHtAHUGeKN1A4U3lwJXaJzHW6jc96qFKVFxEyIvdo871oL1hP+gm40si7LN7W6SYhK
	5t3xeG5VyA5o6ii/VX3+99IrWDmSQ10hoiYNXng4itj/ks9+k8NCOc6xtQRsSVCovCM4Z9wTK9K
	3bEkLuiEuC3
X-Received: by 2002:a17:90a:da90:b0:37c:6910:5758 with SMTP id 98e67ed59e1d1-39580a91ae0mr4399906a91.1.1787117847866;
        Tue, 18 Aug 2026 22:37:27 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm2830814c88.15.2026.08.18.22.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 22:37:27 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 20/25] libkcapi: upgrade 1.5.0 -> 1.5.1
Date: Wed, 19 Aug 2026 17:36:24 +1200
Message-ID: <20260819053629.391864-20-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
References: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 05:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129264

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

License-Update: copyright year changed to 2026[1]

Add tag in the SRC_URI

[1]https://github.com/smuellerDD/libkcapi/commit/df40ea48ecbf1afc6d3efa5494673fa73bd40826

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libkcapi/{libkcapi_1.5.0.bb => libkcapi_1.5.1.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-crypto/libkcapi/{libkcapi_1.5.0.bb => libkcapi_1.5.1.bb} (88%)

diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.1.bb
similarity index 88%
rename from meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb
rename to meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.1.bb
index 742a50c3fe..c4f5010058 100644
--- a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb
+++ b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.1.bb
@@ -1,10 +1,10 @@
 SUMMARY = "Linux Kernel Crypto API User Space Interface Library"
 HOMEPAGE = "https://www.chronox.de/libkcapi/index.html"
 LICENSE = "BSD-3-Clause OR GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3d8a091d797491204567185a6efce70f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fed53d2ab12f2d813d4177dcf4792528"
 
-SRCREV = "fc937358e71253a6efaa3ba74885364976b040ea"
-SRC_URI = "git://github.com/smuellerDD/libkcapi.git;branch=master;protocol=https \
+SRCREV = "df40ea48ecbf1afc6d3efa5494673fa73bd40826"
+SRC_URI = "git://github.com/smuellerDD/libkcapi.git;branch=master;protocol=https;tag=v${PV} \
           "
 
 inherit autotools

