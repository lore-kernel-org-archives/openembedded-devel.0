Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web12.25759.1608483246338355469
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Dec 2020 08:54:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iqpTLy+D;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id g18so4890305pgk.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Dec 2020 08:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=FXJ5we/1lOg1LmQQZoIHNO15xDf4iH0U8OO8w775SnA=;
        b=iqpTLy+DggXPyPtFilXkwd96drOc2K1C61Kv3AGKTIIxPpE2Ex6YJSCwXqjEZYs1gs
         Vp0DHMo01sJK6XCU7KpB297DzFyqv/WP5fSKYQIqG1NJm1DeHX5MVanf+DWO1wNi9TC0
         uvBMvPkzE+cwhziCEq1Bvms+OH4G8BYt0gEnIALPtysRbMDOFgwawin264hZgLOrimKA
         WQlidcyHN5h6PA5I6fwzMDTdPhO80szYcjGnyfhkMlX1a2luBJKgfPVnXH1wLqqv81C0
         AwmvcIxxxtKHvyQCP9gb28H2pYucCTciApQyZutVLAMRwCLFbE532CyRTyX2XDDstZIs
         +pOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=FXJ5we/1lOg1LmQQZoIHNO15xDf4iH0U8OO8w775SnA=;
        b=K7vzACQPB7RRwsGsL856oKfuw8PJaRQW5FI4wKI/zl36F0xuk4wC9iH5/nJH22oKZF
         uKcbg+qSsqOVPmezBFAsSBZdpND6lXgLU54RilM0eR1x1ltnl2ie9PVXhJtCS2DzFyFM
         88qyLz9fRcPuQPiGgIbbmyGzTwaABvSbxhZ0i0LlpCI2+QAU7/APu4WgQZlxilnAE1uT
         hE/duGJVxsnU9ZD2E9rdCTbckObQYa2CP/rxzV938/+fwjfj5K5h+s7hgW5xQ1jyz/fT
         MyvJR/0yR64CoPyVE7y/4ipA6jLehSL4sDDIfcQ7cv73AQ02RuXm1/Tv+MkAz30jBm4T
         3phA==
X-Gm-Message-State: AOAM531C4OttBWKvcCMRdBYkJfkn7lLDp5yD0Db5JUnAkWMr01DVL+Q5
	tL1qBG+2cTbcOwdiYyMSWqIzdcl86f/+Dg==
X-Google-Smtp-Source: ABdhPJy3DCnExkO7wvPBCBscWWPCVPR1BV7fbStkR2rGPPPzQebTaF5a5WZIvTPpdhz+tTEWjB8Fhg==
X-Received: by 2002:a63:f90f:: with SMTP id h15mr11980314pgi.344.1608483245807;
        Sun, 20 Dec 2020 08:54:05 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:81b4:28ec:120:f083])
        by smtp.gmail.com with ESMTPSA id j15sm14192234pfn.180.2020.12.20.08.54.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Dec 2020 08:54:05 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 1/6] lvm2.inc: switch branch master to main
Date: Sun, 20 Dec 2020 08:53:55 -0800
Message-Id: <699e85e565c0a8fd21dfed381031f1018a5744f9.1608483161.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1608483161.git.akuster808@gmail.com>
References: <cover.1608483161.git.akuster808@gmail.com>

From: Hongxu Jia <hongxu.jia@windriver.com>

Keep sync with upstream

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 3c6c7edfc71..11ee7ca8bb7 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12713b4d9386533feeb07d6e4831765a \
 
 DEPENDS += "libaio"
 
-SRC_URI = "git://sourceware.org/git/lvm2.git \
+SRC_URI = "git://sourceware.org/git/lvm2.git;branch=main \
            file://lvm.conf \
            file://0001-implement-libc-specific-reopen_stream.patch \
            file://0002-Guard-use-of-mallinfo-with-__GLIBC__.patch \
-- 
2.17.1

