Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web10.13470.1588619271273439016
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 May 2020 12:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=P5M4n06e;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id x10so134413plr.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 May 2020 12:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+5Clm9knMdhL6nB6WftbPyEx9J+4VQ9NYuP3hBV1VPU=;
        b=P5M4n06e8RXXUZlvWdCvo/nzB8LnSw7Ph14AWppNo3836iPUPc1pA9ZOMX/2kMuFGj
         sKcwieh7Y10kPBSH5ljHYWLsY3G+R+KjUMYBN+v/we2szZw0WrkWMS4SZcxi0aaAAcEn
         a+Df8mvPi+ehIbI8vTgYvzCYAoAEnmPSOvTDDYQM57vT3Pc0AJzp3dm9z4ful7xsrOSM
         MkaJ8S6NiObn5xa9xGHM9yO94tIi88uz0zOId6xwwR5M2O0eoMWoz1oogbGCOTRWjYxI
         EvN3pwDR/UzYCPXuFqcR0gJYiEBnQ3UqOvq+Qrr8Byjv40F/3UNteq34lA/rBf0sz1s0
         5ccQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+5Clm9knMdhL6nB6WftbPyEx9J+4VQ9NYuP3hBV1VPU=;
        b=VxIBx2DFLEitwmTZ0PeK0mt/sA99qcvJQBR7d4l3sbMn+GdstECdxvd3GOyE9bEIpR
         FG/wNX2rNracq14SpIt/DZmMiexwqiH143a6rP9I5TJLHilaQelWGh3fga/7O1gwd1j3
         aIdXf0nwepZWdpTWPyhb3gGv0gH8lNGC/3e6LkPqeH9RKrdcyHgvSl+zt5lEHiGiu6jp
         YisdFgF1czE9AD8PAHQk+4zOnRq94OpGdEr/YCcqun/WU4lICzYNbIIOZ528uBWJ8PTg
         zHeaOpaK0vd85SgX0hA+3VpOkIy28V/qc3Aq7nUViOWMKq/vAFA7Tb4EEFI6fjF6a784
         0Sew==
X-Gm-Message-State: AGi0PubrPESyoDIW8SZ+Zr1bJtRNYF5XrCWy+y/O/ZwBjIfPGUGW8CN+
	8BVb0VcYcOxyVH/SRafOdvj6ZAfOOGA=
X-Google-Smtp-Source: APiQypIgo7/HAZ5XqSYkCAGvTv3hg6Logtb4RYc1/opX/tVRV0XnyQfBSFQJVT4a5pAEKs+8ppzNtg==
X-Received: by 2002:a17:90a:558a:: with SMTP id c10mr509025pji.53.1588619270330;
        Mon, 04 May 2020 12:07:50 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::b3aa])
        by smtp.gmail.com with ESMTPSA id e11sm9505344pfl.85.2020.05.04.12.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 12:07:49 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alistair Francis <alistair@alistair23.me>
Subject: [PATCH] libgit2: Enable pcre2 regexp backend
Date: Mon,  4 May 2020 12:07:47 -0700
Message-Id: <20200504190747.1941697-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As a side effect it helps the builds where pcre is staged in native
sysroot and CMake system is confusing that and adds it to linker
cmdline, its evident with clang as cross compiler since it brings
libpcre-native into native sysroot

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alistair Francis <alistair@alistair23.me>
---
 meta-oe/recipes-support/libgit2/libgit2_1.0.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libgit2/libgit2_1.0.0.bb b/meta-oe/recipes-support/libgit2/libgit2_1.0.0.bb
index fd26a0fe91..74343683f9 100644
--- a/meta-oe/recipes-support/libgit2/libgit2_1.0.0.bb
+++ b/meta-oe/recipes-support/libgit2/libgit2_1.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://libgit2.github.com/"
 LICENSE = "GPL-2.0-with-GCC-exception & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5b002a195fb7ea2d8d583f07eaff3a8e"
 
-DEPENDS = "curl openssl zlib libssh2 libgcrypt"
+DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
 SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.0"
 SRCREV = "7d3c7057f0e774aecd6fc4ef8333e69e5c4873e0"
@@ -16,6 +16,7 @@ EXTRA_OECMAKE = "\
     -DBUILD_CLAR=OFF \
     -DCMAKE_BUILD_TYPE=RelWithDebInfo \
     -DLIB_INSTALL_DIR=${libdir} \
+    -DREGEX_BACKEND='pcre2' \
 "
 
 BBCLASSEXTEND = "native"
-- 
2.26.2

