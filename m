Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F6FBCAC5BE
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 06:32:36 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web10.6894.1758954747120128482
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 23:32:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HtJbMC+5;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-4248a13fbe9so15654375ab.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 23:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758954746; x=1759559546; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1SI0UuBQAT4mbKaJzP0RacbiThqTOqDP66pnQUK1Qg=;
        b=HtJbMC+5219fPFieutYal0K6+cIg8bXNje60bnc07MX0n1drggqOZtG51NFU8p8fsL
         UjMMT3GbJkkAAjUwJWbJe7PU0yHRV/+lIcEi0jATuQBq55eZyU1bQfiILFVIAhBZWF9n
         G4mhG+YER7L2WXRrdPHe6h7sTexomysC5e8YDpJcpZ2KTMbpzCrtPXnLzEZrc/P7mqJe
         1tcr2ppyT17r2fYLzqfyfYyT2HsozsSUrwfo91TtIc9velWg/t77C6T/NqTldjF2xvqQ
         UZt/tlr0M5G5f8aId5w6QR5s1M8wQ9ohIYm50ln9G2gFV99qfXkRd8Z7TGOUrrM4cLXE
         ZViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758954746; x=1759559546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1SI0UuBQAT4mbKaJzP0RacbiThqTOqDP66pnQUK1Qg=;
        b=rYFhrTS8cOVdROMp6Qkq+kLeW2iRB8S4Pdej+F/Qo5hhL4V5gTnkaA6NgcyqTzsWBa
         DcnzQT/u32N7PUrEUgTW+vL6LX5ZrcG2fKFz/+bOVsmBjx2UWvfnu+UwrPZUBv1EFYJR
         he4rqjNrOXkLXmw1Zbin3n9NAYvEcJeSr45/T42PaeUQDP95wAQP7W4TU6ctcLg4ImrU
         CmqC0NQEGUUDITaQN4sUy7os4Fcg2Z9D2JSr/qP2zieBdkQ34ETuWhlVAcm7+KwTR5Q2
         2qoQ97tVXKmBehD6ENQvcDqnIHdV2P3QuQG7n5/LdY2B2j4MzfNizKIp3UHyJoCu3s1g
         x7Uw==
X-Gm-Message-State: AOJu0Yy9Z8FV9NJNlUW7iONHxermMfs/NSaFoOKqwI9rzBVtA6RdBrtD
	9JW1cbK3gcaNfxtntNXz80l/stFy3Yc2P0A9ewsx6Hh8McUsc990Lbkf1ZAV6A==
X-Gm-Gg: ASbGncs/lC+2hIH+iSR3yZK9AvCRfOIr/s3GBfc2p2+rWwM9n/WRohfCTEoR5V46n3t
	BQ6zY8znoMIFqfB7xAE66sf8B0hEg0rAcUYfMwuvlXZ45S6dSPlcWNtPUqpBmyqwmjtC8j+YRHw
	3IUC9E1VQLUY+FZ7xhE4s+ZvQ4zfZaqXAtf0kJ8tU8Whom9XZAKNWK74pWSxXEBAR2S0vq5zvzA
	aZ1LmFR3pK9JMNQuc+g6hTddxzHrsMlEzVe7mczBLe0HYrNcWw/F+FK0lpwT3+pF1lQEg3ISW4r
	LrsatkdOmA51RhcC89mC4ihz8T1X9PDCfUhmJsA1hqblf+QZG6b54MMD1Dvnv9ntKRzdcAMx5w/
	SGKYkUL8wVz49yXzi5EiYPvNhxcnD1lIjY8B5vAZuJ8QGX6X6Rf0=
X-Google-Smtp-Source: AGHT+IE2tv5WjwNlgl6X6tv7VPd3IQFn240vigciPzk3FSZD4K4oXuZXGEGh6D5HenIFkRV40bnYuw==
X-Received: by 2002:a05:6e02:184e:b0:424:1c3e:772c with SMTP id e9e14a558f8ab-425955e831dmr157837525ab.12.1758954746123;
        Fri, 26 Sep 2025 23:32:26 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425bfab12c4sm30225685ab.22.2025.09.26.23.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 23:32:25 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 01/21] gensio: upgrade 2.8.7 -> 2.8.15
Date: Sat, 27 Sep 2025 18:31:56 +1200
Message-ID: <20250927063216.1865627-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
References: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 06:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119955

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9a9564afe2db46d85a57d396c8e967dce204b9a7)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gensio/{gensio_2.8.7.bb => gensio_2.8.15.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/gensio/{gensio_2.8.7.bb => gensio_2.8.15.bb} (92%)

diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.8.7.bb b/meta-oe/recipes-connectivity/gensio/gensio_2.8.15.bb
similarity index 92%
rename from meta-oe/recipes-connectivity/gensio/gensio_2.8.7.bb
rename to meta-oe/recipes-connectivity/gensio/gensio_2.8.15.bb
index f4d0c09306..ce8c8df3ea 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_2.8.7.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_2.8.15.bb
@@ -5,9 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     "
 
-SRCREV = "e4dbb9687bd5e887fa98a4cdcec012ea85da1ef2"
+SRCREV = "5ffe39f4a247ff001661a4c283305a3abe823fe3"
 
-SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=master"
+SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=2.8.x;tag=v${PV}"
 
 S = "${WORKDIR}/git"
 

