Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web09.672.1614884257142023757
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Mar 2021 10:57:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qc9aVx5i;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id s23so7747645pji.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Mar 2021 10:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VqiWh+tc4TdpZDYa2xgtgKy55qgozDhi+1KXNaM9d5g=;
        b=qc9aVx5iRvXYiNJeMoM/8UmIhz+4L/fljgyTu9bJwXMnYKymYD67J/wY2VauX/Z69B
         wTDpolgzZHnOwwjyKE1mRu9rObzJhoR6CnnvIHJC8V3/f0FFsCRsLWcoPOgIhtGuAaMk
         YvxvSKcRued+TcmgApiWMpqq/gCGQYNyi/ayx0GOzzZwwo2tCijOw6fA8TIt1/3NZNzg
         S5OQNBS/QY8NzuDhZkwuPMQiS4K9ggC4YgxyjKH4m+o7eHQ7hM8RK9E3HeNg4SCJyBhX
         jP9BoAB3Q10/tjdeoBYqfPTV1ckDWsUPLCrdX2GGHcjj3IJNCk6A9dp6s9QC3FWgOn41
         GcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VqiWh+tc4TdpZDYa2xgtgKy55qgozDhi+1KXNaM9d5g=;
        b=MdGO2cu4r7eArAt3bL+h1aqjIzbGBCUOp2CQBrEHFLvWF8qiRmpQtvV/ODM7xQOk2C
         qkAKRqhF2QJEXX7VR9jHg/nPIOPLursCDre1uXwbCc7V2yfZkbSYvShRhOU3XTyktP2g
         PbniyjyDcphgzjpx18/kh5dA7tXU/msZojytRomr3UctCn4Ki/9a/5EZIb/79bZEMH9V
         oXcOIBc3OA1OZsKzkgbMLhsaqsA1tZNVcIli2+eKUWvA9p4942V7MOhXzu6/S1FfMKQc
         gt9qp0cjsfIoX3iITyemnDK64yKN6Mjx1NPcNEqIxDVAtxfnE/NdXVKupvwyognVCzNS
         VNqQ==
X-Gm-Message-State: AOAM532QalPaFqkoOQ5AN9di5bav26P+IN4HnYaxZZbKzedySOBYYDAa
	BYG1WlqLQIh+8qYDJg6xKrETksiIcZ20Yg==
X-Google-Smtp-Source: ABdhPJyNEpSC6G+XBY4kr6mt03+1qecyuMDsgdAC7rR/sP4ip+HRltZ5YWGqwJVFtrYKp/ywl5Fvmg==
X-Received: by 2002:a17:90a:5b11:: with SMTP id o17mr6259481pji.32.1614884256376;
        Thu, 04 Mar 2021 10:57:36 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id t16sm133582pfe.165.2021.03.04.10.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 10:57:36 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] opencv: Add packageconfig for building tests
Date: Thu,  4 Mar 2021 10:57:31 -0800
Message-Id: <20210304185732.890730-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This could be enabled when ptests are enabled but generally its fine to
disable them

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_4.5.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.5.1.bb b/meta-oe/recipes-support/opencv/opencv_4.5.1.bb
index a595e788a2..d6652a01d9 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.5.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.5.1.bb
@@ -124,6 +124,7 @@ PACKAGECONFIG[python2] = "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${
 PACKAGECONFIG[python3] = "-DPYTHON3_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include,,python3-numpy,"
 PACKAGECONFIG[samples] = "-DBUILD_EXAMPLES=ON -DINSTALL_PYTHON_EXAMPLES=ON,-DBUILD_EXAMPLES=OFF,,"
 PACKAGECONFIG[tbb] = "-DWITH_TBB=ON,-DWITH_TBB=OFF,tbb,"
+PACKAGECONFIG[tests] = "-DBUILD_TESTS=ON,-DBUILD_TESTS=OFF,,"
 PACKAGECONFIG[text] = "-DBUILD_opencv_text=ON,-DBUILD_opencv_text=OFF,tesseract,"
 PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff,"
 PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
-- 
2.30.1

