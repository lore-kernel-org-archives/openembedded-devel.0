Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34351C433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 07:10:31 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web12.3912.1637133029780926016
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 23:10:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iPh9jfcU;
 spf=pass (domain: gmail.com, ip: 209.85.167.52,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id b1so4561391lfs.13
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 23:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7g/0QOfog9B6o6Bd/5ORHEgPX7K33tCIK0Q1a1FneoA=;
        b=iPh9jfcU513AjMPXZVO/lHkFFDfqsSLgNc15yj5G7gTcpZ6oxih/QpDAZTj9l1dGvK
         G5ryeR+NwR56sdrX5G2MSU/PP3kP/BIWhJ41mdB25s68Isq5xDriYiWCwyiWqqm+H2ao
         LDUVbuO5lM5RxR40whZN/TnOyWk3mk1N3xXFwc+nuHYv5rcLCFn/424aU0LxlFddzfNf
         XDRc57POfFbPPjpb7pwn0DVFo6ge6rz2HMOKVhydof7gYcPk26V/8YgBbZl9AGLBvu+l
         UyJVYbt9usxbXd8eh2Gyd1lCqGZwer2f1nsJTMRV92pBZXPwBKW5fGbLJfRmSg7ryips
         Ijpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7g/0QOfog9B6o6Bd/5ORHEgPX7K33tCIK0Q1a1FneoA=;
        b=y/VP4FRZwaE82RbSeL1TClbN8qTSTTR54viRS+5x2AzJHse361gPsxCHErp4qWCY45
         1O2DfOIF14e2CjFylJPbUE5uWchOxvv+5y8zHADc/0laMUdSiJM6gL6NNXk+Ox1rQlag
         wla5KRe3KzeZiP4Z3c/Vp8y2DRksTBwP+N9AJLcSCLsxye0okTurBixUEaD8KQmWbIeo
         g1ZgTy8LwuKcnbyi8QVJL3F5ofUgwgMDOSPAM/91bVYpYSlPGj0pNjqLfbL4iR4vaGlB
         DDekzDDMDIWFkgs+Ey6wDf7BURSxSRdm1CN7QrnKxeq2/viCNnNtCV+bKKZPQ6Z+vr2V
         k/oQ==
X-Gm-Message-State: AOAM532vSWMolS372iJV2pLcerivFAIxgezXOE7/jUVKzU31/ZgM5DXe
	EU421JCweH3saGIeD79gJK/5DAtr+pG/Ow==
X-Google-Smtp-Source: 
 ABdhPJwcr8tOO/SzeA34Kx1zCgRRwtl7MFBVZJ+/PQBzY7uMn8Y/ZbuDVFlBYTyhVc/n1sNwjptkpA==
X-Received: by 2002:a05:6512:36c6:: with SMTP id
 e6mr13447190lfs.169.1637133027283;
        Tue, 16 Nov 2021 23:10:27 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 bq3sm2025322lfb.173.2021.11.16.23.10.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 23:10:26 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-java][PATCH 1/2] jamvm: Set git branch
Date: Wed, 17 Nov 2021 08:09:57 +0100
Message-Id: <20211117070958.64782-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Nov 2021 07:10:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93986

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 recipes-core/jamvm/jamvm_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/jamvm/jamvm_git.bb b/recipes-core/jamvm/jamvm_git.bb
index 3c9d47b..34861ac 100644
--- a/recipes-core/jamvm/jamvm_git.bb
+++ b/recipes-core/jamvm/jamvm_git.bb
@@ -6,7 +6,7 @@ require jamvm.inc
 SRCREV = "6cef41d859fbc9ce7868a97cb2cb5dd2b10b9103"
 PV = "2.0.0-devel+git${SRCPV}"
 
-SRC_URI = "git://git.code.sf.net/p/jamvm/code;protocol=git \
+SRC_URI = "git://git.code.sf.net/p/jamvm/code;protocol=git;branch=master \
            file://jamvm-jni_h-noinst.patch \
            file://libffi.patch \
            file://jamvm-minmax-heap.patch \

