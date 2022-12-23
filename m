Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52677C4332F
	for <webhook@archiver.kernel.org>; Fri, 23 Dec 2022 18:09:20 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.78755.1671818956319827524
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Dec 2022 10:09:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JjAuJ7Zl;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id 4so5602084plj.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Dec 2022 10:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o6Hudmpcs99MulbCqsequ65YOw+cahs+IVRpo7WWEbM=;
        b=JjAuJ7ZldtquQxGb47Q7cluzp2Cf1GpLAheCUziB8So5YU7a712mNaHJDzFQNpvyfE
         gB7BSFGtD68w/2ymT+E1FURbCF3pq/q3bSNrtb8cy3tvEg7W9JYCIw3MyodAi3HaL2fh
         A1flx0H62/lytpCi6bfFFApdktywo1bUO9VkOMrL1j8hB/MGpRCBj5pWVBjFVEoK2/4R
         6GaLyHqyo8JlJm0ac4r4ilBfLMunolcPqigLWAGeIFMjXMI4ub6cGPZBpM5Q1fiIWZvv
         W9TcGEasqIXEScK4O8tWTzz41kqKvYxWHlG1AXkPq8K8cRnMF/mdwG7wPuxVZ7fPCLad
         CHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o6Hudmpcs99MulbCqsequ65YOw+cahs+IVRpo7WWEbM=;
        b=u8kr5lf3jnlHlC8Lcm6Mt3ucAxgojZ1PvMj5RIEl874u+wsjSHQSJJ+YmyH5ZE2plF
         AjCE4HC7iGlZk19bb97VlfOPMBRmCMZMDJm0RqSvbpbnNMBm/fd8fvGKBiIaJUR3hBBZ
         W0ZC+CX8bqtWGSj+Vu7/LtTMTt5o8GOTfuAp5MCJdFE4pK2fpc8Mq+UG4nfSlaZeV6dR
         E7o36oI2kaTn8ogc8Ek2dxEZvQEi8+fmhSH+5f8QSr0caWfleTlMg8fUuGupDjBRxz93
         JrALkOXBS3c84awgaWs7V8rX6zko7TIbKA8yMcwKWos5RiniyXgIsIwHg1z4Xbdg+uHs
         f2Yw==
X-Gm-Message-State: AFqh2kpRq3g3DCiu93jRPIuDEmpymeyJS6tGPI/otc/qGSIXV1C7al4F
	T5h46oc3yxN62lzdFtmZplUTPYJ59DY=
X-Google-Smtp-Source: AMrXdXvFAA6sttQf9durvHaKRthdE6xYrSnrC4oVSUPEuF+zXwsLpcmDry5GCPOPx+LRa3JJEur4Mw==
X-Received: by 2002:a05:6a20:499d:b0:b2:5a0f:605c with SMTP id fs29-20020a056a20499d00b000b25a0f605cmr12548765pzb.50.1671818955468;
        Fri, 23 Dec 2022 10:09:15 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id r27-20020aa7989b000000b0056bb36c047asm2811238pfl.105.2022.12.23.10.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Dec 2022 10:09:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 1/2] xfsdump: Add -D_LARGEFILE64_SOURCE on musl
Date: Fri, 23 Dec 2022 10:09:12 -0800
Message-Id: <20221223180913.874888-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Dec 2022 18:09:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100199

it used lfs64 funcitons which are under _LARGEFILE64_SOURCE and musl
does not define it indirectly undet _GNU_SOURCE like glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.12.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.12.bb b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.12.bb
index 659d604a66..9e595b9521 100644
--- a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.12.bb
+++ b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.12.bb
@@ -23,6 +23,7 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[gettext] = "--enable-gettext=yes,--enable-gettext=no,gettext"
 
 CFLAGS += "-D_FILE_OFFSET_BITS=64"
+TARGET_CC_ARCH:append:libc-musl = " -D_LARGEFILE64_SOURCE"
 
 do_configure () {
     export DEBUG="-DNDEBUG"
-- 
2.39.0


