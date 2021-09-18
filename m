Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web09.870.1631984264150839343
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Sep 2021 09:57:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=acnbqKQx;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id m21so3703698pgu.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Sep 2021 09:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=HlVbPIwUpKFuiggsQqIBULFcwu4N4P8+AtLU0hlfXWI=;
        b=acnbqKQxLu3+7mQ9/9nuGNszQ+4wTU/qOV5oyeFQLaWGLvJLpnDvQ775xTnRxn1gaV
         Vorw0EFJDUS2ZloMH4efxpowmVqg0Qt2llfWH/NyX3O1a6KoAzv7M4TfiyXkXSSyfIu+
         sBGuBrllD+r4iD1+hFxei+/CCMi/C7J8Xn9nLmDEBYOGynFf/TqAh5590+QHx9gPaOOc
         HXZGXFvLvT/Me6zqXxtPJTFVYlsnpB/Afer4T8fep4HrzkCaaMQgWMhPmyjzB41/vzCs
         81Caei+gOSxmznRL6DXKBw4esEDUwn+nuoSPkLAsR315vVXu/BOdUqnFVkfrzByd0ZJW
         pDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HlVbPIwUpKFuiggsQqIBULFcwu4N4P8+AtLU0hlfXWI=;
        b=q5L5ZtPbB6RyBHLY4iKwfLUBb1OM6wuxAzGxypRYVbzd1MnrlU/mb+KTwuVg/C8AH7
         /kzkn0PG49qq5btX5560QUw3M8hZyfWshyOk7daVL2dZ1jdl7tVlOYMAhp81wjkAoGrh
         P2YSNzRv00IjTJErIH/1HSh5oGcvJny6uN4XsBIoLAWGRiqgzPUmjkitBe9TjZT1px3C
         ZyuYIjhwuMzKX/oKOXi87ULNnlHMMOBewv+CyxanXiVzswQEAP+Cmmu9fnx3gTgZoqyv
         8JVoYgopTXy4e9SgmYkdxyD6mQ7F7mU3bEaD4EaYNT9JhL4qZaxv/EykzUmYxOs9GKKQ
         Lekw==
X-Gm-Message-State: AOAM533ux8I/OnRqfB4+lPnZy+HUDE2+01EuSqt/gofBTJjx4n6Xp1bV
	m34ocmS3b6sfs/3GDMQzxLQPpJrZhCI=
X-Google-Smtp-Source: ABdhPJxwN1O1Hjopqx7wjjFCq7L9IVb2V93dfQg6VL0aCXyC+GSGzPWFl70LoZzCUAA26nTIIqebiA==
X-Received: by 2002:a65:4cc3:: with SMTP id n3mr15598697pgt.326.1631984263419;
        Sat, 18 Sep 2021 09:57:43 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:f923:d379:e6c9:abf7])
        by smtp.gmail.com with ESMTPSA id ga24sm13485274pjb.41.2021.09.18.09.57.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 09:57:43 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 06/18] python3-ipython:set precise BSD license
Date: Sat, 18 Sep 2021 09:57:26 -0700
Message-Id: <20210918165738.2581429-6-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918165738.2581429-1-akuster808@gmail.com>
References: <20210918165738.2581429-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"BSD" is ambiguous, use the precise licenses BSD-3-Clause

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-ipython_7.27.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_7.27.0.bb b/meta-python/recipes-devtools/python/python3-ipython_7.27.0.bb
index 2ec0722c35..3c64b82c2d 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_7.27.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_7.27.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "IPython: Productive Interactive Computing"
 HOMEPAGE = "https://ipython.org"
 AUTHOR = "The IPython Development Team <ipython-dev@python.org>"
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
-- 
2.25.1

