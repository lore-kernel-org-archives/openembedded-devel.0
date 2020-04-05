Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web12.23528.1586111995582701839
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2020 11:39:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id t28so13015661ott.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2020 11:39:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7jVtLwbZ3ZoeXuBiuNhD9m3VWGfDvhHBf+n5FNJEBkk=;
        b=Ioq1bIYHL4/Ty/wovUiUJsc9CjIOJd1Z78W55nTsi+uI1EDZPi2IXi1JpisdoXSwa2
         wMdKSu9Eyp2g7BNLBiNUMVA31ey5PsZYxfyRvaeFL2V2qSr5Qc9WEmXVhHY52jTRPoyZ
         im+QdTkK8rUeIc7s3jwHOJZ7RK0btuf+3SZt9qkIBYLYf/9x+Ed723Co396Iwmd18VPo
         oBq7Xs/yv5rCgHPejDV2AriLlaLLpZhC/hPtWcnn884D9HhPXw2Nu0F4QhscDHN8UeGM
         GGXMPnuB/KyfI0I760DyOYofN2VD7aodiEt8mu9rVeLanmJOvXMuOuVzW1jMGM++skOM
         FIYg==
X-Gm-Message-State: AGi0PuZykQVlXh43tvmkfunthe8WnEv0EGVJQyzOrDFgeo5nVTGftB+k
	g8T5ZbZ4etI/YUCVHarQQpuv3pmj+Tk=
X-Google-Smtp-Source: APiQypJP2ivPOf4NFkG0pdpD1pXlkdhZFZExpm6ufEyg2M2UNx1zqST5bpLATCBD7km9HVeFNDcOEQ==
X-Received: by 2002:a05:6830:2421:: with SMTP id k1mr14966536ots.192.1586111994705;
        Sun, 05 Apr 2020 11:39:54 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q22sm3833927oic.22.2020.04.05.11.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 11:39:54 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 13/15] python-pyexpect: consolidate inc and bb files into a single bb file
Date: Sun,  5 Apr 2020 14:39:27 -0400
Message-Id: <20200405183929.28266-13-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200405183929.28266-1-derek@asterius.io>
References: <20200405183929.28266-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-pyexpect.inc     | 11 -----------
 .../python/python3-pyexpect_1.0.19.bb               | 13 +++++++++++--
 2 files changed, 11 insertions(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pyexpect.inc

diff --git a/meta-python/recipes-devtools/python/python-pyexpect.inc b/meta-python/recipes-devtools/python/python-pyexpect.inc
deleted file mode 100644
index 85d9588a84..0000000000
--- a/meta-python/recipes-devtools/python/python-pyexpect.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = "Python expectaton library"
-DESCRIPTION = "Minimal but very flexible implementation of the expect pattern"
-SECTION = "devel/python"
-HOMEPAGE = " https://bitbucket.org/dwt/pyexpect"
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://README.md;md5=500b884e9dcd5f677a53cbbee8ace939"
-
-inherit pypi
-
-SRC_URI[md5sum] = "dc744289858001925c75d21e26f1260f"
-SRC_URI[sha256sum] = "bff4654b113dac6c2231e486e11dcb23281ddc0742a5404467303fe7638829ef"
diff --git a/meta-python/recipes-devtools/python/python3-pyexpect_1.0.19.bb b/meta-python/recipes-devtools/python/python3-pyexpect_1.0.19.bb
index bfd5840410..ea3c018af7 100644
--- a/meta-python/recipes-devtools/python/python3-pyexpect_1.0.19.bb
+++ b/meta-python/recipes-devtools/python/python3-pyexpect_1.0.19.bb
@@ -1,2 +1,11 @@
-inherit setuptools3
-require python-pyexpect.inc
+SUMMARY = "Python expectaton library"
+DESCRIPTION = "Minimal but very flexible implementation of the expect pattern"
+SECTION = "devel/python"
+HOMEPAGE = " https://bitbucket.org/dwt/pyexpect"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://README.md;md5=500b884e9dcd5f677a53cbbee8ace939"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "dc744289858001925c75d21e26f1260f"
+SRC_URI[sha256sum] = "bff4654b113dac6c2231e486e11dcb23281ddc0742a5404467303fe7638829ef"
-- 
2.17.1

