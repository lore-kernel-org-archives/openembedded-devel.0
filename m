Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 095D1C433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 22:51:42 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web09.3655.1647471101531372234
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 15:51:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p/XiFr9x;
 spf=pass (domain: gmail.com, ip: 209.85.215.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id c11so1263297pgu.11
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 15:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jOlkxeUi2Zy3fzdQOhDIeX0v9ua1wH6SZlTR4cSqV5Q=;
        b=p/XiFr9xCa+RqtErAA/ID5tHOkjlcp1Jnyg6hJnmSjzTOFsX1NQv5tw6FnWOp5vAig
         BT0mVTlT8aOPCbiCuuhTFz+gFbP4Ei5vCZ2QlpAFBXQxrcz7ubS19w8S0X4ezdMI67rC
         KO+Aq0cYmSc7cP4oUMWH8uyPBQoKI2oTpTGL4wkA3gevKHga4/n3HYEHLB2F8/pXPNTB
         dD4VwosLVKZVJQhMgLi9y84mVa6TrVPUYU9B2oha3LBE+mdf94g4md98xo6akmReTGKA
         dZJStDVe9mqFI7GoeaHcdR9q3e9PlSIquMzFlza8Lv3dVjRECPCwUAPMXAwrUVPiIIUy
         yN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jOlkxeUi2Zy3fzdQOhDIeX0v9ua1wH6SZlTR4cSqV5Q=;
        b=2ddHRqydjhY9lU6NzuiAcVsqYnCI1v014XigyEYxxIHHuGtJY1SgLkHsqoRHOQ0gu3
         pOWoNlsFUUAwqI5uFoZK0jCeLtx5iXyEBN2wbU9Z3nUyEHnLL4AfN4vlhPlTuWjoHH1/
         vHMPaJ7K+2Qy9C98mauO38Y8tKpDPeuPFkfbfN8nqIK76Z4lzrv0H/xjLYsOQ1SDRtLM
         fWOmJIpUhIgscqBid4FHa45xIiTlH0NNEHeKdjNYY89zi2pIBh14UXLfHdVYaucLrKVI
         /AY4eFXgC1+MW2w/qHjbr+H4t9mVdry0vHkyaDEOqMKngk/9DFg1ucAusMcPSGFdKO2t
         kR5w==
X-Gm-Message-State: AOAM5312vJwVeTD5xZSOWQlFYdVAv35B5QYvz41unOBrc0GiFcrc01rs
	9aTNbQP/Iv/Y/DwvL/HOut9R48kqg5U7zg==
X-Google-Smtp-Source: 
 ABdhPJz4lAGincPbcu3E8h9XW6gKqH3QH1F/5/1za2MjD+NnP3MbG/wmL6CspbvQNlVooM8U9k0r/Q==
X-Received: by 2002:a05:6a00:1995:b0:4f7:a6d3:38d9 with SMTP id
 d21-20020a056a00199500b004f7a6d338d9mr2092131pfl.20.1647471100768;
        Wed, 16 Mar 2022 15:51:40 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 r14-20020a17090a4dce00b001bcd7c2b2c0sm3587708pjl.7.2022.03.16.15.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 15:51:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] recipes: Adjust for renaming flit_core ->
 python_flit_core
Date: Wed, 16 Mar 2022 15:51:38 -0700
Message-Id: <20220316225138.277220-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Mar 2022 22:51:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96028

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb   | 2 +-
 .../recipes-devtools/python/python3-ordered-set_4.1.0.bb        | 2 +-
 meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb b/meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb
index 16cd58892c..434ab57c50 100644
--- a/meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb
@@ -9,4 +9,4 @@ PYPI_PACKAGE = "backcall"
 SRC_URI[md5sum] = "1f4c9a370c78743406296f48e56e8821"
 SRC_URI[sha256sum] = "5cbdbf27be5e7cfadb448baf0aa95508f91f2bbc6c6437cd9cd06e2a4c215e1e"
 
-inherit flit_core pypi
+inherit pypi python_flit_core
diff --git a/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb b/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb
index b3600d093a..f2f1cf8e45 100644
--- a/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://MIT-LICENSE;md5=3bf5e1ad64c0d99032c3143361fa234e"
 
 SRC_URI[sha256sum] = "694a8e44c87657c59292ede72891eb91d34131f6531463aab3009191c77364a8"
 
-inherit pypi flit_core ptest
+inherit pypi python_flit_core ptest
 
 DEPENDS += "python3-pytest-runner-native"
 
diff --git a/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb b/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
index e19ec7522e..bff2d499f1 100644
--- a/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
@@ -8,7 +8,7 @@ SRCNAME = "ptyprocess"
 
 SRC_URI[sha256sum] = "5c5d0a3b48ceee0b48485e0c26037c0acd7d29765ca3fbb5cb3831d347423220"
 
-inherit pypi flit_core
+inherit pypi python_flit_core
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/ptyprocess"
 
-- 
2.35.1


