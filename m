Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF0CC46467
	for <webhook@archiver.kernel.org>; Mon,  2 Jan 2023 22:42:47 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.49906.1672699361408821377
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jan 2023 14:42:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YCEO4XtP;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id d17so7842691wrs.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Jan 2023 14:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=USX328d9AE0UD83SdSN8JIEAzU3zgk2ms34owhLj3Eo=;
        b=YCEO4XtPQGxemk0aoVYVyKJqmaKBIFfiKYrRPqImUjzuTFyFlocwIDgvP+47qPOYtQ
         pZBS/iCUvuBXO9JvKzvadPkl009mbpdBfyAep4Rv/TWbfH4FTid1ADcb4lvBENV/qD3k
         3GgwcvoecbQ7SFtBfJUi+8HoEwZB2umbBCCBDjC+wQdW0g6tp5vMl1dG8wni16Dmd5UF
         DilN2Majdsgj8XlMKHaHKHmpgsIWIb3XqypfyszMcAdkdJg2Fh5GVkh1Yf3Mtb34+n3J
         SHdNgfiGe4eZwEy4QUdRKSoybhZxfVf9MZdP6cN25nqSIc4CfR8wMoNIh808Ghw5f42G
         3T9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=USX328d9AE0UD83SdSN8JIEAzU3zgk2ms34owhLj3Eo=;
        b=hWYuMg/UDddr8DYXfUsgcSYpg3QaHNEs/swrMDOuS+BNeGruyPODVmAiSbg9myMZOX
         xfg1Z5jww6oAxyn8Exn/0Z6+Qk0E2sK6qmRls0koMhtPCV5lmcV8jNvm42GPZlBzWoLj
         xv3mj7FQAJQaWzFZP4GwA+oDhkTdyKICLonhrNEZgarC1Up7ux25XLlVZchCCzGtUp6h
         1dzipcR/4n2aE0IkNuqDDcGdXA5JCogUw78vs6YKkmli9x3Vq/uNVxTo0zy1YG83mNUp
         ErJVyvMa7XP7RhTnFjGwoTmq/Ol6MItw7s3cCaGiciebgVF7zeyYn3VkiqsYfu2XlGjm
         nYGg==
X-Gm-Message-State: AFqh2kodXZVZNPc6U1Fr9GlHDye2pgKpW8RkM9TbkQr6NaJe1awueI4A
	VkuMGZqZKEoghOFA7SdEGjeVngHhq9k=
X-Google-Smtp-Source: AMrXdXuANsbweVlyTt/woa/+y2KeL77d8Sr9bNyeu2Bn8yuWPmpclQ8WXcS42eZ9J39m/ezOlaK4ow==
X-Received: by 2002:a05:6000:18f:b0:29c:63ac:ec34 with SMTP id p15-20020a056000018f00b0029c63acec34mr1709885wrx.4.1672699359483;
        Mon, 02 Jan 2023 14:42:39 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id f8-20020adff8c8000000b00282194eaf7bsm19605859wrq.71.2023.01.02.14.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 14:42:38 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH 1/4] ostree: Use systemd_system_unitdir for systemd units
Date: Mon,  2 Jan 2023 22:42:31 +0000
Message-Id: <20230102224234.287772-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Jan 2023 22:42:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100339

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta-oe/recipes-extended/ostree/ostree_2022.7.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2022.7.bb b/meta-oe/recipes-extended/ostree/ostree_2022.7.bb
index 771b17b34b35..0a56ad7c8369 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2022.7.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2022.7.bb
@@ -84,7 +84,7 @@ PACKAGECONFIG[selinux] = "--with-selinux, --without-selinux, libselinux, bubblew
 PACKAGECONFIG[smack] = "--with-smack, --without-smack, smack"
 PACKAGECONFIG[soup] = "--with-soup, --without-soup --disable-glibtest, libsoup-2.4"
 PACKAGECONFIG[static] = ""
-PACKAGECONFIG[systemd] = "--with-libsystemd --with-systemdsystemunitdir=${systemd_unitdir}/system, --without-libsystemd, systemd"
+PACKAGECONFIG[systemd] = "--with-libsystemd --with-systemdsystemunitdir=${systemd_system_unitdir}, --without-libsystemd, systemd"
 PACKAGECONFIG[trivial-httpd-cmdline] = "--enable-trivial-httpd-cmdline, --disable-trivial-httpd-cmdline"
 
 EXTRA_OECONF = " \
@@ -139,7 +139,7 @@ PACKAGE_BEFORE_PN = " \
 FILES:${PN} += " \
     ${nonarch_libdir}/${BPN} \
     ${nonarch_libdir}/tmpfiles.d \
-    ${systemd_unitdir}/system \
+    ${systemd_system_unitdir} \
     ${systemd_unitdir}/system-generators \
 "
 FILES:${PN}-dracut = " \
@@ -156,7 +156,7 @@ FILES:${PN}-mkinitcpio = " \
 "
 FILES:${PN}-switchroot = " \
     ${nonarch_libdir}/${BPN}/ostree-prepare-root \
-    ${systemd_unitdir}/system/ostree-prepare-root.service \
+    ${systemd_system_unitdir}/ostree-prepare-root.service \
 "
 FILES:${PN}-trivial-httpd = " \
     ${libexecdir}/libostree/ostree-trivial-httpd \
-- 
2.39.0


