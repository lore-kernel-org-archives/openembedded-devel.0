Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web08.924.1632338554663040701
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qruq0l5a;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id k23so2831578pji.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pctEkf3wkL+6ma4jiVtznjl0DbWiufVmEWARHGgVulI=;
        b=qruq0l5aIvRDM1JyMTN0ae6ZKRedb17n+kq/JznlXp5f9rkx7v3fHTPm7HTJ6vrCqL
         +nGHgVruRgx9ysgWC1edum2f/J5FbHnZMkRMaVITBVMQR+r8n4o9/9pWv7EUl0jn5QPq
         oHQhlwjSbxa5qOPyYYgsZ962E3FKwDCJKhLNGpVDgmOAfo4BQ/+No1PwHKBkujFtVAmj
         qLuO2EQ1Kxww9+zAlW+joycDRXrCjhU7hAuX8tYK8NEcrJ6fFcLN3xKfKTqvISVYcyH9
         1z3b6+X2/RyhNaUdI2Vf87evjU9fAzeRJDuA87CUP7Dk1x6tCvHPnwf+lAQa2fqxMOKD
         +Xew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pctEkf3wkL+6ma4jiVtznjl0DbWiufVmEWARHGgVulI=;
        b=xfX7MOzzHkKsT8Zns1V5keaur+FNpTb9o8wO/elrDSgRXIm6Ic/In+uNaZ7VG626Ux
         bgSQq4B0JZDmiRIzFXrUoStBuI03w8LPa3/PCEP5qe6w3n3PUkx3F1JSPYO8SeDsNj3b
         kOw4Q1Jjuz6wQMjGo3FmN0CphQgHBxfGr+p+mLSgtQAs/ujnBR9h4GgH0aBavH2h33Et
         g20yqxHxjiQGOT/rF9uuSVG4fhvpi4WUDw/K+ZDNbhWVomX868sXfxHFD4gQCauto9IQ
         kd3EK4rMOA3fvtmGVpwXPlOboC79zM5bXaqbcOTtmDExMiPIrsXEMH/Dri50+rl6GCCl
         I/Jg==
X-Gm-Message-State: AOAM532iPSfO+h2KyMPNXAzgSG5Im30w6yGxRtb6NrXJbgcdC1vLf6st
	lq0mRt6q73jCbeKK3xPLS3VYh0VREYYgAA==
X-Google-Smtp-Source: ABdhPJzZ4XbYLJEM6581NLtSntvhztaR32DmcpzcVdUkgc5pFJ1y8OIQMgrS/w/STAqTn9A9H3LaEg==
X-Received: by 2002:a17:90b:3a8f:: with SMTP id om15mr13310833pjb.51.1632338554031;
        Wed, 22 Sep 2021 12:22:34 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:33 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 21/39] zchunk: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:21:55 -0700
Message-Id: <20210922192213.3062719-21-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes

../git/meson.build:32:0: ERROR: Pkg-config binary for machine MachineChoice.HOST not found. Giving up.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/zchunk/zchunk_1.1.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.1.16.bb b/meta-oe/recipes-support/zchunk/zchunk_1.1.16.bb
index 59a0dfff2f..c1b22886fb 100644
--- a/meta-oe/recipes-support/zchunk/zchunk_1.1.16.bb
+++ b/meta-oe/recipes-support/zchunk/zchunk_1.1.16.bb
@@ -17,6 +17,6 @@ DEPENDS = "\
 DEPENDS:append:libc-musl = " argp-standalone"
 LDFLAGS:append:libc-musl = " -largp"
 
-inherit meson
+inherit meson pkgconfig
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.33.0

