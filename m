Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web09.869.1631984262671025711
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Sep 2021 09:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pxztE1mS;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id bb10so8286956plb.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Sep 2021 09:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JeCAQLkwgAivPA91q6KV4qQa47lD7MCI9oaCnEToSFg=;
        b=pxztE1mS6FQFzLAJtGC2mPEAaid3CDvrYMvMf8gPIxOLwQI6ZyqUeSKK7OoParuhCp
         Qr7+8Ckbc8HJNMFzWJNkcSjXfFeFYxivd9fVeFWFIGV1334zh591FrjmX4bLK60GSEO2
         2M8ccUZ/JNkQUXcwH3yjxc8j3ui4GxOBkU8C7bOkxSMWUt+rLWDwcutOtJIgcWvq8VRq
         wFum/obhd85TR3jm3kOMqIW4uMziAYmgOkNeIYan8DxC+cyYy7irvUQ6PnNTnwXzI+t0
         N6ky5F+qFlibNJ3khhIM8UwoJWTw1CPOyezeKCkKcVOT62Be/qW6ZECGUhVLTY7Y+Pt3
         H2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JeCAQLkwgAivPA91q6KV4qQa47lD7MCI9oaCnEToSFg=;
        b=Wl+YpGbkXd657zZzROUOhHUoS+YxQUB1tmCemhN8iTW1G97eKyiqy5rsfnev5k0wLI
         nCbNP7yavViB13c+IKZfQfp2Q6TpLOKTyMQmAqoOR6azRhs1PjYuMy/Jtc+zhpDfqjn6
         iZsohnv3QHlsgTMBpCFeUFZHC5Qb86MO54h2BFehxuWIuok5RW84w4ZKNiVsdh6dugGs
         bizuXKSYVvswBdk5hhHdHPn0Uym70K3FEZdShnkXJSDj1+X5F47W3Ih1ZY/mwYebmxK1
         1dfnxd74vu1fAoHEiLAUZNNgEBDP9R08RByQHfW3UCfJJ6blKQ3EphRF4LFYXeeN1iCx
         HY9Q==
X-Gm-Message-State: AOAM531lSHcAqediN4giBVbRKQEQxNKWv34K0zO7a0vEpNu7P7IjTwDt
	RZ0IiKoAXfAKDhuCFFGPjjRUu7D4iWM=
X-Google-Smtp-Source: ABdhPJz1NqdyyusUEN5GjJxehDN0qCp1Uf6otoZrZ7kM+hnguWuMr/RzdqTSWdN90YMl6objh3WcmA==
X-Received: by 2002:a17:90a:1b2a:: with SMTP id q39mr19319056pjq.219.1631984262006;
        Sat, 18 Sep 2021 09:57:42 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:f923:d379:e6c9:abf7])
        by smtp.gmail.com with ESMTPSA id ga24sm13485274pjb.41.2021.09.18.09.57.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 09:57:41 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 04/18] python3-traitlets: set precise BSD license
Date: Sat, 18 Sep 2021 09:57:24 -0700
Message-Id: <20210918165738.2581429-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918165738.2581429-1-akuster808@gmail.com>
References: <20210918165738.2581429-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"BSD" is ambiguous, use the precise licenses BSD-3-Clause

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-traitlets_5.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.1.0.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.1.0.bb
index da234215ea..120604a8be 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.1.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Traitlets Python config system"
 HOMEPAGE = "http://ipython.org"
 AUTHOR = "IPython Development Team <ipython-dev@scipy.org>"
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.md;md5=eec4de4d599518742e54e75954e33b46"
 
 PYPI_PACKAGE = "traitlets"
-- 
2.25.1

