Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AFE0C636CB
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 13:02:40 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.101357.1674824557644002616
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Jan 2023 05:02:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Sxe3R8g7;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id n7so4917736wrx.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Jan 2023 05:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/HlmNebWrsiIBTGHAB5IdLytNWLjfXng1qpeRKDQGAs=;
        b=Sxe3R8g7vi7rVwke/PadfOM+Rwu0ROG1wqdp0xcEBEqr/wJIE5RuHZ3hDdNc0rpbCl
         5gj6cogm/UZWHf7CIi+mcpubeiX9m6Vj04NKjCWhex9o78yUG66/Ybm3ZCLUVaPXYGrS
         QNt1SyibsGisTXBJcJwzo/aJrkmJqZXG8IgZQGSKIUIoi4JSWAjBLA+fVhDttniJpSAj
         Wu8vUC74Ud2SoKFT3NCsEsNSpYyBfasJ6rNEGBDJKit7qLR8OZ07hGyrnBjqbdGlNc76
         HIeZMWmlvE26Xgo5SCkWfs8b52WqLLz+viSlgMSUsiR0XZo0jV2prgHzh3KIQvzbANQM
         ab3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/HlmNebWrsiIBTGHAB5IdLytNWLjfXng1qpeRKDQGAs=;
        b=0mQ4jVgze1rDR4bQ65m8SUq4e6AOxEUGdouxWqM50z91Pl1DxC28qWdlksJ8gXyoas
         h5T05TYzwvoF28cmeoTAIKqh3mALqdyyQGaexdbhUy84cCSmJhjtiZVxgYdw5ovrsTiG
         tYa7Kazwpt03Ln5Yj9ElkO9v1KgeB7F7h7X7/V3CLsBekVSuxTCImiS+kwmecc1z5z67
         9KKQj0VR3mbihsv/PGXDakXy8KdXQ1dhx7M2EZC/0iJeWVQgYd1mmZ0Zsh/lPJlmLaem
         Daor0FKOtUuXxc7SpowYsD0MEUrnq9IYhEbCMAx6LhDnE0S1myVUbcThB85R/f7xOyOt
         olzA==
X-Gm-Message-State: AFqh2koauinnydp7ZMoBpbUFVfscsrkMNU0t8dZ6n19L7xITrKRrtNLQ
	HoTc7V5uNLLjafQDEltsbQyyKLYjdow=
X-Google-Smtp-Source: AMrXdXtP9LfS5uph9Vy6ygEuy3xq/RoaQqKRIcTlzgTxSJ9l8XKAhCInvlPbNXe7zLk0Pk6hojt2Fw==
X-Received: by 2002:a05:6000:388:b0:2bc:7ec3:8b2 with SMTP id u8-20020a056000038800b002bc7ec308b2mr38095156wrf.68.1674824555787;
        Fri, 27 Jan 2023 05:02:35 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id s5-20020a5d5105000000b002bdfcd8c77csm3960669wrt.101.2023.01.27.05.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 05:02:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 6/6] .patch: fix Signed-off-by formatting issues reported by patchreview tool from oe-core
Date: Fri, 27 Jan 2023 14:02:25 +0100
Message-Id: <20230127130225.1280161-6-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127130225.1280161-1-Martin.Jansa@gmail.com>
References: <20230127130225.1280161-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jan 2023 13:02:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100821

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-daemons/proftpd/files/build_fixup.patch | 2 +-
 meta-networking/recipes-netkit/netkit-rpc/netkit-rpc/gcc4.patch | 2 +-
 .../netkit-rsh/netkit-rsh/fixup_wait3_api_change.patch          | 2 +-
 .../netkit-rsh/netkit-rsh/rsh-redone_link_order_file.patch      | 2 +-
 meta-oe/recipes-kernel/ipmiutil/ipmiutil/fix_systemd_path.patch | 2 +-
 .../telepathy-python_fix_for_automake_1.12.patch                | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch b/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch
index d888dd8263..8126b3619a 100644
--- a/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch
+++ b/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch
@@ -6,7 +6,7 @@ make, move-pidfile-to-var-run, move-runfile-to-var-run
 move pidfile to /var/run
 redefine PR_RUN_DIR as ${localstatedir}/run
 
