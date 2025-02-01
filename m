Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E7E5C0218A
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 14:04:16 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.43477.1738418653089527280
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Feb 2025 06:04:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SQm0K6tA;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso30117415e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Feb 2025 06:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738418651; x=1739023451; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VORPECIleUl8uCtQaAct+q0EkJpX+qlmGbUZq4jpgr4=;
        b=SQm0K6tAX537cwa2NigKanwf4KGPFgEStyLBU0IMtLMfrDolhG9wEsms3DE3+y1g/Y
         //omiKLiGpkQ1oeSle14dG2UZfAEStiGGh3TJnHJihvqarXble4KFgXGhpXrPfrr5AJX
         s0/erf9jwbSIqFd3mZhXkGWSb7448BQjX0MwN3iAI9O7Mr8Cm5ZMcIunor6oDKq9Rz9R
         yM6+9o/GZtWuXUyWD8qGdhgkV27DFuha/dWiu8BGE7YQtb/OCFmtxjoaTUy1UwE+KDng
         yl3BO+6JPGWu4cJ1fCg9UZSPGC+HKvUPUQlXtyZY1Rh/TPbmbu1tZNcYI3cYxW+H4d0K
         jKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738418651; x=1739023451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VORPECIleUl8uCtQaAct+q0EkJpX+qlmGbUZq4jpgr4=;
        b=Dr6BqmgJo8OFfS8VOB/DpnWX3wGI9E4jSPkXGmcKm4dTZmVPPNds0z5vNJ5P4n5JRd
         FCrbLn7HpY73LyLzxvxyGAyXoo+e77+LfVVkaNAXLLvHegqLe/7IsLL/LNfSoAKkkBN5
         VXckpCDYPfyXyPcnzBmjrS0479CZp0/TuSYtBZyO6/UYsJK6agvKIIdyw1ioQ6v4m6zj
         SAsuwMIyRpOM0nrSrUhg8L0ZED/+JgH5BpCcHw9w7zxqPr0VFs7DMLPqDp1HNdIBbuUk
         j+Cke1HPKbiVW6Xtx2bhKIhXyHj6/+TO9hG8ET6thmfZ8glCKLlNpzOag43ufzaSLD2c
         WDzA==
X-Gm-Message-State: AOJu0YyebdruoNDLW0lrhSu1fS9vO9mgT+gB/pLOVItsKGWnw5OzUL2r
	0G7u99o4Ch82CXh8KJjLH/yiEfcuLXPF+JqOuiAbSG08nmkzpCifZNYlLA==
X-Gm-Gg: ASbGncssvZ1IDIJurqup0UHygV8VSWZA8PQVcbogewGT5sCJtYw4dokz/qMz2ADocbw
	iFvMO+XByVXTHl2mMl/26qOjI3kUx53wNFkJDAaSWsAVAQjItbYW+WmtJtNcQSnsR2xnEe7zueX
	gkll9kMAcW1Mz8M6JOwioT9SMn37kB8RR0cNuCHXeZL7j35lhG9nBjEZRAgVb7F5zYrqVnXc+We
	pqzcBSUEY/bu1A3KYIISLHdLcsTYsFRRN+BUz2t5NtLPQTPf979kDIRi3Y/t6qD2a1QJgJZAm6t
	m6SoHF2jsJ7tO1p3MxdgQOS8h4qKqcY=
X-Google-Smtp-Source: AGHT+IFlxkfJyLHAFpOSUCW5DRvJOAIhZJl1e9YBe6IS+pN+IMcxU4KjGH+DOKL9ThTBwRkRXrpYOg==
X-Received: by 2002:a05:600c:4f55:b0:434:a746:9c82 with SMTP id 5b1f17b1804b1-438dc3aa6c4mr148914995e9.5.1738418650905;
        Sat, 01 Feb 2025 06:04:10 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23deedfsm89690035e9.16.2025.02.01.06.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 06:04:09 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [meta-networking][PATCH] znc: fix LICENSE value, clean up SRC_URI
Date: Sat,  1 Feb 2025 15:04:08 +0100
Message-ID: <20250201140408.1283569-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Feb 2025 14:04:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115210

1. Set the correct LICENSE value

2. Csocket is a submodule of the main znc project. Instead of
cloning it separately in a subfolder, just let the gitsm fetcher
to fetch the correct revisions, at the correct place.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-irc/znc/znc_1.8.2.bb | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/meta-networking/recipes-irc/znc/znc_1.8.2.bb b/meta-networking/recipes-irc/znc/znc_1.8.2.bb
index 68dd0702f..48a542657 100644
--- a/meta-networking/recipes-irc/znc/znc_1.8.2.bb
+++ b/meta-networking/recipes-irc/znc/znc_1.8.2.bb
@@ -1,19 +1,13 @@
 SUMMARY = "ZNC, an advanced IRC bouncer"
 SECTION = "net"
-LICENSE = "GPL-2.0-only"
+LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS = "openssl zlib icu"
 
-SRC_URI = "git://github.com/znc/znc.git;name=znc;branch=master;protocol=https \
-           git://github.com/jimloco/Csocket.git;destsuffix=git/third_party/Csocket;name=Csocket;branch=master;protocol=https \
-          "
-SRCREV_znc = "bf253640d33d03331310778e001fb6f5aba2989e"
-SRCREV_Csocket = "e8d9e0bb248c521c2c7fa01e1c6a116d929c41b4"
+SRC_URI = "gitsm://github.com/znc/znc.git;branch=master;protocol=https"
 
-# This constructs a composite revision based on multiple SRCREV's.
-#
-SRCREV_FORMAT = "znc_Csocket"
+SRCREV = "bf253640d33d03331310778e001fb6f5aba2989e"
 
 S = "${WORKDIR}/git"
 

