Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1854EC67871
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 15:21:32 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.46796.1673191271117305859
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 07:21:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jnjt4fdU;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id e17-20020a9d7311000000b00678202573f1so3834424otk.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 07:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLALtPriLeZwTligxpdFR/dm3BJuYV+Mu4HKdi3HlZ8=;
        b=jnjt4fdUrAidrGK0Oxh9ASgFErtshKd+aPL7l4rBJ+wF7BscWNebT2xUenlqbmJuwJ
         kr00/m4tlXwyPg5OyqczmpSluhEMiejmqviEFj7941IsW3WVkEEKnGK/DxV0jmpJr8Sx
         VDneLmc3Y0/j0akdlIAwQK55UgA3dJyOK36+DYMEphImsfYZ9xBDZLP8mvffKui3PNUj
         ukMDim7caRse/rdVO9qfkHA+FbDZ5myfWERkB7pWKmjrJ1sDTcFiHFxWdMcshXmCYYV5
         XhbTqn5rSOauJ9VJRhcEuMQn9JRiQDRp7mDy/vIf5Ly2BkLOoU8lmhN9GCGvnW9IN1bj
         TxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XLALtPriLeZwTligxpdFR/dm3BJuYV+Mu4HKdi3HlZ8=;
        b=E6kOSo5Fdsr8yWEpiqGxdHuoa3BSOqMm/pZc5RWWDVS+hRTuccx4eFyxgAL4xiSPfb
         QjmB53d1XTbElR0ZouJUop/WcojN6WVALNYq/VuG2xQaEvkj7FAzrnrqZIQBVnknWghg
         o05/E41vlgzIbidIKd1FPjuCZgVpqvcUYd+1mrWXBg45v9HSIYFfon56BufUNLiOySYi
         fs7NhgzyTvJ2+6NSTCr7qpUyFFATl1f10ysMULyk/FxmdoN8WvV3eigS7V0zVUWs3gfi
         sK18T/V4NORYNMwAkQHV4PVA6jqrZ3WKj4RLr/EkN6pPFZm1iwZc8Dua2iVccgwZFiwg
         I7jA==
X-Gm-Message-State: AFqh2kovhzoYSiy7xZJ2fMYzASpzRk/ZD4ayCTfNLPk2HcsVVq+z9CrJ
	vlAEnOfc6ywFmrv/XRYsgciTuHJPqBc=
X-Google-Smtp-Source: AMrXdXvasxYf7y+ENkHkSyP76OzESxU3GMrSYStnzdKk6qwVTfylAO4XMcpBHLzQAlytz1bkEbyehA==
X-Received: by 2002:a9d:7cca:0:b0:677:3d79:e60a with SMTP id r10-20020a9d7cca000000b006773d79e60amr27845278otn.31.1673191282972;
        Sun, 08 Jan 2023 07:21:22 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:14ca:f21f:f9fe:c54d])
        by smtp.gmail.com with ESMTPSA id s24-20020a056830125800b00684074fbce6sm3184725otp.54.2023.01.08.07.21.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 07:21:22 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 11/26] ostree: fix selinux policy rebuild error on first deployment
Date: Sun,  8 Jan 2023 10:20:46 -0500
Message-Id: <14c44c099b94d407e87a2f9c554b2ac117bdbf63.1673191116.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673191116.git.akuster808@gmail.com>
References: <cover.1673191116.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 15:21:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100456

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


