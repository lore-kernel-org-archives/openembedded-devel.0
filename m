Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web12.3571.1618693604663126207
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PyUMhDH6;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id z22so10611387plo.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ascjHQ6Ze6D6FwWhmyDL4wR1gdRTTIjIplvTUSSV9Ek=;
        b=PyUMhDH6Vbcjt/T9k6/oM9vw9OkVar6wGEa/OQ9J3hoeZ5D+beX3i6DzWgmvyeDvJ7
         4c52TTTxcnmTV/dMknoixOUZspGXHbmv2YcgkAZKhSYkoCwrjlqqLk0xWkdBGJLLvwCB
         elQIIPzxwbh2+v5aiY1b3BdcuO/+yK5sa2nV/I39Iy5HCmBoHVOyDR2l3q3/grSIYhSB
         2CZgm0oEOyPeOXvYRpLvf/58e0fBT81fPAyuDeSvtdgIcYnUqUgXgeDnhsSAp31woHbM
         Agk5atrZUfWpD1bqEClaQsYLEeIP32SIGM7kp8FKAcgvCmQ8vZPqGKJJMEWSygOITcNq
         87fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ascjHQ6Ze6D6FwWhmyDL4wR1gdRTTIjIplvTUSSV9Ek=;
        b=MHuVqei5pbt4WW4gJ97i4rlLcFoyNXK2smdGZcsPLBojNH7GXKdLe25SgkqQBBhKiQ
         yAmnnQ4VIRrrJGy1akLJVVSfvePg74huYKX8qzki7mHjKLd8dlv+2sfQDqKgKlzJrSYI
         721unxImvQAxhlhlJtEmW6uqjGDr8DaYiGkNl6xp/cwkwjrx757PnV1Y9OBVP09qcjqj
         v7SUmx5AVpV54BmsgCjfcgBEYJzvrZNjVLxqE45azqWziNPIPSBxpluMl+3vvjZ5LZfW
         L7+xulsgZYYZIcrLFNoXqn4xbolwwsNqSd+jUXb3jg3sxpCdaOLxrEAWXES0yaH+eIG5
         ZrPw==
X-Gm-Message-State: AOAM531BToPt3cM5LA2/LcxFwBP0L9A7ehUm78tHtsrKHnW8NXEVeQX3
	gQ99Z4HTNsL8LyDSLEcjUWFrCOPx+2aBIQ==
X-Google-Smtp-Source: ABdhPJwuSH8H8k7Q/gAWFOcj+yzNEDyRZHesnDnDjN5j2vWePO7KybQ+eQ7O8Si8TXFXrNpM2Hi6/Q==
X-Received: by 2002:a17:902:ed87:b029:eb:a96:7892 with SMTP id e7-20020a170902ed87b02900eb0a967892mr15398211plj.47.1618693604090;
        Sat, 17 Apr 2021 14:06:44 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:43 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 47/50] vnstat: Disable install parallism to fix a potential install race
Date: Sat, 17 Apr 2021 14:05:56 -0700
Message-Id: <a9eace646c639ee1020925c3e0c5645230341ec1.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

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
(cherry picked from commit 342b6b047504e4efa12d29c5f1956aa9d67a43e5)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/vnstat/vnstat_2.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/vnstat/vnstat_2.6.bb b/meta-networking/recipes-support/vnstat/vnstat_2.6.bb
index 9a650f40909..ad8802f3a66 100644
--- a/meta-networking/recipes-support/vnstat/vnstat_2.6.bb
+++ b/meta-networking/recipes-support/vnstat/vnstat_2.6.bb
@@ -17,4 +17,6 @@ do_install_append() {
     install -Dm644 ${S}/examples/systemd/vnstat.service "${D}${systemd_system_unitdir}/vnstat.service"
 }
 
+PARALLEL_MAKEINST = ""
+
 SYSTEMD_SERVICE_${PN} = "vnstat.service"
-- 
2.17.1

