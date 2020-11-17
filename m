Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web08.16256.1605654252096396254
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2020 15:04:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Sko6pkU4;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id j19so10230658pgg.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2020 15:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7rviuvInuKIo9ewnV2vCrEIIAXvVcJ8Oe0P+LOT3dYU=;
        b=Sko6pkU4+wd6mrcLaMToGj9q/iKzazrG4vHiU0MyX60UIFUAxnP9gRp2yZq71FpUlh
         cjouIoa/u4VksLwVspUR6dnQF4ElS73TI9PKSLvTgVmZlxa1VGWk2ASnUaG0EnKk9PlY
         N7fI7p2IOYFQZTKyvDo70pIC6KeYvTGiVEQG8hzekhRBVZgElLbuuwbiGlOp3TcdkZI9
         PA2KHjnn6E0pc2+x3o0syQBYmJ6vjFae2PLCJ82IshMaq75ux7I1d4BCctwNIZMBuIIu
         SC6/0OB40rOXM1lEiOpKDpXNU8PTFkqKv9RlVCMPdEor9pXNmbBIzVk3XzrSg/2XqVIk
         CgDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7rviuvInuKIo9ewnV2vCrEIIAXvVcJ8Oe0P+LOT3dYU=;
        b=r5sSfrMrM9hkCKHosJilCvv0JsA1X7idnV5RouGt+sg1PUDxIQftVeazUpME3YlLf7
         K90jsJ/n6pir7GzkAE2skMZQ+SV1/tYQDpUbhMW7jgbXoR4divCnDpsC0okezGJAy+6A
         cnGzY2EjIHQkPYEo93R9aHalRIcDVwdW/IvAjRVbAfKeRN08fTMU5PyXV1RW3ZOZMWvd
         4qfTvuzwIJKUr6kFfz4qYFqrm8nT8b6+LcSxcmoN9yQWHwlHQZw4sBRbxtC3IZBmfpUo
         maaQQLIkXfqc7q/uicDeD3WNbUI5kqFGDMZuUKnVSbf+XJlUcFXGU6WO4avdcJsQ6U8g
         gozg==
X-Gm-Message-State: AOAM53105Y7kubNPu2QBvm6c7AZuKm+iPExKPKQAeJZoBeKlIy8Q02bJ
	Vo4QJ5xCVQMRsHKCaNj20ZpYBFOfvbU2nw==
X-Google-Smtp-Source: ABdhPJxRSO4mU++SrecObgYGQqYsvjp4LPdlmkgjGprDLjtVRuJJf4Vj9qjlH15VclkNuzz3oxDMhQ==
X-Received: by 2002:a05:6a00:212b:b029:18b:ad77:1a27 with SMTP id n11-20020a056a00212bb029018bad771a27mr1526051pfj.40.1605654251434;
        Tue, 17 Nov 2020 15:04:11 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4611])
        by smtp.gmail.com with ESMTPSA id t21sm133587pjr.42.2020.11.17.15.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 15:04:10 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "hasan.men" <hasan.men@bosphorusiss.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 5/5] python3-jsonpath-rw: Add recipe for v1.4.0
Date: Tue, 17 Nov 2020 15:04:04 -0800
Message-Id: <20201117230404.880724-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201117230404.880724-1-raj.khem@gmail.com>
References: <20201117230404.880724-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "hasan.men" <hasan.men@bosphorusiss.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-jsonpath-rw_1.4.0.bb              | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb b/meta-python/recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb
new file mode 100644
index 0000000000..54e1b646d5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "A robust and significantly extended implementation of JSONPath for Python"
+HOMEPAGE = "https://github.com/kennknowles/python-jsonpath-rw"
+SECTION = "devel/python"
+LICENSE = "BSD+"
+LIC_FILES_CHKSUM = "file://README.rst;md5=02384665f821c394981e0dd1faec9a7d"
+
+SRC_URI[md5sum] = "3a807e05c2c12158fc6bb0a402fd5778"
+SRC_URI[sha256sum] = "05c471281c45ae113f6103d1268ec7a4831a2e96aa80de45edc89b11fac4fbec"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " python3-decorator"
-- 
2.29.2

