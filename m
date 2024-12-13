Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67083E7717F
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 21:10:39 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web11.5796.1734124238083091143
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Dec 2024 13:10:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-71e163493efso1085786a34.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Dec 2024 13:10:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734124236; x=1734729036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xmQzAVogfMeqJ5EmKXxly5JK2vO4HMj9ZhtRmPJdHpE=;
        b=bGXAuxaB1vCkkRe9upPqLzhgaqWYkbEJVSwffiV0WAHSHu8ZhoO9S4dAKH97ZT1FC+
         fMFCHjQladD8cn6mb1QfVByRAkgL/i5WGOfpf4Ok1NdqbjABGHq/OVSRsu+yhk3Q4DgX
         u17a/QRZnrMgzJ+sdLV2vxee3YGr/zEX3el67XLW3LbXwOs7D/bH+nC5sGhV4J863sjB
         cvewPhO1lSZWsmJUUSMfnTjMb13w4XVzwddDv27/tXxBdO5Fm2giPWKpMTcayfNXnW1f
         i5w9NhX8gT2lfZmxxv9g8GuSV99IFT2aOm/wZkgnLvI+VHzldnlAi5NNRdqmWhg5OPTt
         NMFw==
X-Gm-Message-State: AOJu0YznUrhiiZ8Go3CHakUjZc4JFelzBrWahqIG2jLWppZOGukRzJfK
	HUn/syEar4LBMSAfxyiW0OumAtnBkgDNvl6x0KqV5hiegXPbTGaKxNYH4g==
X-Gm-Gg: ASbGncs00hTwMdUNgtoeKpiB973AvL57AiAPiplZVLvHTpfQ65NOvBX6LMfgXSIad6e
	uQHeVosWXLzBuzB6+oAupkM4GEpvAtiR+1cNiY0IW5qkZdWagtc5sfKkT/kKhFBjLQ+zNc4OzD8
	rBRe+H3kPWgodv5kJt5Y0cd1gGBMiL+q4dYEy4e1lXSeplFq+O9oS3F02d/F8iZXZo5tEEO62pm
	Zx9tXMcyQET5HcYDWs06ebjhFMPkU4ZBMaCm2Gau4uYh+4fNeIRnXfphE4EsFdj5JSvi56K/FSj
	L/bk/Lf/tctZ+9ZWglVO3NoLPA==
X-Google-Smtp-Source: AGHT+IFgueodw6hF54VMwiEDO9apCKkpK1gojiZsDmtDW9qHcbDE47XnZJunIXsOciBgGfUtre5Hag==
X-Received: by 2002:a05:6830:388c:b0:71e:240a:47fe with SMTP id 46e09a7af769-71e3ba33ad3mr2203225a34.19.1734124236358;
        Fri, 13 Dec 2024 13:10:36 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f33a6af78asm103462eaf.5.2024.12.13.13.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 13:10:35 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH] python3-libusb1: rename recipe to reflect the python version and update to use pypi
Date: Fri, 13 Dec 2024 21:10:02 +0000
Message-Id: <20241213211002.2442194-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Dec 2024 21:10:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114314

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python-libusb1_3.1.0.bb => python3-libusb1_3.1.0.bb}    | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python-libusb1_3.1.0.bb => python3-libusb1_3.1.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python-libusb1_3.1.0.bb b/meta-python/recipes-devtools/python/python3-libusb1_3.1.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python-libusb1_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-libusb1_3.1.0.bb
index 96c83b3fa..f3a0147a3 100644
--- a/meta-python/recipes-devtools/python/python-libusb1_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-libusb1_3.1.0.bb
@@ -6,11 +6,8 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c \
 "
 
-SRC_URI = "https://github.com/vpelletier/${BPN}/releases/download/${PV}/libusb1-${PV}.tar.gz"
 SRC_URI[sha256sum] = "4ee9b0a55f8bd0b3ea7017ae919a6c1f439af742c4a4b04543c5fd7af89b828c"
 
-S = "${WORKDIR}/libusb1-${PV}"
-
 RDEPENDS:${PN} = "libusb1"
 
-inherit setuptools3
+inherit setuptools3 pypi
-- 
2.34.1


