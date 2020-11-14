Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.7871.1605369624969318414
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2020 08:00:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Yb1/Id84;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id gv24so1723422pjb.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2020 08:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TZlTJbr1dRXyDCC4y95+64IRDO8fUIeIXDV++hMgjYA=;
        b=Yb1/Id842YPoUADmm7tCwIALN9uROxad4HJI9io/otNlHSgobrzqcBO0qc/rA6eAIE
         8mhEkuFhG/M3xOshMFoyp4AkUSUSkHaNeNhrHnpjM+1OiOOY43xJyuMkB8+p9PTZkXBf
         wqW4g/uJtSXMtm0P5nGzMRvlzuiZDpWnBDYY56iWcxmzT7WMKLsXQgPNFXxAN/5WBFDx
         f0yp0p3qJxsjwZ7Mloh3UI6iCY2IQbRmwaFrRaZSnyBGfEl/1S9cQIf2W7B3yFhwm1jC
         JZSja0/BCDf5dbrI+reup1jV9Pw7wW6vEW5Sr7Zv7SwYh6Evo93gb6TvjMtxZCZSVE14
         uWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TZlTJbr1dRXyDCC4y95+64IRDO8fUIeIXDV++hMgjYA=;
        b=tX8N99ukU1ywOB/5l/1GRa6PEGbtXI1FsOTyPSzFuPSvf92gTo0curQGipxJsLeRFv
         RhTV0PbDMdIuWw3SeWZBeYe6RspS0m3F/zGhae0r9q+WZ+rjDXBN9O3V17NbUDCWEwXg
         5zpzHI1wuvabweBJmHsXAX9R7mDY7osH7md8wAYa6Q0V8soLJM6LkkXWx6stsJfFGt2S
         EcTHbRc+oSZkZfkhfTNuy4l5SNbzkgwjGzBDg5WK5gJyDV3/n06UsRlaMtrERMCNY37/
         8RYOP0UlED8WPJDHpOexOTBH+T6ddIGxYZB0HjJZVWmPRK3CN9EdIHr5QTYrV2jc5+xh
         388g==
X-Gm-Message-State: AOAM530FsRB9e/nuxUIf2Z//KW54JUM09w/FtVKa/x8s32Chshd7oVpi
	ui5sO+ZZzRTvWP5tIKchuK2C5homyeBw+qjM
X-Google-Smtp-Source: ABdhPJxMyycM2EYAB9lUn6K7oi9ALcUu/zjlsufUKvHRfHwUajwG1GsbvHTCHopn2ky2dQFUVurpkw==
X-Received: by 2002:a17:902:404:b029:d7:cd0b:e6f1 with SMTP id 4-20020a1709020404b02900d7cd0be6f1mr6351755ple.34.1605369624337;
        Sat, 14 Nov 2020 08:00:24 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id w196sm12647687pfd.177.2020.11.14.08.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 08:00:23 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 3/3] python3-pykwalify: Do not unset _PYTHON_SYSCONFIGDATA_NAME
Date: Sat, 14 Nov 2020 08:00:19 -0800
Message-Id: <20201114160019.1885976-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201114160019.1885976-1-raj.khem@gmail.com>
References: <20201114160019.1885976-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

its been shoved out of setuptools3 in oe-core now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb b/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
index 2df30aeab8..2e1bff4f26 100644
--- a/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
@@ -10,8 +10,8 @@ SRC_URI[sha256sum] = "7e8b39c5a3a10bc176682b3bd9a7422c39ca247482df198b402e8015de
 SRC_URI += "file://0001-rule.py-fix-missing-comma.patch"
 
 PYPI_PACKAGE = "pykwalify"
+
 inherit setuptools3 pypi
-unset _PYTHON_SYSCONFIGDATA_NAME
 
 RDEPENDS_${PN} = "\
     ${PYTHON_PN}-docopt \
-- 
2.29.2

