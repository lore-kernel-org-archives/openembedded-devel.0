Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D4CECD128A
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 11:39:46 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.15655.1712835577062678789
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Apr 2024 04:39:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XgOL3xcy;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-416b5f6813cso25586885e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Apr 2024 04:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712835575; x=1713440375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BNLy+/lVs9+d9S0EWOSy/w9jyvcwUcTCgrZPL9e6qyg=;
        b=XgOL3xcyK+4EmFmKxRf8RGleX/Gi7sTQzXiHpmRU+bizmcemiRpHm2EDTPUoZdA0NJ
         H0vzwW/HsdvHZQqTPi8BcF+DTafhvoJQpKaTOl2+u+UXA5t/Bbvr1AOAyO2YDRdo04H0
         YE8IPdgbZh4DY0iu8hFDrBOrLDDrEJIfHdMiJlTsn/vM4DDwG5VGR1cly1FSeC9b9MqK
         7jopj2/SrQEpw7ObjjbOEKdnQpAz04Hj2XzweTQe+oAX/rWmOOhqV5lWB8w69H43pFig
         cmsygxqrptArR5TF/MurFevpx74fZCjqvr4zAfUMbD8OnmABZTq8ZPvhP3PFftvkEUBV
         MRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712835575; x=1713440375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BNLy+/lVs9+d9S0EWOSy/w9jyvcwUcTCgrZPL9e6qyg=;
        b=Epn79kXJAveW1j16iTSHu9NsRbmEpvd5JFhXpPFttYQPivoW7jrcysmzm7PpH7U3Hm
         Vonum9s/J1RhpPcQQCUpjKGY4wcglt3ilHQCHo+NWOm5G36nkKiNNL19JGIOtn+XYx5d
         b6es7/xYXotQng0YzNcYIlVwYJf3TWXszLbftT8eX/TSRwobcTX7xifrALrSpqG3BKN4
         wLg65RA/ohY7Ns598F+8y6iJdhcQGezA94jXhzYdk0YrxvcC72JiXXj8je50mqXxRy3Q
         amXza8gyHdUqzRIIJZQ35bEEA0IRyC/tso0igpgDFBtCwpmY5ZF7gAux9NrDE1+TQpNx
         YuIA==
X-Gm-Message-State: AOJu0YylVHeUQp9E+vCbS+rNdSF6VfQqw6wmOqWMrweKaeuwOPXRiw+u
	1v5UFJAqFJ2ZkU8lDDOJbizL0Bi+IDXsfm98RZMbLNgPGDeCJJth8NsalQ==
X-Google-Smtp-Source: AGHT+IF7NNSIzk0H3xz+3KZt/RgeHv1Zy8ISsBI2vHXOKC9aIUvAOk5xYAlcxsBn/caz0tNoIxzavA==
X-Received: by 2002:a05:6000:188:b0:346:286b:b64 with SMTP id p8-20020a056000018800b00346286b0b64mr4375084wrx.69.1712835574986;
        Thu, 11 Apr 2024 04:39:34 -0700 (PDT)
Received: from localhost.localdomain ([176.33.68.217])
        by smtp.gmail.com with ESMTPSA id e34-20020a5d5962000000b00341c6440c36sm1581033wri.74.2024.04.11.04.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 04:39:34 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-flexcache: add missing runtime dependencies
Date: Thu, 11 Apr 2024 14:39:31 +0300
Message-Id: <20240411113931.224051-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Apr 2024 11:39:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109920

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-devtools/python/python3-flexcache_0.3.bb      | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-flexcache_0.3.bb b/meta-python/recipes-devtools/python/python3-flexcache_0.3.bb
index 165783c9f..1bee77402 100644
--- a/meta-python/recipes-devtools/python/python3-flexcache_0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-flexcache_0.3.bb
@@ -22,4 +22,10 @@ do_install_ptest() {
         cp -rf ${S}/flexcache/testsuite/* ${D}${PTEST_PATH}/testsuite/
 }
 
-RDEPENDS:${PN} = "python3-typing-extensions"
+RDEPENDS:${PN} += " \
+	python3-compression \
+	python3-email \
+	python3-json \
+	python3-pickle \
+	python3-typing-extensions \
+"
-- 
2.25.1


