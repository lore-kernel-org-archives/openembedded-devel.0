Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD5C2C05027
	for <webhook@archiver.kernel.org>; Sat, 18 Feb 2023 02:13:18 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.4869.1676686394183826059
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Feb 2023 18:13:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gtWkkQdh;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id f11so1725620pfj.11
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Feb 2023 18:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1h+1QXDG/HN6+u20xH25n6KnXiL8FiVOe7PKdeQd2qw=;
        b=gtWkkQdhJIKblXyo4ORR1A6OGqODILpJRc8eO8fmJlHRwlEOJNN681enSuTJIT1veH
         cJH62Jprb5oVSsVWgy/7oILLxJuvRYDXpNr4fA4KNxGkgdPiCvPe0cNx1jU3WzMk+W5m
         M/HGHDa34OU7J4EHxaI8XiB2szZEHid+wE9qhL5Vxf7fPw6a0xus6KTmXmD6g35xDB/Y
         yLAyUuLPsC7kMoHQDBj/Mr9AUNSlaB9FRUHSUkXq94YjNQ9BfRpFrYPxraU/0d1WkimD
         EtFULAmTnx29Y7osQRYVzqJHGfUpasA8pwxbg+NkqMOOrKJlXbUUipafkuASGDOnPY9f
         S53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1h+1QXDG/HN6+u20xH25n6KnXiL8FiVOe7PKdeQd2qw=;
        b=hGAMabLjV7GPDm0zHuCdoFxTYLskwect8F7qe+64WfFSlx9mp5iVIxbaPrDN3sAKgt
         fAkgSh8bquRL2Xm1Tds2ZbyC/oO4Xwt+aUHqSAbOxg6TCO3Slwk5/X9ZqqTO3liAMIEw
         r4Dr3hNqbqfxfrspjcjJCnvuNNpbPotDQHmmhEv1Apq96hqO6lFo9KnuuqLE92881QmV
         DOdXWFJNNCoo7zL6Q232qAI0B1FAQnjbBl6ZqexPcfiNKEhdUDtmIxBqmBvTvYDJlbMJ
         zYJKyggfdvi27VJImzaPqtaGOj6IlXLMs7tMsDeO5VuU1y1LIerH7qTvMQZYXtYpYSGC
         oUkg==
X-Gm-Message-State: AO0yUKVIyHWWxrJfGU43kAS/B8gCTSXV++4Uy8cK3AV59uTc7rJjmlhZ
	J3yA7VU49uOJG3pIe8Zvie6QncGFG9s=
X-Google-Smtp-Source: AK7set/oQtwtWry2oZg3LuIKGWqY0vlGJtEBtdZIeB51axH/LFwi9wG8I5+yYxAwY3ywqcbHB/SbRw==
X-Received: by 2002:aa7:96ae:0:b0:5a8:380d:7822 with SMTP id g14-20020aa796ae000000b005a8380d7822mr1947856pfk.23.1676686393118;
        Fri, 17 Feb 2023 18:13:13 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::3020])
        by smtp.gmail.com with ESMTPSA id j5-20020aa78005000000b005938bd2bfd3sm3649097pfi.120.2023.02.17.18.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 18:13:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] glog: Link with libatomics on mips.
Date: Fri, 17 Feb 2023 18:13:10 -0800
Message-Id: <20230218021310.2354303-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 02:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101129

Mips does not have 64bit atomic builtins therefore link with libatomic
we might need same for armv5 and ppc32 too.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/glog/glog_0.6.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/glog/glog_0.6.0.bb b/meta-oe/recipes-support/glog/glog_0.6.0.bb
index 18291600c5..067e914aa2 100644
--- a/meta-oe/recipes-support/glog/glog_0.6.0.bb
+++ b/meta-oe/recipes-support/glog/glog_0.6.0.bb
@@ -17,15 +17,18 @@ S = "${WORKDIR}/git"
 
 inherit cmake
 
-PACKAGECONFIG ?= "shared unwind"
+PACKAGECONFIG ?= "shared unwind 64bit-atomics"
 PACKAGECONFIG:remove:riscv64 = "unwind"
 PACKAGECONFIG:remove:riscv32 = "unwind"
+PACKAGECONFIG:remove:mipsarch = "64bit-atomics"
+
 PACKAGECONFIG:append:libc-musl:riscv64 = " execinfo"
 PACKAGECONFIG:append:libc-musl:riscv32 = " execinfo"
 
 PACKAGECONFIG[unwind] = "-DWITH_UNWIND=ON,-DWITH_UNWIND=OFF,libunwind,libunwind"
 PACKAGECONFIG[execinfo] = ",,libexecinfo"
 PACKAGECONFIG[shared] = "-DBUILD_SHARED_LIBS=ON,-DBUILD_SHARED_LIBS=OFF,,"
+PACKAGECONFIG[64bit-atomics] = ",-DCMAKE_CXX_STANDARD_LIBRARIES='-latomic',,"
 
 do_configure:append() {
     # remove WORKDIR info to improve reproducibility
-- 
2.39.2


