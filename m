Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF45C5475B
	for <webhook@archiver.kernel.org>; Sun,  3 Mar 2024 03:47:10 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.67135.1709437626245815531
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Mar 2024 19:47:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NDJvJH0E;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5c6bd3100fcso2496493a12.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 02 Mar 2024 19:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709437625; x=1710042425; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yUMGv3kUZJFwd09tEnaG/QVgTpB2wRgiY1j0fMvd4dQ=;
        b=NDJvJH0ESFf2dX5wy4d2NOu63X3HTr2DrzwNVFr7HXk+s1aZcoO1zaNtyfP9Xrc7uH
         6xoHGHGVXWkzTsgKC+t4Dq/713HbziTA3DlvBAhYaYlxWIwBm7EiZ1r+hT2F2uO5999L
         6eXayPx4PUq8JPhSXaDqWyQp/KUOnnG9E5Dr9e1W34zlxXvAP1IsIKXDyt92NiamOmIq
         wSCNXTzAyrNYp9Lt2YuksFcoovellA9t/hgiucj763ftv8p2Izbt9vbH0KBOZ+ddz/RK
         9P2/rocDHsEtHlv6rLikd37LqptuIYM8c5jp6vpPvBVAw/cxnV3v3qSyqTQ7t8yX6F1e
         0q3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709437625; x=1710042425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yUMGv3kUZJFwd09tEnaG/QVgTpB2wRgiY1j0fMvd4dQ=;
        b=d301FoAygsDrrLCnE/4GiOyx4HAF0bZdx4740uZQ5/pgQmeWpH0MLChfl/EgqFYgEz
         wGkghv9AqSg+yxa54YYbb6QOqdAaeTEF0A4+0BkxtADATj63ycAH9Mi5UdNoFu3WFxck
         Mwc/+Vi10VFh2e1BJ6Kc7SJdZJqhgkHIN07Pz/PPyzDehuYABHusDqGGmB5QUz2Buc4a
         gLM+lvhVfvU7BccS7AuhdwXVrqqDEBPHEW8QSN+t24oM8Tea59KfnWQxZDtBvtK9EXC2
         bLYdYfDiOt31GGCvGa6xZ2XOdTHq6GpM6R3kzQiSVCay+GC/M+YNALBjavWm0wtWsNEw
         BjQA==
X-Gm-Message-State: AOJu0Yz6W0fGXV7clHe4gwVLNAV2U907pjarfEMaNzZCwLUo24CWRYPy
	JZ/Vs+L6zwKjscGrDa3hl52GyT8cM3Vh+AcEwyx8z5DL1ZVtp6Poug9eKHBq
X-Google-Smtp-Source: AGHT+IGmrQz8qjRWQkfoaC9tAav0zlSfOywMFEl8vN8J7kXF0naqykovMHpozDS/zgZRDL/tCtBy+g==
X-Received: by 2002:a17:902:b195:b0:1dc:8fb0:2b9e with SMTP id s21-20020a170902b19500b001dc8fb02b9emr4836625plr.34.1709437625009;
        Sat, 02 Mar 2024 19:47:05 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5e7])
        by smtp.gmail.com with ESMTPSA id lc8-20020a170902fa8800b001dc8923a2c4sm5947379plb.294.2024.03.02.19.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Mar 2024 19:47:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] drbd-utils: Disable warnings as errors
Date: Sat,  2 Mar 2024 19:47:02 -0800
Message-ID: <20240303034702.3397783-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 03 Mar 2024 03:47:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109086

Newer clang ( 18+ ) finds more warnings and treats them as errors
therefore disable warnings-as-errors

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/drbd/drbd-utils_9.27.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.27.0.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.27.0.bb
index c50d326224..e1fd8e4480 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_9.27.0.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.27.0.bb
@@ -29,6 +29,9 @@ DEPENDS = "flex-native keyutils"
 
 inherit autotools-brokensep systemd
 
+# -Wunused-but-set-variable -Wunused-const-variable -Winconsistent-missing-override
+CPPFLAGS:append = " -Wno-error"
+
 EXTRA_OECONF = " \
                 --with-initdir=/etc/init.d    \
                 --without-pacemaker           \
-- 
2.44.0


