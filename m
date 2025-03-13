Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80BD0C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 09:07:59 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.10407.1741856870683200871
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Mar 2025 02:07:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z/5pnoSx;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso568079f8f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 02:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741856868; x=1742461668; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5hYYH88rCVdhopdKtjd/pl+U2OhfAjtGxsH45qLNspo=;
        b=Z/5pnoSxH1+R5sQ7We4ToqbRoH8JMWVDGWyfz9YyD4Ge9ziTG5mHfa73YCEbOHiT4e
         57gLj8Ko14KdQxT0ST3NUnOec9g0ALE56/yASltNTS5etZ90Ht8P6AlgJaxQWNnJXVZZ
         IwkI2kvazwaoxY01LIFvMNntz0NcmCKdqhfTN/+sReGrhC2BAXnWHSz9HtkPJhugZp0X
         4ynemA5XoMGBCA/+x/pHALkpi4hUQBlUyBbi2G3lMiSAr8aMHfK+cPxYDKJ2Slw9rLKN
         /CDGqYxeZ6dqzOFAjFST+JUvxTpSwtELNuGmud3hBWC3S/glty9puHu5oTnXjrGc1NCk
         Kxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741856868; x=1742461668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5hYYH88rCVdhopdKtjd/pl+U2OhfAjtGxsH45qLNspo=;
        b=ot8oTwC+3lIRJp15gHYGu6S3V3oFS2AmpdHds93Cbnw04C7qX+kNj/XqD6HQIBUROc
         3ppn7F+YtvPdlH6yPSx/J9Zg3X1O8GzOtkom1e8klmcmp4xhHwh/4Pwwmqm+3LHlzPgS
         af8aOQ+lZPuXZGfOPMlEHR5YVkVPblHvk/5ekqDnFvc4tO8cffHMSgEL4hDCIkKDKqda
         9GDwEFEC0g+4NK94U5j5wdsipi/ev3NVduNKb6rbKuLs8U+hRhmnPoUxzUsXXneSkzbo
         2dnaXIg9VT1DkU74c4Rn8v+2caOQ0+NVAmOiHW9UZhOhGFIC67J+aXNjeYST1YvzVqSt
         t0/w==
X-Gm-Message-State: AOJu0Yzv6BxxRx/CNITl2eNXbOj5yke2Rm+t1PtQmy+OSpIekOrxVyS8
	on2ckwlPuHWsm2JEKFP5H0Yc+hxPtn1NaOKsQtoydNWlqwpsuNGDQJolNBo8
X-Gm-Gg: ASbGncs/Bk52J5agF0uCn1Kdo0Z6i884bCIdWe/rwVnzCEaE8tYixVsIdgYLDXiWIay
	mVO54FZ2ZpCqAihmVZ3eMx8HSRDCiaqeO64uNJE5dvwEsrA2fJ/BFlkpQXdKHuCUx+KbQA1xfuz
	zsMZ8oWI5ZmFgtHONGVb/lSeB86wOfgw9SMqL1i/WUv9pNftsWq9yqSXtrtPpz7hVK0dbyBF7S3
	jTzF13IdsjRl71ljSUkUOO6rd2ed3pDMkQ2zJfMPcn6OGmAQDqg4TykRjRNW9y36N0cK40ygjKy
	MxSWUQsZmV6/MJ8h7K9Qcg7E7tsZ+FDN7FPyj+ibid1rgt57Kc35hkdd966HXj/JU1zNXyg9DPI
	9kglHxK17XNjN
X-Google-Smtp-Source: AGHT+IF8Sbypyn9CLhzgjT0jTaQIRac1iawWe4sBOhsx38H0+tBjAzpu0jYDRGMhmaDcOa25olj9vA==
X-Received: by 2002:adf:e007:0:b0:390:f4f9:8396 with SMTP id ffacd0b85a97d-39132d7ff8bmr12890454f8f.28.1741856868465;
        Thu, 13 Mar 2025 02:07:48 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb318a12sm1410326f8f.75.2025.03.13.02.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 02:07:48 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH] mdns: Upgrade 2559.60.39.0.1 -> 2559.80.8
Date: Thu, 13 Mar 2025 09:07:38 +0000
Message-Id: <20250313090737.27357-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 09:07:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115962

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../mdns/{mdns_2559.60.39.0.1.bb => mdns_2559.80.8.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/mdns/{mdns_2559.60.39.0.1.bb => mdns_2559.80.8.bb} (99%)

diff --git a/meta-networking/recipes-protocols/mdns/mdns_2559.60.39.0.1.bb b/meta-networking/recipes-protocols/mdns/mdns_2559.80.8.bb
similarity index 99%
rename from meta-networking/recipes-protocols/mdns/mdns_2559.60.39.0.1.bb
rename to meta-networking/recipes-protocols/mdns/mdns_2559.80.8.bb
index 97d3597cffc0..5f9af2661a92 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_2559.60.39.0.1.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_2559.80.8.bb
@@ -28,7 +28,7 @@ SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https
            file://0004-Add-definition-for-MAX.patch \
            "
 BRANCH = "rel/mDNSResponder-2559"
-SRCREV = "e8a63bd04dda3f83a80f1dbc6db03e7806d87c11"
+SRCREV = "ecc02274878b0a70dba229de642b081cd1c30927"
 
 # We install a stub Makefile in the top directory so that the various checks
 # in base.bbclass pass their tests for a Makefile, this ensures (that amongst

