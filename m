Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26222CFA754
	for <webhook@archiver.kernel.org>; Sat,  5 Oct 2024 15:56:39 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.14251.1728143790775520178
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Oct 2024 08:56:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k2Csyy3i;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71dec1cf48fso1307202b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Oct 2024 08:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728143790; x=1728748590; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XawF5mSvnijKP7pOe34OvBU2NEYk8M174ler74jRQdQ=;
        b=k2Csyy3ikzvsP9b0DfNfCCFs4NAITSRpBpNaObms060RhjgAbxFLujEjWthmok6vib
         2iIu/iGUk4O2PxzEzjaAMXLDRbvMk+GEXCR8lD61jYhmGHKopB9LtnzRR6D2uStuHWpu
         a4aKs9NoNzCpGiER0Vx9JfwZj62sfZZUMRMVSz+ej8t7Q3T2/jP7bfT+lu//OaNHFmrt
         xE9ZaivEmg9RGh/pLDLwtJfwqynQAuo99qnZVhhNDjYc7ZiQ4Cz6SLYsZ35d25Aa0Jvk
         VpoLoosLG5TBdbCAVhIE+5uA7EfTkdmh5VyPLtazukB3IM8UEOC6jd0sNsDfXVpJ1f9L
         Eljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728143790; x=1728748590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XawF5mSvnijKP7pOe34OvBU2NEYk8M174ler74jRQdQ=;
        b=f9bXyL2OpJndAJlrJe2iSoDj+3zP+UwaHNbz+i/GiIHINNZ/jeJr7Kr1S+4B3O9hUU
         XfJgE3EDNj9yWTR2sQ1eMa0ZpwCOjMZ4vGCg04J0fFVd2qjuc+TG4fjTojjbEKaZX2Cg
         g5+4lwfmbUN0+x1Ifh03lpYLHVMsFvLVNgDQaMPCgyLL1gdEU0SE5YzySXcMgYmhxzAw
         U9/kongUeSuvqWsFzwhNr45uRhK/XI/jPY/h6ehkgn7++Nw83WucK31FOA6eX9s2W503
         KSfrQlYK5zOZTvMjI+sRlL68hwwiRARiHxSnySPcE5MUTLO7DK2Gqo8gbR5nyiWqjJlP
         aKhA==
X-Gm-Message-State: AOJu0YyZP7Lf7RdDrvYXoVHpMB1ZSDOI8ED2Kq8PoMx3xIH1z2Zd9EXP
	sEElO2gPe9drK7lthN+NXTIlZvu0/hxLVF3lpxHlO0iqdxHGwtZXf4hmuI/y
X-Google-Smtp-Source: AGHT+IEx2p8AKC3cfnzmKsNz57P0IBOfJOo0g3bdIT/ULd1fSgVu6YwBF/uqFpnkzII7mjvi3elizA==
X-Received: by 2002:a05:6a00:180a:b0:71d:fc85:aa2e with SMTP id d2e1a72fcca58-71dfc85abdamr787428b3a.8.1728143789693;
        Sat, 05 Oct 2024 08:56:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::23dc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0cbba2bsm1629396b3a.41.2024.10.05.08.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:56:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 1/2] sshfs-fuse: Add rdep on python3-compile for ptests
Date: Sat,  5 Oct 2024 08:56:26 -0700
Message-ID: <20241005155627.2558421-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Oct 2024 15:56:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112674

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb         | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb
index fd5af0b026..569c7f6901 100644
--- a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb
+++ b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb
@@ -17,8 +17,9 @@ inherit meson pkgconfig ptest
 SRC_URI += " \
 	file://run-ptest \
 "
-
+#python3-compile for filecmp module
 RDEPENDS:${PN}-ptest += " \
+        python3-compile \
         python3-pytest \
         python3-unittest-automake-output \
         bash \

