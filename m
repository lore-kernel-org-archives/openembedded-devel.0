Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6884C433F5
	for <webhook@archiver.kernel.org>; Sat,  6 Nov 2021 18:17:53 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web12.22170.1636222672631799241
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Nov 2021 11:17:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BnwA8wEL;
 spf=pass (domain: gmail.com, ip: 209.85.210.178,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id n85so7484890pfd.10
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Nov 2021 11:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wVApst89sYc/OPRO7r4LRzQvidTwIa68xwUMfjZedTI=;
        b=BnwA8wELfhQIkvA0H/vE/y9dM0XrZ0hM4DfQFPXXUkQs8iyKFVn+hzyZ8t1XiGdRqK
         noQcJqasBtDUz0KK0BaykOq8Tqger1PmbFi1jBlxk7TcKR16G1tnevJJqWQSOyCOoYkI
         wz+zWmcb6pyc7uPU+95in4/U3YnsyWoSzanE6VriUrZalzCCtA7Wem52W3Im24auIp+r
         te69KLx34n5zprsBTeiX1HZNFLD+uWEWNd6OgIdMECx4talkEZzOctlom5KnZHUVDlgp
         RsbkWZ7fiCP3mQWnpLbfaxCnZDbOrJGuwcuP5i9kxYDvodelDpCsCDdXvxFTa0nGEkJO
         PKlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wVApst89sYc/OPRO7r4LRzQvidTwIa68xwUMfjZedTI=;
        b=TrX01bIjWxKNLJBGHhba3JGKz8pFNH2O4VTyFcFKCf8qOFgYLabGjlQJf/3aImUhJu
         WrPBy7TXFsylMXGDA+4kU++VUBMEHi4Y8UPa9EzGTjaz1iFmgyqPw0luVz6Xvh6XtbZZ
         i6zknLWjlkf0R1gOyF9Mne0HO+g+naiV7FBm7TCHNIncFkEMZlh7UnnHyGN3/qaVmOBo
         8ctiE98KI1DQWe9kb7WOK8UOH2aYh1wiHKzw2zUeWhpMP/kppNEzwzqicwK9ELwYQ/oA
         Go6m0fTGKsOgDbh5VwwzhgzorWu3qB3LlOWu3ShSf+HuSQXezHzU41n+5vJnuCm9OwCA
         S9rg==
X-Gm-Message-State: AOAM5310F79myczm1eRaCiUxPw9RRTqcDgCq7wx5gzlwfY3iMYJbm4Z8
	XI9xuOT1RrUvn3Bof1RDJu760JJixt0=
X-Google-Smtp-Source: 
 ABdhPJxQNVCB7NHX+SKKbgB/rzkyGbh3PZjr28WafL/tuaflYEZgTwjF/HKIMIyJYwpwyciDSs4oVQ==
X-Received: by 2002:a63:8a:: with SMTP id 132mr5122198pga.400.1636222671837;
        Sat, 06 Nov 2021 11:17:51 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:68d9:b431:d568:20cb])
        by smtp.gmail.com with ESMTPSA id
 p23sm12186820pjg.55.2021.11.06.11.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Nov 2021 11:17:51 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][honister][PATCH 1/4] mtr: Explicitly use branch= in SRC_URI
Date: Sat,  6 Nov 2021 11:17:47 -0700
Message-Id: <20211106181750.869596-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Nov 2021 18:17:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93856

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b66ad223244977acd2ec38ab38b7ed896fb80429)
[Fixup for honister context]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/mtr/mtr_0.94.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/mtr/mtr_0.94.bb b/meta-networking/recipes-support/mtr/mtr_0.94.bb
index c046499a2f..dad6096d57 100644
--- a/meta-networking/recipes-support/mtr/mtr_0.94.bb
+++ b/meta-networking/recipes-support/mtr/mtr_0.94.bb
@@ -9,7 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://ui/mtr.c;beginline=5;endline=16;md5=00a894a39d53726a27386534d1c4e468"
 
 SRCREV = "2c73cbf4094e4eed343ed11ae5bab2580f3122d1"
-SRC_URI = "git://github.com/traviscross/mtr"
+SRC_URI = "git://github.com/traviscross/mtr;branch=master \
+          "
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


