Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D93B8C6FD1D
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 23:36:54 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.117873.1680651411422422025
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Apr 2023 16:36:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=S42QYyuZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id r11so34429066wrr.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Apr 2023 16:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680651410; x=1683243410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zETdAoMeu1XL1kD0RebsRAX116vZNnSMMdTy0u+Hchk=;
        b=S42QYyuZytV+rKkTc0MPEeo8s4TOb5almo/F9Jh/xm3eA6sBrmjJ2ZpVij3AcJZPM/
         x8FydmbjgSmaVFLgip0qbc3pJUMFkRCuD4Ap6aOmczVq1uQ4L0vqnHCqujpFdB9tlCj3
         twVuFRZJq1s16zWTE328YzznF+vcs5Y8+FV1vhGH2OTpNSHrSCdXojAq8oT0xXW5YudR
         xQJx3dcnxwA18ptGbIdOxmHIYP4ygyTI2DJgk589sWVqgsCydDBg0mjTsphImz0dWCCp
         MPN2gXW44GLFqJr+hJ6Egd0lgevq/8OlF32hf5bfP+UDIG/yn/pMpTptEJZkE00pqmp0
         mAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680651410; x=1683243410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zETdAoMeu1XL1kD0RebsRAX116vZNnSMMdTy0u+Hchk=;
        b=L03tM4VPl0Kd06blFkyF4KofQcMDHxTYFN7s9rOb4fRWPhDLK238ML6gMnnMLrhKgJ
         LzhvJ5cJ4QbY3CLfXwl4z0fBwH10V4+HuoqIazAKttaJabaxXer4k86jzfsy2l04zQmf
         xAZc4zZr8aGplnc36tWogo3gA7osZppN0wNrUmjXOKHAXG/6RxZjpX7OllJcdp0G1AMC
         JdO3yy0S30h9mqWXc1wW0bjZCaP3/CIHRQ0Y40Noff3jv4nEylhJQz8nixMlwK3agMaT
         KTU9M5b3NFv70WzwtYAVxPIfIRm34eiFk53IuOFCZuakAwZGR97UQPZJMAAONJm2F50j
         So4Q==
X-Gm-Message-State: AAQBX9c14WFkUnN94M3kAcnETlClodfrcNHFQDmI5cdaAh65i8sYo2hR
	EYFC8PVJC5C1hfNB3520y+ntvZrMURI=
X-Google-Smtp-Source: AKy350ZbgEwS4dfV5Fa/wYRjBH0oMyQhMGxcaW0DaWoG823e878/E3bgmepu9jg23WYSAq6+g5uC+g==
X-Received: by 2002:a5d:510c:0:b0:2d7:627b:200 with SMTP id s12-20020a5d510c000000b002d7627b0200mr3112859wrt.64.1680651409586;
        Tue, 04 Apr 2023 16:36:49 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id i12-20020a5d55cc000000b002c3f81c51b6sm13393251wrw.90.2023.04.04.16.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 16:36:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] zsh: fix installed-vs-shipped with multilib
Date: Wed,  5 Apr 2023 01:36:40 +0200
Message-Id: <20230404233640.3074570-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Apr 2023 23:36:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101952

* fixes:
lib32-zsh-5.8: lib32-zsh: Files/directories were installed but not shipped in any package:
  /usr/share/lib32-zsh
  /usr/share/lib32-zsh/5.8
  /usr/share/lib32-zsh/site-functions
  /usr/share/lib32-zsh/5.8/functions
  /usr/share/lib32-zsh/5.8/functions/_selinux_users
... 1000+ lines ...
  /usr/share/lib32-zsh/5.8/functions/VCS_INFO_bydir_detect
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
lib32-zsh: 1116 installed and not shipped files. [installed-vs-shipped]

* they will clash if someone is trying to install both zsh
  and lib32-zsh, but it's not very likely as nobody sane
  was building lib32-zsh with 1000+ line warning regularly

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-shells/zsh/zsh_5.8.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-shells/zsh/zsh_5.8.bb b/meta-oe/recipes-shells/zsh/zsh_5.8.bb
index b023e8d297..7602ff9f64 100644
--- a/meta-oe/recipes-shells/zsh/zsh_5.8.bb
+++ b/meta-oe/recipes-shells/zsh/zsh_5.8.bb
@@ -22,8 +22,8 @@ inherit autotools-brokensep gettext update-alternatives manpages
 EXTRA_OECONF = " \
     --bindir=${base_bindir} \
     --enable-etcdir=${sysconfdir} \
-    --enable-fndir=${datadir}/${PN}/${PV}/functions \
-    --enable-site-fndir=${datadir}/${PN}/site-functions \
+    --enable-fndir=${datadir}/${BPN}/${PV}/functions \
+    --enable-site-fndir=${datadir}/${BPN}/site-functions \
     --with-term-lib='ncursesw ncurses' \
     --with-tcsetpgrp \
     --enable-cap \
-- 
2.40.0


