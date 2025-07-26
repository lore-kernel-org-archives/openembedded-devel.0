Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59223C87FCA
	for <webhook@archiver.kernel.org>; Sat, 26 Jul 2025 21:07:55 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.49243.1753564068208840055
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Jul 2025 14:07:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G8KVAPG1;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-747e41d5469so3518419b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Jul 2025 14:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753564067; x=1754168867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GAPe0TL0/IrKD0QQRkq8zIQqLkjlsOaX+GVY9aOzzrk=;
        b=G8KVAPG1IM+fQXBirIs2itUtiFnPuBLXktwG/Ae1VGOBHQuXZOrQULnR3tIp+ikqfl
         QLq7JAKZ2sPN2T/tDysuHhk0LpQrQT0LnW7/kCAJ7zMS7IYLgGcHo7luIe+0V9ZixI78
         an+eZ73/Vv4qTcNCgDxkTkvDUnBwYYB1Xt5T23F1vxYXFFSL4DYf0x/hhS0CAuFz7eXD
         blG0n4lQpKt9d09bADmcNM2gZOoq9+ZcKMcH63Kzq469GS7gItNJ6wN/EY5YSiOcjvaq
         BVwLx9SdVCPnCJeeZJIGAHb7VFuiafc4EMo5wcg+J7hYLlLXeuMk1yVUe0DVWJM4w97E
         x1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753564067; x=1754168867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GAPe0TL0/IrKD0QQRkq8zIQqLkjlsOaX+GVY9aOzzrk=;
        b=v5IC5ns/FnqpqUdvMjOevJvmRTTNUqHmEgqYpyCaDvyamJgiFhxmugwHdvrDr+AiId
         BHK92EqcGydvi0kwozbYCnA5LcVlINoc8CkDrLgq02dzyYx3sbGxzDfR8rSSBwYlXf0O
         2yqSzvFJoj8zIklFl9XToAKP6PfLH6gcYvwyZw8G9bttkfqjl3oJmODGA/xmmqtfnyuv
         oPk/NH6LB/LzlzaSf/YkrByXKGEvaCE/YGpbipcAsejN/mVjaLjfYeD2uK0r65zrYZew
         8p8Ux6PJMlQswAy1nadH8Jp1CSfp9za1zzKSqXyqYYeihNPnX0y6oM68HC6aCfQngpNF
         4PUg==
X-Gm-Message-State: AOJu0YzLNPgG5SYWbLb8pxvQFm+dE1LWozJT4mfaU8pV4MsT3CNTJaI5
	EmmS4irmc9LqwqVaa4CZhS0boH/3w0Ibbh+9hwUIxFxssxbGRTcKtkAQDmhFkgiNCR4=
X-Gm-Gg: ASbGncsRXQ2EsHQV0HRcuL4TzzklUEl89nybOBGQqbjTu9spH4lk9z2+weJvLX30nbA
	GH4FPa+0k+QUD9htCehYsIU1oQX+GbRtDtry4u6K1VMmhqv29Z5mVZzN+pjUsI/EBHnU/73fCK1
	4X9ftXTsL5q+RFumBOFqKlr7RKrvMPL7Vr5YnQEEzJYyny1877BJ7ttdb6cFDr1nINgLjRYVPsx
	vX4LWkV/CeMuYZVndd3u0fhXQ83fU97gFK3WLAwTXCt6lHffo+xBuDQSMl4ebHcdnH4OWHf/UXU
	9CBG4fsNNY8WZQHzZvKzio+S5mYOkaDWF1x7yxYtbmu3U3GTATkYldPAOtGPhQvUE7ruadcDQe3
	Z/J4Qw/kieNeeYrlUD4/wDDR3
X-Google-Smtp-Source: AGHT+IEuIsa77tVwMyiwrm28UYVH/Qfi3tMsKJk0KZIw/6Rw1HLJqa6Am1/Gn8RVl4TlVioKtSMExg==
X-Received: by 2002:a05:6a20:7f93:b0:21f:cdfa:120e with SMTP id adf61e73a8af0-23d70212c67mr9889387637.30.1753564067193;
        Sat, 26 Jul 2025 14:07:47 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::33e9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f7f58f0f8sm2060903a12.22.2025.07.26.14.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 14:07:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-pytest-asyncio: Upgrade to release 1.1.0
Date: Sat, 26 Jul 2025 14:07:44 -0700
Message-ID: <20250726210744.220896-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Jul 2025 21:07:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118741

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-pytest-asyncio_1.0.0.bb => python3-pytest-asyncio_1.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-asyncio_1.0.0.bb => python3-pytest-asyncio_1.1.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.0.0.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.1.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pytest-asyncio_1.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-asyncio_1.1.0.bb
index 118f4e030d..4ac45fb1a8 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pytest-dev/pytest-asyncio"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=136e4f49dbf29942c572a3a8f6e88a77"
 
-SRC_URI[sha256sum] = "d15463d13f4456e1ead2594520216b225a16f781e144f8fdf6c5bb4667c48b3f"
+SRC_URI[sha256sum] = "796aa822981e01b68c12e4827b8697108f7205020f24b5793b3c41555dab68ea"
 
 inherit pypi python_setuptools_build_meta
 

