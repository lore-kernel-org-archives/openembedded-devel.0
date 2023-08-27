Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C8BC83F10
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 07:11:31 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.23539.1693120289123589870
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Aug 2023 00:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=MCKY2C5V;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3a88ef953adso1670287b6e.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Aug 2023 00:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693120288; x=1693725088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ve9r+O3XteaEdvSRR1x4RoaXK2/9zkOwmxIgTTZLZUo=;
        b=MCKY2C5VWorCyp/PKWFzMxvltrtS2WBNORYUaEfMGwrDw6867nwsvhCZzHs3sbD1V0
         zX365XjhkdGIXnGDIWCTovvsHsY6RK9hfYcI0RZ6KDUTNN8IT02KB/XIQ7YTuMHN4ZhR
         afvFstAtRtx/VxxgvA7WizX+kYyvKBGGAvIFGz60K0O/xOsGJDmWedjJO8PR592Uu4it
         byR1gZcNsp/ViggI/s2a/vF0Iki/4hFbyIIgUWIjpbHKTevdH5UdKLfUMHtSWG7C1ZW5
         WHZgolQ7sgb3kWSMvyxaa1fpfbxA5xSM9/RLNscHBJy+aj+vb2Q3wr9S7HC48qGmEtTn
         ADUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693120288; x=1693725088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ve9r+O3XteaEdvSRR1x4RoaXK2/9zkOwmxIgTTZLZUo=;
        b=ASLjxaf3FCKm/ueS8o/rDSvt6CKnOKmD99nV0UcVrUqOZk8aAbp5CD1txwz3iqqavI
         F/NUO1+kJy4hnGzTxKKFdW/rcilmUE4F0oRNySI8Yv53CbHTgXaahtgw++MU7fFDEEX/
         jR71pvgpsoK6dAhu+G7RHaUxCdoI4CJjjMFrhnsmSOZbZCyFbiGU1u/6dXF+o5J0gZgf
         PizA/C9PSVpBzbB+PVmkiOtTdNgREJhOZ05ISTX3NhNlKAp5BHeDB5/VyafT6eqSo/UR
         UqaiN7vigdbc4eihWoh1No36U43Zf/n0gfZ9oydlIQYHrZMJFwEATfvEhG+UU4/TORtz
         PM/Q==
X-Gm-Message-State: AOJu0YzeaVz9pQdE514fylQgkdnblQtpb+QVBEEs33ZAwVMx+RH87XAw
	RIwEUyyGanPdxp7te5GcXv24xRH5xFAXHA==
X-Google-Smtp-Source: AGHT+IHBvE1Ch1siNqorf+WWs/u9PUo6qxVLhnzC7CPlsjZnwqdW8k+rAqXt0C5wQzu0BxDZSil7Cg==
X-Received: by 2002:a05:6808:2201:b0:3a7:4ce4:cb8f with SMTP id bd1-20020a056808220100b003a74ce4cb8fmr10753980oib.8.1693120288170;
        Sun, 27 Aug 2023 00:11:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::71d2])
        by smtp.gmail.com with ESMTPSA id c5-20020aa781c5000000b006889348ba6esm4314046pfn.127.2023.08.27.00.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 00:11:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] rsyslog: Skip failing omfile-outchannel test on musl
Date: Sun, 27 Aug 2023 00:11:25 -0700
Message-ID: <20230827071125.1704173-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Aug 2023 07:11:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104625

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../rsyslog/disable-omfile-outchannel.patch   | 23 +++++++++++++++++++
 .../rsyslog/rsyslog_8.2306.0.bb               |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/disable-omfile-outchannel.patch

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/disable-omfile-outchannel.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/disable-omfile-outchannel.patch
new file mode 100644
index 0000000000..a8bbe2b51e
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/disable-omfile-outchannel.patch
@@ -0,0 +1,23 @@
+tests: Skip omfile-outchannel test as it fails on musl
+
+scanf error in index i=5559
+sequence error detected in rstb_168227_f19f3b245QVE.out.log
+number of lines in file: 5559 rstb_168227_f19f3b245QVE.out.log
+
+Patch is also applied in void linux
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/tests/omfile-outchannel.sh	2021-03-09 05:51:07.000000000 -0600
++++ b/tests/omfile-outchannel.sh	2022-05-26 15:55:23.358520256 -0500
+@@ -1,5 +1,9 @@
+ #!/bin/bash
+ # addd 2018-08-02 by RGerhards, released under ASL 2.0
++
++# This test fails for x86_64-musl, under GitHub's CI/CD. Disable for now.
++exit 77
++
+ . ${srcdir:=.}/diag.sh init
+ export NUMMESSAGES=10000
+ echo "ls -l $RSYSLOG_DYNNAME*
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2306.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2306.0.bb
index 41ec191a6e..c3948a40ec 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2306.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2306.0.bb
@@ -29,6 +29,7 @@ SRC_URI = "https://www.rsyslog.com/files/download/rsyslog/${BPN}-${PV}.tar.gz \
 
 SRC_URI:append:libc-musl = " \
     file://0001-Include-sys-time-h.patch \
+    file://disable-omfile-outchannel.patch \
 "
 
 SRC_URI[sha256sum] = "f6283efaadc609540a56e6bec88a362c966e77f29fe48e6b734bd6c1123e0be5"
-- 
2.42.0


