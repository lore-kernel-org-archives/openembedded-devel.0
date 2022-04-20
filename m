Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6675C38A2C
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web08.4599.1650434494579962965
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Apr 2022 23:01:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S5cXrv/O;
 spf=pass (domain: gmail.com, ip: 209.85.214.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id t12so872902pll.7
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Apr 2022 23:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pIVVFIXcTR6GC+vHrFk47C6oNkYRvwmHlRxyxqCXEeg=;
        b=S5cXrv/OxsJg8YRFuxXaZ/7R4W7qyfXHZNWfUKx0NfUkh0cj9UQxhrnRN8vX0PwJsG
         0rchVD+UG4jTn8p1SSjbkjoK+T0GP8Vh6eJ9I6+WqU6fGQCTLrU9ixV0aqnlqd2jOFv/
         5AVOVVOTEBuW+SQIrLUDBC4DFV2LPoWCoI/2GY9STjuTjpsYcVTNS9bidVunjH3PSp4N
         0jLZiwHfZLpYfh7OuHTJFnEb+afQ+WlvMl8BMxrb3QvKqZDDYdmOI9yLAopHSXN2i7is
         umSOV3+KFn23YAnCq9ecDPdMxHflU/0P7uclO7RfKYnKNNffs+NZGVZkXAI4cUfbpPaK
         j5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pIVVFIXcTR6GC+vHrFk47C6oNkYRvwmHlRxyxqCXEeg=;
        b=S9Q8/RDx0PoGCudQjsUyPinQ1LSMrUjAxnYghzgUaUQUz0+7omPQ+86TKAt4+JvxFK
         PiJdgwJWWugljhZele+eqyOF3xQB2MyslG19YxwCtl96fOa8HaAnRNjg3s/ytUzdIx9I
         jjTjB9x+KZ2AEZ39H/vvs2nIG10Ns0GK9TWZpiXUQ9ZuPnvkPxHvTpaGhrDCFJxg6uBK
         cSd0t9vHSr9JqDLbtfs7q4ffsXEiWBumPaiThqvAmBSBqJqebb/FUXH/yy84XqoyveGl
         dn+zeEtd/I3tEycZdIxRP99Ojr6XO2ZQ31zOCx9UWIBJoo/y4ZpUJ3iBqB5cu/oaoxJw
         f+rQ==
X-Gm-Message-State: AOAM5329omtFywYm4P+OQO0nhNZIHXS+c7J3kuziVqZB8zH0yzQSTxet
	cXXOWoxf/fei+UEHUwpMLiwhxhrJtOWMeg==
X-Google-Smtp-Source: 
 ABdhPJzp+U6ARdyLRrYDV6XzRVMcDFR0ArbQ1vHPzC2OdwY1rdPgl3+fI3GSSo49GxjN193gXB5YyQ==
X-Received: by 2002:a17:902:e94e:b0:158:91e6:501 with SMTP id
 b14-20020a170902e94e00b0015891e60501mr19067562pll.29.1650434493669;
        Tue, 19 Apr 2022 23:01:33 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3ee6])
        by smtp.gmail.com with ESMTPSA id
 u8-20020a62ed08000000b0050a90fd59d5sm5789269pfh.50.2022.04.19.23.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 23:01:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH] sysprof: Remove libunwind on rv32 with gcc
Date: Tue, 19 Apr 2022 23:01:31 -0700
Message-Id: <20220420060131.4170633-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96711

LLVM libunwind works ok on rv32 but libunwind is not yet ported

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/sysprof/sysprof_3.44.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof_3.44.0.bb b/meta-gnome/recipes-gnome/sysprof/sysprof_3.44.0.bb
index 3606ca9707..383dd9328e 100644
--- a/meta-gnome/recipes-gnome/sysprof/sysprof_3.44.0.bb
+++ b/meta-gnome/recipes-gnome/sysprof/sysprof_3.44.0.bb
@@ -15,6 +15,9 @@ DEPENDS += " \
     json-glib \
     libunwind \
 "
+# nongnu libunwind needs porting to RV32
+DEPENDS:remove:riscv32:toolchain-gcc = "libunwind"
+
 SRC_URI += "file://0001-meson-Check-for-libunwind-instead-of-libunwind-gener.patch"
 SRC_URI[archive.sha256sum] = "ab5d9f5b71973b3088d58a1bfdf1dc23c39a02f5fce4e5e9c73e034b178b005b"
 
-- 
2.36.0


