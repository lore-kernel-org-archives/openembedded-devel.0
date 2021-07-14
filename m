Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web08.9280.1626279955157846485
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jul 2021 09:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CHdCSUR0;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id y4so2481093pfi.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jul 2021 09:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QT7MuAGrvZwLThnzLByKQ6aokh7Ygt4mPElY6FT1G8I=;
        b=CHdCSUR0uxAEiQ7QIct6biFq2gUB0MIl4ae4Tw8p4b2dEeaw8ihCIvhWvqCH11L/M1
         O6HoMBCsOarPSsb0jqvABVgdRVg6B+0CD1pQ77sbDZnLsPj8WN56efyloJbwIETbxvfV
         w93MbJKAb0f9mAswN2G+/bur/bN4KcFhsGAVyOFNGMjXZ3N6SdQESegU7cUUVLYR0hXG
         QQhwv0Z9muH1r9Eh6jMAwPqyEq6f3V23+yrgPxqMlcrlWEDdjiUq6mWz/wm+6wwxh0Bk
         9JYVFBzVII+kxlZoOeIYaelwqauiSTEuVdXw1UMAoauYbC6EnwJ6Hf3Zq0s1FJzZRD53
         hqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QT7MuAGrvZwLThnzLByKQ6aokh7Ygt4mPElY6FT1G8I=;
        b=ZgNZT5/Nw+hbvjfRDjsGiIlILgam67Va2sXiE2D55h00FUF+CL1f7amlVs1HkNdrbJ
         0m1Q5YZzoa5PYZYoSa/oiHyoUZyF/X5SBbQ54EI7+jWOqxe0JBh5xX+1F1nggrg0sepB
         PjlLef1PQI5uvCqEMDnicuU4CX32F75Yxkm5AInGypsDllsMXjPOClbLMtD/gPoY/Qz+
         vJrQSJjXWAaoBqkJk7bi2SW3kNjGomEqivdRGbHdGzN2rPIobLfPNvYZ8LBpVYiAGX0d
         AiSCwzGC7m9EuCZw9wBHVvCioQ5rde6Y62UAaCKd0d/WkSTo5+PDvYWgSOqafoC65LgZ
         OveA==
X-Gm-Message-State: AOAM532l7X8g5h+sOzcU6HpsnyYRKCPX3vSdYcMpdGvfsX8tQhTbmGZw
	tJ4HMsW6pU1tkcS5UTleyddwQrMqaeev8Q==
X-Google-Smtp-Source: ABdhPJx6/gZadTm3oSicQIcmxMdmc1hXTAef7Hk7gmL2TeWsXqFrMPLoLvzscEFF7ENlt7ajTFo+Tg==
X-Received: by 2002:a63:ee11:: with SMTP id e17mr10392334pgi.323.1626279954526;
        Wed, 14 Jul 2021 09:25:54 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::5593])
        by smtp.gmail.com with ESMTPSA id js5sm2610533pjb.40.2021.07.14.09.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 09:25:54 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-pyusb: Add missing runtime dependency on libusb1
Date: Wed, 14 Jul 2021 09:25:50 -0700
Message-Id: <20210714162550.3153376-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210714162550.3153376-1-raj.khem@gmail.com>
References: <20210714162550.3153376-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch as suggested from [1]

[1] https://github.com/openembedded/meta-openembedded/issues/394
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyusb_1.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyusb_1.2.0.bb b/meta-python/recipes-devtools/python/python3-pyusb_1.2.0.bb
index 06f7c1c82b..777aa2bc79 100644
--- a/meta-python/recipes-devtools/python/python3-pyusb_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyusb_1.2.0.bb
@@ -13,4 +13,6 @@ SRC_URI[sha256sum] = "d68597d2cf7df766bdf816b1a337b72ab8233c19825e170ae18714f16b

 inherit pypi setuptools3

+RDEPENDS_${PN} += "libusb1"
+
 BBCLASSEXTEND = "native nativesdk"
--
2.32.0
