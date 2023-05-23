Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 849AEC7EE30
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 04:27:07 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.13897.1684816025161684613
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 May 2023 21:27:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=hif/uAvR;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-64d24136685so3132698b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 21:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684816024; x=1687408024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCRT41NSMlE72TGazjCLG6c9yJRC+hfMZzfMDkVt8ZY=;
        b=hif/uAvRnk3Uv/izms/VQoM/Sp5tGtpHOxfk4rvdnPT4Tdd7i8zE0B34+jw2qYS0dB
         0uAoVE5OTwGhz+mYXNPL/N6GTOlOF1njppRsaGzwjOTbMlJVhnB2KldrxRKtUiMUhHtS
         bgxQKptHfNwwLaMLUHfugqZdkxT0uPCaS290P60nYA/TeZCX3grKIa1RbfH6JMfipCSw
         WRmGmu/hwcIbzUQztwmM5MTydf6sGzNhYUTqPxFV27e9Ue1WeaBzt2BC+wfqID0g8cCt
         qaLB+gaqGuljqdMFFvTuCy2V6qo0ER5392X9GBt8BG1J8FKNxHs024bHo4yWgSCp71yS
         A3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684816024; x=1687408024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yCRT41NSMlE72TGazjCLG6c9yJRC+hfMZzfMDkVt8ZY=;
        b=UJfoqx6QQh7e58dLFF6nEYKZrsQhCIo0M1aOTVnCnnlkIDv7s+ysgqz0XkAGpvSUJK
         fbS2y30XZkgriCtomniQZPL6pNr/yI8ffXYaQKQM460H4TwDvqN+blUT1nXrvTSBwo93
         m+15ik8d1NjDV+R5Ljr/jCMdlNYjnVD65kBBiYEjLYHpeuLBS5/m7VuKXv4GMJT+ga4a
         pL0//9R9vFuzAfr6OWwdvP0iqAE2Mc3JOowRKvooevoFkOGPhwNHANZuLT7+95RoPr51
         RQRlRQHFtjwV7mQE6y0brtX9sp0n93RsqjZg/ku+8yyS1DNhZpBFiIRIEBvFUtx6/VsV
         GJNQ==
X-Gm-Message-State: AC+VfDyUz+ti4R2GyU4o8KprM8gPNf67E6Q2c0QRuekswWeTJUM+oMzl
	JFh4lmn60ITHxUBeptO7qCc9kia844M=
X-Google-Smtp-Source: ACHHUZ56LpxOWPfJfE2JmAfusjkQtGI8mJiKEF60/HFDV4hx/ji+P6FUJdB7Nk90n/3UZQv4dpJM1w==
X-Received: by 2002:a05:6a00:188c:b0:64d:421c:ae43 with SMTP id x12-20020a056a00188c00b0064d421cae43mr13220666pfh.11.1684816024226;
        Mon, 22 May 2023 21:27:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id n7-20020aa79047000000b0064d2c7ac49fsm4844332pfo.31.2023.05.22.21.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 21:27:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 07/11] dovecot: Do not install dovecot-config
Date: Mon, 22 May 2023 21:26:54 -0700
Message-Id: <20230523042658.4159559-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230523042658.4159559-1-raj.khem@gmail.com>
References: <20230523042658.4159559-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 04:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102722

This contains references to source directories used during build, it
will not be useful on target without really editing it properly to
reflect target rootfs install. it perhaps never was used thus far, it
would have failed otherwise.

Fixes
WARNING: dovecot-2.3.20-r0 do_package_qa: QA Issue: File /usr/lib/dovecot/dovecot-config in package dovecot contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/dovecot/dovecot_2.3.20.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.3.20.bb b/meta-networking/recipes-support/dovecot/dovecot_2.3.20.bb
index 7729bb4a8b..effde16a9c 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.3.20.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.3.20.bb
@@ -48,6 +48,7 @@ SYSTEMD_SERVICE:${PN} = "dovecot.service dovecot.socket"
 SYSTEMD_AUTO_ENABLE = "disable"
 
 do_install:append () {
+    rm -rf ${D}${libdir}/dovecot/dovecot-config
     install -d 755 ${D}/etc/dovecot
     touch 644 ${D}/etc/dovecot/dovecot.conf
     if [ "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}" ]; then
-- 
2.40.1


