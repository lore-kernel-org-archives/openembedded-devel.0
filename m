Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3283C43217
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:40 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.39237.1649095832638799195
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 11:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e9yZed2k;
 spf=pass (domain: gmail.com, ip: 209.85.215.175,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id s72so9000023pgc.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 11:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZmPRB4xihKLvu0+Vaa0hShdeIWxK/WNbrNijdrx++KE=;
        b=e9yZed2krnOGIR6xVd+cEzK4HGaHzbj/wApaocxNkHg+r7jZDYe+RGECvNYgOjz3jm
         iIFwFApDovf1oQ/maP2BrBxvNxZfhpRnm6HETQYnIEmPa0hzD3llQqD64rLKqPCfrLNG
         RJN/lF/6HQ68giZfIFLw3noWZO7o0GCZgufKMFoEaMm45LGeCI9sw+fOtpUSqaRocdkT
         d/ynFHvkw5HlNjQZy7fTjLSXfR+er3u3fhO2w3bWAAKM1NcsyBP+esKD4opIeZf28cpl
         lLlBpWPMkQ/cidEy1a/ZCUU4GUcfNCccU+l1yHTzNET2xmRPBeWqBEQWFhgFkNtZDiqX
         4wfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZmPRB4xihKLvu0+Vaa0hShdeIWxK/WNbrNijdrx++KE=;
        b=UytaZgSWgF13TU3zf3mwSQC6iSbwDTWriYpx//rT5wdoii4M1DHbSZpJp7YD6VYcht
         zAZltdBcCWvLc3ICxnS7Ik3nBPxkb6FIX1RDBY1ylVZsnJxI0TStEceocyPesQ1OwK5e
         9SSwWf7VQJ6QWR9TmgF85BFpV0eRRw/u1S5iueJJVMbj8ecMV/OPCRD7nU8EX6E+bYvg
         Hbv3CJZsREk9PKLGpgdhJE0wsVTAbW4Gibc6LJ5iq+YjKj9/AikEHQ29m9k3u9CHK+8K
         U8ns9efb8aJYaAA2zWplalZGXOg4ieWHSGMv+3UYA69LQAbrWZFsdDTdhf73NOib+P4m
         i1Fg==
X-Gm-Message-State: AOAM532GV/ArnvjxC78bJmnBXU73mEWBBEWOqE+qwSiJA0OFjp2Mp3mp
	QoYekAg/ezDbjTQ0lCZMQV9DFIr1YoM=
X-Google-Smtp-Source: 
 ABdhPJzxB+vngRO4bl4JQJa4OcDuVAZaC2zAt/vaCysWOm8pQPC9dpGfMQ/qgyxKG/EExiEbSFwnjw==
X-Received: by 2002:a63:4d66:0:b0:399:14fa:2acc with SMTP id
 n38-20020a634d66000000b0039914fa2accmr958722pgl.558.1649095831821;
        Mon, 04 Apr 2022 11:10:31 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:12d7:1906:ff25:5c6d])
        by smtp.gmail.com with ESMTPSA id
 f14-20020a056a0022ce00b004fabe9fac23sm13725940pfj.151.2022.04.04.11.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 11:10:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][honister][PATCH] breakpad: fix branch for gtest in SRC_URI
Date: Mon,  4 Apr 2022 11:10:29 -0700
Message-Id: <20220404181029.2892793-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96385

From: Thomas Perrot <thomas.perrot@bootlin.com>

The commit 4fe018038f87 is in the main branch, so the do_fetch task failed.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b8bb7dc157b248802218fcf80215f80a6c7cd6f3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/breakpad/breakpad_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
index fabf59d4b2..c752a10083 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
@@ -29,7 +29,7 @@ SRCREV_lss = "fd00dbbd0c06a309c657d89e9430143b179ff6db"
 SRCREV_gyp = "324dd166b7c0b39d513026fa52d6280ac6d56770"
 
 SRC_URI = "git://github.com/google/breakpad;name=breakpad;branch=main;protocol=https \
-           git://github.com/google/googletest.git;destsuffix=git/src/testing/gtest;name=gtest;branch=master;protocol=https \
+           git://github.com/google/googletest.git;destsuffix=git/src/testing/gtest;name=gtest;branch=main;protocol=https \
            git://github.com/protocolbuffers/protobuf.git;destsuffix=git/src/third_party/protobuf/protobuf;name=protobuf;branch=master;protocol=https \
            git://chromium.googlesource.com/linux-syscall-support;protocol=https;branch=main;destsuffix=git/src/third_party/lss;name=lss \
            git://chromium.googlesource.com/external/gyp;protocol=https;destsuffix=git/src/tools/gyp;name=gyp;branch=master \
-- 
2.25.1


