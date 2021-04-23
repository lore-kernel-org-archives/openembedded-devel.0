Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web09.31.1619208274466754843
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Apr 2021 13:04:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YG76aeaH;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id nk8so10499990pjb.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Apr 2021 13:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jR3at6Z0VhzX6edgmea/w2Yue+wPnqjzWla/UnyNG6U=;
        b=YG76aeaHzWmRE3sWBptMg2607mkxh206RrJJxADP5lVUbADjrLSAd1k/G/Q8WbCVnk
         agaTjiYEyjmNwLxuWlt3F5Kdqy8B/2BoRpEZO2ONxOTwgo5bmfb0N3QL2UEMEZhMgTDL
         yaBHa3nEfhBesCtkCzZiCRwUlyMODHEYR4H/ThOTfvydmXbarEqi3zkcuIwmW+x8PoAn
         H/jKD/xnmTBgY63h3lxolg28Y0SX94wTby5SCS2waXAiWCHAonmizIP9ka5KPT8MKAzn
         CcGIkjCH2Rf+P316i41CcGlbr/flyEPwl5qwMTHwDMpUTO/bHCA5ixNNhuGPQE8o4ril
         yFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jR3at6Z0VhzX6edgmea/w2Yue+wPnqjzWla/UnyNG6U=;
        b=qoCPFQq7EnzCYZ0PDi3tJlV5GZGzjKC4cFhZWV/jGj2R4K6KBFpucRdqGV2E710Dac
         zNC5WM6F8VrK9LDf2uz9uNS+61bzMJUV+CJ3LRNvtEqzRH2hfotImMCqxaIkh2u5Lm/H
         vdQULLzgA4bb99bCCdSBTeONx3xFMCKpYWVYxxAoRmYmX99brf/NE3wanUT5xMGPMOUz
         g4Uo88i0k7IGTSRVt+KSdUdYfiicK6gjBS2tCH9z3nx/ED+9ZMyj2LZmtmLo4T/pjglN
         3kytGM/VhHtow9KLaWK4pybmSG4sVJ/2Lamip7U8/dV87xTzAh4bZbR7rQkYBUlRKKjY
         vb2g==
X-Gm-Message-State: AOAM530c1rxUY6Y8hd3CfY770htK9kGyjhUDw9yJIcos9vz0+Z3N6t/M
	3YDdmkMVsjZMi5CSFOy7X04bmVlM0yA6vg==
X-Google-Smtp-Source: ABdhPJx0kq2qvKKoNGo9j6/qP9VT+Ic3E+jo5kEzBow4lvLioDuKZGRlyBPiBmYLgwwjitkQl5WUng==
X-Received: by 2002:a17:902:7081:b029:ec:c083:878a with SMTP id z1-20020a1709027081b02900ecc083878amr5296120plk.76.1619208273834;
        Fri, 23 Apr 2021 13:04:33 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id s22sm5653008pjs.42.2021.04.23.13.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 13:04:33 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][ 4/4] python3-markupsafe: Delete bbappend
Date: Fri, 23 Apr 2021 13:04:29 -0700
Message-Id: <20210423200429.1109991-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423200429.1109991-1-raj.khem@gmail.com>
References: <20210423200429.1109991-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was enabling ptests which is now on by default in OE-core for this
version

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-markupsafe_1.%.bbappend           | 12 ------------
 1 file changed, 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-markupsafe_1.%.bbappend

diff --git a/meta-python/recipes-devtools/python/python3-markupsafe_1.%.bbappend b/meta-python/recipes-devtools/python/python3-markupsafe_1.%.bbappend
deleted file mode 100644
index abfda60658..0000000000
--- a/meta-python/recipes-devtools/python/python3-markupsafe_1.%.bbappend
+++ /dev/null
@@ -1,12 +0,0 @@
-# Main recipe was moved to oe-core, but with ptest disabled
-inherit ${@bb.utils.filter('DISTRO_FEATURES', 'ptest', d)}
-
-RDEPENDS_${PN}-ptest += " \
-    ${PYTHON_PN}-pytest \
-"
-
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -f ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
-- 
2.31.1

