Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BEDFC3601B
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 18:58:05 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.1851.1743533881454631807
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Apr 2025 11:58:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Uw5Wr5rM;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so5011232f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 11:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743533880; x=1744138680; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZSY12U6fx2StlK7MrTnbHSvcU4pt40GkthotT2WaQfc=;
        b=Uw5Wr5rMFEUm94FTN4s3yePtptN3dHjV2aA50xSLT/W3pwWHbW1fXCXf/FkEu/qePJ
         5n+SwfYoiTmvisW9E0syiW3GjBRvb3b2di9GzJQUgod45KAJp0qMSYAHNQApInZEG6al
         LCv3HIpWKlZMWXseebIkD2gAYMoaNoQ5nftwKLhfoYkyYzZhBbsh87G/thnVndJ1QQRG
         b3tyidk0nxAzDOZIs2Ug+hRq5bL+Z070Yk6GCt74Z3Yp1JUXYg3RK/RT1R26Of+Ovtzy
         PYeUnBoIA3nOcpFxjn3fuViH8/yGGhWyWs/Dk/4OGkIpkDGw5pRZ92/il7thaWW/Pa2D
         zVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743533880; x=1744138680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZSY12U6fx2StlK7MrTnbHSvcU4pt40GkthotT2WaQfc=;
        b=b+Mk70uVLXZvh+OWfPxsJFo1JdWwGPQxqN/qipzpYwSl8MNXcgl/nbII7Kpb+io0Xd
         /nj+Dwkm6esr8RzkJuCSScCJwDn7y3mhOIzAfj6unop/3ZjLySSvtgMcMkh2hnN79sND
         S5ZHYbxoZSKW8DTZTA/m3yKUDvhlZPqB4bL8qOpj1TgDzvlWhT4Zkl29qYUL3CObunF4
         siGfWI4Q32kY3mv4yVi8fgSdKHcWIfGdIYnIBfxsNwxuuEzmA2LR0EsntMor8A2ZlShB
         4EzrF2RAHrYa0PrUPDiWEF1ZLnvMxriKb61BPhPCWlCV2V0uyRTgi8H+KHHLQSpNSd/I
         yR3w==
X-Gm-Message-State: AOJu0YxBLgXDbslEoFBwRgbAZl6mWetPK1zqL2N8Wpt6SXnvWCJBDBhP
	tvbtwA1J1Jl3dSrjKa5JOf/wxkL0FX/lgSVDxIulzwz/CttSrCx1MoH4Yg==
X-Gm-Gg: ASbGncuZni4ki7qGJmtzm6QuHZjltV/lENczEqXBujWtekErBlkscsuivVFZicfroFO
	8FqGKGRyWzQYr0Rf8Wn8HusfDda2AOS/kRBM6BZfzLs2GEX2NMl3RUWt2TaOGijVjnQ2W0Tj4T4
	OTLzjNOGBFtYlV4v+Dxq+SQMU8xY1apQcTczvYIG9Y16966ihwRpV4vFF0lyKNOQRtvAsxUEVB1
	fS4zwVObmm4ItMbDLNgKnGkjqECkT+un3BSuLEUf9xDnmTZITRpko8Pfm6x+5SaFAvklptZGHj+
	BGExoQv33cgruyubFKiXFvcd8Y8xYd1qrTJkREFUJfAKeooerbnDg/8LZMh5MgB5xssIRC6W5+z
	HPfP05NvSRVrEBivOQscEgz2e/7bUnRw/Dq9voIdle6/G/CuwEcI=
X-Google-Smtp-Source: AGHT+IGk/+YuEhXsWqdNdylyMMA5xRtbatxNMl/oUaG1tV9NmTXNn4XJtn0Fgbs7q4ySN52mXJoq3w==
X-Received: by 2002:a5d:588a:0:b0:394:ef93:9afc with SMTP id ffacd0b85a97d-39c120dc1aamr10916856f8f.18.1743533879598;
        Tue, 01 Apr 2025 11:57:59 -0700 (PDT)
Received: from localhost.localdomain (ptr-fij45qxtdobqrxrcewr.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:6021:e9a4:5aa0:257b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a4351sm15101202f8f.98.2025.04.01.11.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 11:57:59 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH 4/4] python3-mdit-py-plugins: new recipe vesion 0.4.2
Date: Tue,  1 Apr 2025 20:57:18 +0200
Message-Id: <20250401185718.2447415-4-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250401185718.2447415-1-jan.vermaete@gmail.com>
References: <20250401185718.2447415-1-jan.vermaete@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 18:58:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116487

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../python/python3-mdit-py-plugins_0.4.2.bb        | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.4.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.4.2.bb b/meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.4.2.bb
new file mode 100644
index 0000000000..f83543d320
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.4.2.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Collection of plugins for markdown-it-py"
+HOMEPAGE = "https://github.com/executablebooks/mdit-py-plugins"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a38a1697260a7ad7bf29f44b362db1fc"
+
+SRC_URI[sha256sum] = "5f2cd1fdb606ddf152d37ec30e46101a60512bc0e5fa1a7002c36647b09e26b5"
+
+inherit pypi python_flit_core
+
+RDEPENDS:${PN} += "python3-markdown-it-py"
+
+PYPI_PACKAGE = "mdit-py-plugins"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


