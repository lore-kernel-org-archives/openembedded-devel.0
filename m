Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web10.12996.1589899423173925404
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2020 07:43:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WXY0xZ/4;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id k7so1450571pjs.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2020 07:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=KNiEoasWRNmaeQH/0XHgNeC6hn4ALAYpgijy9sVxLfQ=;
        b=WXY0xZ/4BvOQeiTFFIUlTufbsfkNverWeF9EZ9h6mG4PZ6YJWe83DxnahBrbwFfNby
         8c1AAA3e2VcLUw5MAm2TiT7dLHi7Rv3k2Vpb8XB0CFmXIMjVMizMyJt9uIO3SD7Xzzaz
         Ue1Rjyy9ZQlfmiXdo8LMpldRyX94Zz8c5mvsRGpihVh1GbCXZcpSC+WPtMbHiP/UQSDP
         RzSs5n7VnZ18SVw3oENZPW7cjQWuR5g7ktygBml2L6r/Iypk5Bf93XMThfe+zxJqm7ga
         EIGTgtVt58DgFBYAu+Te+kh4Eugm/BEbNNB4ZdJV+Q0eIFK9JjxG+GV6IKKol2J1PmBZ
         fACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=KNiEoasWRNmaeQH/0XHgNeC6hn4ALAYpgijy9sVxLfQ=;
        b=AulhDqbcAuAyrtmMf7fUmraGA8yKD9Ue3o8BedwOJQIaSM0vZLKgQWJ/ujmugqznRO
         rzepG6NYYZYwZKZOwNft9NaLhsGSWPdC36Jer5RqB5Vuq42bkHgmZ1flKt3FUmeOudIY
         zDmE25skt1OctGcj6n32Sd1wZXHd/w0gONnH39NtTzHBUSO1bEyU2U07O8Voao/tf+AQ
         CBcOPf9u8kd7rc/A4fT8s5urtjhU/L+lRq2Lv0ajpQ4KDUN47L9Xfe0kHyv7AC5iUwm9
         4AkPF9II1PIyS0E14k4G7xhZAq6/ZUQQi6smHPiLcTZCJvb08M/Y0MYvaOLS4NOGsgeN
         DHqg==
X-Gm-Message-State: AOAM531CugG4iK0UVWYpgdZHS3JUbiefJYh2VwAuCsjyoVEwnoYHRdF2
	8EU4AoXCOL17fRf0HgBogM15cBYO
X-Google-Smtp-Source: ABdhPJx0Y7rU9U64PmUtAbNoCU2XrOAbeXt9zatnSa/AhTHyu2zdlue2lajrvjFZKSTOPr7SOzIw2A==
X-Received: by 2002:a17:90b:ed2:: with SMTP id gz18mr5588316pjb.22.1589899422347;
        Tue, 19 May 2020 07:43:42 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9de6:6921:ec78:716d])
        by smtp.gmail.com with ESMTPSA id h3sm2382099pjk.10.2020.05.19.07.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 07:43:41 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Trevor Gamblin <trevor.gamblin@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [dunfell][PATCH 07/18] python3-pyyaml: add python3-netclient to RDEPENDS
Date: Tue, 19 May 2020 07:43:21 -0700
Message-Id: <20200519144332.12822-7-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200519144332.12822-1-akuster808@gmail.com>
References: <20200519144332.12822-1-akuster808@gmail.com>

From: Trevor Gamblin <trevor.gamblin@windriver.com>

pyyaml relies on the base64 module (which is in python3-netclient),
but it is not in RDEPENDS, so add it:

|Python 3.8.2 (default, Apr 27 2020, 08:51:00)
|[GCC 9.3.0] on linux
|Type "help", "copyright", "credits" or "license" for more information.
|>>> import yaml
|Traceback (most recent call last):
|File "<stdin>", line 1, in <module>
|File "/usr/lib64/python3.8/site-packages/yaml/_init_.py", line 8, in <module>
|from .loader import *
|File "/usr/lib64/python3.8/site-packages/yaml/loader.py", line 8, in <module>
|from .constructor import *
|File "/usr/lib64/python3.8/site-packages/yaml/constructor.py", line 14, in <module>
|import collections.abc, datetime, base64, binascii, re, sys, types
|ModuleNotFoundError: No module named 'base64'

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5fceaa4964fdbc2a76aec6d774843914c57221ee)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb b/meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb
index b5425b8c95..17868a25dd 100644
--- a/meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb
@@ -13,6 +13,7 @@ SRC_URI[sha256sum] = "e9f45bd5b92c7974e59bcd2dcc8631a6b6cc380a904725fce7bc08872e
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-netclient \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

