Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web12.8714.1586006958546422178
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 06:29:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id k5so8795544oiw.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 06:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=sAEEySnXCFDR4HJbXJlPUtySgkX294iwOnN7m1822yU=;
        b=XHgu8ckrKLH+gOtFT0xJDpKVn2FmMAtPCSOXcWWO1KtlvyNk+oplgYI5krNC2pBcnl
         3OLBc1MxUpzklb3pibvgiy9QmzOwvhT65KmILVHGe1+bK1bhEpwQGyj3+Yk26Q3WtTrn
         C5Tt2PgO6FTVAH3axO36+Io8CPVqzTWNuDUiPNKSRHkV6yB28aVif21ET14Xy+fmd9EB
         ToEnjxHFKG3WlMAxaP1RHqJ8daiiDvXusptNyfUX7vLFt0bQZMgkzSIcJvxYaUTYN77s
         Z9wSrzzJ6A1H7PBCFgvufrUaOk0o9Em9ISnuxVly63SuGQfcGsbJTIMtixQeHLqjF8/N
         zHvg==
X-Gm-Message-State: AGi0PubNc7gTguISugcJGnqFxeYNbWa929AGOCuVDf3ShYDNgkrSqybk
	sGhfy/bofTsRPPbMyKw4TjDXCYpre7Y=
X-Google-Smtp-Source: APiQypI4bOdn8yTNgDmOPayZbqr4e2ZXWXUc7xWipu1Gtg1aFquUZCvIIoxN4XaxHdVjR0s5v8Brzw==
X-Received: by 2002:aca:4a55:: with SMTP id x82mr6942993oia.28.1586006957593;
        Sat, 04 Apr 2020 06:29:17 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id t17sm2813013oof.43.2020.04.04.06.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 06:29:16 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 09/11] python-typing: remove unused inc file
Date: Sat,  4 Apr 2020 09:28:44 -0400
Message-Id: <20200404132846.16832-9-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404132846.16832-1-derek@asterius.io>
References: <20200404132846.16832-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-typing.inc | 9 ---------
 1 file changed, 9 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-typing.inc

diff --git a/meta-python/recipes-devtools/python/python-typing.inc b/meta-python/recipes-devtools/python/python-typing.inc
deleted file mode 100644
index ab8ee81ec5..0000000000
--- a/meta-python/recipes-devtools/python/python-typing.inc
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = "Simple Python module defined by PEP 484."
-HOMEPAGE = "https://github.com/python/typing"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=64fc2b30b67d0a8423c250e0386ed72f"
-
-SRC_URI[md5sum] = "0a1ebd4af65b4769e33459004eb20345"
-SRC_URI[sha256sum] = "91dfe6f3f706ee8cc32d38edbbf304e9b7583fb37108fef38229617f8b3eba23"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

