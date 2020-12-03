Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web08.10811.1607005457966737388
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Dec 2020 06:24:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ms29FEoH;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: twoerner@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id i18so2240115ioa.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Dec 2020 06:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1rxYSVxt2rsNZPb+UMU4XYS7i5eIGaar2fWd3gIV75M=;
        b=Ms29FEoHz8VsQGzRwM1Ov+YCJHhvYJ/fYl6nARKjzG6D7qhrzUpqYDNLxCI4m/nVXX
         3+UybGpeZwYkabHOIeQ8f8CogJRmcuGdg5mfO7Qfhn5b+BK9qFuh3vOB1bFx6uHDg839
         AYVN/EEN90WcMQYsr4yXrgtNidJ4ATT0Gxplvn17MbvBV4oys/tKIGppPGe7UOhNGVcu
         0AihSGhx6tiBmr2fOK2mPmx93xc2mA+aZjB9GsAzGn4Axgv9Cfhkkxk7yRnM6/QTyVhg
         NxGoeJ0zwfG0VVXPyQvTSN+YSd0V9UIwSnPiPOAm7PxpiDHxW70xd6rfQARtiY69Hytf
         Lvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1rxYSVxt2rsNZPb+UMU4XYS7i5eIGaar2fWd3gIV75M=;
        b=DB3lNxUdBb+cBfJ2zZcyAQlNygE9Bh+eWDFr/Irx7o7uE0R7y42hH3C8NE2NX+dJWu
         +XUBSqqLqdzqt2beZshcEWDyGs4FuC7+9SWUPvMQkacwFnzZNtalJCluKslkGl48vzE7
         vTR2AsYH3RFYUNsYhoZ2lB4z8pKHRoInVIw08I/OAKy9uYy9lxXUA1VERPiwgFa0MJRN
         PF/wemX7dMIz5KoJEZcCfe6KC7HsZ7jSTiJRKX0NVsjMqeCsxsPxuQdRc47NqGgXcAoi
         3tfOKwpR4ONMMzMgCgIIolMParZbZBdcOMZ7384m02RbIjFwyqKDPT9bB1zGzRqvkEpe
         K/vQ==
X-Gm-Message-State: AOAM531CjhHBG5NDnul4DGgkR7kzWX/DfRFcaEnVCCv4/0BTw++2mm71
	zYwOD2/hEFaYsJ3BpHe68EA9VezIFAVPhw==
X-Google-Smtp-Source: ABdhPJxJGx9B83DlPdS35zZL3MoN+h0TszZvQ2hJew2tpk44J6qnEzdLWFqWqlN9weymYMf7cKd0tQ==
X-Received: by 2002:a6b:f202:: with SMTP id q2mr3264026ioh.87.1607005457106;
        Thu, 03 Dec 2020 06:24:17 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id g1sm744722ioh.39.2020.12.03.06.24.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 06:24:16 -0800 (PST)
From: "Trevor Woerner" <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 2/3] glmark2: update to latest
Date: Thu,  3 Dec 2020 09:24:06 -0500
Message-Id: <20201203142407.4865-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.28.0.497.g54e85e7af1
In-Reply-To: <20201203142407.4865-1-twoerner@gmail.com>
References: <20201203142407.4865-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index 320d07dfc..da8ca9e2b 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -10,12 +10,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 
 DEPENDS = "libpng jpeg udev"
 
-PV = "20191226+${SRCPV}"
+PV = "2020.11+${SRCPV}"
 
 COMPATIBLE_HOST_rpi  = "${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '.*-linux*', 'null', d)}"
 
 SRC_URI = "git://github.com/glmark2/glmark2.git;protocol=https"
-SRCREV = "72dabc5d72b49c6d45badeb8a941ba4d829b0bd6"
+SRCREV = "784aca755a469b144acf3cae180b6e613b7b057a"
 
 S = "${WORKDIR}/git"
 
-- 
2.28.0.497.g54e85e7af1

