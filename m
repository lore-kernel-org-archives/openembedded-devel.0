Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27EB7C433F5
	for <webhook@archiver.kernel.org>; Sat, 14 May 2022 08:24:10 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.4016.1652516640136296682
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 May 2022 01:24:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g6T1zVEF;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id i5so14050753wrc.13
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 May 2022 01:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SRIb+J3bI2U4i51WSTfxvXdlRZxncGd2k68rw2o8c30=;
        b=g6T1zVEFcHhMdZrxsYa73KsDG0C3D5S0D7SjOHciedmAhLBeiXtWXyJqicpTfLq5SG
         pR76Fxhq4R+PfVvf2M/Q8cYWCiQ5FVOT27qECH2O9EnhwaOfXz4JetHUx3GGv9ZIDxP7
         gDLMNqBmYjqEMq/zF38ChxW2fBvl3WTFIjjICVUSYBPMp/xBF/fss+7RrTp8+o4TqO3K
         vWw2EuERAjQBOfK8aD38bHFqWGpoyJkytrKQlAaM73x5Fj8q7VgVtPA5TUlEIqook2OC
         x5OH2Z0HfEzBR59tb1bXTnNJRjJlEeciJZRXNt6MehyWsE6b9L0wJ5sbwWUnlPSGKth9
         D1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SRIb+J3bI2U4i51WSTfxvXdlRZxncGd2k68rw2o8c30=;
        b=y1+d7JT33OBD4v7Z3u4VLxDSNXzJTn0CO3HQ+SRHqiUJ7Eh4Ke57LcrlML1w9i2p/3
         ABSictmd++0e1wI39qA1u8dVpqrzQ5GMuZGIY5Is8XSTBv8HHetice/Lo39HUlo7T/NG
         MbWMBDOue0STj7TgEISdRvy3Amd9u7YBVDsdC5kgjDLyIM3Nn/mDBzXTiqYDmVO40sXD
         fRKrH34dXT96ZeaI0YxgVsKTld+ZEWMHKS5qNEjkvuAjmFMVHA8rhNNDflE0vYXmIZey
         CST7NzKFwWkbErNSdnl2fCx9+2MgNRw7mySdfdCxB2k8fc3sR+pBf3tk73BW4mE0udpD
         XnUg==
X-Gm-Message-State: AOAM530RtcWt0SUxDJpHD1oU+Jq30GcuypOlYJma45HduC/NR7+Bmt8c
	RcV+JgX4edZqAVjAYoSwWlXgThhgwCg=
X-Google-Smtp-Source: 
 ABdhPJz/ruYy7tG0JheNCrMX7SMq3Wg/bSWYoAbMVFieeI7jEqWMmPTDyLCM4h2Wx4vF0iWKHv5Yvg==
X-Received: by 2002:a5d:6a85:0:b0:20a:d938:3879 with SMTP id
 s5-20020a5d6a85000000b0020ad9383879mr6815796wru.462.1652516638561;
        Sat, 14 May 2022 01:23:58 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 n27-20020adf8b1b000000b0020c5253d900sm4189484wra.76.2022.05.14.01.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 01:23:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [dunfell][PATCH] ostree: prevent ostree-native depending on target
 virtual/kernel to provide kernel-module-overlay
Date: Sat, 14 May 2022 10:23:53 +0200
Message-Id: <20220514082353.3114819-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 May 2022 08:24:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97095

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/ostree/ostree_2020.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2020.3.bb b/meta-oe/recipes-extended/ostree/ostree_2020.3.bb
index b8b86ed5a9..5b0171d8c8 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2020.3.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2020.3.bb
@@ -181,7 +181,7 @@ RDEPENDS_${PN}-ptest += " \
 "
 RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils glibc-localedata-en-us"
 
-RRECOMMENDS_${PN} += "kernel-module-overlay"
+RRECOMMENDS_${PN}_append_class-target = " kernel-module-overlay"
 
 SYSTEMD_SERVICE_${PN} = "ostree-remount.service ostree-finalize-staged.path"
 SYSTEMD_SERVICE_${PN}-switchroot = "ostree-prepare-root.service"
-- 
2.35.1


