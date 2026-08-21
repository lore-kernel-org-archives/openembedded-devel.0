Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7773BC5DF8E
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 04:35:59 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.688.1787286955550994181
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2026 21:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=p0YK2deQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso6694065ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 21:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787286955; x=1787891755; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rA5BZk1iesrFdRce4vRKlBWeP7mqooVoI02Em6NMNV4=;
        b=p0YK2deQa2vMmQ0KSo98HSFQDTF4z/YR8ZP7AM5neQyHWexRTEKl6bmr3CA2xKqAX2
         U9DT2gbx0HPClOGZQXaqVV0USOtfo/UX7ZndNt7dhgibsbNXDonLBv7FE3UTYXJahsfd
         8B1tAxyfL6u/V/5nyw7Zij092yYoh7JPD9UDJR+7xFt/ya98StWoGgeJapKS1R6om0jg
         zNGpbn/wixnZmiD274xs1ySpF4F1jtDzsjJitW50XYs3gQnRpdbHFc54De8j9pzXHTdQ
         bK5t8+dc1ZTXjtDEYpqMxg5clc8KN61lbqNVRoPlm3GRBD77Kej42I/3KOhKqS53f0Y0
         JUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787286955; x=1787891755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rA5BZk1iesrFdRce4vRKlBWeP7mqooVoI02Em6NMNV4=;
        b=LapWfJ4FRkPEBUsNlZ5SdCGTSboyEQqayuCXkuNpZ+lM8cHDY46WKFqp8jyWIsvre/
         rEmJT8Lzh0DF47gJbou9/Fn3gVZnnM5DOCVyMUBZJNvuJL7QrvPPZTf/8KoBHADHNbd+
         n4DJN3yeOnw8525eW6p/DHxGQ6VWbnT+7y3s1wjrdjymntoeRaHVg8O23qWaS+gexncv
         HvPKqiDBZVx8OjoJAvxSvsZh48cHBdW3g8F/Mgi3TCBOOoWMV9ErVsGNbrYaNpqyLDrl
         F9FJshSQ5Z9adgW7c7s8TJz5F41yIy86N0ZqzOi0jzYNhlXj6sdhdkrGM2i6yeQFim49
         RbpA==
X-Gm-Message-State: AOJu0Ywdp+OjlgLkbbHgUZMfdPllJs6exZdQG/lC8LQBBW5s9Btex6Op
	zbgxoQ+JjidNGuxkOSIAK9g0K+3HDTgb8AalgivPdaguiKTnxXcjzw7Qjg4fqw==
X-Gm-Gg: AR+sD13JgWMJJfisSMca9Az2KojJwWQh/6vJm7K/PTJbnaRM3TL2k2b48QWO5XNuIIg
	RLfJdwzhkvGusnfltPi6Yfdg12Ba6waN4coh/oDuSe7AxX4BX8wQZPzgjrAzEleefKU1uS9u8RZ
	drV4wJTt49+vT0dgeAzIvh08Djd28/L8HmrR11MEH66RYFRZOAhYaNKVmM72oYZ4MiQe62ni6EN
	AXlLcbIDheYcR54b5ZKR9XOGRff88cxfOBrOsA3DeuPhWgWMnVbphzDp1/KhMmxPokOq6M+s3Rx
	TS9jKS2MezuYhW0f4EVsdijiQlzlG+MLiBm/raV3oHLB1PG387n/OYuAy/4BpGYboFKj3MekuX6
	irvKbgwCvaWcbCi7TeJ3qfCUIpVG7yRPK8HEuav+JPlJd0npQeMqZQ46WbAq8hLVc07/t7rPJad
	HM0WvJyo3YCc+KF60k+cAhAsaEkn/kxZRLQ1lNhHqXpACeGEEfilCgKG1WrvgJ5R74Rsx/2EjT8
	sn43XHNxpcm/C8sfIg=
X-Received: by 2002:a17:902:d4d0:b0:2c9:deec:f564 with SMTP id d9443c01a7336-2d64b0c72c7mr57338895ad.13.1787286954664;
        Thu, 20 Aug 2026 21:35:54 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([161.29.95.207])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef6ec40sm23626097eec.7.2026.08.20.21.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 21:35:54 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 9/15] librdkafka: add UPSTREAM_CHECK_GITTAGREGEX
Date: Fri, 21 Aug 2026 16:35:18 +1200
Message-ID: <20260821043525.448011-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821043525.448011-1-ankur.tyagi85@gmail.com>
References: <20260821043525.448011-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 04:35:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129404

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also include tag in the SRC_URI

Fixes:
$ devtool latest-version librdkafka
...
INFO: Current version: 2.11.1
INFO: Latest version: 64
INFO: Latest version's commit: 1f33da62396378c1f8a92ac4b8c8b4beb6b40617

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/librdkafka/librdkafka_2.11.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/librdkafka/librdkafka_2.11.1.bb b/meta-oe/recipes-support/librdkafka/librdkafka_2.11.1.bb
index 23ae2fbb29..d7f3ee572d 100644
--- a/meta-oe/recipes-support/librdkafka/librdkafka_2.11.1.bb
+++ b/meta-oe/recipes-support/librdkafka/librdkafka_2.11.1.bb
@@ -7,9 +7,11 @@ LICENSE = "BSD-2-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=40b04809b5d6f648f20f45143cbcb1ad"
 
-SRC_URI = "git://github.com/edenhill/librdkafka;protocol=https;branch=master"
+SRC_URI = "git://github.com/edenhill/librdkafka;protocol=https;branch=master;tag=v${PV}"
 SRCREV = "69b1865efdc0118cd017760d038d34e52fb3f0d0"
 
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
+
 DEPENDS = "zlib openssl zstd curl"
 
 inherit cmake

