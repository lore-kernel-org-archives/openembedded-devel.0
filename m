Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF3AFC47093
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:12 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.25304.1650857678905167931
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Apr 2022 20:34:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oncjf3Z2;
 spf=pass (domain: gmail.com, ip: 209.85.214.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id h12so20400523plf.12
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Apr 2022 20:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NqDKowNiRTQRxFPGacz8d6kg3NwPuDqRPWpgFEQZ7OU=;
        b=oncjf3Z2LfIQgg0t6tYnXp1YMBtcSJNsMPs4mpxD4Waz9Cp26a0T4A/aLs0OSGeq0j
         r9+AVNJV1O79YfJXQvXzVp+VqH5NUWjujGwR7veexTudV/saOlWQQjuwziCbgKOkh0MD
         oFQJyFpNMjOFuRmSh/MDbP0vTxodVBrYXVABV6Lf8Kp0I0zXEeVZ72MPD1W7hU/RvR6C
         tGbM5RSXty0g944UYq/BgVaZoK1flwuhC7/VuxlVkti7/Mv6BQcLbOKIw/tq4pZ+nqvC
         VTrUvylYxdXplwNRKw2n82c42ktg0+1sM0v9YcM+KltPvAn2M6LQEUUXp3kyU6l46Mni
         evDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NqDKowNiRTQRxFPGacz8d6kg3NwPuDqRPWpgFEQZ7OU=;
        b=28Cdcugh9Ukw5NEFG1EtBja7Jt/YAXRo3+d7+UuK20lK4EesJl5Z99DBn8CvDbg7s1
         ZXeu3R/CC7T9uuI4kOKYOkZH9opLNJ4SACQFnM3aevKnpNkUArDxFwRx4R6PxdicHjYf
         +3wu1EK0Sd1wEsDxcV3WjrVVydJ43qTeT0Cj2mSK2GgMyQyV4NE82FLUvisdkm6jcG4+
         KwG6LnGgXL4NpTV5+cj3IBny97TFoJYSSVBJFLTpTNBRWq/ChAs2fLvmkv9MR2c+F+a7
         sRqxFwjSJ68j5OuQSxEMCz4tCwC6wJHY0LX4e9Pq6ku0SIs1V+f1yFBKWIe9kwJfnqyL
         P8kA==
X-Gm-Message-State: AOAM530A4BM2o/Y68/juL2nVloWEJ7wDYt9nest5PlWoP6wXIaoV8rZ9
	63Kkvjc3xkcayezFNAdb+ffAN/DIoB1rTw==
X-Google-Smtp-Source: 
 ABdhPJzHeHgCcAFWgWq8fI8sTb1wRUIjex0g4EvyhOv8/O1OVpXSDKxxp59vYoVmOvSTBSagsSHMTw==
X-Received: by 2002:a17:902:9a4c:b0:156:6735:b438 with SMTP id
 x12-20020a1709029a4c00b001566735b438mr16246413plv.46.1650857677964;
        Sun, 24 Apr 2022 20:34:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 x123-20020a628681000000b0050d4614a535sm300759pfd.170.2022.04.24.20.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 20:34:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] pam-ssh-agent-auth: Use specific versions of BSD
 licenses
Date: Sun, 24 Apr 2022 20:34:34 -0700
Message-Id: <20220425033434.3263325-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96757

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb b/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
index f7cf4a03ff..7065529326 100644
--- a/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
+++ b/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "pam-ssh-agent-auth"
 DESCRIPTION = "A PAM module which permits authentication via ssh-agent."
 HOMEPAGE = "http://sourceforge.net/projects/pamsshagentauth/"
 SECTION = "libs"
-LICENSE = "OpenSSL & BSD"
+LICENSE = "OpenSSL & BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.OpenSSL;md5=8ab01146141ded59b75f8ba7811ed05a \
                     file://OPENSSH_LICENSE;md5=7ae09218173be1643c998a4b71027f9b \
 "
-- 
2.36.0


