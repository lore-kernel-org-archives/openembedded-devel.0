Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.7290.1588931243675372637
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 May 2020 02:47:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c+3H7Ybm;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: oecore.mailinglist@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id s8so1106932wrt.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 08 May 2020 02:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Qcg+eITBlueWfeNaqAL7L0BMAY9Z4DyuLIQLgHLcbag=;
        b=c+3H7YbmTqaiVjwT5mzK26klBAkGrC/tJEt1CBfBtPZqvRzGfISejK72RVrdvY5Q3T
         xMrXEUNyTH9NpEIFseTYFdE4iGEa/Al7LnSyIJG5TFob6oGl+f5GsoyZkgOkSqNX9Ipl
         90CX6MxNwXhwGsPnnTIHb9cm7WeIfPqHoL+S8F8/ogfMpzs80U46DArAuOqxXuGHVsXa
         vVNDHeGRX5bP6X/+HO/cU44Qflz3c95G1pqJ7wE6kfzc9PedjFbm6ovenmKpRzXdHOK1
         rMXWT9k0rUUPon+JFf8NsLIRJe1J0LUc1Ac3ie1WxQlgsnS2CQtBq8Wknq/Sd1TS3Zc3
         ijPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Qcg+eITBlueWfeNaqAL7L0BMAY9Z4DyuLIQLgHLcbag=;
        b=TGfbjbQQjK+AerpFVMxYe1DN56lS6jx30JUYC+iPfiZOEvKQQiG16wtzu8nyRZc1TQ
         zrzi/KnfHwvm1CMzepFQuaFb6rqqmQfADa8jzBEwbobcvvzs4lbmfMu5e8e76KG4Do1D
         j5cfbQg4zQvPYH/6obID0iTXJfhbfV8ai+MyGFBly0rAb3Wd38vNf7VD7vTU/tESHaWP
         /BCIkWxUGxnb4ewHeH8HLf9ufhJ5UM2441PXHdFutIK/tsfVqALQZxlL90EhNJ68ogUH
         lhfmXdVPRmupc/mBnv8odAzI3ZWN0S8YokRmdZubWas0ar1KZCE1oMvovaWtvwFKUfu9
         I5NA==
X-Gm-Message-State: AGi0PuY9v6AfLTYEM2YugHaTplEQYXfFHgN5DZW9gamqLvV7VLi9JIPs
	g8IlxFUNzT7r7x69psRNwv6e0tIfN0t1vUaY
X-Google-Smtp-Source: APiQypIgSwWJ79yGJPRrj5Kzt9g8/L5AhBHPWBxjF+N9IxHRqRhows1HjnP4+7VWWkMjgYvYoWGtKA==
X-Received: by 2002:a5d:4702:: with SMTP id y2mr1894182wrq.136.1588931241951;
        Fri, 08 May 2020 02:47:21 -0700 (PDT)
Return-Path: <oecore.mailinglist@gmail.com>
Received: from t460s-2.res.training (ppp-94-65-43-120.home.otenet.gr. [94.65.43.120])
        by smtp.gmail.com with ESMTPSA id 2sm2085390wre.25.2020.05.08.02.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 02:47:21 -0700 (PDT)
From: "Robert Berger" <oecore.mailinglist@gmail.com>
X-Google-Original-From: Robert Berger <robert.berger@ReliableEmbeddedSystems.com>
To: openembedded-devel@lists.openembedded.org
Cc: richard.leitner@skidata.com,
	Robert Berger <robert.berger@ReliableEmbeddedSystems.com>
Subject: [meta-java][PATCH] icedtea7-native: host gcc-9, extra CFLAGS needed
Date: Fri,  8 May 2020 12:46:38 +0300
Message-Id: <20200508094638.12915-1-robert.berger@ReliableEmbeddedSystems.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Robert Berger <robert.berger@ReliableEmbeddedSystems.com>
---
 recipes-core/icedtea/icedtea7-native.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index 8d0dc71..b9ad2bd 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -28,6 +28,11 @@ CXX_append = " -std=gnu++98"
 # WORKAROUND: ignore errors from new compilers
 CFLAGS_append = " -Wno-error=stringop-overflow -Wno-error=return-type"
 
+# oe.utils.get_host_compiler_version returns "gcc, 9.2" and we want -> "9"
+HOST_COMPILER_MAJOR="${@oe.utils.get_host_compiler_version(d)[1].split(".", 2)[0]}"
+# if compiler version 9 detected, add more CFLAGS
+CFLAGS_append = " ${@oe.utils.conditional('HOST_COMPILER_MAJOR', '9', '-Wno-error=format-overflow', '', d)}"
+
 inherit native java autotools pkgconfig
 inherit openjdk-build-helper
 inherit python3native
-- 
2.17.1

