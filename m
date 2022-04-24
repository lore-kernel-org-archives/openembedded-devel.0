Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64BC4C4708E
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:12 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web08.19935.1650820937713826004
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Apr 2022 10:22:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fb5oYpum;
 spf=pass (domain: gmail.com, ip: 209.85.215.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id g9so11503551pgc.10
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Apr 2022 10:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VpspRbYDScQ2SGmS/kf95tbtLb08Z11L5OpGRQl7JKo=;
        b=fb5oYpumEtslmBHWouNBlB+GOxpsFfPAn2AMqFIr3YC4aHAPccwiDZ6yFnM+f/ioC1
         NKeQWaj6B6zCoxt927f5hdI7B162Nr04E0rowFoG2On5SxdNgJ9eApbjAqRVwEFscARr
         HCSep2bmS1nng7dgyideBpbssENgcowyfJgjDQTvYSw1qRDyc6zwMFayPoBK5+OPngq6
         1kmOcVCGHKzOnWeydQbgqc58HTo5B+xL7Z9/icvTeymLi8ouk7t5a/xTt9nL1ZFLuiWh
         12E1C7nIncJW5yG5GoPfZgxX5HtCmqXb8xNguuUo3eMy70eNDi1P0VxgwBoc9J0+0vPC
         BoXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VpspRbYDScQ2SGmS/kf95tbtLb08Z11L5OpGRQl7JKo=;
        b=QpXxbCNv5mRO1urwvCiZwYzdDh3xHk/PJ+4zUwMhumiaAy32LTnmUAY7hHcNpcXVNN
         rurpAW+CvXKcoaoHXyqUWmPXYIG8EMMIL/bH6o1nBcImHi+yPaSpt+gEHZsB2g2szAiQ
         Xtm5g/p1ofhsih1Swb/DDWnCT0KtpG7uTXcIqCJNAxOH0KEsjU6tSlVwguo0a3KkQp6Y
         sAoaDUB7WLu70WaFBI5iLTGA+Kwb9zRqVLoaEWyP6MPUzWUNYwg7uJdDNBUiAPF7NrPx
         Irv9Mr678Ju3SGrdL9bt5MDetEzOSOaU4F6ukwrSj28vdvHoeb8je5c2Gyg49SRsclU/
         z0PQ==
X-Gm-Message-State: AOAM532LboxrevgxmU+anNFNoHXBz0VU8q4zCLnYbWMH9spXc2Rldsuu
	dM4E56E15P+T0DiOAs0+EyOzXfuYwbIoug==
X-Google-Smtp-Source: 
 ABdhPJxg/SDdooeFVv9tzr4MAzidAnk7tjnfdW9sMZXfzK0m7moQHVPS2131fadpocVOh8G+QihO/w==
X-Received: by 2002:a63:9141:0:b0:3ab:ea6:694d with SMTP id
 l62-20020a639141000000b003ab0ea6694dmr4861051pge.49.1650820936970;
        Sun, 24 Apr 2022 10:22:16 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 e13-20020a63370d000000b003810782e0cdsm7253160pga.56.2022.04.24.10.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 10:22:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-initramfs][PATCH 1/2] klibc: Recognise --dyld-prefix clang
 option
Date: Sun, 24 Apr 2022 10:22:13 -0700
Message-Id: <20220424172214.324878-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96754

This is added when usrmerge is enabled in distro

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../klibc/files/klcc-cross-accept-clang-options.patch        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/files/klcc-cross-accept-clang-options.patch b/meta-initramfs/recipes-devtools/klibc/files/klcc-cross-accept-clang-options.patch
index 431c75e3af..a3a0695637 100644
--- a/meta-initramfs/recipes-devtools/klibc/files/klcc-cross-accept-clang-options.patch
+++ b/meta-initramfs/recipes-devtools/klibc/files/klcc-cross-accept-clang-options.patch
@@ -5,7 +5,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 --- a/klcc/klcc.in
 +++ b/klcc/klcc.in
-@@ -207,6 +207,27 @@ while ( defined($a = shift(@ARGV)) ) {
+@@ -207,6 +207,30 @@ while ( defined($a = shift(@ARGV)) ) {
      } elsif ( $a =~ /^--([sysroot=])(.*)$/ ) {
  	# Override gcc encoded sysroot
  	push(@ccopt, $a);
@@ -29,6 +29,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +	push(@ccopt, $a);
 +    } elsif ( $a =~ '-rtlib=.*' ) {
 +	# Allow clang options
++	push(@ccopt, $a);
++    } elsif ( $a =~ '--dyld-prefix=.*' ) {
++	# Allow clang options
 +	push(@ccopt, $a);
      } else {
  	die "$0: unknown option: $a\n";
-- 
2.36.0


