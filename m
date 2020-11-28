Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web12.36765.1606592846906422405
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Nov 2020 11:47:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GHvr0c9N;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id w16so7012526pga.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Nov 2020 11:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fFmpRB5JJpzzr8O4xwEiD2X5NZ0U3fZsvNifvrlBL24=;
        b=GHvr0c9N3g4kZr2x0jdIt4dsooE7Wca7APFrwNw0RCeMnFBBlgE+eWBiwyqXTjJZfz
         wzidX5mVfeKYwQnYhzjAPJREKa6wg3faxxLy2f7qaPLOriy3vPhWK/71h9gCqjcujojA
         0I7RI0rh4t9W1x/1y/Z07RKUvHwCYXGecFOsd7iO58OQksvzKzmUCi9vdspQQb4S1OGH
         iZ25oYBWMdeZxwh4a7MDmZQsJEGU7VElGL4GyAk/WZ8MG+OYVFokoKwZL8g5nyzfwrAR
         gzGpcG5iA/GMHhvvPPL1YTm3vemd9ZOK6C2R02XpdTvwBvn7sAQU2uEHc7Hh16kfbPv2
         QANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fFmpRB5JJpzzr8O4xwEiD2X5NZ0U3fZsvNifvrlBL24=;
        b=qvHQGUb1gzfDDrGDPm4Y3BNmsdf6vbSkrSdHXtPXaCQGOXlJFiE5lqKHf4wu9n60Up
         pMamVdJAyZrDzr7MyE/d2SaEqe/87PvF4mFRRlbklfCpcwu5pVQACNWJ9HlGg2tWkZWn
         MVxpj9gaqymjloN/MGSyuCJqX0NAZH0ReZIuuYTbyzzBhpmPYJOlOM8dXmHoYZfunZfZ
         Vv4GrIqA43KVCCbchAfyNTzdjWkwNiV4rGNHV1FygE/gCmO2J21/upoIWKSJ48DbCugp
         pGKhQ/gR8h8aXZjeH1gxIUE+F0j6MWwjEBrweRD+MaxXmlVxicJM/vExP80FTAAHUcSm
         gblw==
X-Gm-Message-State: AOAM531jjYxNxmk3vWn6OK9ccN+pUouyRE7wdy368VWvBd1bmqZW0PQU
	3Cj98mRNXLVSjKVrB+9vUBq5PbZPIfUNkg==
X-Google-Smtp-Source: ABdhPJyA4QSev/6yyAhXU8bA9Gh03idaIS/D9AOqwIN5gRJYXXuGb6YO7il12weAT14UBCyWJXPuuw==
X-Received: by 2002:a17:90a:c687:: with SMTP id n7mr17499737pjt.75.1606592846287;
        Sat, 28 Nov 2020 11:47:26 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:58b6:35be:25dc:8a78])
        by smtp.gmail.com with ESMTPSA id d2sm16084702pji.7.2020.11.28.11.47.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 11:47:25 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 09/16] python3-packaging: drop (moved to oe-core)
Date: Sat, 28 Nov 2020 11:46:49 -0800
Message-Id: <391136f8c90ac16b0d40936f8264427d9def84d7.1606592636.git.ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606592636.git.ticotimo@gmail.com>
References: <cover.1606592636.git.ticotimo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <ticotimo@gmail.com>

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../python/python3-packaging_20.4.bb               | 14 --------------
 1 file changed, 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-packaging_20.4.bb

diff --git a/meta-python/recipes-devtools/python/python3-packaging_20.4.bb b/meta-python/recipes-devtools/python/python3-packaging_20.4.bb
deleted file mode 100644
index c75707e69c..0000000000
--- a/meta-python/recipes-devtools/python/python3-packaging_20.4.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "Core utilities for Python packages"
-HOMEPAGE = "https://github.com/pypa/packaging"
-LICENSE = "Apache-2.0 & BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
-
-SRC_URI[md5sum] = "3208229da731c5d8e29d4d8941e75005"
-SRC_URI[sha256sum] = "4357f74f47b9c12db93624a82154e9b120fa8293699949152b22065d556079f8"
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND = "native"
-
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
-RDEPENDS_${PN} += "${PYTHON_PN}-six ${PYTHON_PN}-pyparsing"
-- 
2.25.0

