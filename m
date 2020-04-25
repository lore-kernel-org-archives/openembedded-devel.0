Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web11.2028.1587793486258843923
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Apr 2020 22:44:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O0piCgyA;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id t9so4796985pjw.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2020 22:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6893TP5npMUctXDDpeu5eG24lqQlFJRCgqA2221Cniw=;
        b=O0piCgyAeNvqjFJHvyPtZ677aSWgPWRwvqlHF6BcdTnfCxGOOrvw1W2v1AgigZIBKD
         L7plBZDCdg4Zj8F9yR3rlX9TZ8bbYxmlLuMH9V5P/GyqE9B72Q8PZ97QbT4G/fn3AqON
         eYSTr0ZGVRW9j+mN6appbKR2bzVXKgROlFD7l+Sn1zLzbExhBfPzvZALSkvIrVYwY+Qf
         BiCwZAlTYP6C3pUKprOq+lx9d3E+A9oiFpoMhsgAy7iwHdlVWlwVt7OMVct0LTty2fLV
         TMkqyzrc9OwHuAlN5YcySeSBUGM4mRWcuce6FNvCb6ArTEnpSgTHng/mMeRN++hhCCX2
         B4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6893TP5npMUctXDDpeu5eG24lqQlFJRCgqA2221Cniw=;
        b=cS+jC/+SvxdD/mkBKIMtbf9RulwuHxJ7vNmeavPK2TweDFNezLsbrA0a7aNep77jdC
         ZE3vfXmLqazFVXbb8SaP72LtDdOlfRiGd92ErJRwePMBtz2voJ7Ont6+haxRh+20sawc
         5T6xZbssp28EMNo9fif6X+6OkEDoxL73iaoWg7WjB+xJea76blvM1NBNWr1Bu50zPi5y
         cP+iT1NZ6FJt/eEMT39OsWEQ6DQ33QvIux/66OmruhG8Aj73wp2M4tk7BiXnVbGMldXV
         D7qak90asuf84gNmulAirEeCt5JfFQRAs+nZg2GXXe12aGh8exKRnfBpXqUw8U24XkSF
         Szaw==
X-Gm-Message-State: AGi0Puaa3CRybt/YZkdTGlxRQENb97HNtzdC4S4hlpoahppknV5q+pq4
	dW/uyM0WbTa49m91CEr0M5p2YgchyTc=
X-Google-Smtp-Source: APiQypJI9tMGgQrprBrdCckhtIj2oRt2RVtcUcfain1tTnxr9YGZEhubAflT8tH9S6PO2IL65VjZDw==
X-Received: by 2002:a17:90a:a414:: with SMTP id y20mr9169668pjp.45.1587793485461;
        Fri, 24 Apr 2020 22:44:45 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:9640:dcf0:abab:3ebd:87c7])
        by smtp.gmail.com with ESMTPSA id f3sm6102745pjo.24.2020.04.24.22.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 22:44:45 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>
Subject: [meta-python2] python{-native}: upgrade 2.7.17 -> 2.7.18
Date: Fri, 24 Apr 2020 22:43:46 -0700
Message-Id: <20200425054346.36789-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the FINAL 2.7 release. Upstream will
not be supporting Python 2 any longer. You
are STRONGLY encouraged to move to Python 3.

You leave yourself at risk to vulnerabilities,
security risks and fundamentally non-supported
code. You are risking significant liability if
you do not update to Python 3.

License-Update: Update copyright years

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../{python-native_2.7.17.bb => python-native_2.7.18.bb}     | 0
 recipes-devtools/python/python.inc                           | 5 ++---
 .../python/{python_2.7.17.bb => python_2.7.18.bb}            | 0
 3 files changed, 2 insertions(+), 3 deletions(-)
 rename recipes-devtools/python/{python-native_2.7.17.bb => python-native_2.7.18.bb} (100%)
 rename recipes-devtools/python/{python_2.7.17.bb => python_2.7.18.bb} (100%)

diff --git a/recipes-devtools/python/python-native_2.7.17.bb b/recipes-devtools/python/python-native_2.7.18.bb
similarity index 100%
rename from recipes-devtools/python/python-native_2.7.17.bb
rename to recipes-devtools/python/python-native_2.7.18.bb
diff --git a/recipes-devtools/python/python.inc b/recipes-devtools/python/python.inc
index 19a2f3e7..a4ba0c54 100644
--- a/recipes-devtools/python/python.inc
+++ b/recipes-devtools/python/python.inc
@@ -5,13 +5,12 @@ SECTION = "devel/python"
 # bump this on every change in contrib/python/generate-manifest-2.7.py
 INC_PR = "r1"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e466242989bd33c1bd2b6a526a742498"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=203a6dbc802ee896020a47161e759642"
 
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            "
 
-SRC_URI[md5sum] = "b3b6d2c92f42a60667814358ab9f0cfd"
-SRC_URI[sha256sum] = "4d43f033cdbd0aa7b7023c81b0e986fd11e653b5248dac9144d508f11812ba41"
+SRC_URI[sha256sum] = "b62c0e7937551d0cc02b8fd5cb0f544f9405bafc9a54d3808ed4594812edef43"
 
 # python recipe is actually python 2.x
 # also, exclude pre-releases for both python 2.x and 3.x
diff --git a/recipes-devtools/python/python_2.7.17.bb b/recipes-devtools/python/python_2.7.18.bb
similarity index 100%
rename from recipes-devtools/python/python_2.7.17.bb
rename to recipes-devtools/python/python_2.7.18.bb
-- 
2.25.0

