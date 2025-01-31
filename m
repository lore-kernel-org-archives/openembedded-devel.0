Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D541C0218F
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 13:15:01 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.18909.1738329292665349366
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jan 2025 05:14:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ha+gyMeG;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4363ae65100so22585415e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 05:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738329291; x=1738934091; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iwZyMo3DfKyYuK29x7L8c0nQYO8wmVXxsvoVe9Ssui0=;
        b=Ha+gyMeGImfY8sAfqCNEIkdbVV/uSDx6GBDeewtsIeEsCOItFDinYvyiX+uwVzJFPW
         F1Ohp1aPszptISNFj9R5JgHI+LBe+WEvZbduyQ/zpk01xb5UW4ylxlKhVVO2igIHvcMe
         6+SUDcTdKzM7GECRh/NdI12rGCtUzO3koxrr4knSsowOKipgLbGegs/JIuZ/7m5hqi3G
         9RVEzbP5aifOZxqaC8ALG84JP5jp/KuEWsR9+LOHoBzal4bRhxEOm3krxST/E/pDeD7h
         WgzzymQrD9GHMt3KupqoHIQu1b/VY4Jlgnc+430S5I2jm1TSkA39rgeCumEwQHytPoo9
         fUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738329291; x=1738934091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iwZyMo3DfKyYuK29x7L8c0nQYO8wmVXxsvoVe9Ssui0=;
        b=LyF0cNsAOKZqZsPglAkkTZaIlyxywLYZA8J1xvxnhyZjNYndwxsv4WetjT2Zrfn4bA
         5V9rvIOVupAYESTows1jSdsjCzghzHSgSM77wQ9uy68vRa/TMi6cH7lxKQp3VALlRmpK
         vUa3ffZzvJf5raD0crIhdy8cfuwBXhgq8X4xcLAJ5bW7Nt+znhPgTUECkb6G48tGOOXV
         fcwEkagsSjriifPrVBvQcvxlumLwMOeQS0+UIe4Zyr4JKKQajOyVamITNuCQhsa74gkT
         J570pP1YZC6dc6tHSwuUizjG8LyBpp+ngKckTGJPBK7WELmmmywCSKjpzoYRofbtcVKi
         PndQ==
X-Gm-Message-State: AOJu0Yxrrnl9xdClPVqQ57XPvf89hnqx8lZTdwGc1Rae0sCwX2VCa9Bx
	1DnEulDqEbKXRxjZZFnSnSxFyw/wUgKh3z8c+CASRegVoQsZZOzrWf7k1YHH
X-Gm-Gg: ASbGncvPkDF2emH4XF2dmN+4E3rBYr/vEEzATaYMKXPsXjCQV/I0X7zaDFxDYvLiCf1
	Yu+V8f3eNIt74+cibCRmz9SrbsgYo0C9OKmaYjxgTZwjyzCLlLHZFVDJfvTkcuEYYHoPGspE/80
	5pqG6EEPdi2HVMvzO5bBnP66ok3AT7YAC6zZSLeo5AcM/bl5kTs86+Knyg9+Wq44C8v/+S2aQnL
	caS7z21FdrWAhul7jDTARdYC5U5WqyeQCK0XxDHmy8QfVB0Sv7nWqMpHO/IzDJJ8nnEt1oojRty
	DNZHAhQGtew6V6ZwrS3pqhfifzoHKPc=
X-Google-Smtp-Source: AGHT+IGF/WhJr4S++lQww1fKchCq9+t5kt3+PQlX+hCT5iugBntUR30+aG1E35hu0lz4JyQc+zdffA==
X-Received: by 2002:a05:600c:b8c:b0:434:a04d:1670 with SMTP id 5b1f17b1804b1-438dc34ba8fmr131787205e9.0.1738329290947;
        Fri, 31 Jan 2025 05:14:50 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc2ede0sm90761475e9.21.2025.01.31.05.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 05:14:50 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [meta-filesystems][PATCH] fatresize: set correct LICENSE
Date: Fri, 31 Jan 2025 14:14:46 +0100
Message-ID: <20250131131446.1197006-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 13:15:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115196

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb b/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
index cf7ac62be..6832634f6 100644
--- a/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
+++ b/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Resize FAT partitions using libparted"
 SECTION = "console/tools"
-LICENSE = "GPL-2.0-only"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "git://salsa.debian.org/parted-team/fatresize.git;protocol=https;branch=master \

