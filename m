Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA5ABC433EF
	for <webhook@archiver.kernel.org>; Sun,  8 May 2022 01:47:11 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web12.16620.1651974419121443559
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 May 2022 18:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YzyINNxb;
 spf=pass (domain: gmail.com, ip: 209.85.215.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id r192so5028973pgr.6
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 May 2022 18:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EpsihLpToFbm5GcJ8xjh8Dej2fPuwkeAyvKrXx9tl3A=;
        b=YzyINNxbc7wHHOKVKq2k4ojRDh5ktWDRTaRZytdaZrqFJC3GDFVBrQuez6Ymk4urwL
         6lhWsXs5I62bAFvZLSiCpV7KhW5BsN54ZL0Ze8WcF1bdl2ZiVr5VmeKekSvBOK5XC3W0
         QWfdreWUuXhLgFbrWLlGGxMu1YyJJShhMQe45q3WbnWkwqZPluBO5oRRf56JDce7bMGG
         M5j8jI5PAYLC1HnPwdLO2Uw+3sq2FtHS/9D2NqYSdQXx6f/wv6g04BpsvtS9Ea1ptfy7
         XOLF2n57Mi1OuPfs0jSpOjEnYfBp316yzMRUOkERJhDDY+Nw1erFnotozg4hQrmLHnH1
         Tjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EpsihLpToFbm5GcJ8xjh8Dej2fPuwkeAyvKrXx9tl3A=;
        b=U5/M4W+d5iCQLkW+qILDBOWsl5Xhx5hEepnfqzvscvb4/NkfS9r45+VrvgAuSaS5eE
         gtCW0O3fn294Yzx3DkUXGhPaRkWIVVCCJpnLEowbRmAkEWXdnas3dBRG9yUsIwjPCc+s
         gJNQS9nCacMvpl9u3zONzx6c9BHKHOZei5aHN2vwhAZKXNnGhKcIl04587ao4YA/AXgB
         U/kWqZ/Dva8TxfjqY34vkp+CX4YS9f4RPegBVKR5Q7boDASc1dlaxVUM01W3zKlr8FMP
         NTtekafSFZmAROs/fW8iQzSTcDbcuW+Mqk/63HRKPH4q1oG5WwbX6nZEF42/VwJ72YH0
         0hHg==
X-Gm-Message-State: AOAM530z/7k/k843x637E2D796D30npHBuxi0fFFCibWC8T6YpKV5QkJ
	VWA+eoL2fGh+Lekp6b5/8Uhxx+f9h3JXlA==
X-Google-Smtp-Source: 
 ABdhPJz0SCT57flhUCiBvpgBI2qQzrDT/vuZZCgM+SuealGxrvhuILTeDq2lINwL6qkjNWNbcOnt4w==
X-Received: by 2002:a63:5d0a:0:b0:399:40fd:2012 with SMTP id
 r10-20020a635d0a000000b0039940fd2012mr8267061pgb.454.1651974418331;
        Sat, 07 May 2022 18:46:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 x71-20020a63864a000000b003c15f7f2914sm5646429pgd.24.2022.05.07.18.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 May 2022 18:46:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 1/2] zfs: Disable on mips
Date: Sat,  7 May 2022 18:46:55 -0700
Message-Id: <20220508014656.1381130-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 May 2022 01:47:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96981

Fails to build on mips at this time, if someone provides fixes it can be
enabled then

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb b/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
index 96e07cc454..fb19796abe 100644
--- a/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
+++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
@@ -56,3 +56,5 @@ FILES:${PN}-dev += "\
     "
 # Not yet ported to rv32
 COMPATIBLE_HOST:riscv32 = "null"
+# conflicting definition of ABS macro from asm/asm.h from kernel
+COMPATIBLE_HOST:mips = "null"
-- 
2.36.1


