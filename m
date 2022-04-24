Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E630DC47086
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:11 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web09.14273.1650769817410895740
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Apr 2022 20:10:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mbdn3xlY;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d15so5116442plh.2
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Apr 2022 20:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZHcQiTqXlYcMin9/KxM7R45cIEapfcEgi7LoTaqyDOo=;
        b=mbdn3xlYfhPVY8k8KVrBJeG5LshYMn0O5ocFwO6T6eqakUAASsiEDkBctjKS1aU2BZ
         ktPPfoXjHHzHISTZ/cFlBkki45QWO+qFLx08Cv+keBTNVEfLDyqnmsfRYoYnScjpbSNU
         5JxgwL/h2I/TvngRL2XHIo2PL/+WuvvzkWh/JAIOcrOxTd7v0TyOj/vphbz+wW8pwMjM
         BhsAPkrkK+CMX/A2bjvkf9xsTkEMGHa+2tXXSeFzWVRlr4fwh51twknwlou7Qs1OADvC
         xc4QL87DAwbk3ivzLKTjUHJyB62Bw0wITZ3pWvanJu31Vp985WsGzKnX8KzxMBKiPnX1
         e6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZHcQiTqXlYcMin9/KxM7R45cIEapfcEgi7LoTaqyDOo=;
        b=KGef+XCV4OaWatjLFPM2VF2vs23KUv7h8L0JM/rsIXRZ+n1AH0QZizTyLtpk3MxZYs
         8y5E/unVfKBhLYFYOnHc/srcLFM5yuG8wYGU8dL2tQRwyZaeA8nkfRxME50sQYZmMZhg
         /29GhuC82KZJMhPmJyqUA+FsLytahNo35vUfCaxfXVExkk3Kc2lC7biMU4kjmpx4FNkv
         dMSkXiiYcTROY118CgfCvLGzHocyqpc8DXyuRnUOY9vgKUxQSCsLNjHolQN39v/1H+hn
         HmHNr6jbyqD4LtobHxWzfVljeyG7ypCCYUpaLC8BP79uMB55+FNs07u6Brl8GyJk65Np
         Qwlg==
X-Gm-Message-State: AOAM5337fufGQ7BG0Ih+VmK6ERVkXBtEunoJxEOHSOudJw4NOkl3eWng
	ZuGZ4ms/k84MdrF75hAeQe9m+GoyBiA28g==
X-Google-Smtp-Source: 
 ABdhPJwNIesaTwdbyUtrNXVSDadaLO91TXZ0Ax0ZM6jZv+3cwSqyf+BSd7Ev0SJ0Vr9LAuWN+JYhug==
X-Received: by 2002:a17:902:b189:b0:14d:6f87:7c25 with SMTP id
 s9-20020a170902b18900b0014d6f877c25mr12023127plr.31.1650769816755;
        Sat, 23 Apr 2022 20:10:16 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 q13-20020a17090a2e0d00b001cd4989feebsm10630987pjd.55.2022.04.23.20.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 20:10:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 12/12] ufw: Fix build with usrmerge distro
 feature
Date: Sat, 23 Apr 2022 20:10:04 -0700
Message-Id: <20220424031004.3209576-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220424031004.3209576-1-raj.khem@gmail.com>
References: <20220424031004.3209576-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96749

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb b/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
index 70216a85e3..6dca784bf4 100644
--- a/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
+++ b/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
@@ -38,6 +38,13 @@ RRECOMMENDS:${PN} = " \
                      kernel-module-nf-recent \
 "
 
+
+do_configure:prepend() {
+    if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','true','false',d)}; then
+        sed -i -e 's|/lib|${nonarch_base_libdir}|' ${S}/setup.py
+    fi
+}
+
 do_install:append() {
     install -d ${D}${systemd_unitdir}/system/
     install -m 0644 ${S}/doc/systemd.example ${D}${systemd_unitdir}/system/ufw.service
-- 
2.36.0


