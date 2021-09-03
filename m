Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.6138.1630683505982503092
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Sep 2021 08:38:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hLkdiabT;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id u1so3521673plq.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Sep 2021 08:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hfmERdl0+gyn13TLfT2537B9teXK3Y0TLkFHBdn19mE=;
        b=hLkdiabTNnYg6nEJV0waAzGSd74S3iTSsQ12KL6evapbXJPOAWJOCqkY2Mc2rOIaTt
         XKcIh+e+/PRKhDfOJ6iIZ4Aa5nZLlvs7CqhYpOPTzWSI5geKu8G3y2h7ldEjJGYgVbeP
         I8rBXgbLiDpKB+hORjQlIqiCCQibAdYaOsEwOhm9k2t/9MU672wqT1oJ8zGUx56Wvy+z
         UH9h84nFsppFSSOn27B1hlsmt452YYd9NtnWc+7TI7jAyTMrx9r15UBsuucVOg0ebV3u
         BmLn8wYbHrJmx/Cf7PVvsm91B+S70UovXQtzC+j2QbO69YOg9lE/J2jayFX3U7q80/kk
         2FBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hfmERdl0+gyn13TLfT2537B9teXK3Y0TLkFHBdn19mE=;
        b=Gh12reA66GrQ5MJgH0+T/+ImwseICS/aOiQiLOquk/43zBFIkwzC5tW5KzGBhTsW28
         ScGSD9NtI32mrQREBb6oumB0N82tTXx9fY6iKD6YVCjNJYdSCCbAyX5/NQpp6FpRvwmr
         w4LqLdv4qfqUtSj3SE+Na14VbSlo257EYjitDiSoemr9hsKXeyu+/URwR+AEmkTE/ClT
         pea2zQoDqATXHBQzkLEB6h91PSwyVoA7lYrRdpgcsbx18TL6bvG6bRmmTTJUi8/dh44v
         Mi2T6MzKw2LJ6JQGDM5hwaIiPA4+/vHDxeF4YlEmxXjiL/attxzEgYusyp8DD0IA60Fi
         o4zA==
X-Gm-Message-State: AOAM531cGv5eAU7oBVxAvrvydt3KdugE26ttxFtYIx+Pxadpg1/m80lB
	UWWjULCiK0GVI0/P950H/hLjrXDrzd1Hew==
X-Google-Smtp-Source: ABdhPJwk+FAiqQKTjtwxbYma4o5hB0ifj1DfnWv4dAkCgxAHWPjLCAZ6ee6w1rq+TG2K3t2iTSxEtA==
X-Received: by 2002:a17:902:a702:b029:12b:aa0f:d553 with SMTP id w2-20020a170902a702b029012baa0fd553mr3738329plq.3.1630683505148;
        Fri, 03 Sep 2021 08:38:25 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1d09])
        by smtp.gmail.com with ESMTPSA id d8sm5566419pjr.17.2021.09.03.08.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 08:38:24 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] packagegroup-meta-python: Add python3-kivy
Date: Fri,  3 Sep 2021 08:38:22 -0700
Message-Id: <20210903153822.900046-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index b5a2f5d7d9..7a19ea92e3 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -210,6 +210,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-kconfiglib \
     python3-keras-applications \
     python3-keras-preprocessing \
+    python3-kivy \
     python3-kiwisolver \
     python3-langtable \
     python3-lazy-object-proxy \
--
2.33.0
