Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.870.1631984272982434641
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Sep 2021 09:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JYuiWyBw;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id w19so12109510pfn.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Sep 2021 09:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IiC6enG+fkzh90QKye+9Lz0RhvRHdJnC6aNuwo4MQHU=;
        b=JYuiWyBwwbOdpXxqxdd53j7kxZC8kW2cR5xqe6acUFBNaG4DEEYSGnT8grEswg0EuN
         dkEq+CCRH3Bcb7q4FX5kQwkZYrQ3pZbcmycaAwDJ5XvVyyfnSb/8uSC83C+GW86va9ah
         zWhOlPGDSP6swIAvaz9EtM4E7Br8Q6r5nxAzIb9R2Kd9z919r7wPaagaXwspO1yBzYy4
         6EK217wdrwoimGIcrVinY+SiDORtNsySLyaiZBXRYudIfhL/PxbkAiIh4xiLwsh5qXYW
         MDNx17NBTFLJ7v/+SnTjbioLguq0J07C3PCXeJpHCLVtj43CqpOCweTRjjKnWv0CbFN6
         F17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IiC6enG+fkzh90QKye+9Lz0RhvRHdJnC6aNuwo4MQHU=;
        b=nvCDDwH+2d+LBqlDXIsUSCwCOWnhHPY8uQ7BpBvjqa2EM7glwYKjH8btniJ5YN0W6f
         tfxwFzpt6/s8LUY2XUk4fL6hxupp4IxQv+NkV/yEIljxSls8zUInvmb0GNN4KEXABKBn
         1ggVmCUMpJ1zU5hOjJtnt0xMyLzh1w1konnW7MdyidKI3t2eWeDhbH+lml83s7P+zw0s
         OpcuciCPjL/4QTIiRH6yQfARJJb+XYPLL4YMd/RfRcSppeXD8u7z52hunZf6ecuP8GPb
         +JN27Hc6Bp5C/ou30UoFlruwrutMJBsZHg8JbvfB3QWMfD0g+8Wrhfpgic9zjeSpZjRm
         Kogg==
X-Gm-Message-State: AOAM532juIUjL2UfqkHWaxH4uNtPugqVBNOR9ntQLjQ/QxaVJABa3sXo
	tDmdbXaC/5fRCXuKxdvFldt2L7CtuJw=
X-Google-Smtp-Source: ABdhPJwNNNDzsOQNPT2s6RbASbQ3+AYbBze890Jt0wueVILC6/HbXbaMABndYFKTe7CzRLH9gugBLg==
X-Received: by 2002:a05:6a00:1307:b0:43d:2b4:419a with SMTP id j7-20020a056a00130700b0043d02b4419amr17063325pfu.62.1631984272376;
        Sat, 18 Sep 2021 09:57:52 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:f923:d379:e6c9:abf7])
        by smtp.gmail.com with ESMTPSA id ga24sm13485274pjb.41.2021.09.18.09.57.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 09:57:52 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 16/18] python3-jdcal: set precise BSD license
Date: Sat, 18 Sep 2021 09:57:36 -0700
Message-Id: <20210918165738.2581429-16-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918165738.2581429-1-akuster808@gmail.com>
References: <20210918165738.2581429-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"BSD" is ambiguous, use the precise licenses BSD-2-Clause

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-jdcal_1.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-jdcal_1.4.1.bb b/meta-python/recipes-devtools/python/python3-jdcal_1.4.1.bb
index 765de4d4f4..8655150b03 100644
--- a/meta-python/recipes-devtools/python/python3-jdcal_1.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-jdcal_1.4.1.bb
@@ -4,7 +4,7 @@ and another function for converting Julian calendar dates to Julian dates are de
 Two functions for the reverse calculations are also defined."
 
 HOMEPAGE = "https://github.com/phn/jdcal"
-LICENSE = "BSD"
+LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;md5=bd236e1f590973467a427bb354be0f46"
 
 inherit pypi setuptools3 ptest
-- 
2.25.1

