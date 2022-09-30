Return-Path: <mathieu.dubois-briand@hyprua.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C18DC433FE
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 10:18:28 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.3971.1664533097903578107
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Sep 2022 03:18:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hyprua-org.20210112.gappssmtp.com header.s=20210112
 header.b=loVi/9y1;
 spf=none, err=SPF record not found (domain: hyprua.org, ip: 209.85.128.50,
 mailfrom: mathieu.dubois-briand@hyprua.org)
Received: by mail-wm1-f50.google.com with SMTP id
 130-20020a1c0288000000b003b494ffc00bso4219700wmc.0
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Sep 2022 03:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hyprua-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=SVmdCiuTJngr8OMvWgtoe5dtbLGr6ociTpBqrdg0/+Y=;
        b=loVi/9y1cY8vhPBhpJ85bAwYiiZ3Kx1V2OT/686qn7p/QXlq9wTtWgRjyCqZPfKa/9
         ikQ45DtiF96SIPG5Joe8S+srq87rFKrKpqcIEj/235vwRjFl3tmbMgKcg3BKkuR+EVc8
         FIwMgDlh7/URf38aWWQxWvlMzOFhwR4v9g92tFHtDuRsJQeMuT/5B4W99rXn1+2nofFh
         n9mPfgR3ya1+sj5RCJYW8AoAhLG3Ibod6Bbo7RQLiukn/Dr9LHXGyceA2jGkQdlsImCL
         RAbU3h7dCpOaiJQLC7Ef8oHMh5aALL2RBijg7qSD7/5wUtlMK37YSHjMkEFQzIWz1Dkw
         iyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=SVmdCiuTJngr8OMvWgtoe5dtbLGr6ociTpBqrdg0/+Y=;
        b=cDrExcM0DOOQMZjJ8J7auafS22Q/63YMBDy1hjYm7qM5eY5PA7mIFNqjwkm8iEwR6v
         SfKuX1D3ab/6V6t5Cw3SXOJ2O2jLUrNLihPzzHDiTtoE8+CvoT3UlXU31hHNWjZ/yyqx
         pDq79BCToGfhMffkY2brVzN5fq6F8UKQg8MGPuVMx8ZFasMMYHoxIzVgGdlYE3Q7onev
         MefS0YfiZpGMIu6WdTtfwfBMLtObWJIKIwTSYVJHQehmRvoGaSpX92cy6urLVtbToj8P
         1zBYQuqkFIbomPb85jLuQh7C0xyt+3/yVsXn4rvzaYC4LYj3C6CuuFuK8/8bulHxFBbN
         3Qug==
X-Gm-Message-State: ACrzQf3QHNxEpzmdFy9QV47dLKWUnN6BiyzL8PSdrwM16+lO0+Xpdt+q
	eIu+KWBxw03NEQ3h6bTZsKMkHjXyfdzE05SdrpA=
X-Google-Smtp-Source: 
 AMsMyM4MSStdolomBsCh+bFrluqUvCwTMnSlSba4N05Ckz7AihdjXr3uPnvPmspbswEh05+sTrrFLg==
X-Received: by 2002:a05:600c:3d8a:b0:3b4:a4e1:8661 with SMTP id
 bi10-20020a05600c3d8a00b003b4a4e18661mr5382206wmb.30.1664533096092;
        Fri, 30 Sep 2022 03:18:16 -0700 (PDT)
Received: from WIPC21110265.. ([2a04:cec0:1074:c7f5:a030:e974:fd06:787c])
        by smtp.gmail.com with ESMTPSA id
 l18-20020a1ced12000000b003b341a2cfadsm1702311wmh.17.2022.09.30.03.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 03:18:15 -0700 (PDT)
From: Mathieu Dubois-Briand <mathieu.dubois-briand@hyprua.org>
X-Google-Original-From: Mathieu Dubois-Briand <mbriand@witekio.com>
To: openembedded-devel@lists.openembedded.org
Cc: Mathieu Dubois-Briand <mbriand@witekio.com>
Subject: [PATCH] networkmanager: Update to 1.22.16
Date: Fri, 30 Sep 2022 12:18:00 +0200
Message-Id: <20220930101800.4010254-1-mbriand@witekio.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <17199BE6DFF1463E.8075@lists.openembedded.org>
References: <17199BE6DFF1463E.8075@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Sep 2022 10:18:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99022

Update network manager stable branch to last version, allowing to fix
CVE-2020-10754.
---
 .../{networkmanager_1.22.10.bb => networkmanager_1.22.16.bb}   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.22.10.bb => networkmanager_1.22.16.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.10.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.16.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.10.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.16.bb
index 33a2b7c0ce93..a28372dd1f9e 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.10.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.16.bb
@@ -33,11 +33,12 @@ SRC_URI_append_libc-musl = " \
     file://musl/0003-Fix-build-with-musl-for-n-dhcp4.patch \
     file://musl/0004-Fix-build-with-musl-systemd-specific.patch \
 "
-SRC_URI[sha256sum] = "2b29ccc1531ba7ebba95a97f40c22b963838e8b6833745efe8e6fb71fd8fca77"
+SRC_URI[sha256sum] = "377aa053752eaa304b72c9906f9efcd9fbd5f7f6cb4cd4ad72425a68982cffc6"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
 EXTRA_OECONF = " \
+    --disable-firewalld-zone \
     --disable-ifcfg-rh \
     --disable-more-warnings \
     --with-iptables=${sbindir}/iptables \
-- 
2.34.1


