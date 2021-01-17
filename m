Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web12.21063.1610905032926730239
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:37:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZbDakPC+;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id u11so3052243plg.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=iKQef/W56JRkKOe0QI4FmC5PxjpUMHDnXcpLtoaUMr4=;
        b=ZbDakPC+SpQotXVcaFL30VcFMrJOYMvlKK0btEGhtxhzo8juWkN20lCgv6c1gA5ocK
         BU1z5JNlZmc05bZlrZZrvc8Kqzdd6hvnMQS7YfIyd2EC3bftmYNNf5VG2tleQzJCla6+
         wVXqq62dgYfAYhLe6Nax6HIVU5dmGJLvM+Hp39qPcaM4n7qwKycLnj7XvuUTLPbBoimh
         r9+MWR32J1kWPEVxjKgpNe8EAuZgA3w1ow1WHpQnLTLWaxtGOyfEo4ooypGUvhjaJ0Yf
         AmS9uEzGFkaYUjyUdw2JVbWAFT4ncerp+zppXtZWJn1jy7SYQgFOv8ZtVpFddTDJHRQ9
         9aYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=iKQef/W56JRkKOe0QI4FmC5PxjpUMHDnXcpLtoaUMr4=;
        b=AuUic/FVvU0LyG3nf/DvnYbzLlJzwrSFX2HhldLUaXKMNpsIpbFp+X6tPSMeABgaMg
         rCBL1VUFFTdZOslOrOO+INEhC+3GW3k4RNcObyAhnRiZ2wwGdDegREiPsRsomCXLAbMC
         RJaP7Ee7NE+dX07L6xcDttIxaFSl8miryXHVPfjfh7W0e2fD1jfuU8C1xz11e/NQHKIO
         hGicok264fURDIVGxQk5GhxV3bjQCvWyf+EvjiD6DAEc5mjSV1VWv8h91oyw1fijnCgF
         1pIWi4qmQKAueW+4V35uNZQTjmU/4mYcseqXbODUsVMW8aTx4xfWGl441UQeksijn32X
         YlRQ==
X-Gm-Message-State: AOAM531+8uPRnr24a54av8fwBfz7ZbpVMSnAX2imO8JAjV6flC32/uR3
	SikWHS9t66lmvVhPtTO4k4syt61mb3AE/g==
X-Google-Smtp-Source: ABdhPJwhpWRHvl7TZftSjbeGAwoZvr5vNxEwxIwbJJntA2LG933GCusj0rVlqMcMdJ3VaGwQB+cFzA==
X-Received: by 2002:a17:90a:b284:: with SMTP id c4mr21872045pjr.183.1610905032375;
        Sun, 17 Jan 2021 09:37:12 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id t4sm13661338pfe.212.2021.01.17.09.37.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:37:12 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 31/31] fuse: set CVE_PRODUCT to "fuse_project:fuse"
Date: Sun, 17 Jan 2021 09:36:36 -0800
Message-Id: <fd7dc3487134aae50382c651996077ee1d109060.1610904793.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610904792.git.akuster808@gmail.com>
References: <cover.1610904792.git.akuster808@gmail.com>

From: Mikko Rapeli <mikko.rapeli@bmw.de>

Other products like "RedHat:fuse" introduce false CVE findings like:

https://nvd.nist.gov/vuln/detail/CVE-2018-10906
https://nvd.nist.gov/vuln/detail/CVE-2019-14860
https://nvd.nist.gov/vuln/detail/CVE-2020-25689

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-filesystems/recipes-support/fuse/fuse3_3.9.3.bb | 2 ++
 meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.9.3.bb b/meta-filesystems/recipes-support/fuse/fuse3_3.9.3.bb
index 8ef9ee12c3..e80b3f5530 100644
--- a/meta-filesystems/recipes-support/fuse/fuse3_3.9.3.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse3_3.9.3.bb
@@ -20,6 +20,8 @@ S = "${WORKDIR}/fuse-${PV}"
 UPSTREAM_CHECK_URI = "https://github.com/libfuse/libfuse/releases"
 UPSTREAM_CHECK_REGEX = "fuse\-(?P<pver>3(\.\d+)+).tar.xz"
 
+CVE_PRODUCT = "fuse_project:fuse"
+
 inherit meson pkgconfig ptest
 
 SRC_URI += " \
diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
index 95e870691c..2c272d4527 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
@@ -22,6 +22,8 @@ SRC_URI[sha256sum] = "d0e69d5d608cc22ff4843791ad097f554dd32540ddc9bed7638cc6fea7
 UPSTREAM_CHECK_URI = "https://github.com/libfuse/libfuse/releases"
 UPSTREAM_CHECK_REGEX = "fuse\-(?P<pver>2(\.\d+)+).tar.gz"
 
+CVE_PRODUCT = "fuse_project:fuse"
+
 inherit autotools pkgconfig update-rc.d systemd
 
 INITSCRIPT_NAME = "fuse"
-- 
2.17.1

