Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DAEDC6FA8D
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 23:41:26 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web12.2745.1662594079248947157
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=can7ah1A;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 a5-20020a17090aa50500b002008eeb040eso2046366pjq.1
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=0DsEnUWWCYY0ZxAu2gUI+Xn/R04PTWXVPIv+ikW8SKk=;
        b=can7ah1Aq11jaevHu2kkZ4jsUIZQKLH9ycjS+PCMHltEoe4I5rhmYiJb76c8UgvJQH
         9OJD4x1t0CoyFqXwPfqpRBpczNgtuXIqpR6WlXLsVOnm4iUManRAjSdEuLVslzLxus00
         yESlAHu2MtMTxB4esQ/hBOuucL0sXwpGsz5hHdirWmvNq/IHStGmHiKXTodHxsBtlzQX
         kNk9KwSgbB9snkc1xRpugrRe5sRR31vw8pcUDHEDmsLogPPo2zCQzcmUrT12UE+Sq3K/
         Sqb6QcY5RJBNNl4vYlSnBrfG8aijxlR5zMOLQHBWD7jHr55OiFe8ly7sQfra9bWmK2EY
         elEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=0DsEnUWWCYY0ZxAu2gUI+Xn/R04PTWXVPIv+ikW8SKk=;
        b=nHWlF39k65jyaKK306nInLo7wQ3hu4ZohDS2QBZt6Fh0HjJCALZjGG/vyNkEFF4j0+
         FI4g4w5RMNpxsfIuitC1rvQPO7e4xq/q/6OW5Dl6YuR7wm6edgb7Tolxl63mYWWELpst
         unjFocunzR4sMZsSb6tgOwADGSKAuvndWGAEONy+wOFqdgdtH2vbRyBpyDZbqr2kwJcZ
         vmlo7vCEb2rb1aqPUNX0uSJ852k55jFUsBzpNEBz7SezAVI20BvO2HFzq/YLTXssfEEp
         2iSupDBYTb0IqV6A2Zp+L6HvmhGGP5GlQ2wGpz0vdwBMaw1X1umFE/zY+VaYsTnTzTv0
         jbkg==
X-Gm-Message-State: ACgBeo0bdGYs/hqNJOV9nFWWjk2yKa3KeQbj1G2addycHakR4RUqaQDx
	5da4P4p7NyMXpgG00Iw1h2y4e3Vp+wgdsw==
X-Google-Smtp-Source: 
 AA6agR6kVA/b40vJBX/w9tUE6HF6e/12wQtmw4lOz51PEK1YaLWvy1VK7zHv/e4aJu04rlnJ3+1euw==
X-Received: by 2002:a17:90a:c402:b0:1f7:75ce:1206 with SMTP id
 i2-20020a17090ac40200b001f775ce1206mr1030654pjt.68.1662594078519;
        Wed, 07 Sep 2022 16:41:18 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1761])
        by smtp.gmail.com with ESMTPSA id
 ij5-20020a170902ab4500b0016c5306917fsm10276495plb.53.2022.09.07.16.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 16:41:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 17/22] libesmtp: Enable gnu strerror_r on
 glibc
Date: Wed,  7 Sep 2022 16:40:57 -0700
Message-Id: <20220907234102.3312797-17-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220907234102.3312797-1-raj.khem@gmail.com>
References: <20220907234102.3312797-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Sep 2022 23:41:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98707

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb b/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb
index 164c8c2612..3d0764a3b9 100644
--- a/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb
+++ b/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb
@@ -32,5 +32,9 @@ EXTRA_OEMESON = " \
 
 CFLAGS += "-D_GNU_SOURCE"
 
+do_configure:prepend:libc-glibc() {
+    sed -i -e "s/conf.set('HAVE_WORKING_STRERROR_R', 0)/conf.set('HAVE_WORKING_STRERROR_R', 1)/g" ${S}/meson.build
+}
+
 FILES:${PN} = "${libdir}/lib*${SOLIBS} \
                ${libdir}/esmtp-plugins-6.2.0/*${SOLIBSDEV}"
-- 
2.37.3


