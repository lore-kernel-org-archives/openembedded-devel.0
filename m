Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.2243.1593537811380796366
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 10:23:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QjQ7FNK9;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id d194so6880580pga.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 10:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lvNcH1My/m4Z6czHDfkcIKzkkoUxiHQC69se3Ck1Cro=;
        b=QjQ7FNK9cV7y4kV5bRuz4MG6+HctwQP8zUQy0qjrwXAh4ziyZBTbUHtJa41OEtJOkv
         1bWVjmQNXlqU3lT+4NGeYTjqTYSXGbg0I/Vsrk4GdS/5r+O6txfZRZh0xOH8N7yyjNq/
         EojN4gBb4kYL1dQ0QE6kgFHHfEI0sRwNud53w0RUKADSu2m5sW/1ohCeYOihQrFDkka8
         yXdXoAWCNyV7jAaEN/hk3R1bDRStC3nJWFwuIAsxOKLsb0c0HAS9aY5lIUgSQ5Z4aYpJ
         ZCsKN7k7R/RIZKcRXlAopAxykuoH6NQcQqNeWVSgDdJ5QQWcE3sUQgCiRDmfhg77lHj6
         l01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lvNcH1My/m4Z6czHDfkcIKzkkoUxiHQC69se3Ck1Cro=;
        b=QU37UUuBR+WR5IInGdCcPFFjeWbUTPjoIlaHLVOtr30ZOWoCtfFVpNdpJGTBJaHCJ8
         L5ayCbDXQ8LU0Y3jCw6QdEmU2/X5MtjaumDcOvyL4nXCFTzHszDC4fuKI33wHyCErToT
         Uol2a6POZauC9gGY9wLpvIfKz2XY6pipkCHSQ1t+6xFIXpJf6x4hQXQHUG+LJjrF99Qf
         9l/tmlkDQQpDi9I/+LKwgaegPOkqwHFIdDZj/RGBVPAgTesWj5K9WQ7rdfBnDh1hmJ5q
         cgHRGhISNDytvCXLTPVhBIOOM7ekcfvmsbMJM54ShAZvICsY4YtbdFSpD0YK85jsCuL7
         gscw==
X-Gm-Message-State: AOAM533UfDmuQ40is74Q9ni+518KTyQ40JdgT4Uvdzbe1EyFFiTwj18Y
	Pjg8V15ninsImE3vIlaCQYKq3QA3nAs=
X-Google-Smtp-Source: ABdhPJyvudzwjf1A6JY2/xI7P8n4+wdprLFtHp7i0ul31VpEHXUxv3nURQj1Mb3X7baIV+1Anmj1iA==
X-Received: by 2002:a65:64d8:: with SMTP id t24mr16395416pgv.286.1593537810459;
        Tue, 30 Jun 2020 10:23:30 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net (c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
        by smtp.gmail.com with ESMTPSA id n11sm3157132pgm.1.2020.06.30.10.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 10:23:29 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] lirc: Inherit distutils-common-base
Date: Tue, 30 Jun 2020 10:23:27 -0700
Message-Id: <20200630172327.283522-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This helps in compiling the python pieces in this package, which uses
setup.py to build but does not have ldshared set correctly, inheriting
distutils-common-base provides the minimum needed environment for the
python module build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb
index 2843cdf95c..b68303241e 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb
@@ -29,7 +29,7 @@ SYSTEMD_SERVICE_${PN}-exec = "irexec.service"
 SYSTEMD_AUTO_ENABLE_lirc = "enable"
 SYSTEMD_AUTO_ENABLE_lirc-exec = "enable"
 
-inherit autotools pkgconfig systemd python3native
+inherit autotools pkgconfig systemd python3native distutils-common-base
 
 PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir,systemd"
 PACKAGECONFIG[x11] = "--with-x,--with-x=no,libx11,"
-- 
2.27.0

