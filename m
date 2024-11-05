Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C67DD2B94D
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:00 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.19527.1730817411704093517
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ROqFbu8Z;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e33c65d104so46420227b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817411; x=1731422211; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=brbqvqZZz92b6XfQlzUbi1h6m70aRvmnp52O4JbQ5Uw=;
        b=ROqFbu8Zfu3dHo21U66k1DgGWyfcBMMXi+GgAGcTJrdPCkIequeRthddvkF2U724qI
         Tjwp5owlyrwE8bNVWAQFdB4mVu82AGW8JSqS+RuaNuiSxLBjTQ0nFDWXW8zvzJ07ohBe
         DQRP39wJd9ZTD9iYIhmaWHPPZ0ksgQkV4tN+CptawjvE9J2tNUpnPJo+1c1IPoyjq3Uy
         Bd/scWCFrPcQyli7NxjeyC29kSAVwWhrBwawkokNq8Jqdah6qM2gJFqi7pXW/p6mByb0
         GJjQ0qYH81HuNPYtCPyMbIxYzwkMUGLvtwp15tsMcSR8eQdiaYLjG8ybRpR5D7051uj4
         RnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817411; x=1731422211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=brbqvqZZz92b6XfQlzUbi1h6m70aRvmnp52O4JbQ5Uw=;
        b=jzjQs9N4Y/UiwkhE1/El7uv+vLHrz8aAtPuhyg0vMazCFqoYnw0ej3Q4jPiIrJltTZ
         vaRPv6aRoHO5KfC67WbfS/wc5kusMiNPDGpoXyuHtJbdRTKXafnIam+CphoAlFybPdV2
         +yIUbhzrcqmK6NU9HkWJbqeyE7ABla2bpgfrA4i3CIw7AQoiCnm2natGCXzKR/OUarb6
         IEjH8ikv2r3FlZv+GSvHzcdHgNasEZ4B4V/KBaRFmv1m4kJWuZQxc773PIAvIsgkUk/y
         zxYbUgR51B2p8mri2T+26Iv/7B0uy242xVqE4n+f8uF7HTt0x5OwxnDmuqiSCz99oUtg
         DsGA==
X-Gm-Message-State: AOJu0YwiVROu2ueSCrpPP8bsL1Wb/GZ6rht5a5BhjrO27nIDxvelQZLr
	SR6xoDPb/fvHSffddwj0tZZ5lbHCtUBVFCiSLhh5gNbplJAKaoFeMRWNMw==
X-Google-Smtp-Source: AGHT+IHmMBZJu7A2qtQN0dl1AJkJAEuQNVCbZ1SZvozPY14+Lv6Y2XmennTl0TQinJfxZVWMB7NEiQ==
X-Received: by 2002:a05:690c:5:b0:6de:c0e:20ef with SMTP id 00721157ae682-6e9d88ecdc1mr351351757b3.7.1730817409291;
        Tue, 05 Nov 2024 06:36:49 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:49 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 22/90] python3-robotframework: upgrade 7.0.1 -> 7.1
Date: Tue,  5 Nov 2024 09:34:47 -0500
Message-ID: <20241105143638.2301245-23-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113443

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/robotframework/robotframework/blob/master/doc/releasenotes/rf-7.1.rst

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...n3-robotframework_7.0.1.bb => python3-robotframework_7.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-robotframework_7.0.1.bb => python3-robotframework_7.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework_7.0.1.bb b/meta-python/recipes-devtools/python/python3-robotframework_7.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-robotframework_7.0.1.bb
rename to meta-python/recipes-devtools/python/python3-robotframework_7.1.bb
index 9e81e8e7be..979aba6812 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_7.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_7.1.bb
@@ -13,7 +13,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE_EXT = "zip"
 
-SRC_URI[sha256sum] = "58d01b84cd7eccea69f2dbe13cbcbff1299e551168d3b88c25617b0c9d6ddc75"
+SRC_URI[sha256sum] = "34796d387e182b36f05d82f3bbc802bd6a30192ebf1e03c76d2086d0d04faaff"
 
 RDEPENDS:${PN} += " \
     python3-shell \
-- 
2.43.0


