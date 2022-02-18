Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E16C43217
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 21:16:14 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.2982.1645218973962862244
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Feb 2022 13:16:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GAujBIZy;
 spf=pass (domain: gmail.com, ip: 209.85.210.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id u16so3277727pfg.12
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Feb 2022 13:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ln0wgWxIVg72qVgnFsuxQXBVqHX1U8/cplvnf7bxA8A=;
        b=GAujBIZyml/+rEp46hJKH4sYJCQ3MqL2u0HYLo3luyfBVFAnGF88Y2n/zfneaY7TxW
         f5zwTqqjktOVZa6nm1F4676SUjfMtOrm2uAzf9FfNC76Lo4r2388jMPHSzLqwAOFebtZ
         9zgoG81DlZ82T8TbgdD+DX1+Q2D2NOa8h3XmvIvkXQqs0QydVPZq3BPf/XGGD5ZE/S3S
         nxJLtmSuyg74Cn8OzpQrE9eK7u8nUSpWYVoHiG3C01u/3J8w7FujIlTnWm3ToFn2hsck
         3o3xTogdpKdRLYgkyvASUg7IntQxDWB2ytW+HAPe9vHhkQYTdJpoxd+fjg0991rU0dGp
         Mz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ln0wgWxIVg72qVgnFsuxQXBVqHX1U8/cplvnf7bxA8A=;
        b=MqPzunXuKKCGNikFtkPYMh6RChKXB+kavJ7sus7DQ+3V7XP7Jl7ITHjoE7rdnC3vwt
         V/2yYGhCSUesCdL1qMn5CafOarhl4H7NQg1A6uyFCKzjwQRNYAKgqdZ2SipEX0b+nksk
         4jvKZs9Xj0Gg8Z9KLPfl5G/kCApsETZn2nCFekw1Z6foSj5USA12tA+DpED7rvrhJHAA
         i3Y9L+rBe7MBNEaSCFvkMv+VbWBxIsZPLz0oSzd594KMTcRh/TzjXXR8p1ktK/NhvX+h
         QxEGU+dARIUWWSD8dDddsoZGfsdFDYHF0vEPA0yqPuc9VbvWoEj3Yzt2A06KfCw3wNcH
         /ZHw==
X-Gm-Message-State: AOAM530GC2T+YVbq3NtunnQx6d8B00lMB4ckzzVIbg8Pi7J3yer4xgab
	XZJr+OnimoLUuyyPezbU1AtV+OrfZvV+qw==
X-Google-Smtp-Source: 
 ABdhPJx43JsFmriFYKigjGI5t/JD6JFdhIvOUDwdzavou18gJSZc/nGEOM3vpC3xRAJcj1qllz4tcw==
X-Received: by 2002:a63:4a48:0:b0:364:402:6b2c with SMTP id
 j8-20020a634a48000000b0036404026b2cmr7867731pgl.292.1645218973141;
        Fri, 18 Feb 2022 13:16:13 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 nu11sm274252pjb.36.2022.02.18.13.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 13:16:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/4] cairomm: Upgrade to 1.16.1
Date: Fri, 18 Feb 2022 13:16:07 -0800
Message-Id: <20220218211608.1625215-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220218211608.1625215-1-raj.khem@gmail.com>
References: <20220218211608.1625215-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Feb 2022 21:16:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95384

Changes are here
https://github.com/freedesktop/cairomm/blob/master/NEWS

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../cairo/{cairomm_1.12.0.bb => cairomm_1.16.1.bb}         | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/cairo/{cairomm_1.12.0.bb => cairomm_1.16.1.bb} (53%)

diff --git a/meta-oe/recipes-graphics/cairo/cairomm_1.12.0.bb b/meta-oe/recipes-graphics/cairo/cairomm_1.16.1.bb
similarity index 53%
rename from meta-oe/recipes-graphics/cairo/cairomm_1.12.0.bb
rename to meta-oe/recipes-graphics/cairo/cairomm_1.16.1.bb
index a697e36cd8..6e8aa47e57 100644
--- a/meta-oe/recipes-graphics/cairo/cairomm_1.12.0.bb
+++ b/meta-oe/recipes-graphics/cairo/cairomm_1.16.1.bb
@@ -3,12 +3,13 @@ SUMMARY = "C++ bindings for Cairo graphics library"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c46bda00ffbb0ba1dac22f8d087f54d9"
 
+GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase
 
-DEPENDS = "cairo libsigc++-2.0"
+DEPENDS += "boost cairo libsigc++-3"
 
-SRC_URI[archive.md5sum] = "c62b476b61bd0abf7e9851f417d73291"
-SRC_URI[archive.sha256sum] = "a54ada8394a86182525c0762e6f50db6b9212a2109280d13ec6a0b29bfd1afe6"
+SRC_URI = "https://www.cairographics.org/releases/${P}.tar.xz"
+SRC_URI[sha256sum] = "6f6060d8e98dd4b8acfee2295fddbdd38cf487c07c26aad8d1a83bb9bff4a2c6"
 
 FILES:${PN}-doc += "${datadir}/devhelp"
 FILES:${PN}-dev += "${libdir}/cairomm-*/"
-- 
2.35.1


