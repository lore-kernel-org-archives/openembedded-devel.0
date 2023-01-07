Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75737C46467
	for <webhook@archiver.kernel.org>; Sat,  7 Jan 2023 03:28:11 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.13365.1673062087260178293
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Jan 2023 19:28:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I8XQCG7W;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id z4-20020a17090a170400b00226d331390cso3766500pjd.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Jan 2023 19:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+JiB1FCTRKKFdL+V8I8PCkhOWcKMV6eZ0VSrOoeg1rk=;
        b=I8XQCG7WNuvbAoKKsnTbJhgec8v6CYxZQBfdPhN0GRB9CTrsniQWdXO1eSa94/paXy
         +6G4fHnsCOdlfMbmva2+d+BusULBq72AL1TBy0uc5MhSGM1D4OTE1fGnFlWZoKIchRoL
         UuUpCt5AJmyGg3mbe38d/QLsgpKy8aVy0I/neluwQXATVEJsTywYUh3L1fsxkb/0Mkf4
         uqnWjUFnHkPwbES5Vo1SMcVtukYpANgGEXhqt7TtmEgmUyvdpAoLBVSqcefzn9p8RHKO
         /A7vPL51LQ7+LqIPm03/7iBadByJA1kOqbbD0X/x1skonbNJOBM9Z58TBcAueGI6LOoP
         w0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+JiB1FCTRKKFdL+V8I8PCkhOWcKMV6eZ0VSrOoeg1rk=;
        b=D2rowEWmEMffMPNVvTyXLOJiilLeFBGYNoFZsXhj+ptivc6SSXWm4t9zXkRcKxKwuy
         +esZ0Jm/m+St02Ue00FbdhecL2oaXXji3KmpW8UAkJi091emrVSkmAV/wTR3Jk+ne1MA
         5/qj61FyZ3nPA6VD2cj1a/UskkYFq+5lcraMLDgnUnstpKqc8f5yVJ+uqNJcxK0+/z0j
         OSVV1t6/OZbauzehSaBspmAcW7LBnQDus380Aommdm3Tg6oRxPOCHHH/vzBquIBIZq/7
         i9UI9IkUc6y2QMpI9U/mgQuGfrA4V9CP1HjQPlfZenrewVGR2WKd3TQwK3nG7kPx0Dtv
         jv9Q==
X-Gm-Message-State: AFqh2kp9JEgtFAm2Sz1XlZdZZYltrWJDgvXNKY+fIkev5yX531AVXdOP
	id4B12nwA6Si3Xp6f6cjv9HoZ0fahZ+Gzw==
X-Google-Smtp-Source: AMrXdXscIKapuN3Sh0KMfjLVoorjqtheSo6oZANghZtkZkd4q4gu2DWQ1vixYU/XcXc/zfyl2iQ+yg==
X-Received: by 2002:a17:902:8e8b:b0:192:e4cf:ca64 with SMTP id bg11-20020a1709028e8b00b00192e4cfca64mr13564316plb.28.1673062086460;
        Fri, 06 Jan 2023 19:28:06 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::ee35])
        by smtp.gmail.com with ESMTPSA id w19-20020a170902ca1300b001896040022asm1617131pld.190.2023.01.06.19.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 19:28:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] concurrencykit: Set correct PLAT value for riscv32
Date: Fri,  6 Jan 2023 19:28:03 -0800
Message-Id: <20230107032803.1593510-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Jan 2023 03:28:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100433

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
index cb65250e9a..fe2c1d201a 100644
--- a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
@@ -21,6 +21,7 @@ inherit autotools-brokensep
 
 PLAT:powerpc64 = "ppc64"
 PLAT:powerpc64le = "ppc64"
+PLAT:riscv32 = "riscv"
 PLAT ?= "${HOST_ARCH}"
 
 do_configure () {
-- 
2.39.0


