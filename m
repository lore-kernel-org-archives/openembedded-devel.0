Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64934C6FA83
	for <webhook@archiver.kernel.org>; Sun, 11 Sep 2022 19:12:27 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.1804.1662923542985241768
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Sep 2022 12:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VFd0DF7c;
 spf=pass (domain: gmail.com, ip: 209.85.208.41,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id s11so9844390edd.13
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Sep 2022 12:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=5hVY+ym6E+tNkgBq9iq2Qi2u1F9zNQNvtXwu/Kl/Nh8=;
        b=VFd0DF7cAVnrVf3vWYOKYFjYABYm4LuOWUXKhHPWcAcWHMbCJbM35j9mpbqcFuNzT3
         3NpUT/ueylEl+yexl1wWefkP+dv+yVSEn1bJyBhZ3qT6KflTcWvDP8r7E5Z77CFlt9Ti
         WeykG6HSVyyYF2EYNCmoALzDramYJJorVZ4ohYJtXOFZou4eCfj8x9MlJiNIaLNahbwI
         RmL6y56l2PPGTOV5qfYFRZmVVp02wkBU1NgABfwmCarXk80hCUyuRox0W4n05IHsULWc
         bqbtBICaZVAOMSyC/OOUSNYpg6dEr0m8gqxZLC1nVEFgdGLMYy4pTDz9WRmWdxKL6Hrl
         hWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=5hVY+ym6E+tNkgBq9iq2Qi2u1F9zNQNvtXwu/Kl/Nh8=;
        b=xOo7o25Zshm7rGzUphm2zJpxUFvGaEdpCQvQFqznCGPtHbxqgbAl6KqcgVL6DtY4Ok
         y4NiVKCj8vrfI4p+4L3+CQ0rkkCSY3o/6erCVkeOiGPs5e4CWXXkGKnxazfOj2FfqOmo
         N88d76nuErdrnzfsNB2LPqPQBVcvTTdhRs/QSOXL53QA/PBJPczJtg5n5kPPI4qQn1kK
         Dg8qAZHmOrVgHTv26TDQSXb5Gn6pI2Zyzg4eQpAgS6SIbVWXRyeEHaX0mxKVgtUG331C
         SwzUbZUZwzRWnMLEQiIHYyTF7O22CvkAv1By+zZlPqSmiwQOByrJ5IeacOOUs/iW7Qk+
         UxwA==
X-Gm-Message-State: ACgBeo0dRrfjN/iM2zsUGmV7O+cnB9cYGU/kq4tzXtOiCorE2P5LCDfN
	0H0r6266sn9YVmxqvhWvlwDDgP1fBSo=
X-Google-Smtp-Source: 
 AA6agR5ifZyzPTEmBfT4B7zr+gzkrlfdWJwfZmpGJssk5iZ8YzVMidx0P3ukfl5TDfJEi2/M8WXuuA==
X-Received: by 2002:a05:6402:51d1:b0:451:ea13:1583 with SMTP id
 r17-20020a05640251d100b00451ea131583mr122695edd.322.1662923541377;
        Sun, 11 Sep 2022 12:12:21 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 g22-20020a170906539600b0076fa6d9d891sm3304265ejo.46.2022.09.11.12.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 12:12:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] lvm2: use bfd even with ld-is-gold in
 DISTRO_FEATURES
Date: Sun, 11 Sep 2022 21:12:17 +0200
Message-Id: <20220911191217.2596456-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 11 Sep 2022 19:12:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98737

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 34e57ec7a5..dfabf11e2f 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -57,3 +57,7 @@ EXTRA_OECONF = "--with-user= \
                 --with-thin-repair=${sbindir}/thin_repair \
                 --with-thin-restore=${sbindir}/thin_restore \
 "
+
+# gold doesn't like multiple dm_bitset_parse_list definitions in libdm/.exported_symbols.DM_1_02_138 and libdm/.exported_symbols.DM_1_02_129
+# after it was uncommented in the later in 2.03.12 with https://github.com/lvmteam/lvm2/commit/60eb608d66c2056a78e81f27db3da14139d9faab
+LDFLAGS += "-fuse-ld=bfd"
-- 
2.37.3


