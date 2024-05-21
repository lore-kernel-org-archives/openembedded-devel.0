Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A330C25B7F
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 18:10:38 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.3091.1716315033181958451
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 May 2024 11:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MzGYmb1V;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1eb0e08bfd2so110893845ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 11:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716315032; x=1716919832; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H3p5DTwy9GDz07zpnsXsuS3lsFX+U7atvQsndUnh+Sw=;
        b=MzGYmb1Vf1crOKN89wu5A5FzdtZ4y+GVoMRdzMWyrWnYfuMIAXa3KHqRanns8cszDA
         Kcjul43kH4O5Tty2vEBXSTl0BuCuHgNyrb60Sq19v9FJ+gKGTkcbDjNW5RskF57S56c1
         2tzdPa+oiii1sbiQUA84UMVB+GOSMGSbYTDBfJMWedl4jwRDbqWpCEHkbW/42UBsoS/5
         z6WmPOkZ0fpSbR16zHwBZHindBRVqy2nqrGllBXNP8LrrUhRqipreCiMMdW0D/8EZ5E2
         ilst4/yV+jkW/mB6hXP6kXfxGyFarSnzkJpkh3IqSdQj+PhTteHgT/ADgQeB0hmSyYWW
         vQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716315032; x=1716919832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H3p5DTwy9GDz07zpnsXsuS3lsFX+U7atvQsndUnh+Sw=;
        b=kuetujdvLmuyM+OiF1W3t6LwTKLDQkz3PYafLSIsDSGmw4a9x/7NPB0NL/BqtkoNmV
         0qUtx4eRAVXfk1rGLlZvlQHUrLeKgS/il9xj67ZjgXmTzv6BLM8wZe7/rmHOkhRCi1Q5
         nkfLF7Bu7G6IJh0f+0h+1tYcivD0NRgB6vS1P1qbV/xBONq/WH9/K85qnZige5fLjwHg
         WN3ybeFDUhPe5ov740nKXisKCN3FuSabaaR8JgKzz6i8eprIieav2QkJL0HheRoI26Yd
         j075Q38vZ0NrOGlGR1qt8BiwEGRPp25jciOAsN8EBb/UASkM9zZP+f+j26Vgh4SrQLCS
         qlRg==
X-Gm-Message-State: AOJu0YwqFOqMv+d3o7qrffgmfsN95IGTe5A/9WVeo800Htfpv02HZeSI
	8A6GAiX00O6gP6WIHiNYy+mJJVF5vitiapDDtQ1tbxmXV5mnvfHi2eWFl7Kzqzs=
X-Google-Smtp-Source: AGHT+IH7OQVjIfY95J9SzIxdf9VshwpF7X60zGjiKSTREYUrPW4lab+7BPf4e2yfL8Vau6JnSSMIIA==
X-Received: by 2002:a17:902:e805:b0:1f2:f9de:c9e8 with SMTP id d9443c01a7336-1f2f9ded095mr80777295ad.2.1716315032469;
        Tue, 21 May 2024 11:10:32 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c136354sm224799075ad.244.2024.05.21.11.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 11:10:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][ 06/22] gosu: Adjust for UNPACKDIR/WORKDIR rework
Date: Tue, 21 May 2024 11:10:07 -0700
Message-ID: <20240521181024.426176-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521181024.426176-1-raj.khem@gmail.com>
References: <20240521181024.426176-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 18:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110455

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/gosu/gosu_1.17.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/gosu/gosu_1.17.bb b/meta-oe/recipes-support/gosu/gosu_1.17.bb
index a29d6bce45..6a4441fc24 100644
--- a/meta-oe/recipes-support/gosu/gosu_1.17.bb
+++ b/meta-oe/recipes-support/gosu/gosu_1.17.bb
@@ -5,9 +5,9 @@ LICENSE = "Apache-2.0 "
 LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 GO_IMPORT = "github.com/tianon/gosu"
-SRC_URI = "git://${GO_IMPORT}.git;branch=master;protocol=https \
-           git://github.com/moby/sys;name=user;destsuffix=${S}/src/github.com/moby/sys;branch=main;protocol=https \
-           git://github.com/golang/sys;name=sys;destsuffix=${S}/src/golang.org/x/sys;branch=master;protocol=https \
+SRC_URI = "git://${GO_IMPORT}.git;destsuffix=src/${GO_IMPORT};branch=master;protocol=https \
+           git://github.com/moby/sys;name=user;destsuffix=src/github.com/moby/sys;branch=main;protocol=https \
+           git://github.com/golang/sys;name=sys;destsuffix=src/golang.org/x/sys;branch=master;protocol=https \
 "
 SRCREV = "0d1847490b448a17eb347e5e357f2c0478df87ad"
 #v0.1.0
@@ -17,6 +17,7 @@ SRCREV_sys = "95e765b1cc43ac521bd4fd501e00774e34401449"
 
 SRCREV_FORMAT .= "_user_sys"
 
+S = "${UNPACKDIR}"
 inherit go
 
 CGO_ENABLED = "1"
-- 
2.45.1


