Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 411B9C433FE
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 15:27:27 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web08.9767.1634138846474387500
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Oct 2021 08:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Wdma24Hs;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id 21so2040097plo.13
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Oct 2021 08:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EFLNbE42JtVTqIEq2OezPj+LJ+H/zVm8+Qr7LVvSp2w=;
        b=Wdma24HsyuS25MJKOjZO+mQbkeDOfuDSvykc+v76xUJ9Al9BHya3hE2oXFSoUJTbrn
         aprNcNdWGJWeoeYVv5bBBByl6K/SUnfFgPn6vK/lUh2cel97kcAudh7h9OngafP783Kz
         MSzJU5RTMOH4KGly82axfGCKQ1ya/NdQrXMPrw4KJFL/fzGwC+NY1ZdHggEGrQd5ginp
         idWUbnlSSdC0zjGosXm8twIlNabyUAkmECLGtsqTTV2CuGPRpUzYiDfPBg1wMmy8Nv+A
         RWusrNibIhkkampkGHeCIobT1nxCb265EbPRdx2yGH0Kz0KEm5gRLLCsJIGklgVYkMwg
         EeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EFLNbE42JtVTqIEq2OezPj+LJ+H/zVm8+Qr7LVvSp2w=;
        b=jJP+rusFSqSfqvKY+bioFWvUIFKfYaloD6cHnmpA4Jt9PRUNJpYX83rpX9J2qOxeSW
         b0mP+AfMMNlNRSROMQ/RJgwekJEDfOknZJdu2Lq3vUkqava13TavWK4fIT5o8zDE1U0Y
         pmH25Ks7TFxwgegg6f/MNohOQoGVokRSiSjd7bqW8XlBTQ0ueEX7Ul5mbk67Iy4w3+lF
         gJfrpneikydlylE5Jp5Roi7FVpvQhvmskSxmsvmUWXCYAFmsxlI5v23mfdAT2sk9VdRk
         IxQcb6YN2QE7qPCMn9BeO3KYaCqB/E02mTcvapxSFBPFA1baVFAaYCE1qvi5WTvR0t7A
         YzgQ==
X-Gm-Message-State: AOAM532pxvCr95Q+5NajbLsa30FdFtFVepZ3jBt48E7cmORCt4el/2mF
	udYzgHauobLhKx/9ZXHtn8CVEqdFb0+WqA==
X-Google-Smtp-Source: 
 ABdhPJxeMaJWB89Y6pOakirhRGymcoNHdmZGQxhO6kOGeLnnw/GLTjAqiFBjSiOqACFdZxJT/GTQ1g==
X-Received: by 2002:a17:90a:bb13:: with SMTP id
 u19mr14170868pjr.42.1634138845706;
        Wed, 13 Oct 2021 08:27:25 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ba74])
        by smtp.gmail.com with ESMTPSA id
 h4sm14830856pgn.6.2021.10.13.08.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 08:27:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-pybluez: Do not set 2to3
Date: Wed, 13 Oct 2021 08:27:21 -0700
Message-Id: <20211013152721.978756-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013152721.978756-1-raj.khem@gmail.com>
References: <20211013152721.978756-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Oct 2021 15:27:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93281

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pybluez_0.23.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb b/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
index e8d14416f8..cc659ea678 100644
--- a/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
+++ b/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
@@ -11,8 +11,13 @@ SRC_URI[md5sum] = "afbe8429bb82d2c46a3d0f5f4f898f9d"
 SRC_URI[sha256sum] = "c8f04d2e78951eaa9de486b4d49381704e8943d0a6e6e58f55fcd7b8582e90de"
 
 PYPI_PACKAGE = "PyBluez"
+
 inherit pypi setuptools3
 
+do_configure:prepend() {
+   sed -i -e "/use_2to3=True,/d" ${S}/setup.py
+}
+
 RDEPENDS:${PN} += "\
     bluez5 \
     ${PYTHON_PN}-fcntl \
-- 
2.33.0


