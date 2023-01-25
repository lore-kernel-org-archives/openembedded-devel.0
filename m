Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B9E9C61DB3
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:31:46 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.44972.1674653497692269247
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:31:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Kg8ogcb0;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id u13-20020a4aa34d000000b004f5219f9424so3140844ool.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLALtPriLeZwTligxpdFR/dm3BJuYV+Mu4HKdi3HlZ8=;
        b=Kg8ogcb0KBVeS8iloWOrWwOFrLwEUNSH/wnYKSkHJ863MeFwFRqKHjkAh+q0mNF8uA
         XyuGeE87a2xV+iVZjR152tpbh0ZoeJmN3Hw9jf4Gn60i6k1PsPTxoHxkcJgVcpJquUB9
         0WySFPnX05EVVbSrj21Uk1Bpux3q4ws5LHMPgU6a1Xw7+RRatxwTpOLud7r6u669dLAW
         y8Bqv0zXknPlM0loTLLKS3DvIrloIUGdWgdQrbsvcZtsTuYAJZNQlN1BiMjOxTWVFiot
         DKBirmkgyCOWzYlrbUsdyHibyrHfIcxajrGxxbk/p9LVlaI2zpO/LuQ3gJ32CsU2OpW5
         8Xlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XLALtPriLeZwTligxpdFR/dm3BJuYV+Mu4HKdi3HlZ8=;
        b=7LJFjK77EFoJDVGNl1iYX9XvpuGcoKU6AlXAN7ip5RP4PzQsUa1FNhu4oI/leac2og
         zXxzC2e2/UG7Kt5Hqd4aj9rLkvMUsrF/dRPw+EyLHVRRfCab6CJstw1Ag0hKsRRC5u+Q
         8X8BcgVaN04a+32GqwqqvhU7p5bBCt6Ns8SnR8heOQm581zQUbg5NoQVrHjiC8i1/3mx
         hMAHqHa7QxnwVcLCNUNuo/e05QWQ0nEeDemTlJJDZYLlJgzFDaO/IzaUXPcMDj7IT6OX
         ulAYFZSNp47AyQQ9mfqh//anw+fb4amI3OKzNz4zPyHFHJO+Qbz5MT3OaT1ni4DZN67p
         23Lw==
X-Gm-Message-State: AFqh2krRIH/DHmiilhrHPjmYSBlKRSoSsPO9AFpIdfvXeiJyWexYGUZc
	y54C5PnbRctPdpukgw5XLiLhIZnjGtQ=
X-Google-Smtp-Source: AMrXdXsrKUTH1hYroLYlBDU/qQeqzRphacTMijZ14LF6q7DLM+tf7l5VsYpgvoVY2xfBywk5bUVIEA==
X-Received: by 2002:a4a:944a:0:b0:4e7:128c:f195 with SMTP id j10-20020a4a944a000000b004e7128cf195mr14106392ooi.8.1674653496807;
        Wed, 25 Jan 2023 05:31:36 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.31.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:31:36 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 11/41] ostree: fix selinux policy rebuild error on first deployment
Date: Wed, 25 Jan 2023 08:30:53 -0500
Message-Id: <14c44c099b94d407e87a2f9c554b2ac117bdbf63.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:31:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100746

From: Yi Zhao <yi.zhao@windriver.com>

Backport a patch to fix selinux policy rebuild error on first
deployment.
See: https://github.com/ostreedev/ostree/issues/2758

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 290166c46b6d7ae2474b754dd416bef45a0e7946)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...uild-selinux-policy-on-first-deploym.patch | 44 +++++++++++++++++++
 .../recipes-extended/ostree/ostree_2022.5.bb  |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-deploy-Don-t-rebuild-selinux-policy-on-first-deploym.patch

diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-deploy-Don-t-rebuild-selinux-policy-on-first-deploym.patch b/meta-oe/recipes-extended/ostree/ostree/0001-deploy-Don-t-rebuild-selinux-policy-on-first-deploym.patch
new file mode 100644
index 0000000000..248dcf49b8
--- /dev/null
+++ b/meta-oe/recipes-extended/ostree/ostree/0001-deploy-Don-t-rebuild-selinux-policy-on-first-deploym.patch
@@ -0,0 +1,44 @@
+From bd325061dc9585886f7e60e58d9fc0c8b37e71db Mon Sep 17 00:00:00 2001
+From: Colin Walters <walters@verbum.org>
+Date: Wed, 9 Nov 2022 11:18:36 -0500
+Subject: [PATCH] deploy: Don't rebuild selinux policy on first deployment
+
+Basically, it should not be necessary - the policy should be
+up-to-date.  We don't want to force on continual policy rebuilds.
+
+Even trying to run bwrap when we're *not* in a booted
+root can cause failures in nested containerization scenarios.
+
+Closes: https://github.com/ostreedev/ostree/issues/2758
+
+Upstream-Status: Backport
+[https://github.com/ostreedev/ostree/commit/bd325061dc9585886f7e60e58d9fc0c8b37e71db]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/libostree/ostree-sysroot-deploy.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/libostree/ostree-sysroot-deploy.c b/src/libostree/ostree-sysroot-deploy.c
+index f27ae0e1..26b07080 100644
+--- a/src/libostree/ostree-sysroot-deploy.c
++++ b/src/libostree/ostree-sysroot-deploy.c
+@@ -2987,12 +2987,12 @@ sysroot_finalize_deployment (OstreeSysroot     *self,
+       if (!merge_configuration_from (self, merge_deployment, deployment, deployment_dfd,
+                                      cancellable, error))
+         return FALSE;
+-    }
+ 
+ #ifdef HAVE_SELINUX
+-  if (!sysroot_finalize_selinux_policy(deployment_dfd, error))
+-    return FALSE;
++      if (!sysroot_finalize_selinux_policy (deployment_dfd, error))
++        return FALSE;
+ #endif /* HAVE_SELINUX */
++    }
+ 
+   const char *osdeploypath = glnx_strjoina ("ostree/deploy/", ostree_deployment_get_osname (deployment));
+   glnx_autofd int os_deploy_dfd = -1;
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/ostree/ostree_2022.5.bb b/meta-oe/recipes-extended/ostree/ostree_2022.5.bb
index a21c473f0a..7838537a42 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2022.5.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2022.5.bb
@@ -22,6 +22,7 @@ SRC_URI = " \
     file://0001-Remove-unused-linux-fs.h-includes.patch \
     file://0001-libostree-Remove-including-sys-mount.h.patch \
     file://0001-s390x-se-luks-gencpio-There-is-no-bashism.patch \
+    file://0001-deploy-Don-t-rebuild-selinux-policy-on-first-deploym.patch \
     file://run-ptest \
 "
 SRCREV = "15740d042c9c5258a1c082b5e228cf6f115edbb0"
-- 
2.25.1


