Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF2DFC4451B
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 19:30:32 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.598.1784399323199488619
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Jul 2026 11:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gDS6PGUA;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: nguyenthaithuanalg@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-848643382fcso10245932b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Jul 2026 11:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784399322; x=1785004122; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F+0VVz4XX6hPwcMN1JLT7rOt1VftIl36qsfypqbhi5Y=;
        b=gDS6PGUAQXjJtnNr7jvjjJ3abb22OKX9rm9JV1O+NA/JN/Tm4Enu8mLtovlmLwL6oM
         ek+h3qeMDI9XDIhWUGQAI+K9ZQG0TQ4BYLhmnj6HBZSKIdet4+ZINlpKVRHD2YZfOu/F
         2T4mEFVK5dsSGXakrUvxELK+nVyDY7deNuY1zF8gLJvwlj/akr0yU+F8omUoxEMU2z6N
         TREn/JR0Xk00tff++gRNPwjiEmpuJCtm6oX6KKaRKg9DMkcVFju2Uju7/vj2QiWF2Ccb
         fF8SdANaECOyjsh/syQFoRyYi3cJ3p2CYoYiu8re26MB6zN6LCTZGQLKaquXwE4kuR3l
         6JPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784399322; x=1785004122;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F+0VVz4XX6hPwcMN1JLT7rOt1VftIl36qsfypqbhi5Y=;
        b=jLCFMbVcDw3epot6QoFN5HXUuuBt4uFJ22RcWAWWz8t/PRTL1KY/rxSA4xFyPeI/Jw
         lGEnOFzFas2N8LHs2FIvYZGL0qvRTkVvub/XNDFqEBcFmUjA663ESXT2z35tgsCrOVkQ
         FUjMNyIqZ1IRk6KGNGloZo+kEfhH+0qbIpqo5ivem3CkLwTysv0W+jdWsiImZM6j4eZB
         SXIHnrJpq2Zq/PP3flVQO1LSww/N4xjlVy2OQs75gWfWpTlvWc6D+1oVHGjKj99772rJ
         iv6h4OcKovt2knadULzK3NH8f/WCkkqjvDO+sIyrSLKyLWecmDokf+PJYpRl12lzFsi0
         4cMg==
X-Gm-Message-State: AOJu0YzDLx1ydAc9oBWvkdvSSql4mgipvXvYBVZAHqY4BlHzND6E+Kve
	S2D2XaF24BhyXf7d+SAWSPbIC+PwSkM/PelgSB2vGGw2MJiXoy9+L+4wT/HBAQ==
X-Gm-Gg: AfdE7cn6hB23U2l8LXWqwgWsdCqRYjr4Menyn+6Nno8VvFIbrAv5tgjkIzlnhp0gf6M
	XKb6wJ+ttcRWuJA8YdHaFeIY3XNsdNyOqs6NQNC2icO9yLcWPoBG/I+rfYwAHi/jqX1Uv9kyc5m
	HMZg1XTTiAKhzYvTzStLWnj6nkJLU4MXnr/odrKKTsMZbdt/p4R1/pgAL4sgsZjSZqCtSD+/5F/
	PRIH8tLTKi4OljNV9vhFlqFDWdIfv3JexhoBs5dIon5gMIQIuMwNOMUAZUaVvSEyG+iYN9PUvrB
	j4Gh6r4kAS0sRCzBag4BfYG2hmB28cHpCnJYa+dQgG4VtaqlEmwB/4738kASQqi/a2X/Mbdgp9x
	XnCo1mVKvlXcCDUuuNTjkLlE6IWdnTazvSQIYx3MDyZ4RpQQAEyRn0BBOIcxi74qVD3qW7RK1Zd
	V4OI7h54rR91RfuqLsdmSlR/XDzm8JMqyj1w==
X-Received: by 2002:a05:6a00:4005:b0:848:6c1c:17c0 with SMTP id d2e1a72fcca58-84c29312a6dmr8286877b3a.19.1784399322456;
        Sat, 18 Jul 2026 11:28:42 -0700 (PDT)
Received: from thuannt-Z87M-D3H.. ([42.113.218.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c30fb62fesm2501492b3a.29.2026.07.18.11.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 11:28:41 -0700 (PDT)
From: =?UTF-8?B?VGh14bqtbiBOZ3V54buFbi1UaMOhaQ==?= <nguyenthaithuanalg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Thu=E1=BA=ADn=20Nguy=E1=BB=85n-Th=C3=A1i?= <nguyenthaithuanalg@gmail.com>
Subject: [meta-oe][PATCH] Edit SRC_URI: add ";tag=v${PV}"
Date: Sun, 19 Jul 2026 01:28:36 +0700
Message-ID: <20260718182836.405978-1-nguyenthaithuanalg@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Jul 2026 19:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128258

Signed-off-by: Thuận Nguyễn-Thái <nguyenthaithuanalg@gmail.com>
---
 meta-oe/recipes-support/libsimplelog/libsimplelog_1.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libsimplelog/libsimplelog_1.1.0.bb b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.1.0.bb
index fbfa926166..53c13d726b 100644
--- a/meta-oe/recipes-support/libsimplelog/libsimplelog_1.1.0.bb
+++ b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.1.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/thuanalg/simplelog-topic"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=594fdc3cb85f0b684cf5d7b332a741be"
 
-SRC_URI = "git://github.com/thuanalg/simplelog-topic.git;branch=main;protocol=https;"
+SRC_URI = "git://github.com/thuanalg/simplelog-topic.git;branch=main;protocol=https;tag=v${PV}"
 
 SRCREV = "151e83902ca9755bcd285791d2f49de6fc30bfe6"
 
-- 
2.43.0


