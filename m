Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.3135.1599324972232620754
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 09:56:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pli0i2wt;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id v15so5931208pgh.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Sep 2020 09:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=n8b7ghzhN3wcWcvJQzkfKH7QAfnlBESxckC4w07udoo=;
        b=pli0i2wtcp82JaDzClwJpA4xNLEBVo+8EM7xC1oO/iSz9k7YNVZHXo7VLsuxsL4xpj
         P/LoIp4fvlSpTIHyThc0NWn9O76/PEc7lsb6Dc8TZQngHRZ693BqgMMbYxLpYslgHTib
         ARtYwOFJ83uPRfeei1TvjKoMPeimJYNkOtXr1XKGBbUOaeCd30Lv/1IIEPMc4DKv40ea
         LqXKgM3lzDoxRo0dnL7gIyYWoXR/gvviJjrzlZiXUx3vHSh3+CLfHm3QXvKuk+vTOjdu
         O8kq2GPDbiTsyKGzw2mWkN7R9oQxlCyZGQ3NEpRR8gtbcoTajUICcDSHb6KyKHpBJt9O
         X9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=n8b7ghzhN3wcWcvJQzkfKH7QAfnlBESxckC4w07udoo=;
        b=GEj0Tjk5ZmxpjVIBnXe75n/78Lj52LMCwJFHPOcH14NBzwcZHLznvHFUvR70EnuJLZ
         SY8k2NMFNdmz/PvfHXN/s6bOhT+zrKPuJNkWM6bLmgAfXBIbjeOmSIe3MPz85hBHYKxa
         +gIY+f16ZR2xc4EoPoU4XQ+xiyDPSHNEPiTlo0o+fqlG6bn1L8JEDYczGb5rbJbozhnw
         zbsGFzjVXugOfIXeLIOCCgZIHia0zrO5aKQN9931fPU039qcFAjRRkamFEGcjlZBP+Ld
         C5ZxP6fsdJW8Xsexcsg1fniehwIMbXl4pvhklOq3Bb+R9/lqjW9XgvbUYSQeyy9mTXsy
         DjBQ==
X-Gm-Message-State: AOAM533Q2NmY3L/5zj4UyJlO6tIz1wLJXwVokP7UKwYJKpNH65jS9A1l
	FoYCdLt97lEuGF0jxXWHD2Zk77W7Joc=
X-Google-Smtp-Source: ABdhPJwBzRzlzPKBFHHHQXnOQxlgEPRmThKtWmEkrCLdh04HeUIjzfCm0buapGb9sO2fY3Ams8VJUQ==
X-Received: by 2002:a62:ce03:: with SMTP id y3mr3199110pfg.205.1599324971513;
        Sat, 05 Sep 2020 09:56:11 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:745b:fcae:da87:5147])
        by smtp.gmail.com with ESMTPSA id lb1sm7410944pjb.26.2020.09.05.09.56.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 09:56:11 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 06/20] python3-pint: add setuptools and packaging to RDEPENDS
Date: Sat,  5 Sep 2020 09:55:49 -0700
Message-Id: <f1dc6e6f5dab205d20073ee6c10b406b304784fa.1599324864.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1599324864.git.akuster808@gmail.com>
References: <cover.1599324864.git.akuster808@gmail.com>

From: Ryan Rowe <rrowe@xevo.com>

Signed-off-by: Ryan Rowe <rrowe@xevo.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit cfa786917343589c1756c1bc7cdf62309d29462f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python-pint.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-pint.inc b/meta-python/recipes-devtools/python/python-pint.inc
index 5c34810080..d022c41a57 100644
--- a/meta-python/recipes-devtools/python/python-pint.inc
+++ b/meta-python/recipes-devtools/python/python-pint.inc
@@ -20,6 +20,11 @@ SRC_URI += " \
 	file://run-ptest \
 "
 
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-setuptools \
+    ${PYTHON_PN}-packaging \
+"
+
 RDEPENDS_${PN}-ptest += " \
 	${PYTHON_PN}-pytest \
 "
-- 
2.17.1

