Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C81FC433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 02:13:54 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.20594.1639448033530823146
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 18:13:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jWowpYYv;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso14927368pjb.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 18:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2NOWnSlZgHoOkKDP108U+S4FQKSKSho3XyJ+TU+ndN4=;
        b=jWowpYYvNcd2ASnfePEHs1coQZ9/nq1iMdruRMhKKpCSeFm0+Tnuy8E+B5tl6EQeA8
         x2hhk4iiXhJXFUb86gx2/jwqgdKLfIRRsZMg+9PsHpDoHcnWNCojRIhp7PXqdDSytnF/
         c1vWLzjiINsau72NoXVWduDAtsRKqdOV7LOXRsscZkf9qJ/QczSzRrY4tFkJ0CTQhpXe
         KzKk2ePdwG0QeEaN7jqWoMGLsjR9qmdM9ms0HbM++L7r/Ttly14wMC3OhDRdKt43P7Rx
         lyul3HD8J85YJEH4H6XKexabkp5dnQ8Xc/Je6wDBT9S1kIBtWXQV8POLTh7NhnJs7QWg
         k+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2NOWnSlZgHoOkKDP108U+S4FQKSKSho3XyJ+TU+ndN4=;
        b=cuIENNl0swzOLbX4vpwXybzGC0LXI8Ajba7BdxwSusXX3GjnlROShadS1rOgFUhSN8
         P3Vrge7ahaKbo5mLfNM0MvuKA2tVvMsfU/0QgAaMd3l7hkiq7tJDDmumvkZ2tX5iGXoQ
         2yoAwue6pBVD8ny78zIARbl+FO49M5zjM0fyklUxh/z7R5YUtni1iyxxLX/7IRittGSx
         /Iz42ek2Cfz29yG2/M2FIkuiUNOzLZtQlTdxMKKeYOXNcWVtFw/54j4JG7I5mpA6b7Vq
         vekUcz6mw0JRqFdf8eAI/nw9QiTOYAun5Y3V/f1bGJW72TYhIiv729HCYoXcgEd5vHcN
         RFeA==
X-Gm-Message-State: AOAM532Qq0LC03bhmbWwaaWxiAyBUznCfx5xc+CoeucgSu0eJjr7EM8B
	UY92L98fU9Mkl9v7RJDzl9u82GxWn0G96w==
X-Google-Smtp-Source: 
 ABdhPJwhpYmjO6Wodg8pHsvQoM8TtM0thOi4MbHQbDsHIj5326MvpYv9RnRLCXu9EDv6iVxUE0uq6Q==
X-Received: by 2002:a17:90b:1c0b:: with SMTP id
 oc11mr2259554pjb.237.1639448032835;
        Mon, 13 Dec 2021 18:13:52 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2b9d])
        by smtp.gmail.com with ESMTPSA id
 o23sm13075226pfp.209.2021.12.13.18.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 18:13:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-webserver][PATCH] netdata: Link libatomic on mips
Date: Mon, 13 Dec 2021 18:13:50 -0800
Message-Id: <20211214021350.3110616-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Dec 2021 02:13:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94347

This is for providing the atomics which is available as intrinsics on
other arches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-webserver/recipes-webadmin/netdata/netdata_1.32.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.32.0.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.32.0.bb
index d06eb87626..5b7f43f333 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.32.0.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.32.0.bb
@@ -25,6 +25,7 @@ inherit pkgconfig autotools-brokensep useradd systemd
 LIBS:toolchain-clang:x86 = "-latomic"
 LIBS:riscv64 = "-latomic"
 LIBS:riscv32 = "-latomic"
+LIBS:mips = "-latomic"
 export LIBS
 
 #systemd
-- 
2.34.1


