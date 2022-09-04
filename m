Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD29FC6FA82
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:35:24 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.11310.1662276865171884035
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EwOrJy1u;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id bh13so5608731pgb.4
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=/c0yTIMel6MGBUqQfWs+eDjRkZubR9t07vkY0qPLy34=;
        b=EwOrJy1uXm+C4oJ5UGaRMRL+upr86sV6s94sIEUfrlUd2e84DWosovdNrEmZWtclYE
         l6lMOwRRTeSDwfDaCXMgjA+H8KiGI/koISpEOhRmXXx2ms3RYNvxXOSx3CEoQu6Q/ghD
         E4XOiIc4UKDZQFQXWklOCaQyvbR1g2YaTcbexshMiQftJCgE2EFAZWs9WujK9cS7Pix7
         nASepIZLn90immtQGteDgOj//vnU6T4S+804+l3D9vfvek3B9YiwPLdZOHRad1F0igJ6
         Q8p+xYBEMBwPKp5h1eipl5YoKsjaiJeEVrBDh1jlnW62USz3mR4V1sdIEfGomGTWAk0N
         YcaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=/c0yTIMel6MGBUqQfWs+eDjRkZubR9t07vkY0qPLy34=;
        b=ZBOuZYAGJTztEd+wzxs9IT5B3FCxQ5OFOaXlVgMfOHH2uwbwPFf78sN2jVhNLf2Qux
         Y6cuWqNh2flQ6Xmu/RqKy++jbZ5kkPdjd29MHc5mOuzwrobIIp+8LXQWedfuwcx/Qrvo
         ZFBGJSMfAB6gF8stu+Zw1UB61bdMbTuoqaqO48ySTIaxC9DJ/8QJjDJRc58Pnx50bUt1
         i63/1th62EM8B/OIv8JbNgTqQn4sdVOnX7B5pOTenaNYMLSpbyObwfDOOx5IakZhdRvN
         DEPCll7ER76q3zmC6tG+4mVk2+5rCNOyAWDErQr/+vArGnpFPiibkjbsf9nbACe5oYhQ
         fOcw==
X-Gm-Message-State: ACgBeo0HJ8OLE2GYH+YIduvyPo9+ptMkRc2H7SyO8cPKAMZuiyMlsed6
	HmTEhVrmJkUY5xWuCev1o5Fe8VvRGiuY6A==
X-Google-Smtp-Source: 
 AA6agR58CJHq3x5xbX34BfCoowQWxCOSoIniub8/7f2+UxeUuehNs370gkBc8EkDPGYkied9ZfBPuw==
X-Received: by 2002:a05:6a00:26e0:b0:537:e561:baba with SMTP id
 p32-20020a056a0026e000b00537e561babamr39884767pfw.34.1662276914572;
        Sun, 04 Sep 2022 00:35:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:35:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 53/63] ipmiutil: Add missing headers for protypes of
 free/malloc/atoi
Date: Sun,  4 Sep 2022 00:34:07 -0700
Message-Id: <20220904073417.3251865-53-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:35:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98647

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...lib.h-for-malloc-free-atoi-functions.patch | 26 +++++++++++++++++++
 .../recipes-kernel/ipmiutil/ipmiutil_3.1.5.bb |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/ipmiutil/ipmiutil/0001-ihpm-Include-stdlib.h-for-malloc-free-atoi-functions.patch

diff --git a/meta-oe/recipes-kernel/ipmiutil/ipmiutil/0001-ihpm-Include-stdlib.h-for-malloc-free-atoi-functions.patch b/meta-oe/recipes-kernel/ipmiutil/ipmiutil/0001-ihpm-Include-stdlib.h-for-malloc-free-atoi-functions.patch
new file mode 100644
index 0000000000..1ed6472f6d
--- /dev/null
+++ b/meta-oe/recipes-kernel/ipmiutil/ipmiutil/0001-ihpm-Include-stdlib.h-for-malloc-free-atoi-functions.patch
@@ -0,0 +1,26 @@
+From 097e108b81f2571c4c51871044adf409b6954649 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 3 Sep 2022 00:44:52 -0700
+Subject: [PATCH] ihpm: Include stdlib.h for malloc/free/atoi functions
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ util/ihpm.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/util/ihpm.c b/util/ihpm.c
+index 740ab74..5ad9ef6 100644
+--- a/util/ihpm.c
++++ b/util/ihpm.c
+@@ -68,6 +68,7 @@ typedef uint32_t    socklen_t;
+ #endif
+ #include <stdio.h>
+ #include <stdarg.h>
++#include <stdlib.h> /* malloc/free/atoi */
+ #include <string.h>
+ #include <time.h>
+ 
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.5.bb b/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.5.bb
index d0f3688a25..64bcf5f764 100644
--- a/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.5.bb
+++ b/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.5.bb
@@ -22,6 +22,7 @@ PARALLEL_MAKE = ""
 SRC_URI = "${SOURCEFORGE_MIRROR}/ipmiutil/ipmiutil-${PV}.tar.gz \
            file://fix_systemd_path.patch \
            file://0001-Prevent-access-times-from-changing-resulting-gzip-md.patch \
+           file://0001-ihpm-Include-stdlib.h-for-malloc-free-atoi-functions.patch \
           "
 SRC_URI[md5sum] = "292d6df25cad678bb27e5c8cdc6748f9"
 SRC_URI[sha256sum] = "58ccdbd5755d7dd72478756715af09e9c73330dfad2b91dbf03d2ac504b301a3"
-- 
2.37.3


