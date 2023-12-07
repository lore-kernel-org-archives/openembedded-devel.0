Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE3DEC4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 07:48:54 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.78514.1701935334257895187
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Dec 2023 23:48:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l3/D18CX;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40c29f7b068so3592995e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 23:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701935332; x=1702540132; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OIlzEG4novZFyRotxH/qI+Y/ledrSy/tfSRY5fGZFb0=;
        b=l3/D18CX2ovR20s7LyPijff5WBiFgppca5TbWbHZQXmS5el2VuLUsvOWu+juoliovc
         wlf6K6kfClXb2w65fgXjICZu2UH9X3jMcZozZgWYUBDqrLr2qpd2N1cR7piYaxp44VCZ
         5LgpLerq3YI51rv94PLQZbslujYQIgjhLfN1V1Yh8kci3ZV3McuGZOBbUAMiaONPISD6
         R2CHL+k1PNVH+qa7ANm0yNctss2BSYBst/mxxHPFTLBNIb1D9lAPU0Dx1RSktNBylpMT
         1IB8+SjTCs6iwf/48eGAOCfIhFLl+s8+kX8eWHZjSLEykxrCrLCrAU3/LIcQ5IrA1aaF
         CI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701935332; x=1702540132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OIlzEG4novZFyRotxH/qI+Y/ledrSy/tfSRY5fGZFb0=;
        b=u/M6QGkzO3SSgyok3mTBI0oZfd/a/iC9aaErTTSJlSQNS8lLPK9VgTHrlLEd8aMbRa
         g1buEg04BfVoJ91FUUvZaOU5WXEQtIXNuSVWyBOvPWsp5IQ1SUfO+INYu6K92gdtmBeW
         oFzjj7FYwvzZ9CR7Qxlkxthfs6HFJM29SR8mQUbju/Oifl13QgPm+1r9fneEv06ixfh3
         ij99BQlWHnt2VZSNol+fAzPSumTIzqH4tKXSbk0r2Oiv4HVsyW9lx4wI2ATe9AvPegaK
         mAxpoDtmLyo3mjf51O8WiS/zPV36pfvGEBYAwTFfLpVXRojSounqfBkrblS1DdHwL+19
         Xfrw==
X-Gm-Message-State: AOJu0Yy6q382tk0r6Al+WGFgdFIcVjibI82Z03Yi94rKps14uFikny8C
	aJz54ponOgP3gJEP+JTShX4D4zS/Zgdv5g==
X-Google-Smtp-Source: AGHT+IH7IJuiLuZvtAmVbdYh0/+4z+cft2r5ArijdeBwD1RGhVWuOvSIOJUm0VXD3Xsx2vvAnkDTZw==
X-Received: by 2002:a05:600c:3590:b0:40c:2b7b:65ad with SMTP id p16-20020a05600c359000b0040c2b7b65admr144434wmq.66.1701935331919;
        Wed, 06 Dec 2023 23:48:51 -0800 (PST)
Received: from localhost.localdomain ([176.33.71.251])
        by smtp.gmail.com with ESMTPSA id g10-20020a05600c4eca00b0040c08567bbfsm961792wmq.17.2023.12.06.23.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 23:48:51 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] xorg-docs: add recipe
Date: Thu,  7 Dec 2023 10:48:48 +0300
Message-Id: <20231207074848.18738-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 07:48:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107271

Provides miscellaneous documentation for the X Window System that doesn't better fit into other packages.
The preferred documentation format for these documents is DocBook XML.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-oe/recipes-graphics/xorg-doc/xorg-docs_1.7.2.bb | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-doc/xorg-docs_1.7.2.bb

diff --git a/meta-oe/recipes-graphics/xorg-doc/xorg-docs_1.7.2.bb b/meta-oe/recipes-graphics/xorg-doc/xorg-docs_1.7.2.bb
new file mode 100644
index 000000000..4cef981bc
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-doc/xorg-docs_1.7.2.bb
@@ -0,0 +1,7 @@
+require xorg-doc-common.inc
+
+SUMMARY = "Documentation for the X Window System"
+
+LIC_FILES_CHKSUM = "file://general/License.xml;md5=f2677c20a4066714e233e9bbd8659aa2"
+
+SRC_URI[sha256sum] = "2391b8af472626c12d3c3814b5e7a0ea43c3a96eda94255b7ed8bdff0fbf08e3"
-- 
2.25.1


