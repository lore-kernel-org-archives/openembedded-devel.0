Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49342C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 19:41:35 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.1036.1646854893971500778
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Mar 2022 11:41:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=BYA28xyv;
 spf=pass (domain: mvista.com, ip: 209.85.216.50,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-pj1-f50.google.com with SMTP id
 mv5-20020a17090b198500b001bf2a039831so6213583pjb.5
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Mar 2022 11:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N16KIg6ofDOBbroiCvXqChpv17E+/0VJYOYB3cZPt6Q=;
        b=BYA28xyv+mrLQ+I4flr6yG49rCy2NRZYkVnGSDG8OtRdKQcFd27jjaeP28bx5yzgMr
         6vgWnWOW4qPyavGOwx22+kyg7qerpn0xTewxx9+A8BxENQSL+1FPnQ2/Mau8afkvBtJ9
         LXa0jkvJmDVYhk7MSLl9HwN8D60fGG4gqGNtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N16KIg6ofDOBbroiCvXqChpv17E+/0VJYOYB3cZPt6Q=;
        b=Thp8e8i5R9T1pYS8Zar+3bLTkC6Hr/FvbfS+vxlmUG773YkAm+iO8Crc/SsIbn8rr0
         SOFVRYB14VztcBHnlIq7CXv7VM/c9vxoDxhFUYbYLzzypoBUjPiISbWMeQYLp5rfIRc8
         FN2Ov5T/CFM+nltJBmF1KNS3GP6ma4xDBjXRhsd4SgXPrM99GNunq9QHsj5g+JyKbtZh
         Dj0SUhwjnBOQpkRzTDfvjZtbHrLObXqUsGhe4ja+Oi+5k1epZW8lyvyvizyFWtE1WLHP
         VNwvidAr5mT2N5e/huYx/j4MdWFo/HRiKNmWGjxmqM2Y5d+VZEaBLERXIIdWj9aih1lD
         EoQQ==
X-Gm-Message-State: AOAM530bKQcZIefHdTg+8qHP1/AuYrj0PkZA/f5ZrwizuMxsEW8KJiA0
	iznWX+ysiVRSdjHqx6LKlgdijkJphhfDzg==
X-Google-Smtp-Source: 
 ABdhPJzzLZHMbplzNBKPbHpGXkU09BClT91JCHVyzcB2K2kyvLQqp0n2a8czkjfReGuuhRpX+hTpHw==
X-Received: by 2002:a17:90b:4a07:b0:1bf:b159:185 with SMTP id
 kk7-20020a17090b4a0700b001bfb1590185mr1110587pjb.65.1646854893145;
        Wed, 09 Mar 2022 11:41:33 -0800 (PST)
Received: from red (99-14-97-149.lightspeed.frokca.sbcglobal.net.
 [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 1-20020a17090a1a0100b001bf3ba1508fsm3378184pjk.33.2022.03.09.11.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 11:41:32 -0800 (PST)
Received: by red (sSMTP sendmail emulation); Wed, 09 Mar 2022 14:41:30 -0500
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jeremy Puhlman <jpuhlman@mvista.com>
Subject: [meta-oe][PATCH] nspr-native: build correclty with extended
 buildtools.
Date: Wed,  9 Mar 2022 14:41:27 -0500
Message-Id: <20220309194127.725972-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Mar 2022 19:41:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95912

From: Jeremy Puhlman <jpuhlman@mvista.com>

gcc   abstract.o -Xlinker -L../../dist/lib -lplc4 -L../../dist/lib -lnspr4 -lpthread -o abstract
/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__libc_dlsym@GLIBC_PRIVATE'
/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__pthread_unwind@GLIBC_PRIVATE'
/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__libc_dlopen_mode@GLIBC_PRIVATE'
/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__clock_getcpuclockid@GLIBC_PRIVATE'
/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__clock_nanosleep@GLIBC_PRIVATE'
/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__clock_settime@GLIBC_PRIVATE'
/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__clock_getres@GLIBC_PRIVATE'

The linker is not correctly pulling in lrt as needed.

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 meta-oe/recipes-support/nspr/nspr_4.29.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/nspr/nspr_4.29.bb b/meta-oe/recipes-support/nspr/nspr_4.29.bb
index f224bcd34..2717f37bc 100644
--- a/meta-oe/recipes-support/nspr/nspr_4.29.bb
+++ b/meta-oe/recipes-support/nspr/nspr_4.29.bb
@@ -160,6 +160,8 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 # preferred path upstream.
 EXTRA_OECONF += "--includedir=${includedir}/nspr"
 
+EXTRA_OEMAKE:append:class-native = " EXTRA_LIBS='-lpthread -lrt'"
+
 do_compile:prepend() {
 	oe_runmake CROSS_COMPILE=1 CFLAGS="-DXP_UNIX ${BUILD_CFLAGS}" LDFLAGS="" CC="${BUILD_CC}" -C config export
 }
-- 
2.31.1


