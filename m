Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web09.3517.1618693592511112106
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f4LwdfMg;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id m11so20631885pfc.11
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=AlGcKEUSK11+m50WCBqe6KN3/wr0lUWmxbbokafsmAQ=;
        b=f4LwdfMg9Ukx9H0Nd9wx0ZDFBvQfbtBctXLMG7OJnIAR6c8ofmWpJUteVjMzfXQJSN
         Pk4BdOW30onoQrdEC+mcDMsl6fzmb2udcmrCB7VbsNtDLFX9zy0VV42f59WcBMnpqQpq
         VRCpvGTMhxllKG5rXPpfpbpCk+pDeYFYv5Kcl2twSek8cnMRndhg/+AfoAoIOfCXQ+B0
         X6Kt3j0Me0EApm4hYxFUUhN7pBmWSBdYpKhbCHz1h6rZIW7mm6+SaGfy0dim61VK5sE2
         +hdqlQ3z1uKDeKQoZrBTBQcD78g3O1008jLj1Dlaf9d3zgU8Wgg9+GJoy8PdrSWuZ2os
         mDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=AlGcKEUSK11+m50WCBqe6KN3/wr0lUWmxbbokafsmAQ=;
        b=OBUYScTyu7JkS325V/lJsTMwJiw7O7fqzRXBaA9t4Doow3XiW4txb5+73ZaCUuD6Uc
         wa/ynuyb4ShNTbLdZtxP47aLVPMY3WJC/OFNWecTtTtyQa3Pyl2RB2nUxPkyl7ofTxXC
         dOyRbZzdSzFOpIYPpZDwAH8CayNV43q9+4dmG4Mxce0Hao/agjpk9CDjo5X6ctpVYHTo
         ShWxXea51WLsEUOYXfh32yck00ihJhhX7PhAir/p/ZuV+3LtNyPmXSMGcJDCVQYDwuYH
         4RC7mDpEAC70YQK8visnaHk6VHP3Aiv0iFl9rjXK1BvFt4hwPrjHH8fyEvJUlPYjhqtr
         /ZaQ==
X-Gm-Message-State: AOAM530VRHVZCL2bNEhl5aX+bFoWuUPFxHM0IFYlrn6wb9WakeGUg7SF
	RQIvelnJ8aagjPXpoDDXggK0Iq70a27w+A==
X-Google-Smtp-Source: ABdhPJzEtGayb9Gme8oQkf3FQMA3lhCjQRX3JgaPWl1+portzV39CB6o8j2SfAy7YqigZYoruos4Lg==
X-Received: by 2002:a05:6a00:854:b029:25c:8f19:c4ed with SMTP id q20-20020a056a000854b029025c8f19c4edmr3266465pfk.40.1618693591975;
        Sat, 17 Apr 2021 14:06:31 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:31 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 31/50] python3-humanize: Upgrade 3.4.0 -> 3.4.1
Date: Sat, 17 Apr 2021 14:05:40 -0700
Message-Id: <c655523933439b326545731e003476726dc670ea.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 3.4.1:

- Add Catalan binary translation

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit eb79ca6f11ca6753560d1e7c14ffd3e7ab0b3717)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-humanize_3.4.0.bb => python3-humanize_3.4.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_3.4.0.bb => python3-humanize_3.4.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_3.4.0.bb b/meta-python/recipes-devtools/python/python3-humanize_3.4.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-humanize_3.4.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_3.4.1.bb
index f9c22e89148..5ffc2b59380 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_3.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_3.4.1.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "096b9ae6d1d56321d3d81f17117c2068179d7b4f7f73ba4baf302726923b48ec"
+SRC_URI[sha256sum] = "6e04cdd75d66074c34ff93c30a2ad6d19d91202a65c1bd400b2edeedae399bda"
 
 inherit pypi setuptools3
 
-- 
2.17.1

