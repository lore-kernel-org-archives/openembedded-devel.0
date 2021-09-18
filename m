Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.841.1631984271087415199
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Sep 2021 09:57:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f9Q7SCx+;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id 203so4327048pfy.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Sep 2021 09:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uxz0QldAY6rfvecHdVtw7iD9N6CM/ZQN59YSfXW7fig=;
        b=f9Q7SCx+/L/5vLvl3tbSr/6IXvT+jNKGe/9T4hnJl4NYwSviH2EpdIkhvnrRKpv2DF
         OP+FoGGlWbYSUkeYLtv/+pi6Uz212/Lacwg4Y016Cq9LnJwvI7sBTutvPQ0zsGEgALqA
         X4Bh5CgqiHlvh5FSnPlijKzqBYsL23jV4zlPZ0d+H4sTWPy73spfQ7GxyonNjtN6qIv/
         3NilHQ/dWfZGkJ6V9YD+bl0n8B1q3p3lwojbgmmfhHM0v8IIL53KC0I2g5mV4PYveZt0
         ukfppztehtH9NVPwonuvz9iXlXk/F89+PwBrvNkd+5TuREL2Uzn06DiLOUe8CPemRxnR
         8ZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uxz0QldAY6rfvecHdVtw7iD9N6CM/ZQN59YSfXW7fig=;
        b=ovzYOmTpXkHEnw8+fyuT81xpdTg4OTOFgf9aYKkRPGBCBtxx1Mjjn9P+21ZH2hR90V
         ZK/f00Y8WjXmpbAvb5k4SBuhZ5+dXz7Vk7FspPq4yPdE/TzrWIGxs/an5xPHIkJY0Jxh
         ythkVQ13c5jaGAHS+oCEmCkRcp4KKr68exNWNqp5qfW5uB1ppV5dwh4KC0kE7k93J1YI
         JYWLJ1/mAkZfYSyda0tXGfamOTCd/ZVjWsu7U5lktk3d5ANyqWwaNjIVmQsRSq3gdlsK
         8Qm0FDUQ9gHe2SU3kIUe+qHOJG4N0XXOi5vbF6PVcFaalsgkm7iINLBpOhm3+ioUxrah
         EqAQ==
X-Gm-Message-State: AOAM5301ZiXTjZOCz6Ku29XB3n5gN0u/hcAr8/EH/wLBDpE4BHim5Pe+
	V5dO+9Nlr6Aw+4hkRykR/wu5LfU3RzQ=
X-Google-Smtp-Source: ABdhPJzAETZFiVzs/H35fn4tiLoMluBVKZsRLpgwpI+c2wZGa/XXkWxFzcg9Zbm/YQQ01TkitCx9rw==
X-Received: by 2002:a62:7985:0:b0:437:36f1:d0df with SMTP id u127-20020a627985000000b0043736f1d0dfmr16697263pfc.52.1631984270476;
        Sat, 18 Sep 2021 09:57:50 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:f923:d379:e6c9:abf7])
        by smtp.gmail.com with ESMTPSA id ga24sm13485274pjb.41.2021.09.18.09.57.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 09:57:50 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 14/18] python3-gnupg: set precise BSD license
Date: Sat, 18 Sep 2021 09:57:34 -0700
Message-Id: <20210918165738.2581429-14-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918165738.2581429-1-akuster808@gmail.com>
References: <20210918165738.2581429-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"BSD" is ambiguous, use the precise licenses BSD-3-Clause

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-gnupg_0.4.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-gnupg_0.4.7.bb b/meta-python/recipes-devtools/python/python3-gnupg_0.4.7.bb
index 5808c8db05..83ee57926e 100644
--- a/meta-python/recipes-devtools/python/python3-gnupg_0.4.7.bb
+++ b/meta-python/recipes-devtools/python/python3-gnupg_0.4.7.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A wrapper for the Gnu Privacy Guard (GPG or GnuPG)"
 SECTION = "devel/python"
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b0b7ac63b60085b23fa9f7e1951daa1d"
 
 PYPI_PACKAGE = "python-gnupg"
-- 
2.25.1

