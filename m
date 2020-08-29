Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.7555.1598688223369176288
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Aug 2020 01:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=frAZg+B/;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id a8so739982plm.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2020 01:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O1dJJ3HqNb+VA48CkhnB4JfMtODRAV47yWyRWMNLyPs=;
        b=frAZg+B/u207H+vH+xraQPFe+K+YXPzwuL16Wm2eDBTuPIXWpelBqZ0N0eFNwexlDc
         VA7Q/UGrGXP8UTwEt/8b6qd3SWCw6KlDfl1FJgGV2sPGX/NKEynRFQGVrDGwdMCKfosH
         LFTy8QaWKETpC7Gsf7AcNWcEolsg1efWcTzd3aFLioB0eYkXN6FuPFtlRPgajhgUD9j8
         fjwsQ2uOk8wnaGspAmj/sMgvJF0gsP0W7nZnkzPqro7f81YYT14BugkDFyIi1ISvAVfT
         RpvqTuvp2tj7kVA9X8kWRS6yBH52jHJ8wN2VacSUORZeWVjD+TBzjZK+kHvk2jN0Inzx
         zzgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O1dJJ3HqNb+VA48CkhnB4JfMtODRAV47yWyRWMNLyPs=;
        b=acJN9xE5Sod1svrAhv/cVFEynnilvZtuwfk0Fh3rt7hqrmqvWoJAPK+Gye8imCpInb
         qyQ8UYdiBvzAFHQQPzjlu+eNb8lt7xtRoxUXgJ9kNnoFIWUTnZfpgveSbUIEvA7fS6qh
         21NHb6kNhsbdc++piogCTBtbAR3daTYWldxkO2kVb4tN6FnXD3HotVZ+NzsPou3toKdn
         zraiRBASMT9a4MxFU6VbqXZWBq7MbMt4ucDkeFJZbSvlzJhzyPxwFwvy10H28XL6lsXB
         H5E1IgLz0POh/WQa5VSj/VPC5mBbYkAh1/zSRZ2PpeSls6B72A+MWO7zswZ6tR3wZ4cf
         ImOg==
X-Gm-Message-State: AOAM533S26XZG51v08hSpxekDOhqmNr53t8KMdmmeE6ZlyYlWarmWUma
	WVpvuYlNBJZViUSvBw95VRY38e6A/mZ00A==
X-Google-Smtp-Source: ABdhPJwXBJ2xEXgwfy1TVCH95r/qsba4TFE+YkAlc5dL7h3+Mct9LooMH5OlSFx3+9DnCL4Mgq7ANg==
X-Received: by 2002:a17:90a:ba04:: with SMTP id s4mr2370303pjr.3.1598688222616;
        Sat, 29 Aug 2020 01:03:42 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4fbd])
        by smtp.gmail.com with ESMTPSA id i17sm1717557pfo.150.2020.08.29.01.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2020 01:03:42 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] wvdial: Update SRC_URI to an accessible location
Date: Sat, 29 Aug 2020 01:03:37 -0700
Message-Id: <20200829080337.3273497-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200829080337.3273497-1-raj.khem@gmail.com>
References: <20200829080337.3273497-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb b/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
index b985d39abf..473ceabcf0 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
@@ -9,7 +9,7 @@ inherit pkgconfig
 DEPENDS = "wvstreams"
 RDEPENDS_${PN} = "ppp"
 
-SRC_URI = "http://${BPN}.googlecode.com/files/${BP}.tar.bz2 \
+SRC_URI = "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${BPN}/${BP}.tar.bz2 \
            file://typo_pon.wvdial.1.patch \
            file://musl-support.patch \
           "
-- 
2.28.0

