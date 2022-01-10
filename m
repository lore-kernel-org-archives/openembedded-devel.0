Return-Path: <bhargavthriler@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8842AC433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 15:26:40 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.33101.1641828400037904079
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jan 2022 07:26:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lYbS3Vn4;
 spf=pass (domain: gmail.com, ip: 209.85.216.47,
 mailfrom: bhargavthriler@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id
 n30-20020a17090a5aa100b001b2b6509685so287114pji.3
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jan 2022 07:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XtruWaZ6SPg9DhX4Bnb/1IUnGp6dB0bVynWaL9oS3NA=;
        b=lYbS3Vn4yHnwbadAFSPQwAtmCuCte+c7gwm/ua/E7bspF2vJ/YMC1uSD1YbmySIbtm
         TR+Qqm/dAzTM8PWYtVzUeOd5zD3O1RIBMvdMXz6oSzZpmyyucxtCUpKAG4r88p3Y8+CZ
         CWlQRMkILdzFxm04RZQI98gfXUlnqooYjIEXkbpZ5QQ5F0mExt8Hq7eWTwHWfbJzPhgL
         kuJg8Pqc8s9pBIQFEEiGmGCyHcJJVbrB+OMnK39czpH7LMZB2gwf6Q8sBSv6QBXMAwlK
         SvJrXgYL38Z4NJVKauWIdNMojyS/CTsVviJCICDH6c4tlskoFMHORFSkxguWo/oUxgNc
         A2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XtruWaZ6SPg9DhX4Bnb/1IUnGp6dB0bVynWaL9oS3NA=;
        b=Ya645uVa880nqvAC2qmrasH+IbGJqG68KNLKnMw28MyjroyZpozI/4OUE232wudiWL
         qVwxEbzs6b3gQgzICEI8bWvU522/q6kT4m9Tibl4DYPi2ETKVqxrmmbZfd3S1m9Wlydj
         lPJ6gJS9TvZMK+PUKj0I3J41xofgxbl7Fere5jdqJrKx1c79l/ZlVkoMv3cNGoF5GfLD
         8B9kKoOUHS2dBwfCnVE40h4YNIvSkfxaO8hvlwT3smqzw+byzU5nRML4BUKn4Z1lRf0/
         Fqr30yeDiRsAB963sG5LE8AYXhrIxRCSdkjGPKVrSYgyu7F3I/uVlCpRwNVvysSJHtZ/
         so5g==
X-Gm-Message-State: AOAM530/StCwowb+Zk/oK4uqnrPPjXiESZQIJeMGW4XwYALI8bhxZX6E
	MwBOcwjOJK/MmfawzMSN/1HkUjwIP+OC
X-Google-Smtp-Source: 
 ABdhPJwmRfH6qo2WwsvMNYNUn4It1OaD5ImMYkTK7ysbGHG2zLyi+liCWS2EC6B4vkoO5cRN4ILm9g==
X-Received: by 2002:a62:cd02:0:b0:4bd:8f59:dc4e with SMTP id
 o2-20020a62cd02000000b004bd8f59dc4emr246639pfg.64.1641828399376;
        Mon, 10 Jan 2022 07:26:39 -0800 (PST)
Received: from localhost.localdomain ([49.207.212.74])
        by smtp.gmail.com with ESMTPSA id
 bo15sm2920239pjb.16.2022.01.10.07.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 07:26:39 -0800 (PST)
From: Bhargav Das <bhargavthriler@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Bhargav Das <bhargavthriler@gmail.com>
Subject: [meta-python][PATCH] python3-colorzero: add recipe for python
 colorzero
Date: Mon, 10 Jan 2022 20:56:27 +0530
Message-Id: <20220110152627.57765-1-bhargavthriler@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jan 2022 15:26:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94717

colorzero is a color manipulation library for Python

Signed-off-by: Bhargav Das <bhargavthriler@gmail.com>
---
 .../python/python3-colorzero_2.0.bb              | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-colorzero_2.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-colorzero_2.0.bb b/meta-python/recipes-devtools/python/python3-colorzero_2.0.bb
new file mode 100644
index 000000000..1a331d13f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-colorzero_2.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "colorzero is a color manipulation library for Python"
+DESCRIPTION = "colorzero is a color manipulation library for Python \
+(yes, another one) which aims to be reasonably simple to use and \
+"pythonic" in nature."
+HOMEPAGE = " https://github.com/waveform80/colorzero "
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ae6c62710c0646f3c60d1ad812ea9bf9"
+
+RDEPENDS:${PN} = "python3-image"
+
+SRC_URI[sha256sum] = "e7d5a5c26cd0dc37b164ebefc609f388de24f8593b659191e12d85f8f9d5eb58"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "colorzero"
-- 
2.25.1


