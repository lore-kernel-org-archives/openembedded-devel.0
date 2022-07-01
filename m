Return-Path: <troth@openavr.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8478CC43334
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 16:02:20 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web08.40237.1656691335901751915
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Jul 2022 09:02:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20210112.gappssmtp.com header.s=20210112
 header.b=ESOdJAMb;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.166.44,
 mailfrom: troth@openavr.org)
Received: by mail-io1-f44.google.com with SMTP id m13so2746528ioj.0
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Jul 2022 09:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kpZN/TrxTEnMQNR07zFvN82L4CtjXAqy0ZxO1v1MrcA=;
        b=ESOdJAMba3InVe3UyJwVZYVGz+3lErT9XWEthM1atlfbykxtMgW9/Iv10UxfhThB1Y
         HV64FFNFDM0XsGesHrwmQfixR8qrz60p5EA6c4XK9CxQWMaiFwo+uWwnPqzY92FM1tkm
         afJd3HGK21pfOHe11nrOW1NTfzcZLxTaU2YawEYvJ0LcisxTk1YQjPqVaaNga3ve/+Dg
         7NQfMobxQW+9qmwwXRQla3MNjwDQxDwjsI9jmj1XIus57UDTcmDqAlqi4/dK7rP/QMeY
         Kzm7L30koPAQIcuAb8c6oidg9rPWc3xAEM2/+vGIMwZjUnjqsRlqHT/B/vyTembA8YD5
         BDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kpZN/TrxTEnMQNR07zFvN82L4CtjXAqy0ZxO1v1MrcA=;
        b=WBgOCtr7DyBt3xN6NCvnh+se0zOvw46P22CgdOXh+o+UZ0jEQ6IU3t1ICfErlhZOci
         oPiZbHMsTZvc/qZ0FWPh/jZRY1R2skjt9zd5itDTntjtEO3tsWoWcgN6tkO7psrUhC5b
         U8qlC79w0c+93Ex2lX1ikeHiIj7d+VzAvRc7G7vgSTmYE6BrR9nnYFqmzs0eG+oZZY++
         /5lLrmsqQokUcfvAdX96dtMDpLDsyPZtAIefBUTjANj6MieRmZAerE2niYwSupmZbquW
         x9y7YwJeEpbWcivP3OhK2XlS9LEafQeXtYasvJYSBEogMG/tjtNAeOO/IF60IJr9GYSH
         PjRA==
X-Gm-Message-State: AJIora/7Z8h8Cuin9qJJUqTF/kVdaSPhhst78TWIJRiBlH7aYDO1qDU3
	E/1TJgKofgjMJnczQgrhp4A5T8AqGUsXtnx/
X-Google-Smtp-Source: 
 AGRyM1to2pAiAxLt/LNEV97da+D4cDJiubTEKuT1FxL5tqcIPYMhxOe9br1voSG1b5282WENCc61NQ==
X-Received: by 2002:a05:6638:264d:b0:33c:ba2d:72e6 with SMTP id
 n13-20020a056638264d00b0033cba2d72e6mr8983113jat.173.1656691334981;
        Fri, 01 Jul 2022 09:02:14 -0700 (PDT)
Received: from beast.bozoland.org (c-24-8-35-226.hsd1.co.comcast.net.
 [24.8.35.226])
        by smtp.gmail.com with ESMTPSA id
 g9-20020a028509000000b00339de094a02sm9968643jai.172.2022.07.01.09.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 09:02:14 -0700 (PDT)
From: "Theodore A. Roth" <troth@openavr.org>
X-Google-Original-From: "Theodore A. Roth" <theodore_roth@trimble.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Theodore A. Roth" <theodore_roth@trimble.com>,
	"Theodore A . Roth" <troth@openavr.org>
Subject: [oe][meta-networking][PATCH] crda: Depend on correct wireless-regdb
 package
Date: Fri,  1 Jul 2022 10:01:40 -0600
Message-Id: <20220701160140.456931-1-theodore_roth@trimble.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Jul 2022 16:02:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97671

The cdra application is looking for the `regulatory.bin` file that is
installed by the `wireless-regdb` package, but that is not installed
because the RDEPENDS lists`wireless-regdb-static` (which conflicts with
`wireless-regdb`).

Changing RDEPENDS to use `wireless-regdb` instead of
`wireless-regdb-static` allows the cdra application to function
properly.

Example output before this fix was applied:

    root@yocto:~# COUNTRY=US crda
    failed to open db file: No such file or directory

    root@yocto:~# COUNTRY=US strace crda
    execve("/usr/sbin/crda", ["crda"], 0xbec80d70 /* 17 vars */) = 0

    ...

    openat(AT_FDCWD, "/usr/local/lib/crda/regulatory.bin", O_RDONLY) = -1 ENOENT (No such file or directory)
    openat(AT_FDCWD, "/usr/lib/crda/regulatory.bin", O_RDONLY) = -1 ENOENT (No such file or directory)
    openat(AT_FDCWD, "/lib/crda/regulatory.bin", O_RDONLY) = -1 ENOENT (No such file or directory)

    ...

    write(3, "failed to open db file: No such "..., 50failed to open db file: No such file or directory
    ) = 50
    close(3)                                = 0
    exit_group(-2)                          = ?
    +++ exited with 254 +++

Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
Signed-off-by: Theodore A. Roth <troth@openavr.org>
---
 .../meta-python/recipes-connectivity/crda/crda_3.18.bb          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda_3.18.bb b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda_3.18.bb
index 9abfd61cf..a616557e7 100644
--- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda_3.18.bb
+++ b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda_3.18.bb
@@ -36,4 +36,4 @@ do_install() {
     oe_runmake SBINDIR=${sbindir}/ install
 }
 
-RDEPENDS:${PN} = "udev wireless-regdb-static"
+RDEPENDS:${PN} = "udev wireless-regdb"
-- 
2.25.1


