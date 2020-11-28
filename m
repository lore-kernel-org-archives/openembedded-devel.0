Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.36783.1606592845050502984
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Nov 2020 11:47:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Tt6FoJkh;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id bj5so4297649plb.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Nov 2020 11:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=TOhAwSz/ap0uN+X6vO2b0A7mtKGRelVKZBNO/aIgQJ4=;
        b=Tt6FoJkhKD/aXwPOPqq7Hh7jBVWZDo9OzWBd8od2n39mHSgphBe7zxtvROope5Cm3G
         698o3I8wS0rIut91E4xQrmjBsy0rztGMwq9ltap2Qr14/mC3jlX7prvrhIdp0HAOeHax
         uH/rU+B8Y2O34yT9U15ouhK7Pvb6OhyUUxZj9TU3AwZztUnne59XvGd+wb7asqmBxTPr
         gNckhql7SG1033NCYqu2wL4+dX5+Fjcr8HBOXYigdQc4WMwiklhkmPOd8PyQ/tQSRfnI
         XhXg/6ugirMUkgqanOdCI89jvpgRg/BBI/V9gpgUrA4ajO/zf9ESi5Faq5KPUPNRI5kA
         ysXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TOhAwSz/ap0uN+X6vO2b0A7mtKGRelVKZBNO/aIgQJ4=;
        b=dOADS/Tw0liRDBIGRRDod46W8HF+AsQyKlmIWwSkeLG4VJeAwnOSUj9SsS9j7CZ92k
         wzC9fx8y9DDNH/B0nxtwMk+wBed12rOvR03TVXMR7F+h6iIyEC/bNes/zEMF8hDF4Zlh
         ZexW4tOlRLOc4gs4X9yeHjb6ZBMXu6gpjy5y++N6HAFESddlxsECgHRjUUgGrIkkOfQQ
         ARTCv6SKcVJJK4FSvTynaW2WixP4NPU37BTCla4xkKUAKU3Mw3eQlux76HLjzGE/ykks
         cKf0cGoGwBiqRjedEBJD5+ju9b7P6tOO54lchHyrdQqe/BhajSrWtEsPmA66sAJHulBZ
         uJlw==
X-Gm-Message-State: AOAM530zqNr4nvqD/mHNW4Rn1XlcwMMIQbS6Ejey0PSmRQihzkBlrdit
	Cl9C1X5EbREsLyorWLfEH9LUjItWYtwoLA==
X-Google-Smtp-Source: ABdhPJy5ntM3s2/Ih6y8uu49rzNFMBltCo7sPYifr/80wN7lnOg1qb8Bo4Vcb2TSRyAubaBHvJoJMw==
X-Received: by 2002:a17:902:567:b029:d9:d6ba:cb65 with SMTP id 94-20020a1709020567b02900d9d6bacb65mr12266775plf.57.1606592844425;
        Sat, 28 Nov 2020 11:47:24 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:58b6:35be:25dc:8a78])
        by smtp.gmail.com with ESMTPSA id d2sm16084702pji.7.2020.11.28.11.47.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 11:47:23 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 07/16] python3-py: drop (moved to oe-core)
Date: Sat, 28 Nov 2020 11:46:47 -0800
Message-Id: <553e11713313ab89d8533562ceaefe613119baf3.1606592636.git.ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606592636.git.ticotimo@gmail.com>
References: <cover.1606592636.git.ticotimo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <ticotimo@gmail.com>

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../recipes-devtools/python/python3-py_1.9.0.bb   | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-py_1.9.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-py_1.9.0.bb b/meta-python/recipes-devtools/python/python3-py_1.9.0.bb
deleted file mode 100644
index 794ec2a87e..0000000000
--- a/meta-python/recipes-devtools/python/python3-py_1.9.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Library with cross-python path, ini-parsing, io, code, log facilities"
-HOMEPAGE = "http://py.readthedocs.io/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
-
-SRC_URI[md5sum] = "b80db4e61eef724f49feb4d20b649e62"
-SRC_URI[sha256sum] = "9ca6883ce56b4e8da7e79ac18787889fa5206c79dcc67fb065376cd2fe03f342"
-
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND = "native nativesdk"
-
-RDEPENDS_${PN} += "${PYTHON_PN}-netclient"
-- 
2.25.0

