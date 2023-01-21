Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 492E5C54794
	for <webhook@archiver.kernel.org>; Sat, 21 Jan 2023 18:01:37 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.2062.1674324091113259352
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jan 2023 10:01:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=igK35m7z;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id y3-20020a17090a390300b00229add7bb36so7760833pjb.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 10:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2LzTNAdkTt9uJ7Uo6YGQ6nbpU3H0243F9WbhiqTsMY=;
        b=igK35m7zBLb5gaDU7XDCtj8DnkyQykEHx4W51m5qSWPgEh8ZZjqdRG/BA7CCFBCQHL
         a0fgrI+yc9iBGLtZ1aS58zM6qPvy+43mea4mvOg75Gz4MnSrLasPibvYHrVBE0blFGpj
         vwPfXCFr959E9cuh1XaDtliK0iroNWmoZMjhqDtMYEjviIocKKzUt1wEttwkLGhlptmu
         IGvM0YdBL1vs9ujFJURVVm/+HWlGSvjEzCgBo6EOmdBZWbZ2WBpy2vOxUgDdGiCHy4Nm
         HOQWtu32Viy1yNqLBjBG71O5CR24mXbuZ6fRHgHy0En6UuY1go/64MSLPMbwpEaobnF4
         5tug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2LzTNAdkTt9uJ7Uo6YGQ6nbpU3H0243F9WbhiqTsMY=;
        b=xDPR4RJ2JTWQJMcUSAvxg0tMV9sc2trCxQBkyAt+2Oyw2ZO9HlthZjuJmEWED1NfQC
         oLWnfaXtUc4LF3xGV0HHO0OiB2NkHZh8agZXm984jlNu/Holb/o+rBtKG3zCPjJ5mGl3
         mSIYHXR52FBbehtKm6m/+7f8HAK9MNE6QRBLWOAF+6AUpy6QUhvEv3Ca8K/GuTs0Xx7i
         j3cQDhaDOdHNWYjAjEm16P9D3OwTHf8jzrUspEOL7QjGAb/X0J4rnpuntmqYdkXKBP4z
         6W0iYyuLtWEzp1kIJePwnNaH9BQ5jqDvLT7bfAjuh1qdTInO9gvEo26Y9LR2Y5cQDy7b
         7Hew==
X-Gm-Message-State: AFqh2koLBF/ONOEKaTBcyc8+8khc4eEebSYKmAw4IXXa9kgTUdp7niwU
	UQogmGWb3SKezWTof2AJKJOIFtuaW3xT7g==
X-Google-Smtp-Source: AMrXdXt1ZoEuG5yeFSxTwi0q9QpbHNqLpeAIC1tPxgovp7A8o81iBBnpb5n1H7s+U8l0/ktFVN+EnA==
X-Received: by 2002:a17:90b:4c85:b0:229:f915:ef32 with SMTP id my5-20020a17090b4c8500b00229f915ef32mr9346009pjb.36.1674324090341;
        Sat, 21 Jan 2023 10:01:30 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id d15-20020a17090a02cf00b00226c2d90c04sm3623583pjd.38.2023.01.21.10.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 10:01:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 08/30] ippool: Use unsigned int type for 1-bit integer bitfield
Date: Sat, 21 Jan 2023 10:00:59 -0800
Message-Id: <20230121180121.1229895-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121180121.1229895-1-raj.khem@gmail.com>
References: <20230121180121.1229895-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 18:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100674

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-int-type-for-1-bit-integer-bitfield.patch | 42 +++++++++++++++++++
 .../recipes-daemons/ippool/ippool_1.3.bb      |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/ippool/ippool/0001-Use-unsigned-int-type-for-1-bit-integer-bitfield.patch

diff --git a/meta-networking/recipes-daemons/ippool/ippool/0001-Use-unsigned-int-type-for-1-bit-integer-bitfield.patch b/meta-networking/recipes-daemons/ippool/ippool/0001-Use-unsigned-int-type-for-1-bit-integer-bitfield.patch
new file mode 100644
index 0000000000..0533616722
--- /dev/null
+++ b/meta-networking/recipes-daemons/ippool/ippool/0001-Use-unsigned-int-type-for-1-bit-integer-bitfield.patch
@@ -0,0 +1,42 @@
+From 4788ce6ec602f6441970e1095572c4ff0e90c7c5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 17 Jan 2023 22:33:52 -0800
+Subject: [PATCH] Use unsigned int type for 1-bit integer bitfield
+
+In C++, signed integers are represented in two's complement. This also applies to signed bitfields.
+A signed bitfield composed of one bit can therefore store a value in the range -1 to 0.
+Assigning a value of 1 to such a bitfield should produce a warning since it is out of range of representable values.
+Therefore fix this case by using unsigned int instead of signed int
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ usl/usl_signal.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/usl/usl_signal.c b/usl/usl_signal.c
+index 45ddd94..8c1d4d0 100644
+--- a/usl/usl_signal.c
++++ b/usl/usl_signal.c
+@@ -39,12 +39,12 @@ struct usl_notifier {
+ };
+ 
+ typedef struct {
+-	volatile int	sighup:1;
+-	volatile int	sigterm:1;
+-	volatile int	sigchld:1;
+-	volatile int	sigusr1:1;
+-	volatile int	sigusr2:1;
+-	volatile int	running:1;
++	volatile unsigned int	sighup:1;
++	volatile unsigned int	sigterm:1;
++	volatile unsigned int	sigchld:1;
++	volatile unsigned int	sigusr1:1;
++	volatile unsigned int	sigusr2:1;
++	volatile unsigned int	running:1;
+ 	sig_atomic_t	waiting;
+ 	sigjmp_buf 	sigjmp;
+ } usl_signal_data_t;
+-- 
+2.39.1
+
diff --git a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
index 984acac76e..26b03814d6 100644
--- a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
+++ b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
@@ -29,6 +29,7 @@ SRC_URI = "https://sourceforge.net/projects/openl2tp/files/${BPN}/${PV}/${BPN}-$
            file://strncpy-truncation.patch \
            file://0001-pppd-ippool.c-Fix-type-casting-issues-between-in_add.patch \
            file://0002-ippool_rpc_server.c-Add-missing-prototype-for-ippool.patch \
+           file://0001-Use-unsigned-int-type-for-1-bit-integer-bitfield.patch \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4c59283b82fc2b166455e0fc23c71c6f"
-- 
2.39.1


