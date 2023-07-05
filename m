Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A21C001DD
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 07:00:34 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web10.11247.1688540425529740589
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jul 2023 00:00:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=RhCaOK1l;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: quaresma.jose@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-345f1e0abf9so18532235ab.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Jul 2023 00:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688540424; x=1691132424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rPIJ8t1SACIKZc3Xa0Ce+F1sKc37Bumn0FQ7x98F/g0=;
        b=RhCaOK1lSJkDkdQbWjK+tXaV9sslyPetXc+Rtjt0EKtK+dBiKckPkatnZXoEY5WjjP
         d4B34VvzUxg9W+hocJUIK5I9l7j+e2f2B8FFDA2F6EchZ2irzUgPEtKBwLEg243g9DHM
         X68OAzxkw8TnYvdqr2bSyPh4NnLhAYDx17ouJDcd2Exr5NMyQc5HN+yUiwHDR5N76uC1
         lGGw2z4pyCntlRzlbT+7u6y9IlbrIU3xbpLiMqr6Wh14rb+diPsyJh5wug75lCZ8m9H9
         0/xkCNFfh0mmsEQti91XiH5R2VB8nQ1Yk3HiXZC4EUAxUKkBHZCzaNdixpGNCfNLz+mw
         6CZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688540424; x=1691132424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rPIJ8t1SACIKZc3Xa0Ce+F1sKc37Bumn0FQ7x98F/g0=;
        b=jAUQlUnQ8nRHNXfgctDL3/bKLoCUa6Si2LsVL1spgSvwFzeP5c1FUaREfYQqdtYMcz
         P33A0cBh53T4E4r92+YMdPY9zqDPr9PbsxBiuR6JJyDDdm2sJnxKTBHVLMixltzQGk+A
         iKDRl9jGh1IvE0YuLslvesvylbi5YU9UxDeLwtMlAMV1ZFe/Rx5N3cTk9uLz31ze8J2r
         GQN6FI1HDe5Fpy1uxjzvWDhelp3XLKQ/U04EsVFuhxziBGL8oUEk4wQur6v2xBoEBRhP
         jkb3F+d+GRRaRHmlI7neEyaF3XXCLefdT8JpZI3u67jE8xQbL+CHF+2LMxyD0O3udv8v
         jn1w==
X-Gm-Message-State: ABy/qLY44jC3tnS68zY6hKntE/lMBWqFZ1knhRWlQ5vyk+tzYemiFrHm
	Pb90Umt9RDijIUQ5kNQKRabISt6fGEVoMw==
X-Google-Smtp-Source: APBJJlEfzZtPR4jJrnB5XvJ2xiFQPtoZ4B5gw/pNRink+P/OIU3UwT7SeNXIjxFvGXMCtc5aMGfBNg==
X-Received: by 2002:a92:d2c8:0:b0:345:70b9:5171 with SMTP id w8-20020a92d2c8000000b0034570b95171mr14849947ilg.20.1688540424482;
        Wed, 05 Jul 2023 00:00:24 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id eq6-20020a0566384e2600b0042b6940b793sm233056jab.17.2023.07.05.00.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 00:00:24 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: Ricardo Salveti <ricardo@foundries.io>,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-oe][PATCH] lshw: bump to b4e0673
Date: Wed,  5 Jul 2023 06:59:54 +0000
Message-Id: <20230705065954.3221241-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Jul 2023 07:00:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103666

From: Ricardo Salveti <ricardo@foundries.io>

Relevant changes:
- b4e0673 fix NVMe multipath detection
- e7cde93 NVMe: fix logical name with native multipath

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta-oe/recipes-devtools/lshw/lshw_02.19.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/lshw/lshw_02.19.2.bb b/meta-oe/recipes-devtools/lshw/lshw_02.19.2.bb
index 6420c7e32..f5eda17f4 100644
--- a/meta-oe/recipes-devtools/lshw/lshw_02.19.2.bb
+++ b/meta-oe/recipes-devtools/lshw/lshw_02.19.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64|riscv64).*-linux"
 
 PV .= "+git${SRCPV}"
-SRCREV = "42fef565731411a784101de614a54bff79d1858e"
+SRCREV = "b4e067307906ec6f277cce5c8a882f5edd03cbbc"
 SRC_URI = " \
     git://github.com/lyonel/lshw.git;protocol=https;branch=master \
     file://0001-disable-docbook2man.patch \
-- 
2.34.1