-Signed-off-By: Armin Kuster <akuster808@gmail.com>
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
 
 
 diff --git a/Make.rules.in b/Make.rules.in
diff --git a/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc/gcc4.patch b/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc/gcc4.patch
index 715ddb7b68..089156a7ae 100644
--- a/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc/gcc4.patch
+++ b/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc/gcc4.patch
@@ -4,7 +4,7 @@ https://github.com/openembedded/openembedded/tree/master/recipes/netkit-rpc/netk
 
 Upstream-Status: Backported
 
-Signed-off-By: Armin Kuster <akuster808@gmail.com>
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
 
 --- netkit-rpc-0.17/rpcgen/rpc_cout.c~gcc4
 +++ netkit-rpc-0.17/rpcgen/rpc_cout.c
diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/fixup_wait3_api_change.patch b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/fixup_wait3_api_change.patch
index cd6df62fb3..c6e2e60624 100644
--- a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/fixup_wait3_api_change.patch
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/fixup_wait3_api_change.patch
@@ -8,7 +8,7 @@ https://sourceware.org/ml/libc-alpha/2016-02/msg00342.html
 
 Upstream-Status: Inappropriate [ no upstream maintaner ]
 
-Signed-off-by Armin Kuster <akuster@mvista.com>
+Signed-off-by: Armin Kuster <akuster@mvista.com>
 
 Index: netkit-rsh-0.17/rlogin/rlogin.c
 ===================================================================
diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rsh-redone_link_order_file.patch b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rsh-redone_link_order_file.patch
index c12ee9b465..ab0b9b64bc 100644
--- a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rsh-redone_link_order_file.patch
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rsh-redone_link_order_file.patch
@@ -8,7 +8,7 @@ Most distos have there own verison of this fix. This was derived by
 -- Colin Watson <cjwatson@ubuntu.com>  Tue, 13 Sep 2011 10:07:08 +0100
 
 
-signed-off-by: Armin Kuster <akuster808@gmail.com>
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
 
 Index: netkit-rsh-0.17/rsh/Makefile
 ===================================================================
diff --git a/meta-oe/recipes-kernel/ipmiutil/ipmiutil/fix_systemd_path.patch b/meta-oe/recipes-kernel/ipmiutil/ipmiutil/fix_systemd_path.patch
index dd9230dd4e..d47e086c46 100644
--- a/meta-oe/recipes-kernel/ipmiutil/ipmiutil/fix_systemd_path.patch
+++ b/meta-oe/recipes-kernel/ipmiutil/ipmiutil/fix_systemd_path.patch
@@ -4,7 +4,7 @@ The configure probes the host for systemd path information.
 
 Upstream-Status: Inappropriate [Embedded]
 
-Signed-off-By: Armin Kuster <akuster@mvista.com>
+Signed-off-by: Armin Kuster <akuster@mvista.com>
 
 Index: ipmiutil-3.0.5/configure.ac
 ===================================================================
diff --git a/meta-python/recipes-connectivity/telepathy/telepathy-python3-0.15.19/telepathy-python_fix_for_automake_1.12.patch b/meta-python/recipes-connectivity/telepathy/telepathy-python3-0.15.19/telepathy-python_fix_for_automake_1.12.patch
index f613fdce4d..0498f3ddd0 100644
--- a/meta-python/recipes-connectivity/telepathy/telepathy-python3-0.15.19/telepathy-python_fix_for_automake_1.12.patch
+++ b/meta-python/recipes-connectivity/telepathy/telepathy-python3-0.15.19/telepathy-python_fix_for_automake_1.12.patch
@@ -9,7 +9,7 @@ of warning-errors.
 | make[1]: Leaving directory `/srv/home/nitin/builds2/build0/tmp/work/i586-poky-linux/telepathy-python-0.15.19-r4/telepathy-python-0.15.19/src'
 | make: *** [all-recursive] Error 1
 
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 2012/07/10
 Index: telepathy-python-0.15.19/src/Makefile.am
 ===================================================================
-- 
2.39.1


