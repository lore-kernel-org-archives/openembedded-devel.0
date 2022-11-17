Return-Path: <omkarpatil10.93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DEC9C4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 08:24:32 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.10817.1668673463706177760
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Nov 2022 00:24:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l5v4HtQH;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: omkarpatil10.93@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d20so936327plr.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Nov 2022 00:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=etXic8+htlm8EbwHS6qdCNCxrJKG/lbQspFFYwvCIO0=;
        b=l5v4HtQHzqB8BMXtiD4zIa6I2ol4G2mGMmaVS8v0N6bwGGnsCx6JT3sdidMNsRiu2S
         a/kPyRkfoF48f9S3g9KJXROEmK9znVMDpM8ushGvPU2DAz0YbiSM4cxjrLAgKIMyXlW6
         JAyFfVpa02BsA1ClClSnpqj5aPLAx+aABr6FA1sRFy3hIQ2a1AhfUNb1oYTP3fgz5D7D
         PtmBC/5l+GdCx289yNJt8vhNpV0uPc5cn1uLL4F6j1cBJDsqWOjcRrRECC7+LAHQbtFv
         xCzviKxQGFgejI7NM2iXTgbJcQp2k4HDnSmt2MdfcEdje4OOjCgAt/SSLRjUwbqroybE
         Ay2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etXic8+htlm8EbwHS6qdCNCxrJKG/lbQspFFYwvCIO0=;
        b=Vbn9yqGyScy7xUJccuNHPkGW7Rrn33vBJQ3VXOCs+NRblyQkWzRUYAoIxfs/KcOPIb
         qW9rR8kQ0jkZkyHyXSRwPB0dDaIaIEi6BkKgnWG3sQXZd5HuvwYyc96MdflrJkQwLcym
         rWtN+FZsiH2NA1WdJrtKAJmoHDjIM57vVjSU71xBtNSHWpBJYnBR3R5xQ1jpgczZ1vqI
         mrXyI8+CcUEHuwfrw154gBfDNGsk+m3Fzi6f0JBt8UdqgOLUWzeuSMXb0xu+p7lbnHA/
         oqgduQKazyGcDibgolawvIaOu4v6DzDfhMpnYBkl6tmyx4lW1LhTxPVrAEeeAz3eGFxz
         /pAw==
X-Gm-Message-State: ANoB5pmfHZPsXOJ4H+7vnCn9X2E2qx++vIeT2sKrUnzRWymusedsAZAH
	SmA0du+I/j0f6sL25sbz9XgZMxFAiyhhzg==
X-Google-Smtp-Source: AA0mqf4HAQcrpElkzrQHZbGwByQYw55L0LEKTIlZGrqY7VVr/T2iZMl3j4AMsNxPCVm/K4IvEHDbhw==
X-Received: by 2002:a17:90b:48c8:b0:20b:25f6:3e30 with SMTP id li8-20020a17090b48c800b0020b25f63e30mr1669628pjb.227.1668673462556;
        Thu, 17 Nov 2022 00:24:22 -0800 (PST)
Received: from localhost.localdomain ([2409:4042:4e02:b7cf:7864:cc87:c985:cfd1])
        by smtp.gmail.com with ESMTPSA id 143-20020a621495000000b00565b259a52asm485447pfu.1.2022.11.17.00.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 00:24:22 -0800 (PST)
From: Omkar Patil <omkarpatil10.93@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	omkar.patil@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [oe][meta-filesystems][dunfell][PATCH] ntfs-3g-ntfsprogs: Upgrade 2022.5.17 to 2022.10.3
Date: Thu, 17 Nov 2022 13:53:59 +0530
Message-Id: <20221117082359.19378-1-omkarpatil10.93@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Nov 2022 08:24:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99602

From: Omkar Patil <omkar.patil@kpit.com>

Changes:
Rejected zero-sized runs
Avoided merging runlists with no runs

Fix CVE-2022-40284

Signed-off-by: Omkar Patil <omkarpatil10.93@gmail.com>
---
 ...3g-ntfsprogs_2022.5.17.bb => ntfs-3g-ntfsprogs_2022.10.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/{ntfs-3g-ntfsprogs_2022.5.17.bb => ntfs-3g-ntfsprogs_2022.10.3.bb} (95%)

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.5.17.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
similarity index 95%
rename from meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.5.17.bb
rename to meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
index cb52c5567..efb331d7b 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.5.17.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
@@ -10,7 +10,7 @@ SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz \
            file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.patch \
 "
 S = "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
-SRC_URI[sha256sum] = "0489fbb6972581e1b417ab578d543f6ae522e7fa648c3c9b49c789510fd5eb93"
+SRC_URI[sha256sum] = "f20e36ee68074b845e3629e6bced4706ad053804cbaf062fbae60738f854170c"
 
 UPSTREAM_CHECK_URI = "https://www.tuxera.com/community/open-source-ntfs-3g/"
 UPSTREAM_CHECK_REGEX = "ntfs-3g_ntfsprogs-(?P<pver>\d+(\.\d+)+)\.tgz"
-- 
2.17.1


