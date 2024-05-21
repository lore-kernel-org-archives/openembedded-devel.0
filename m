Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E005C25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 18:10:48 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.3102.1716315048073037429
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 May 2024 11:10:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GFLFf/jF;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1eb24e3a2d9so117776075ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 11:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716315047; x=1716919847; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdbX25TNHzNlfb7QkNyyaBGLOMbIEQxwI7SyAqWXFxc=;
        b=GFLFf/jFt94JpMC7iThCb49hPlR+BIG4RPUP/XvuRpRGcKZWIihVc2N7urImVutdHe
         PDzjpAFiTmaBn/sbmrm77Q26MiwAvzNEdwWby9DMPQsVbIAI34iHubGPCc0ZeTGrD6eS
         RBMbgDeObXdngdQPYYoeN2chv5ee7T4DK15C3IQT/pjQ0FlqUtHHVLYb422dHsHLHdKh
         +z5rd01tJPaEEkHkXsC9Hhu+4RsvXMpPW/tMd6kEOPlJhAS+3CV2JE2ZChgDeQ/1hjYP
         kFIoIwBpqRpKfdW6toyXbwr2+VLZunIUoCoXpvdWEKH39dznTHuEv6rDWxkor5GKYn7m
         GxuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716315047; x=1716919847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zdbX25TNHzNlfb7QkNyyaBGLOMbIEQxwI7SyAqWXFxc=;
        b=GcNnCJEsjnrFgbpYBUHv5yAWlDIktMNlTpFNLIAYRNeN7UdPdLpY2uOq+VXIoMkt/X
         /2tp4EW3PKVrTypEGU1cw39/BkOhNlS5bGP7Z5pk3JQ+exMm83JkWOx1lbPnj1Yg95l4
         mRRwOyaXPYv4digDU+gAqqe9eQH6RGKUuv8huHlzZ99HfIguNt/sPqwUIenJYGXtmr/Y
         NMYv+nnryOHaJA8srodrk/Ds84dC1WUTP00xymiRb6VevRisjVMzeF17tjPfTiQfnO7P
         sOqW01i2Gy8axWiJBq17jofqp8v5vccEXO+alSvHAcHb/lhjaUvGPxhq3xpgcifAMW/c
         3dGA==
X-Gm-Message-State: AOJu0YxKsJcAtwe02GPed9RS6iJQqLLGLu5g90JiAnZqalT2Zz6zNs5n
	Z4H+chJV/HVta3SZssY5J+Yl6TICSTHEu4OTBoQmdo+n/kHmjmWgrXACfPR/EmQ=
X-Google-Smtp-Source: AGHT+IHDf6R7422g7fcJedzDlVaF9YSnXwmPh0I+/mxZ3zco8dy2Wxz9J8PtWKTjfLu0EuEIDJUgkQ==
X-Received: by 2002:a17:902:e845:b0:1f2:fd49:9fcc with SMTP id d9443c01a7336-1f2fd49a043mr111243585ad.34.1716315047307;
        Tue, 21 May 2024 11:10:47 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c136354sm224799075ad.244.2024.05.21.11.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 11:10:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][ 21/22] syzkaller: Fix build with musl + gcc14
Date: Tue, 21 May 2024 11:10:22 -0700
Message-ID: <20240521181024.426176-21-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521181024.426176-1-raj.khem@gmail.com>
References: <20240521181024.426176-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 18:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110470

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ve-including-error.h-in-test_linux.h.patch | 29 +++++++++++++++++++
 .../recipes-test/syzkaller/syzkaller_git.bb   |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-test/syzkaller/syzkaller/0001-executor-Remove-including-error.h-in-test_linux.h.patch

diff --git a/meta-oe/recipes-test/syzkaller/syzkaller/0001-executor-Remove-including-error.h-in-test_linux.h.patch b/meta-oe/recipes-test/syzkaller/syzkaller/0001-executor-Remove-including-error.h-in-test_linux.h.patch
new file mode 100644
index 0000000000..8bb19fb72b
--- /dev/null
+++ b/meta-oe/recipes-test/syzkaller/syzkaller/0001-executor-Remove-including-error.h-in-test_linux.h.patch
@@ -0,0 +1,29 @@
+From 648868595cf290e77aab1f271db2a57e1f791301 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 20 May 2024 20:37:07 -0700
+Subject: [PATCH] executor: Remove including <error.h> in test_linux.h
+
+it seems to be redundant and moreover it lets us compile on musl which
+does not provide this system header
+
+Upstream-Status: Submitted [https://github.com/google/syzkaller/pull/4822]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ executor/test_linux.h | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/executor/test_linux.h b/executor/test_linux.h
+index 7cf459569..8c9493539 100644
+--- a/executor/test_linux.h
++++ b/executor/test_linux.h
+@@ -1,7 +1,6 @@
+ // Copyright 2017 syzkaller project authors. All rights reserved.
+ // Use of this source code is governed by Apache 2 LICENSE that can be found in the LICENSE file.
+ 
+-#include <error.h>
+ #include <stdint.h>
+ #include <sys/utsname.h>
+ 
+-- 
+2.45.1
+
diff --git a/meta-oe/recipes-test/syzkaller/syzkaller_git.bb b/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
index b43207f2a7..639f55de2f 100644
--- a/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
+++ b/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
@@ -9,6 +9,7 @@ GO_IMPORT = "github.com/google/syzkaller"
 SRC_URI = "git://${GO_IMPORT};protocol=https;destsuffix=${BPN}-${PV}/src/${GO_IMPORT};branch=master \
            file://0001-sys-targets-targets.go-allow-users-to-override-hardc.patch;patchdir=src/${GO_IMPORT} \
            file://0001-executor-Include-missing-linux-falloc.h.patch;patchdir=src/${GO_IMPORT} \
+           file://0001-executor-Remove-including-error.h-in-test_linux.h.patch;patchdir=src/${GO_IMPORT} \
            "
 SRCREV = "25905f5d0a2a7883bd33491997556193582c6059"
 
-- 
2.45.1


