Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A7F1CA5FFC
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 11:08:02 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6876.1791371273124008852
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Oct 2026 04:07:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kkitmcNP;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc4aa02a269so1794516a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2026 04:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791371272; x=1791976072; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EhPIPsGg7pHT7QECEGicYGU3E7x6naBxdDv4J+PlQIc=;
        b=kkitmcNPXs5dI+rSJJfRy9GyKlTyazoQlTxoSg/L1YsaGzbVJkHmYr9/7E+QfKeF6o
         Pr6okBaw8/48xuxJtV5mIV5xscsIvhZgeXVrhQSjkmD2gNTK7tOynZCA115WGWAdLx4e
         1nLe640/58D82dqXRK7lwKr7TM8KZMIJTFw8j8f1yJVCbhAhuDPA1tKljC0XZ6JGqrEh
         t+/hNP9pS5Wt75uRtSfZuzDIvhdt6iFwYdjez/q8Wy5sP48C3N9gQi4JKCrqGrlKH5br
         0P71wHvvYsaQHG3GJ80anQWrc0XfYxbMJvcX4wx0c0DIV0vK5HlQqNqLtyPvoKGtqwqa
         F7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371272; x=1791976072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EhPIPsGg7pHT7QECEGicYGU3E7x6naBxdDv4J+PlQIc=;
        b=0PFLTJ278g0JAz51HM820zvaggfoNn4DbLzVGFOl3dYUXr02Tqp7vMXAVt4ENt3iUn
         5F/vgPX6j2A3zYGdkBQecBZFxDkWz5TPHdBlxdzWHAc0yCLwqT1ensBlNG4uLCbhpPoG
         tWShDKnOqm2T13R1vsm1NE7wdERZtRiwGA8OlMAzYmvo+y5jnd5EnIwZVkie0Xkbsj2u
         UhftgmtqsXfU3mXOW5Jk0+glirLaZrRxZYSIapOzcYcSrRHlFm4nBUaszJv+JNKwgCmf
         2iiuE62aWuG6qj9vX6PBWDjqwNPXLTy29/nBJnxfSB/tOFhZBQuYPjjBlVMDHgufYmLu
         H18Q==
X-Gm-Message-State: AFq9FYL9/I9EJ4L2Iz44j8Nz4iiuX8iqLW5BUj0/zJcJ+b+PxxErhTeL
	Ebo4lFXTWPgbjE4EJgzV15Ixk1Fe1q7VToS38yxPcVs7eOAgbliERd6Ui5JdANZY
X-Gm-Gg: AYBFou3bxw7LIMceTMJRqKSvvoZWkD3iL9Ij8WwdsXM84CdXxdGxcyosaJShBE9PG5U
	JzJFqKC38KQUMilOnh6HATuXkbsEc0CMDOhb6AyK4aGYJSUUzufhM+ZRmYVCg7Ws/xuxuLv712N
	0tGw2b+V7Q866oOfbLfhpqr18WSF05DVLGPhtx02JQ6qLXhuxayKo4f0FNyNK+oy2BbBsjyMk/f
	b9HvtGMEaqQXqghoIlauJhsgBQRVaIzmE4tszkNdoFlRC/mmD32XA0ZCXro+Opk1M+do57Wy24g
	VHED7pxsxS0RAeSfr8Nuvfm5EoORiPp/gce4DwkvIsk8WKmFtABGIKzlWVjwkdVGbQLBLN435Kn
	lIBx3mR4Fhf8lAWFbZFOetADZHUEHjj+o89sXgqlNqI2uFl+Q6vGNrFzweor5gv4UjieCEgrLOm
	ff8/7R1o8SuOmVvfiBlPu8BZsz03yhvVMJNvcytN3Nt0DPc6+r+2vyB0+xhqJy8lNMoVniwR9mW
	NROns60h5/+M89MYwnbxWs=
X-Received: by 2002:a17:90b:5286:b0:3a0:c156:3f8a with SMTP id 98e67ed59e1d1-3a8a1c5e33cmr1594008a91.56.1791371272313;
        Wed, 07 Oct 2026 04:07:52 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8533aba95sm10862177a91.2.2026.10.07.04.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:07:50 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][PATCH 1/15] swagger-ui: upgrade 5.33.0 -> 5.33.1
Date: Thu,  8 Oct 2026 00:07:26 +1300
Message-ID: <20261007110740.3179543-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2026 11:08:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130643

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/swagger-api/swagger-ui/releases/tag/v5.33.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../swagger-ui/{swagger-ui_5.33.0.bb => swagger-ui_5.33.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.33.0.bb => swagger-ui_5.33.1.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.0.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.1.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.0.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.1.bb
index 45a3bb6d17..db2bb498a8 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.0.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=main;protocol=https;tag=v${PV}"
 
-SRCREV = "cfd4a6c3cbaeeb7c13a8bada7c754de42d78cd5b"
+SRCREV = "cac3d136b5e37bfbe3288c8591f6f4fcf9870599"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 

