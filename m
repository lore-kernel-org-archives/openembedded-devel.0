Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0BF1C27C53
	for <webhook@archiver.kernel.org>; Sat, 22 Jun 2024 06:33:55 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.92683.1719038027254862188
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jun 2024 23:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Afw2e6oG;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-364cdfdaf91so1943244f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Jun 2024 23:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719038025; x=1719642825; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7QlXFRtDCLLJbc6TXswLwtVsxY9ySZud1ftkwQSoRsU=;
        b=Afw2e6oG0wnOCXQEMHGSbUDhBoWnOrA2waGTTQl/SBdobqdVOPoM4N5iMrLi/LqhVR
         kI+8mAv2qASh2ICrYr7FikBbhhi+JHZAmXpCDi7QeLhjjX5Im8hS2WixddvkerZc34Vt
         x5IVH/3rQjW+Xu+70VoM5SmEaM/gg/bsS9wQpJBXgMObNxMA4esSVnoEUn6QCFYfATLu
         ZFA4a0H4VwiqsPrthII0/BlaH1/5lfFYLQsV0BnKiap8ZwmPaww5dr5IooDEFiyC/qUH
         MXXx2nBnkkeWfDF4IZiwHsZ+Pm+PZSLCrYUDv+m1m6hXH3N41YHqcnCONL0mkdH5Wt8A
         itpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719038025; x=1719642825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7QlXFRtDCLLJbc6TXswLwtVsxY9ySZud1ftkwQSoRsU=;
        b=Dhxvtn9fOPOVvGjU3U6bCupjZqikRn55tUb48ZKRDgchKh5DtAziwLBiPFUkiv5PH3
         NWSQ2BxZvFbFvQ2nWSnWVDlHHeSmND1+ISlPbamwEJ4RjuotFLTymamAJ4zVMY5Ut2OS
         CcVhDNuwUfNZDUGmzwYKbJL3LzVaKJ1QeVvkR08glU7LFbUqLkwGGCNiyyjQqNwIZue8
         7Ribep6pwQBIqfE/JMLsZJqrKJ3MI7f+akd4Dh1WWZbr0gspWa0gJ2SwX1QyLU9Wknbd
         CtDrLP40gHbmy0MNGy0Hw4WdLoleHOxWKnzs6Vispj2DJSkoDPqXw8Cvs8EQREoP6Tu0
         jSUg==
X-Gm-Message-State: AOJu0YwzkOe7oLVsVDMfga+TEhYZQuhRkTFZ0nhZQEjKhi7DymMT2QFu
	Y7EO/4kdbOeanPwYMuoYTyjs/LWiu2dqlBm6TJqJktN85H71/aXDqhwqJg==
X-Google-Smtp-Source: AGHT+IFWZlsjcZJAd+cN34beav/3bjtwdxY258+Kz3He4HAbtPUB7zvy+P5RwcqzIqfOqsyLp+Sofw==
X-Received: by 2002:a05:6000:229:b0:363:b8fc:449b with SMTP id ffacd0b85a97d-363b8fc458emr6053685f8f.28.1719038025285;
        Fri, 21 Jun 2024 23:33:45 -0700 (PDT)
Received: from localhost.localdomain (78-20-160-86.access.telenet.be. [78.20.160.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366389b8985sm3569976f8f.43.2024.06.21.23.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 23:33:44 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH] python3-protobuf: added python3-ctypes as RDEPENDS
Date: Sat, 22 Jun 2024 08:31:36 +0200
Message-Id: <20240622063136.159436-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Jun 2024 06:33:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110996

  File "/usr/lib/python3.12/site-packages/google/protobuf/internal/type_checkers.py", line 25, in <module>
    import ctypes
ModuleNotFoundError: No module named 'ctypes'

tested on qemu86-64

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
index b9b03badd..9695880d0 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
@@ -17,6 +17,7 @@ UPSTREAM_CHECK_REGEX = "protobuf/(?P<pver>\d+(\.\d+)+)/"
 DEPENDS += "protobuf"
 
 RDEPENDS:${PN} += " \
+    python3-ctypes \
     python3-datetime \
     python3-json \
     python3-logging \
-- 
2.39.2


