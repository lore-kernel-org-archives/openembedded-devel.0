Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5FA0C6FD1C
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 22:39:52 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.88179.1679611189123551117
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Mar 2023 15:39:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YOOo7Fu0;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: festevam@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-17ab3a48158so48108fac.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 15:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679611188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qPCZwkVqAYEARDuQS5LxCGXraVFTDoNj8xkb68WVJEM=;
        b=YOOo7Fu0aB7Z9q2x7FNMVAUdwT8Ukh7JOvg1gO5kFgzMt/5OzH1bCnCp3+AlFIcxrf
         LBYTIfXwy8mk2e0n9PmhHJA9KB85S4BzBaxRLvVToJAe5f7d2ddByaVPWICwDk3Yc5aZ
         ByqeFJU5GMglBPVUqjXPc5uXSHosjcFRa2YgH1y3kNvhYjYRH4zdpNWk83/R7DK6D8yP
         vn6uDjOOAWs+DoAT87anjdEmADp0CjivJIu0JdYjy/ZrnyPDthwu4dL/rhyDEXiuTNzy
         /L6Iot+tJZJk37HkmrZfKMHJrXFxWXrNaBKi5UrZPEH6GMghU+xBcvMHNZUm2Moxf040
         E0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679611188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qPCZwkVqAYEARDuQS5LxCGXraVFTDoNj8xkb68WVJEM=;
        b=rkxGMBbK8BL6nIMcJAKg8CnKnSClN3LjzVk6SlY5r9jvhxptTR3PoHtXGFaK8DFd+w
         mWcRlPxJ3Ehg29Un0GE8g0bAscJUShSEiX+cBjA1sunPH5+I5D49h/Kn/YgsP1b70QTO
         jkMp10goLzgYRph5h+nytOv4TbYSPFXIHpSoLeWuh/Grqk2etoDsdPMpLhPehiQRAszO
         c7+hDhs2k/XKFXutyGNdZMo8ZmWlYcXHt91yghGSFdFUgY3Mb7YTsEpkG60USZAfzG9Q
         39z7GRDLpQLm0OCfF0rJ0fk5qSX9W8plBS7cZcFzN07wiufHm+gAS2l+Na1izvsdiHsG
         93ZQ==
X-Gm-Message-State: AO0yUKWL8qyzSlsjZakGo/fMO0Eex3xtCxglm7SIv8Kiw4odMn6IW/UY
	3l2cYgN+LQPz0NgSsXv7m9fd2z+zlX+SCA==
X-Google-Smtp-Source: AK7set/qVU583XaRZvDw35Ds14rUU9fIJS+evyioBmaaBzEZ7ZVWrFOEZPeON/pPDMvxcOvHKlTXGw==
X-Received: by 2002:a05:6871:88a:b0:177:8383:7287 with SMTP id r10-20020a056871088a00b0017783837287mr583719oaq.5.1679611187913;
        Thu, 23 Mar 2023 15:39:47 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b69:a23d:2b74:f5e9:5ae8])
        by smtp.gmail.com with ESMTPSA id tk6-20020a05687189c600b0017703cd8ff6sm6591137oab.7.2023.03.23.15.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 15:39:47 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [meta-networking][[PATCH] ettercap: Update Upstream-Status
Date: Thu, 23 Mar 2023 19:39:40 -0300
Message-Id: <20230323223940.3455593-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 22:39:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101671

From: Fabio Estevam <festevam@denx.de>

The patch has been applied upstream, so update the Upstream-Status
line accordingly.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 ...1-sslstrip-Enhance-the-libcurl-version-check-to-consid.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ettercap/ettercap/0001-sslstrip-Enhance-the-libcurl-version-check-to-consid.patch b/meta-networking/recipes-support/ettercap/ettercap/0001-sslstrip-Enhance-the-libcurl-version-check-to-consid.patch
index 82456c2f963b..592ea52f2ef4 100644
--- a/meta-networking/recipes-support/ettercap/ettercap/0001-sslstrip-Enhance-the-libcurl-version-check-to-consid.patch
+++ b/meta-networking/recipes-support/ettercap/ettercap/0001-sslstrip-Enhance-the-libcurl-version-check-to-consid.patch
@@ -14,7 +14,7 @@ TOPDIR/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/ettercap/0.8.3.1-r0/g
  ^
 1 error generated.
 
-Upstream-Status: Submitted [https://github.com/Ettercap/ettercap/pull/1221]
+Upstream-Status: Backport [https://github.com/Ettercap/ettercap/commit/40534662043b7d831d1f6c70448afa9d374a9b63]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  plug-ins/sslstrip/sslstrip.c | 2 +-
-- 
2.34.1


