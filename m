Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web08.245.1632416188399539484
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Sep 2021 09:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pK832SLA;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id dw14so4887695pjb.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Sep 2021 09:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2MQIBIxwuMiA9qU0T1emr9ihr2sX3/wuCN9lq8LZysE=;
        b=pK832SLAmTbwhheFr2xRJK0xCFLH7NqmNxB7byWvvwHDwdUDflhrTaFILRYFuYwTSi
         Fl9e4NlferktTzWzq71yM0lN3plqITMONP3XukKKEpYyjgrot1TAn4sEzaFv83foUDtL
         ebVWWZx/mkq0a4WSuUSnckRBtxbJx/MrFLmAvAwSE5+oUrLOMCsovMn/E+YvLVFIcnh6
         FItggGfma52yMlyG2Zc4Wq3Ps74UoRPgR/xdHkVVK8GAGlzk8lNQvyOVRGJWfZoutgl2
         KiNqpLW4uiSQPTbVksgRubFvQmDJ6Ufe6GaiQyqoHnkrpRNVDY8nvFnf2YBRGF+XfLf8
         Fk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2MQIBIxwuMiA9qU0T1emr9ihr2sX3/wuCN9lq8LZysE=;
        b=iBH5suxcSzf9Nn9lDV2q+ogKT1NpllXpNyNZPbiK+b72eEWp/mkWNHuxDBO9r+cH+8
         APOg8AVqHsqLxYFpU0U5V48xebQR3lXLj3qUp8J/p/0SxPcXHrRGoDHNL09PTG82voyw
         hK65R7qaxzBDO1zZ245kUGwyDitJmUhsPuI1ebdzkGY0pw90wHxDx12Wn5W+R3/orhGE
         f+WlfPrz3vOcKDdmG8+bgssEdjwr5oPutypKzOwszOa0b4ib92vAFqqn2B0Vay9oIqWd
         MCqCrVDxv4drR+a/QudX87d/uiCqO8yw+p827CgqglyIs0P1UztdWBVnFF2dOTx7/J+O
         4NMQ==
X-Gm-Message-State: AOAM533BsZRMzWMy5rgE6+7I4vsJbUY74UMP5+Im8bAqSka4OJOQxXG6
	RFsxmy0E1bG0zNL3Svggy0/PRrzRvF1IIg==
X-Google-Smtp-Source: ABdhPJyLZx3YdFMJqPZA5K1LruEek3az3JN1XuUVG8gxVmY4c125xjfXXBx7i7GEwo0rTwVC7/lu+Q==
X-Received: by 2002:a17:902:a38b:b0:138:d329:27ac with SMTP id x11-20020a170902a38b00b00138d32927acmr4981432pla.7.1632416187553;
        Thu, 23 Sep 2021 09:56:27 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id d22sm6846597pgi.73.2021.09.23.09.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 09:56:27 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] rdma-core: Inherit pkgconfig
Date: Thu, 23 Sep 2021 09:56:25 -0700
Message-Id: <20210923165625.2481614-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fixes
 CMake Error at /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/rdma-core/36.0-r0/recipe-sysroot-native/usr/share/cmake-3.21/Modules/FindPackageHandleStandardArgs.cmake:230 (message):
|   Could NOT find PkgConfig (missing: PKG_CONFIG_EXECUTABLE)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/rdma-core/rdma-core_36.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_36.0.bb b/meta-networking/recipes-support/rdma-core/rdma-core_36.0.bb
index 097144d356..bcb6c0e101 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_36.0.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_36.0.bb
@@ -26,7 +26,7 @@ FILES_SOLIBSDEV = ""
 FILES:${PN} += "${libdir}/*"
 INSANE_SKIP:${PN} += "dev-so"
 
-inherit cmake cpan-base python3native systemd
+inherit cmake cpan-base pkgconfig python3native systemd
 
 SYSTEMD_SERVICE:${PN} = " \
     srp_daemon.service \
-- 
2.33.0

