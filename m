Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5887C77B75
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 07:04:40 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.82537.1684134276476254542
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 May 2023 00:04:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=U7cjjMdl;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f42bcf5df1so67432055e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 May 2023 00:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684134275; x=1686726275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mO8G9KfgohMZnUFXv2mXodQwGMjSMwlYvZf/4gnDvpI=;
        b=U7cjjMdlrqz8/qMyKqMcpo42RLoXrnvM7f91PVOd9dl3CqD3hLFE4biVqxuRwfPTB/
         mBBhIXSlg/afKeN8A7kMH3VBr/8r9SN2SMBLU8jAMHL5DcuE9FsFWiFLnws//ph4+mI1
         2NlOa6lNrPWv5GmjdaNi2mfpb8FpAFDJKESpiI/0l6I2cP6RXMQnPA2rFtkNOEkJLLke
         X3SW+Gnjej4967+xYpii/p77RmeoSyINNZt9YliN4mgFy+I/YJyouCBabwRxD/rOSIKT
         mYRKI/nQriuhKD1g3hDb9E32cVnuFscG2eIEr4jPDPFmv31KHJdUoh8Raq8nzbk5DqHQ
         duAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684134275; x=1686726275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mO8G9KfgohMZnUFXv2mXodQwGMjSMwlYvZf/4gnDvpI=;
        b=GFUJZWWQTY3XoRaLl/0ADPLWMbdjcwmomk3SLKWVe7XVQQxxQHFlWhdVT+VNKjtnDM
         WEMtwY0nDftkIUu8l9n/H53jQc30g9kBs2OnAMzYUKzGBMhO8hUMgg/T4YMEz+HKIb13
         1hRil1xpvtnSbcfWOd/56x+jpw+czI/CAwmGd/zbKFLJVRze9qcZGUx3zJWos3bt/OYD
         hZhVyOQHOKe2WLUn9KAA8AaH9tWofyR8ZGj9o/Afffc0jgyj7uNK7Uw4cSL53Jxas15M
         QRw6i2WaGS3xJaYVJdDtTStqnJ7mCrwy/V3UdBxIXTT26sLimbvhhgaHORgxg1IvdLHa
         CSeA==
X-Gm-Message-State: AC+VfDwxxSmH7y0xp6RKWZ70jefO+UfF1dRRh9LRfq386RVhRn4wauIV
	6DOm1UMFJHtYH7CO7GifX2fLZOKkPDY=
X-Google-Smtp-Source: ACHHUZ7mHctsUAJvPAQWCInPWbbruXzqZKTq9iPUtDr3D9jGVjBNzSG5rGDV9d3PsopFPmwO1Fndrg==
X-Received: by 2002:a7b:cd04:0:b0:3f1:9527:8e8a with SMTP id f4-20020a7bcd04000000b003f195278e8amr21081349wmj.21.1684134274498;
        Mon, 15 May 2023 00:04:34 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id n22-20020a7bcbd6000000b003f41bb52834sm26640533wmi.38.2023.05.15.00.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 00:04:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] poppler: add dependency on glib-2.0-native
Date: Mon, 15 May 2023 09:04:30 +0200
Message-Id: <20230515070430.4135398-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 May 2023 07:04:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102595

* in some builds (probably without gobject-introspection-data enabled) it fails to find native glib-mkenums and fails with:
  poppler/23.04.0-r0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file 'poppler/23.04.0-r0/poppler-23.04.0/glib/GLIB2_MKENUMS-NOTFOUND': [Errno 2] No such file or directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/poppler/poppler_23.04.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/poppler/poppler_23.04.0.bb b/meta-oe/recipes-support/poppler/poppler_23.04.0.bb
index 19bdce4d86..099be58a42 100644
--- a/meta-oe/recipes-support/poppler/poppler_23.04.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_23.04.0.bb
@@ -10,7 +10,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            "
 SRC_URI[sha256sum] = "b6d893dc7dcd4138b9e9df59a13c59695e50e80dc5c2cacee0674670693951a1"
 
-DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
+DEPENDS = "fontconfig zlib cairo lcms glib-2.0 glib-2.0-native"
 
 inherit cmake pkgconfig gobject-introspection
 
-- 
2.40.1


