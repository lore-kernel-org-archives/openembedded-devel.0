Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.10042.1599005372019485555
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2020 17:09:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uCGqoO9G;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id u20so1828130pfn.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2020 17:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oMlsN0uFVAacDALRazpWm2ohmXHGHEWQGi8nuM2AxW0=;
        b=uCGqoO9GBWOym8vhV5u3Jd+dOSHDvWo7itZFA/lazLOCNM6j5mSvJTjV0wCJItzqMt
         q+GVX+75OIs06sXDUm3kRBBCLvru7Xoei0lVLttOZlNjBNDXh8ffAG7CRmEUtTR3lDRr
         2T3CzRtHf6++oTnzWpQKlm+ecsIYx/+EbAMi2RELvC4mhqWqmGyMRcDfE9FXJXbjhmWH
         pCj3vmzy5qIocmpAG8X4BzUF+4R5dNxo9iTlKQ9Gsc7SjVM0QnzzFdJWZ55yFUJGDm59
         yfh39+NblL+AbKfRJ0aumnsdZGECH/BbidYMtZMmvJhuR8uQV4z4mXO7obqFnIwnNA/Y
         5BgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oMlsN0uFVAacDALRazpWm2ohmXHGHEWQGi8nuM2AxW0=;
        b=QEN1Xh9/HSTL+aYvCkU/NnvXyvlRY9WlCus28tXd3Td2ZI3eiGKVudkfNzwTrbfppB
         qiTFqxZra3Xt/yxKEKuPAcvULm9ex7SwkoyS0tpEMUBgVrRyL0NYW+J6XutKUeu4tls5
         DyOM+WVi3voJ9BtRE3CoAh9jKY0zGS77dZAo6SAZQocwZHskgUI4N0ExGNs9XnGQuqop
         Hqk4E9sMRRpUb3FiZQhADWOi74SuvyVhKPJxXTEurfIMesVuV+66u5NJFoO6Cr+4Fr4x
         atrsauF8pM0a8aITMYlzDPX+bsq9cYeHzP9IEKeOwa6Dl4JH3b4o7MesVbt4j9ndkqdi
         3dzA==
X-Gm-Message-State: AOAM531zOXKHHbwSDcE6FB7PXJetjkMaBqjzCd6Ao95AGP0t8E1/fR4O
	T7DmijXAijfk24oMiTFsk6APba41MxYuCw==
X-Google-Smtp-Source: ABdhPJwJ58eewrf1f8lpY9uVhFi3TuqelOhI1VAnTpgUhpGki4SM1xUxAL3c6QRiCOeg1hpqeN6+Jg==
X-Received: by 2002:a62:3182:: with SMTP id x124mr722748pfx.70.1599005369263;
        Tue, 01 Sep 2020 17:09:29 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id gt13sm2511218pjb.43.2020.09.01.17.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 17:09:28 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 1/3] schroedinger: Update SRC_URI
Date: Tue,  1 Sep 2020 17:09:24 -0700
Message-Id: <20200902000926.2271220-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

http://www.diracvideo.org is not accessible anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/schroedinger/schroedinger_1.0.11.bb      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb b/meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb
index d026c69a8f..2f1fda341e 100644
--- a/meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb
+++ b/meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d91a46405fc074b88c963cc4f2a0aae9 \
 
 DEPENDS = "orc-native orc"
 
-SRC_URI = "http://www.diracvideo.org/download/schroedinger/${BP}.tar.gz \
+SRC_URI = "https://download.videolan.org/contrib/${BPN}/${BP}.tar.gz \
            file://configure.ac.patch"
 
 SRC_URI[md5sum] = "da6af08e564ca1157348fb8d92efc891"
-- 
2.28.0

