Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09654C4332F
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 22:26:58 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.913.1665613615603224561
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Oct 2022 15:26:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NOQGKqzM;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id a6-20020a17090abe0600b0020d7c0c6650so3303756pjs.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Oct 2022 15:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ci06OilwmddGahY1JxfgcT1hMchgVRUNopBMXSAig6E=;
        b=NOQGKqzMJt71fJlMCrKzTL4P7z6sspwz9GU1y/caa4naxy8zUmbrpncDeimzf67Ay5
         ciefwDv9qMrmz8InYcvuOflcycwRYKiGmWxNlfIS+D8bh8D++x7+AdFz8y5LXSpl3OcY
         vj/uRlQLu8EQLc1o+kQIT7gw1Fpg8R/9zKMbMMxResASQwAe/uEd8DhSQB64r3ou+yEL
         A6CHvnMN3U2NRVR+6j7bU5EjI/HHQwxY7LB8+cyYRfdEzpoUzz4yUOx9nnMEgBEJLrAU
         jPhzSZKWwgUROQtWkYCkoys7nupjhriMJ4qJwItoagCJzGOxnU+2FUCpEa2nNNri4gl8
         sBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ci06OilwmddGahY1JxfgcT1hMchgVRUNopBMXSAig6E=;
        b=FdAv1lQxS2tFQKyRq8tK/2yp556d3jaDHIe4qNYhho6r3ToW1x2cIf9cUHTx+AMeg/
         +YpwhI1cRhoRSfOzElRecqdW3o8eunm7SWbgrOB9O2fZhi8dbmdClhwuSKnedG42BqAi
         sAMdpX94JZ4nATb6TDfrvzyELzU9wXLYV5TmRdmohTFql+raQXMUdVLsvUair3tU9xIe
         a+7k8burth1u6whzfJDPrimZvOPoKQbERCXK6bGY8Hd4oHfAzCuAamptUHTQk/5am/Js
         WOwdTc3PHmTonhYRr/VIYRcmgvIw+ovdOz+G0bnHUEmUSQt6fecoaB/uVtUcHN/YYplF
         LUog==
X-Gm-Message-State: ACrzQf0W4jDX+cALrUiYikGVwpzKdb73dcCRSugF7maCHXQGiHuul4xm
	s5yqQBK7RIdoFzISgFK0p6qMBnvnauo=
X-Google-Smtp-Source: AMsMyM4SkahFFItAYuojAH1YNXyLMq+mYjfyClBD/OOmXEoVqyK5ANEt5UC39baUCQ3Bnu8OGGZ9AQ==
X-Received: by 2002:a17:902:b402:b0:179:e5b0:96d3 with SMTP id x2-20020a170902b40200b00179e5b096d3mr31863247plr.142.1665613614844;
        Wed, 12 Oct 2022 15:26:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::32cd])
        by smtp.gmail.com with ESMTPSA id kb8-20020a17090ae7c800b001df264610c4sm5358011pjb.0.2022.10.12.15.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 15:26:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hao Jiang <jianghao@google.com>
Subject: [meta-networking][PATCH] mctp: install the .target files
Date: Wed, 12 Oct 2022 15:26:52 -0700
Message-Id: <20221012222652.445918-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Oct 2022 22:26:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99150

From: Hao Jiang <jianghao@google.com>

Need the targets file to enable the mctpd.service on systemd.

Signed-off-by: Hao Jiang <jianghao@google.com>
Change-Id: I8d48d3767760dc1f34ae7e1266600d350ac93281
---
 meta-networking/recipes-support/mctp/mctp_git.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/mctp/mctp_git.bb b/meta-networking/recipes-support/mctp/mctp_git.bb
index 516f3e2d9e..9e97a6a60a 100644
--- a/meta-networking/recipes-support/mctp/mctp_git.bb
+++ b/meta-networking/recipes-support/mctp/mctp_git.bb
@@ -22,13 +22,16 @@ PACKAGECONFIG ??= " \
 # mctpd will only be built if pkg-config detects libsystemd; in which case
 # we'll want to declare the dep and install the service.
 PACKAGECONFIG[systemd] = ",,systemd,libsystemd"
-SYSTEMD_SERVICE:${PN} = "mctpd.service"
+SYSTEMD_SERVICE:${PN} = "mctpd.service mctp.target mctp-local.target"
+SYSTEMD_AUTO_ENABLE_${PN} = "enable"
 
 do_install:append () {
     if ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${systemd_system_unitdir}
         install -m 0644 ${S}/conf/mctpd.service \
                 ${D}${systemd_system_unitdir}/mctpd.service
+        install -m 0644 ${S}/conf/*.target \
+                ${D}${systemd_system_unitdir}/
         install -d ${D}${datadir}/dbus-1/system.d
         install -m 0644 ${S}/conf/mctpd-dbus.conf \
                 ${D}${datadir}/dbus-1/system.d/mctpd.conf
-- 
2.38.0


