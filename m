Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DED6C54E41
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 19:08:00 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.1473.1709665670292615814
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Mar 2024 11:07:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eaI+DWoB;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1dc0d11d1b7so49402605ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 11:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709665669; x=1710270469; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9HZlNEaxlflRwR0IyBtODJdQpKFipjZkGzxjc+uojM=;
        b=eaI+DWoBm3CdhN6VsN9ONvWuehZ9i4LtR4u2CkzyLvtLonhN/QUrwqOKvB6ON14WqC
         kqmF676n4vnp2Nqe2I1FjtHzYwT2+HRZunxPv9xmbVL+QBGT4BGyfaGfdAfKk0gOjAf6
         u2imqq09Siu3EukhIs4Dsp7LMsCrRNWphAyS/sRhzeGk0vUOmtMb7TSHCWCvrDwyxjpg
         26BXln3kAbIyF306Sg2DpJp8ooydUYNO12wzncNYu1O/3JxogxgvLprv9P/W1JGyM3RW
         wVjDM0VT+Epk8tjnBhyBNRmM6NOKtRgaDCkSZY72keUaRbzEAoINAn01vffpt6iNqIhc
         QgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709665669; x=1710270469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9HZlNEaxlflRwR0IyBtODJdQpKFipjZkGzxjc+uojM=;
        b=N0NiDDqFrlpgNGkJ1hyiK88h1qbeg9AGXWrNC5TJbdIxPeJ7owdmYXY4Vf8r3V54OJ
         H1EzGIGkHwMQ49F1SutAnBq40C1Qemyb6OECOryPWfLqPynk0zCckxoD++Nr2yAW0RG0
         5H/7u6j6pIObN6Z9TdyXmA7TXINuPAYI657LxuAIfZyNLgS0UHciIhRnab3JbP8nnG0Q
         sRyChDdw5CJpzrRAby4asrRr1NCoDw2ktcc90S/qYt1QmB0ItoNiN/heuVFa0kAxi/X/
         LLGF3nD3tJ4w4j5iDmHcyZPOuNRw3SHnCBPwmnzBYLYrIgNKET0L3EF27FYdsVGRmDdO
         yDkA==
X-Gm-Message-State: AOJu0YxDeCkqQkhdiG7L+otLIWxo4T7urCODUQBqe9VZBotZIbIg1wio
	qEorQ9HU8v96qNeTn0y2Owo2ZPpZF1JxZbg7qkL0vbHt1nZ/oTyFuv8GNC3F
X-Google-Smtp-Source: AGHT+IF+Ilu/RVujXU+v2KXD8+trnZhI2ulSbaROeXaXYHaJYPhAip/4mwMTZrOKMSbPNBJ9YIjm0A==
X-Received: by 2002:a17:902:cf0c:b0:1dc:cba3:f909 with SMTP id i12-20020a170902cf0c00b001dccba3f909mr3166618plg.54.1709665669237;
        Tue, 05 Mar 2024 11:07:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::d3a5])
        by smtp.gmail.com with ESMTPSA id q15-20020a170902a3cf00b001db3efca159sm11104411plb.132.2024.03.05.11.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 11:07:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/3] pgpool2: Fix build with postgresql 16+
Date: Tue,  5 Mar 2024 11:07:44 -0800
Message-ID: <20240305190745.3586645-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240305190745.3586645-1-raj.khem@gmail.com>
References: <20240305190745.3586645-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 19:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109128

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../pgpool2/pgpool2/define_SIGNAL_ARGS.patch  | 25 +++++++++++++++++++
 .../recipes-support/pgpool2/pgpool2_4.5.1.bb  |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-networking/recipes-support/pgpool2/pgpool2/define_SIGNAL_ARGS.patch

diff --git a/meta-networking/recipes-support/pgpool2/pgpool2/define_SIGNAL_ARGS.patch b/meta-networking/recipes-support/pgpool2/pgpool2/define_SIGNAL_ARGS.patch
new file mode 100644
index 0000000000..3ae9b1bd9a
--- /dev/null
+++ b/meta-networking/recipes-support/pgpool2/pgpool2/define_SIGNAL_ARGS.patch
@@ -0,0 +1,25 @@
+Define SIGNAL_ARGS if its not defined, this is flagged with
+newer C compilers e.g. clang18, where if it is not defined
+then it ends up with compiler errors
+
+/usr/include/postgresql/server/port.h:488:28: error: a parameter l
+ist without types is only allowed in a function definition
+|   488 | typedef void (*pqsigfunc) (SIGNAL_ARGS);
+|       |                            ^
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/src/include/pool_type.h
++++ b/src/include/pool_type.h
+@@ -125,7 +125,9 @@ extern void ExceptionalCondition(const c
+ #define LONGALIGN(LEN)			TYPEALIGN(ALIGNOF_LONG, (LEN))
+ #define DOUBLEALIGN(LEN)		TYPEALIGN(ALIGNOF_DOUBLE, (LEN))
+ #define MAXALIGN(LEN)			TYPEALIGN(MAXIMUM_ALIGNOF, (LEN))
+-
++#ifndef SIGNAL_ARGS
++#define SIGNAL_ARGS  int postgres_signal_arg
++#endif
+ /*
+  *  It seems that sockaddr_storage is now commonly used in place of sockaddr.
+  *  So, define it if it is not define yet, and create new SockAddr structure
diff --git a/meta-networking/recipes-support/pgpool2/pgpool2_4.5.1.bb b/meta-networking/recipes-support/pgpool2/pgpool2_4.5.1.bb
index b127d69625..ffb879952c 100644
--- a/meta-networking/recipes-support/pgpool2/pgpool2_4.5.1.bb
+++ b/meta-networking/recipes-support/pgpool2/pgpool2_4.5.1.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e4b38de086d73e0521de0bbdbaa4a1a9"
 
 SRC_URI = "http://www.pgpool.net/mediawiki/images/pgpool-II-${PV}.tar.gz \
 	   file://0001-Fix-build-error-when-build-this-file.patch \
+	   file://define_SIGNAL_ARGS.patch \
 	   file://pgpool.sysconfig \
 	   file://pgpool.service \
            "
-- 
2.44.0


