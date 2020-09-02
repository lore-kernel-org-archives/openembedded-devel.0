Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.11467.1599063303749460542
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 09:15:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Zt1eKoEL;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id q3so2504474pls.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2020 09:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=BAgUk/P/2uhdr5ZMXir9FwJACTj3LB3kdFOEfrYdCh0=;
        b=Zt1eKoEL0TDFUkUhclip+8ZAdbMmC/iPz1VM8VMUTUEfQoznl0zE9Cv7ZuC4D3qNlM
         GjaC1h38Vj+4LjNsWYe9ydxDZl/iNebNxmodo5NNvvFfL357jdcljC44BDYMxTNwFD8c
         Knue5UH3VsK4aItlUCGuQBynUhdInY4yqL8dgxkq/a17hcz2bIBvZR8kq/zt/BpWhLWB
         3G1JKS0PrKKlm4YZOwgBPYTAIv7oAGqOwcONjapkaveIaxhNsw116yA+7fRn9uf6b9rm
         Mhn10TxKeeSlmK5gX3brXzUNLMi+3rHhJeldi3mxAXOaeC6vP8oi+DNKO9CZmXk5xY7x
         wqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=BAgUk/P/2uhdr5ZMXir9FwJACTj3LB3kdFOEfrYdCh0=;
        b=Sc3B+DAoIU8obaIZs3XPCh48Fqc04st00+KRTs2IWR9BXZ2ZQWgBbJhg1z4amds9mV
         t0XCnIREioVevUXTnAPxtudxAHVv6iVFvkwfJnDmEuIK08GHCUpyPnlUYvmG8BKwVePs
         oRgrn09kwYMK98H65hGhzaJLf2MkMZOSTFRV+TMMCxXervD65QWjbX0b204c6yypLNlB
         7mWWe4ViHGNADeqfF9UrrKbxRQxJS9YTt9ff1BBF7jC1G2Nb246JuBtBsgB9HrQEhdHh
         UBejD7wqzHwlKRI3wxHyaMkNTdLx8hrWnhAcqsfgFdRlfzTchkRfsKi6L7ln3+6FWN8g
         GztA==
X-Gm-Message-State: AOAM5315OS1mL8TWcW8BeCB0M5ohNcGHUvH8fW1VM+YNdjjtoa6PAVmA
	0wgkSqMvBpx+IdbaB/o3KHTZt5wEGTw=
X-Google-Smtp-Source: ABdhPJzvmIiqyE6985qAv8dwXvwX9noNnzXgRuncBTqT2aLxB4YKKWqXr1a0e/nAYgaSNpAFj7k33Q==
X-Received: by 2002:a17:902:9a41:: with SMTP id x1mr2678397plv.323.1599063302833;
        Wed, 02 Sep 2020 09:15:02 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:3889:a22b:6ae0:235a])
        by smtp.gmail.com with ESMTPSA id q127sm4218940pfb.61.2020.09.02.09.15.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 09:15:02 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/3] log4cplus: pkg moved to core
Date: Wed,  2 Sep 2020 09:14:58 -0700
Message-Id: <20200902161500.22518-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../log4cplus/log4cplus_2.0.5.bb              | 19 -------------------
 1 file changed, 19 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.5.bb

diff --git a/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.5.bb b/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.5.bb
deleted file mode 100644
index 967ac7623a..0000000000
--- a/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.5.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "log4cplus provides a simple C++ logging API for log management"
-SECTION = "libs"
-HOMEPAGE = "http://sourceforge.net/projects/log4cplus/"
-BUGTRACKER = "http://sourceforge.net/p/log4cplus/bugs/"
-
-LICENSE = "Apache-2.0 & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=41e8e060c26822886b592ab4765c756b"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}-stable/${PV}/${BP}.tar.gz \
-          "
-SRC_URI[md5sum] = "71dd956bf686195127559671f1426cff"
-SRC_URI[sha256sum] = "c07115c23219390633798def30b7b51a0f79fdeb857e4b49632f17746d0ceb97"
-
-UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/log4cplus/files/log4cplus-stable/"
-UPSTREAM_CHECK_REGEX = "log4cplus-stable/(?P<pver>\d+(\.\d+)+)/"
-
-inherit autotools pkgconfig
-
-BBCLASSEXTEND = "native"
-- 
2.17.1

