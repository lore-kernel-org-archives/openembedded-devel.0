Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web12.4883.1592688033525218777
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Jun 2020 14:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U+j2Co2K;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id k11so14067640ejr.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Jun 2020 14:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=YBiqv+M/mXIRTLlHq9ay7vH9Uf+1mvulas7ejTLvjNM=;
        b=U+j2Co2K/oiZlGxn3DUFcEuOaRvGoXj44POiJ39VWI9wXbt/Ah6aFlxtUI9rvYGJDb
         pfpPDl6pEzlx5QNcXrLxonRHDGGm2L/2isFd4386dNCxSz9yrrenra0aGdAusUmA4wBo
         PnB7QXGwyPhmyvzba3asav+bZzsbrcbIsSYxzo3VulPiQP253t00lIac2kDY1Wftgvxn
         eniOnJT7+hhei03qtthINP2fP5rzo7r+6Z/I+0dBOEHDhW9QcJUzmCjTz85DqkBilfLr
         d8+sFdRd4m+ynZHrBi2JLdLY3ug1X1aFXZ0EOsp1/kjSLjbzjsx3fKY+x1xoeX1hbqZ6
         69KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YBiqv+M/mXIRTLlHq9ay7vH9Uf+1mvulas7ejTLvjNM=;
        b=B4LTinytxSvraSyRHwyZC0LJjNiXPIYFkNRx0tlhr1BN/BTyVhHl+6mbRDMZ9/VMMQ
         2quwoQNvWX/hHTxwzI7LVk/ikBD01DHxaAuWV0nCpak+p8fXhd6LFHNYTWqB3SE47nmc
         5v9yxbRAGby45YK2LtKakDCPImQ2SLXj6f/YLwTi8ypkvrgrMHIrr1QKJ1vU6fAbu43D
         f+zgL8IiupmH2vNB0KTrECd3w422434m0wt2Ixexf2sJz3cXBk/IlDBKNkcqJAxwehvU
         0jcKL9elJ3iv2GSfoNCPE526CIBBhKUTTjOIdzhmsWzruIZSj7HEPWeC7DqDilklG9OT
         EgSw==
X-Gm-Message-State: AOAM532bPwdgfrItYdDEoU7lAovKywzUo/LoqtT3MyHLGYdEowduJL5X
	I2NLtuTs3CMINVQ778QbM7NXYLAjBvGVpQ==
X-Google-Smtp-Source: ABdhPJzo9vCBLMGsI/b3fTX4EXBqv2syo5NUdcrHargjRb9CQbL+ommUYQ8YFQFatCilfA/NxkE/QQ==
X-Received: by 2002:a17:906:7a19:: with SMTP id d25mr9608356ejo.333.1592688031577;
        Sat, 20 Jun 2020 14:20:31 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f07a073c7ed84e0f8e2ef6e.dip0.t-ipconnect.de. [2003:f0:7f07:a073:c7ed:84e0:f8e2:ef6e])
        by smtp.gmail.com with ESMTPSA id f10sm2928010edx.5.2020.06.20.14.20.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 14:20:31 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/4] openh264: upgrade 2.1.0 -> 2.1.1
Date: Sat, 20 Jun 2020 23:20:20 +0200
Message-Id: <20200620212022.82066-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200620212022.82066-1-schnitzeltony@gmail.com>
References: <20200620212022.82066-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From [1]
* release x86 and x64 libraries for android platform
* Bug fixes

[1] https://github.com/cisco/openh264/releases

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../openh264/{openh264_2.1.0.bb => openh264_2.1.1.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/openh264/{openh264_2.1.0.bb => openh264_2.1.1.bb} (94%)

diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264_2.1.0.bb b/meta-multimedia/recipes-multimedia/openh264/openh264_2.1.1.bb
similarity index 94%
rename from meta-multimedia/recipes-multimedia/openh264/openh264_2.1.0.bb
rename to meta-multimedia/recipes-multimedia/openh264/openh264_2.1.1.bb
index 3c65ef247..3988cfff8 100644
--- a/meta-multimedia/recipes-multimedia/openh264/openh264_2.1.0.bb
+++ b/meta-multimedia/recipes-multimedia/openh264/openh264_2.1.1.bb
@@ -11,8 +11,8 @@ LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bb6d3771da6a07d33fd50d4d9aa73bcf"
 
 S = "${WORKDIR}/git"
-SRCREV = "a60e28efe227ea8ea760b1e29a8943e371ebe4b3"
-BRANCH = "openh264v2.1.0"
+SRCREV = "50a1fcf70fafe962c526749991cb4646406933ba"
+BRANCH = "openh264v2.1.1"
 SRC_URI = "git://github.com/cisco/openh264.git;protocol=https;branch=${BRANCH} \
            file://0001-Makefile-Use-cp-options-to-preserve-file-mode.patch \
            "
-- 
2.26.2

