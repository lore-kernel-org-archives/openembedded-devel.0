Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.2736.1618461733554462378
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Apr 2021 21:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n6AbqXDf;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id z22-20020a17090a0156b029014d4056663fso12002447pje.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Apr 2021 21:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6rV1v0DLSIFx/vVakA22dkepjOJZ4k/Q3SGPOPti7t4=;
        b=n6AbqXDfwM4TCZzkPX9sxhg5AUdWmXf5JE94G/tVd8iMYGa0B6C9tSrMERV1f/cwvX
         ner8ZJzp3vNvskAxbWkXp09Kc0VVqLjdiOO19cEHTk2zfu/Z8oKQPujffJJADo7HktV6
         gPhJJZrue72p51FHiuYu+xn+AJ+eUoE8cPIzMCChf+8Z2Z+Srte8leg22jEPP1XKSkdQ
         9mvMqtrwwf1lkvZPeC7yTx8cqnSjIEhOTFLhom8zd8Yvpprjdzn6nA8hw+EC/Pzg7sZN
         f0fO3m4Rr9/ErwMARLp5F5ir6YCwJ3C+hQcv+00r8h8p0Tlu1QqC4cydqpDn9Zqv8tgs
         Ok6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6rV1v0DLSIFx/vVakA22dkepjOJZ4k/Q3SGPOPti7t4=;
        b=YIozNFxRsJI3RDQBKAZSfuoaPgpBp8SW32Vamtu9D0XQcFt8xYQA1xIk5g0UedSMU1
         UJFM5AG9LAcmURWXXc+iKiOlqnDWCfugK6rcfA3oeZrBQrBHKF8ykEC1i9Y9HQUFA9wD
         uaG8cUZ7+drmVkxFG5xKUPhvqLiRFASEfk740qbXk4UBnudQ+x7LDT5aZezg6VFM/8Xq
         kWw9onHgiN1Enemei4MGiL9Rzn22BAncQ12z9JpfuHehDbyCyitHkoy16QSRbWx4m/uy
         xHNwNpIsDB90EtEcE+Nl8XbykEXdkCZC5Ym1BAxrOlEYhetZlxy9bEyPbfu7GwolBNoe
         cE7Q==
X-Gm-Message-State: AOAM532dO3G3d7CyTGbBUXZN2cG4wqpaOOFu3Yj95jV/MLKYmCAOWxWz
	VCkn6IJHGC0eKuyFVvRFGeji0tf0G63Elg==
X-Google-Smtp-Source: ABdhPJz/VwyyJhMF8e7nDnqKvgV8e03rQw62MK+fqitkTnDF1OAKw0LdhBTyYdWGQH7x3pAxnHdpzQ==
X-Received: by 2002:a17:90a:9903:: with SMTP id b3mr1662931pjp.97.1618461732846;
        Wed, 14 Apr 2021 21:42:12 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::630])
        by smtp.gmail.com with ESMTPSA id l17sm945722pgi.66.2021.04.14.21.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 21:42:12 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] vnstat: Disable install parallism to fix a potential install race
Date: Wed, 14 Apr 2021 21:42:10 -0700
Message-Id: <20210415044210.246051-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It seems in some cases installing vnstati program races and is tried
twice, and second operation fails since it ensues somewhere between
the file being created by first operation and file actually being
created

   /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/hosttools/install -c vnstat vnstati '/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/vnstat/2.6-r0/image/usr/bin'
|  /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/hosttools/install -c -m 644 ../vnstat-2.6/man/vnstatd.8 '/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/vnstat/2.6-r0/image/usr/share/man/man8'
|  /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/hosttools/install -c -m 644 ../vnstat-2.6/man/vnstat.conf.5 '/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/vnstat/2.6-r0/image/usr/share/man/man5'
|  /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/hosttools/install -c -m 644 ../vnstat-2.6/man/vnstat.1 ../vnstat-2.6/man/vnstati.1 '/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/vnstat/2.6-r0/image/usr/share/man/man1'
| make  install-data-hook
| make[3]: Entering directory '/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/vnstat/2.6-r0/build'
| Making install-exec in .
| make[4]: Entering directory '/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/vnstat/2.6-r0/build'
|  /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/vnstat/2.6-r0/image/usr/bin'
|  /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/vnstat/2.6-r0/image/usr/sbin'
|   /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/hosttools/install -c vnstat vnstati '/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/vnstat/2.6-r0/image/usr/bin'
|   /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/hosttools/install -c vnstatd '/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/vnstat/2.6-r0/image/usr/sbin'
| /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/hosttools/install: cannot create regular file '/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/vnstat/2.6-r0/image/usr/bin/vnstati': File exists
| make[4]: *** [Makefile:822: install-binPROGRAMS] Error 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/vnstat/vnstat_2.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/vnstat/vnstat_2.6.bb b/meta-networking/recipes-support/vnstat/vnstat_2.6.bb
index 9a650f4090..ad8802f3a6 100644
--- a/meta-networking/recipes-support/vnstat/vnstat_2.6.bb
+++ b/meta-networking/recipes-support/vnstat/vnstat_2.6.bb
@@ -17,4 +17,6 @@ do_install_append() {
     install -Dm644 ${S}/examples/systemd/vnstat.service "${D}${systemd_system_unitdir}/vnstat.service"
 }
 
+PARALLEL_MAKEINST = ""
+
 SYSTEMD_SERVICE_${PN} = "vnstat.service"
-- 
2.31.1

