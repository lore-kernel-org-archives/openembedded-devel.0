Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.26.1626378330463681246
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jul 2021 12:45:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IA91RVRH;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: texier.pj2@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id a23-20020a05600c2257b0290236ec98bebaso1928139wmm.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jul 2021 12:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=3J2eFgLL9YGQCNkS91K+KbrXQ+wEP5H9S4dCPSf7ozc=;
        b=IA91RVRHa39et+l47n4jfPXfLinubdueiExUsuWPo1gxpoIGZAh6A3xacdt1tdPnWI
         o1bmoRLrBby3n6BJ9/Y2ZsHcraO6ugms8ovFFqR5uPKP3fST7Xi7GXBHZF06XkcF/tyJ
         7jNcDDGFiNZFsFI0G33m8Ab7K8t0d14XlP+dJBvex40NRP0dtTwFRTlSJ7m5DXct6CwC
         qYF/LQckyumdXip3od3KcEiS6UPNJvmiKwXKghTVS0QFDp8eAOGrA0PWIHBnyP4EF0zX
         HIDTt5z8zQP7MgYRAz5rIrBW5MJOPyvBnAPfVF4TDXSwvmthBkgKdwTNpXK73qZo96bp
         BL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3J2eFgLL9YGQCNkS91K+KbrXQ+wEP5H9S4dCPSf7ozc=;
        b=Iu0B0wXyf3ZmV5M61g/inEzwIuI0Oodhkqa36YJGNsSothd5ajBcCxID7v2WSmISDb
         54KNbbj2UUUvI/6hvi1E0NASh2+Ka2N/fiqSIWqQeTMb9/cMD/uJ6rF/1QLkomtB22i7
         maGgZzWhh4IICTHQ+SDHimsW/iEa/jp6W7Q1AotgQpf1U7tU6QrIq+6ReErDap2KVgMx
         taZAYDwIjmRYSmlO7U7A+6CJvTD/Ci/B4LFNPiWcdXCxjI8WerPSeyy6k/8hf+KrdywJ
         OGmq6/Ss8sE+PgJ/T+lB+BlU7UBuMQFwtcLHbbVOiI8S48vKdVzjy0CUdZM9smVVc6qK
         a9fw==
X-Gm-Message-State: AOAM532te7SscNJlQl4da+5x8nITgzJVYM35X0XgQ8Azm8mIGvLbwT+g
	HL50wAjokeDTiA6xGWsMfjDPLKQcoiw=
X-Google-Smtp-Source: ABdhPJyZPIn2ZC6KNiSyepyCEmpYtoH8krRyUcvpAvP1pL9rq2oZiepu7F5Ff0s3G5w06nZsSmpZEQ==
X-Received: by 2002:a05:600c:4e92:: with SMTP id f18mr12265376wmq.62.1626378328732;
        Thu, 15 Jul 2021 12:45:28 -0700 (PDT)
Return-Path: <texier.pj2@gmail.com>
Received: from menoah.home ([2a01:cb19:190:c500:3523:b838:596f:db5])
        by smtp.gmail.com with ESMTPSA id g3sm7602410wru.95.2021.07.15.12.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 12:45:28 -0700 (PDT)
From: "Pierre-Jean Texier" <texier.pj2@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Subject: [meta-oe][PATCH] linuxptp: fix upstream version check
Date: Thu, 15 Jul 2021 21:45:25 +0200
Message-Id: <20210715194525.16639-1-texier.pj2@gmail.com>
X-Mailer: git-send-email 2.17.1

Fixes:

builder@2088cb10ccfb:/work/build$ devtool check-upgrade-status linuxptp
NOTE: Starting bitbake server...
<...>

INFO: linuxptp                  3.1             UNKNOWN_BROKEN  None

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
---
 meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.bb b/meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.bb
index ce28564759..a0f894a4db 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.bb
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.bb
@@ -8,6 +8,9 @@ SRC_URI = "http://sourceforge.net/projects/linuxptp/files/v${PV}/linuxptp-${PV}.
            file://Use-cross-cpp-in-incdefs.patch \
            "
 
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/linuxptp/files/"
+UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
+
 SRC_URI[md5sum] = "2264cb69c9af947028835c12c89a7572"
 SRC_URI[sha256sum] = "f58f5b11cf14dc7c4f7c9efdfb27190e43d02cf20c3525f6639edac10528ce7d"
 
-- 
2.17.1

