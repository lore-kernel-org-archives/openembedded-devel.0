Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web12.10111.1597218659211235983
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 00:50:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XVGjLQTt;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id o1so741746plk.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 00:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KsQCwPst5lvFWaHALi+IUS4ygdnbiWCJqMOPbmuIXug=;
        b=XVGjLQTtAKSK7oAI1t4WdlXJOAqgO81E34saDl5YJmVD/hHgnYUNgB6icMpyHpQwFe
         HC/1QQOVqMY/7SR0lMHp8hXsQT2UTCzsomMKf1EPJim/fIG+8sJDkhHATrHoAlBivrS+
         oSZwFnGwFaItGwGXOdGRlSa/iCX6jEfdA0htjyWF9ZIpHuIYteJbwjJBEB/YbBkrb2RS
         TJThaF0ZjCfcp1UuBum4flxua1hM7/vrWlPzD1TELvb8qiQB2hEGY8kQj8TDrJMm5G2Z
         ejwSCiYUR7WDjfM2qOXYntas++5+NXP9B6liqhuMLeadv8usjsypbhP5ew/uDAPify37
         v52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KsQCwPst5lvFWaHALi+IUS4ygdnbiWCJqMOPbmuIXug=;
        b=otIv8sm3IFJnJDauA9dICDDws/9eCDQ7GK/M98MyZMZjGHXRx5UK9I3KzVazXF5K5l
         Dq+6F7REMfF9tbyKBFBYYoB7in42lcB0jwyVfGPKjaLI/oN1SH6xZNFPLS1HDpFwNUMr
         GJl7uMANGDpFz8+MEQwhGXL5P5IuOqFXzNmjmRPVYe+PP+5HRnq6zCT9Hrcq4R6JbkFf
         MWHdDm4hBJPHb5eH0sG9jWHraO4TK7lEiDgPV0ajGU35V+AWD8CC5QrbreKUGcDDj9lL
         SvX/CIwXLx3mXB1VprfR5F3JgZllLAJKDxGZiFhHnhg5VLzeeslWt9qHfd/wFk45c4TO
         qrGw==
X-Gm-Message-State: AOAM5309VeQeOYKk6CkB0japlmdSLM4kWibAh5ncfvyjtMv16WI4dH2A
	4IQBQUC3nh4JauyfG+dsGxgeVmrFyzA=
X-Google-Smtp-Source: ABdhPJxoItopyaLQuULX4pMqxzDAHhyWaI9BqmiBw6fLQRSWaLZNsbNdlelEajeZK3z/Yby41jai8g==
X-Received: by 2002:a17:90b:374c:: with SMTP id ne12mr5055895pjb.120.1597218658332;
        Wed, 12 Aug 2020 00:50:58 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id l63sm1384257pgl.24.2020.08.12.00.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 00:50:57 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2] ocl-icd: Upgrade to latest
Date: Wed, 12 Aug 2020 00:50:55 -0700
Message-Id: <20200812075055.3512737-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: Update copyrights [1]

Install CL/cl_icd.h as its needed by opencl-icd-loader

Do not provide libOpenCL.so these are alrwady provided by OpenCL 1.2 Installable Client Driver

[1] https://github.com/OCL-dev/ocl-icd/commit/3920205736afbb67729e9c73c7b4c6fdb3fcb327#diff-7116ef0705885343c9e1b2171a06be0e

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix library conflicts and license checksums

 meta-oe/recipes-core/opencl/ocl-icd_git.bb | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/opencl/ocl-icd_git.bb b/meta-oe/recipes-core/opencl/ocl-icd_git.bb
index d14ec53e3d..a65c7618b8 100644
--- a/meta-oe/recipes-core/opencl/ocl-icd_git.bb
+++ b/meta-oe/recipes-core/opencl/ocl-icd_git.bb
@@ -3,12 +3,12 @@ DESCRIPTION = "Open Source alternative to vendor specific OpenCL ICD loaders."
 
 # The LICENSE is BSD 2-Clause "Simplified" License
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=232257bbf7320320725ca9529d3782ab"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1238d5bccbb6bda30654e48dcc0a554b"
 
 SRC_URI = "git://github.com/OCL-dev/ocl-icd.git;protocol=https"
 
 PV = "2.2.12+git${SRCPV}"
-SRCREV = "af79aebe4649f30dbd711c1bf6fc661eac6e5f01"
+SRCREV = "a9e57b199ff1e8d03fa3e5c53c5544de3dc72fe6"
 
 S = "${WORKDIR}/git"
 
@@ -16,4 +16,10 @@ inherit autotools
 
 DEPENDS = "ruby-native"
 
+
+do_install_append() {
+    install -Dm 0644 ${S}/khronos-headers/CL/cl_icd.h ${D}${includedir}/CL/cl_icd.h
+    rm -rf ${D}${libdir}/libOpenCL.so*
+}
+
 BBCLASSEXTEND = "native"
-- 
2.28.0

