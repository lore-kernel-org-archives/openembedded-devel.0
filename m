Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF942C46467
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 17:48:47 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.1169.1650383922060630783
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Apr 2022 08:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d1BLbrfm;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 2so15814978pjw.2
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Apr 2022 08:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lZnVU7NCL+CDwYtOq5gUGskhKLhWqt1zlpj/IgdthyE=;
        b=d1BLbrfmrLPaUP1ZXZu+48w+p51XkVA99DPKOX457Ep4ItlAulqvGDbbOEy3Y3iofe
         CbNXNWxa8w8TzAoWiKpZbqqxHiiHdMirr5Cn7co+TmyZdlNWAzFhfC2pgK0JkQdf6cLs
         k4Z0QHfUPb4J7L3x0xCo17xryPtk0ZhAIniA7my3zZpNScsmC+zrvBfii12WceM+5Dwj
         o/P6DMFcP8cE/S8NjNIPpf3PqnGwgXOAoOCU/f3onFUBluaZ0Hq3nWtXieq/LMtS61ve
         lQZZEpTac+4MEpFO6sCC5GQZxiGTYQTtVL/wUao6F+NEI22TVFBwTeTseYXCNSiNgpNb
         Lpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lZnVU7NCL+CDwYtOq5gUGskhKLhWqt1zlpj/IgdthyE=;
        b=ylDlBvboNv7xJ3OAsrhkyKasQ/UoJa200Y1aWW0XzIOhHxl18Jktn/B08/LMwka8YC
         oKejkl8RvKkz8yERL0v6yoONorIEpMat96R0tP6HeN291Ov0S+KPX84BfaKROKSAit3i
         /HIAIxNSnrpnduOU8RZFJJ770zomwher25EAzR6DLta9vf9CBJr3A1IJbhqyMQ6D4hC0
         peZC6FDFKGG4N0G5XPmcnt6lMO81B44xdfjsXdkZDl8XZNOD0FWk0moCAiQKZCNhml0/
         hzBU2uGuthNKIWqNBC+UmAn/CznQEMJsmlnabzKXitv1ARC29SyW0Ju1tWu9HUiiU09F
         Ssgw==
X-Gm-Message-State: AOAM533AiyistZwS2CtXLlxKNPxl8YwIfQFyzbNxO8PJDnmGAE3vn6NA
	yDeCu6huIXdvJPgoZxQ1xVZV/wz/lppj0g==
X-Google-Smtp-Source: 
 ABdhPJzqfvg6F6e9rNQXcc6sxBSWf00pfVTZTaWdNlXd0KgApNrzcmAkqwd6AVi1kM7Qy4vGakOKmA==
X-Received: by 2002:a17:902:6acc:b0:149:8f60:a526 with SMTP id
 i12-20020a1709026acc00b001498f60a526mr16534841plt.25.1650383921378;
        Tue, 19 Apr 2022 08:58:41 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3ee6])
        by smtp.gmail.com with ESMTPSA id
 x39-20020a056a0018a700b004fa7e6ceafesm17968474pfh.169.2022.04.19.08.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 08:58:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH] gimp: Disable vector icons on 32bit systems
Date: Tue, 19 Apr 2022 08:58:38 -0700
Message-Id: <20220419155838.804695-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Apr 2022 17:48:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96696

This uses qemu during build and qemu-user segfaults on all 32bit
architectures, until that is fixed disable building vector icons on
32bit architectures

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
index 1155e0eec3..a73de1e3ff 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
@@ -51,11 +51,7 @@ EXTRA_OECONF = "--disable-python \
                 --disable-check-update \
                 --without-wmf"
 
-EXTRA_OECONF:append:toolchain-clang:arm = " --disable-vector-icons"
-EXTRA_OECONF:append:toolchain-clang:riscv32 = " --disable-vector-icons"
-EXTRA_OECONF:append:toolchain-clang:mips = " --disable-vector-icons"
-EXTRA_OECONF:append:toolchain-clang:x86 = " --disable-vector-icons"
-EXTRA_OECONF:append:powerpc = " --disable-vector-icons"
+EXTRA_OECONF += "${@oe.utils.conditional('SITEINFO_BITS', '32', ' --disable-vector-icons', '', d)}"
 
 do_configure:append() {
     find ${B} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
-- 
2.36.0


