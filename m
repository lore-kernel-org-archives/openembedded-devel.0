Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0363C77B7F
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 13:30:52 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.21829.1684243844756037636
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 May 2023 06:30:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=kd/rDQPr;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4f00d41df22so4419594e87.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 06:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684243843; x=1686835843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fKMF94Pb696ApGd6uu0Tgf4UilH/Hsa+1ytHvyuM0Yo=;
        b=kd/rDQPrvkvFCwW+52UUPQvfWSA2445dUQfaG32pehb/mqD2PbK9KctHW8orvQP/tj
         KYsbqHrylifBwsmvQ4sQphwa3kew+Jd2ZAeEaYtISrEOViJQtSWGNs/OkCRRhiDEGBOK
         qNQFjXhzZgS5XmBT2a+ljxGIy7xA2HIS37FKmi+DzrBnCNgBrcp05tI0qNajhStuDahJ
         qt/g6DPFBLcqHVSPLRczGfmPsm6AD+qxtpMgctENd421MRpvXm3sLKbbGIFT1F02222W
         PKBhUemAjU8E0HohlHmtYyEberlKxCn8v6TK6iLpRFmihuGcPi5yey2/g8KPS2sUFCs9
         Dbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684243843; x=1686835843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fKMF94Pb696ApGd6uu0Tgf4UilH/Hsa+1ytHvyuM0Yo=;
        b=XuYYlTAMVlz0pYu9TH+Q4F/p4QnCQej33zPs03r3sdhQWbOBEEC7gqmg4kkoZmfiP7
         kOahBY22j4taTCvmnA8iZn9mA0NRywz0EPLPAtjW48Y3u1iom8WZj0A3BvAUP0g4f8vi
         Fp3HVDNbvIT+xSDyFIOI+vOCodgm+G11sljAyvgoXunQmS8wRJbjIJotqdreqf5eIzIx
         EqYTTTtF93BJIFAXW+xt/TpYkMNtWqbGGGRh4nlNPnENHOB8pg1MslXu2Aes4A8qzdEg
         MxXvhbE/V0MQySBHenxIhF+rrAAJKVtRAMkzR7bnRZ2a0UWFVq4Gu2jHWvmDQ2OkKF9o
         vnPg==
X-Gm-Message-State: AC+VfDxkfYhRLTtxPuwoVuv7b1LYM3JmjTF8d7Y0hQt8JRsn0cmWgZy5
	ndBnHCQtkGkD5hkxAxuEz8wIcTXSY7c=
X-Google-Smtp-Source: ACHHUZ6M02GUY0jpmWfOXwleAfHNdvdvLMblZO33mH8XeoTSv32fmpULbYcJ4Oycx3NPUkklbvX4RA==
X-Received: by 2002:a2e:a4b3:0:b0:2a9:45fb:6331 with SMTP id g19-20020a2ea4b3000000b002a945fb6331mr8688781ljm.6.1684243842600;
        Tue, 16 May 2023 06:30:42 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com ([2a00:801:7ac:9fa0:5593:5e7e:494a:e2c8])
        by smtp.gmail.com with ESMTPSA id f9-20020a2e6a09000000b002acad2f2994sm3996338ljc.127.2023.05.16.06.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 06:30:42 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-oe] [PATCH] libusbgx: drop hard-coded /usr/bin,/etc
Date: Tue, 16 May 2023 15:30:52 +0200
Message-Id: <20230516133052.2071705-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 13:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102628

From: Ming Liu <liu.ming50@gmail.com>

Drop hard-coded /usr/bin,/etc from gadget-start.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta-oe/recipes-support/libusbgx/libusbgx_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
index 66a5a4071..7998b0c15 100644
--- a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
+++ b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
@@ -37,7 +37,9 @@ INITSCRIPT_PARAMS = "defaults"
 INHIBIT_UPDATERCD_BBCLASS = "${@bb.utils.contains('PACKAGECONFIG', 'examples', '1', '0', d)}"
 
 do_install:append() {
-    install -Dm 0755 ${WORKDIR}/gadget-start ${D}/${bindir}/gadget-start
+    install -Dm 0755 ${WORKDIR}/gadget-start ${D}${bindir}/gadget-start
+    sed -i -e 's,/usr/bin,${bindir},g' -e 's,/etc,${sysconfdir},g' ${D}${bindir}/gadget-start
+
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -Dm 0644 ${WORKDIR}/usbgx.service ${D}${systemd_system_unitdir}/usbgx.service
     fi
-- 
2.25.1


