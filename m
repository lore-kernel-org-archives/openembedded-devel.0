Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.23467.1623627171503346644
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Jun 2021 16:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q5KUkScS;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id a127so3397003pfa.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Jun 2021 16:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=q4wLLPc04wtoz7T/BSTC5PWCI+3GJIy+dfIXETs0+aE=;
        b=q5KUkScSJRx35ucxt11/CmXv1qlDt9YSBebacS5ShLXvfEDMJEDmsUSr9wnySbdboR
         WUDqjcaJ1LZnKvumSuQLDY0soMLXGCFQJQqWQEER1O4wqi4qLKqK5FUZ9iQSFEw2sJYA
         0ZtqF0hHxAPzGmzh7mFEDyXYmsxqAylJK7g3AhAJequsa0UpXVEdzCIOeDIk+o9qJiC8
         3Lnb3GmUYlx6Yl1KTzjrAOMeMVwEfnVrZQL69ox0Tlyufc8qWQboJXcjgY1lINhT7cOr
         kDnmDH5QN0Vr20HZOpY6Rv3KLlR73klRExYAqONo2avgkKta99cdBsBxorQQZiPOVgS2
         6qWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=q4wLLPc04wtoz7T/BSTC5PWCI+3GJIy+dfIXETs0+aE=;
        b=n18ONgPxnVA5GyLZVLOofUst52RQrRLvEg/p7CTiu7bU1w+csyFUUTKtZJkZAuqL0+
         wwjXJY27P4NuPwnLisnYYhdWP/cHb5rOlrsQRYZW3DPDCdOghkYZW7AHrJ/X2ldzlVAS
         joebNOWtVig/jjGRrtHXJAsP1N0ZIMG+3sIMm9w1vt/zrDVjto8Xy5yfq43BBNRqZ9ak
         Ygy/h1GjTawoORqXExXbs3lr4MG9Fm8uagjhUkRORPLFluJcKcy8rReLppq0tvDHU2mX
         5VDNBMsFuYj6QxCw5231gd3axkXsfvpsRXiz8fbLcuuwzd/rhQ1yzVQuNZBrZJkxsAQw
         Mkow==
X-Gm-Message-State: AOAM532xiSBoxu+So6fpz281AMAt2lmW8gWtUMMdO0zQgRQy3EvwfTtG
	92+/sfNvftAx7s2C3iu2Vru0hfSlVClwxA==
X-Google-Smtp-Source: ABdhPJzU3aiGXj95pRLVLCN+cUMrmFlMdlSJBlu+fyNi7zk3KrEnHRBHHONxSCpETy7GYVFEl2aArg==
X-Received: by 2002:a62:2942:0:b029:2f4:e012:fb23 with SMTP id p63-20020a6229420000b02902f4e012fb23mr18865773pfp.55.1623627170947;
        Sun, 13 Jun 2021 16:32:50 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:ed93:eb87:6dc9:a518])
        by smtp.gmail.com with ESMTPSA id gd10sm9933924pjb.0.2021.06.13.16.32.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jun 2021 16:32:50 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [Hardknott 4/5] mongodb: Change PV to 4.4.6
Date: Sun, 13 Jun 2021 16:32:43 -0700
Message-Id: <e9f5cef789014e60d49b66af639bf1191374f5e6.1623627089.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1623627089.git.akuster808@gmail.com>
References: <cover.1623627089.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

4.4.6 has been released from same SHA which was used for rc0

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e17fc085c025550be08353319983f9b89b11831b)
[Bug fix only updates:
Issues fixed:
SERVER-53604: Include original aws iam arn in authenticate audit logs
SERVER-52564: Deadlock between step down and MongoDOperationContextSession
WT-7442: RTS to open dhandle only when the dhandle has unstable updates
WT-7426: Set write generation number when the page image gets created
WT-7373: Improve slow random cursor operations on oplog]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../meta-python/recipes-dbs/mongodb/mongodb_git.bb            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 54178bf75a..fcabf81327 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -11,8 +11,8 @@ DEPENDS = "openssl libpcap zlib boost curl python3 \
 
 inherit scons dos2unix siteinfo python3native systemd useradd
 
-PV = "4.4.5+4.4.6-rc0"
-#v4.4.6-rc0
+PV = "4.4.6"
+#v4.4.6
 SRCREV = "72e66213c2c3eab37d9358d5e78ad7f5c1d0d0d7"
 SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4 \
            file://0001-Tell-scons-to-use-build-settings-from-environment-va.patch \
-- 
2.17.1

