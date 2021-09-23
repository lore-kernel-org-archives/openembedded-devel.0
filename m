Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web08.1528.1632357281310170481
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 17:34:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OMwcQxsb;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id y1so2875849plk.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 17:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0CmmPgH1NCOajJgRmJphLNWwUv8wwc3BclB2QwcOoMc=;
        b=OMwcQxsbz7IT2b9+94AYSHa3xxoWNngxvcMLi8rCrcenEMULCWKYlKo/WBrNjKOa3G
         a6MDOyb6cz98PX6fMD9L5JrGb7Dn3MCNaG/FuaF/wesDLfPGTPAmr2Et5DgrjuX7AOES
         qgP185mJcWzuFzc2bUZEYnghXOum0ViCIPuGFQzt6VtaVSPly/P7L2l9IXEJgFFb54iC
         EpbTv81WV0qjevC9YSo6et681LiVCM+gEsFfqOyLxr2/vt4ib7d+5K7KjWMNBhqMIccU
         vFLW5qwp5fFMTO+MD2A82e/YcRuMr7wz4//vxTWUfjcxe3lxmLXjLFtojh70XVQ/Puqt
         upmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0CmmPgH1NCOajJgRmJphLNWwUv8wwc3BclB2QwcOoMc=;
        b=r2uJb2TptqOOLePuhdpM0brfdMvNk++dR7/hZ1S3MwsTCljcc772ELXGdLBajYtmLl
         EgODvapZPWeNadd4uBPq1WNyQUPaflDUVZu2mbDe0XnwgW+mriqCyWrSbOG/IVtcs87p
         wkSPtTmnLD+CEjjS7mJdx+KbB9SINDNcRTz80ZXhKnKhes0quS1KEx2vuDA6Tn+Z33Jp
         TzhZqJCfAu0bJtGY4GX6woX5ms/PvBtNdg/SR5cKObFHQk9b2AMZdll79lmiSyE/K+Hv
         Hy3gXP3RVlwcBlQN5emkNEJHEOlE83TtvUnMRxaY4mNj3IYxYZ1t0KkxOry7ZGi3rQry
         LtYw==
X-Gm-Message-State: AOAM531CC11dZhb5hLpa/HfZuC7s0M9kCW6Jm2WrUlqQKOzA659nJVzM
	w44jC0M+1Af8W1/WtNO2u/pfQnfAMTqB/Q==
X-Google-Smtp-Source: ABdhPJyytBYDwyKWWEXHvVsnWUDtIghPKLugkS5PM/vIMhAzC1KNtmU0gVNaFL2JsEIhb7D7WOaNtg==
X-Received: by 2002:a17:90b:1e4d:: with SMTP id pi13mr14571389pjb.96.1632357280346;
        Wed, 22 Sep 2021 17:34:40 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id gp11sm6597762pjb.2.2021.09.22.17.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 17:34:40 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] pahole: Inherit missing pkgconfig
Date: Wed, 22 Sep 2021 17:34:37 -0700
Message-Id: <20210923003437.639474-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
  Could NOT find PkgConfig (missing: PKG_CONFIG_EXECUTABLE)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/pahole/pahole_1.22.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.22.bb b/meta-oe/recipes-devtools/pahole/pahole_1.22.bb
index bdf9598e97..0fdde93e0e 100644
--- a/meta-oe/recipes-devtools/pahole/pahole_1.22.bb
+++ b/meta-oe/recipes-devtools/pahole/pahole_1.22.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/devel/pahole/pahole.git \
 
 S = "${WORKDIR}/git"
 
-inherit cmake
+inherit cmake pkgconfig
 
 PACKAGECONFIG[python3] = ",,python3-core,python3-core"
 
-- 
2.33.0

