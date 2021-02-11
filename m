Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web09.488.1613069065918651710
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Feb 2021 10:44:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=v79Wzioo;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.65, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f65.google.com with SMTP id p21so9530937lfu.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Feb 2021 10:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lEgtpc2U3/+tal8hgVBQu6zrT4INKT3z09mRvpfblTE=;
        b=v79WzioocBPdJLvjFn6tqBQawieXRtVj6nwkUvrsbWXXq/utHJVMtCeCoyBkay1seK
         zibKAByF+WsAeqMvN2yy0Jv0TrrrSK6sJcDYF6hXK3108UC0xi9E2b9/yyhsdARv/mu2
         7qY41zxmmz3TXdBnN4GdZ893/9WpOWwmQvcF5ldD2VJ8wvZkMHI9XSqdfs1H6vmrJNVA
         E5JT1um9FA08X+Z3XhuMWJjBZWr3IYD7P6fCTX0/T1egP9xg++ioQ3Ej+Q6QFYGn/7m4
         M1U8fNF0HlSPE6uAL/IWDDHZDcUzncXkvEJhrdqVGXrcgPdbpIdyUH0+DduZt17tZuQm
         SM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lEgtpc2U3/+tal8hgVBQu6zrT4INKT3z09mRvpfblTE=;
        b=qHpi7rSIc5B9InX9WLcrUcB3a1w1597sBOITAh9hvZI6cATlXeV83jzkbWOkGYdjM4
         Y0xL07KVItt2ODnKRk7mtN3Shm+KpITx8v422WpTxJt3wqvA7kaMKXl1H/YVFJ2s44GJ
         rlRvfHe8Wu+5E+UdPRzBDqlm0jszI8Ojnv17380PxNOqkO2wijV52rPPtwDE05yYyoe1
         87OsTnRWvxzrm1NbkunC7Ka6j8F9GobW/goXBzOTVmsqmyr+UpBXl0xDo3mtiFH2SdYK
         g725ePMoTuuFT6Nh9ClauQo0yy+HPzmaEI7tbYgdlb1EqOZ3ZQsNffRFYhoDIn2C9b7f
         U/5Q==
X-Gm-Message-State: AOAM533YUdTFe2EXBbzUBNjQdtLFgj6Sqo9v68/jIVstygNc7Eew4FY3
	8chiWP5uFtC53Tim71LRdwOV9MOvdhDIXMJM
X-Google-Smtp-Source: ABdhPJzoI0SoxY8ndaDNrOlGOWRd7th8z0Bb9cIpq9WT4ovGPPm2KUJIZaY75bMaUTAyCn3Pd9cTDg==
X-Received: by 2002:a19:6a17:: with SMTP id u23mr4731282lfu.21.1613069063609;
        Thu, 11 Feb 2021 10:44:23 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id d10sm996950lji.17.2021.02.11.10.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 10:44:23 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] ceres-solver: update to 2.0.0
Date: Thu, 11 Feb 2021 19:44:15 +0100
Message-Id: <20210211184415.2232107-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: license of subcomponent was added:
https://github.com/ceres-solver/ceres-solver/commits/master/LICENSE

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{ceres-solver_1.14.0.bb => ceres-solver_2.0.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/ceres-solver/{ceres-solver_1.14.0.bb => ceres-solver_2.0.0.bb} (92%)

diff --git a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.0.bb b/meta-oe/recipes-support/ceres-solver/ceres-solver_2.0.0.bb
similarity index 92%
rename from meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.0.bb
rename to meta-oe/recipes-support/ceres-solver/ceres-solver_2.0.0.bb
index ac463038a..28d0868c4 100644
--- a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.0.bb
+++ b/meta-oe/recipes-support/ceres-solver/ceres-solver_2.0.0.bb
@@ -2,12 +2,12 @@ DESCRIPTION = "Ceres Solver is an open source C++ library for modeling and solvi
 AUTHOR = "Sameer Agarwal and Keir Mierle and Others"
 HOMEPAGE = "http://ceres-solver.org/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=35e00f0c4c96a0820a03e0b31e6416be"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bb761279816b72be19d7ce646e4e2a14"
 
 DEPENDS = "libeigen glog"
 
 SRC_URI = "git://github.com/ceres-solver/ceres-solver.git"
-SRCREV = "facb199f3eda902360f9e1d5271372b7e54febe1"
+SRCREV = "399cda773035d99eaf1f4a129a666b3c4df9d1b1"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

