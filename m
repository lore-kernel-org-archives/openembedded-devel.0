Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43196C43219
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 13:49:40 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web12.16974.1652622576293961596
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A4pcVFnA;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id x52so11742778pfu.11
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=571jW6FGyqsUVdEUZjpt0PGMuYOerK8/5F+ejOXkXW8=;
        b=A4pcVFnA3nKeNyyGlhwB3JeIacMQeukLxpfMrNlXsWAO2F0YGic8p0qfsP+H595tMz
         2FXf8z/x51xUf5yTwFHBTBJctvsgZySxXVp3bmE+wY34BsMaTxO7oxEJ761sQ9PqSlNS
         AJlDALPxVlITwmnH26v61KkQ1DFIcBxr81AsOt6GYLwVDzKEVE1nKT0Vsq4v0SoGTvKB
         CHQY9VVdv0l/Q91bpKhH5q7hdV+mQIn3ktHiJp/SXcOAi75g4/NetcBkYV+u7pXN/q/+
         /Sh+QrwbE3TZDjNp0C26+R0PBuLUQ7L8Az16tCPsQhnPy9PoJ0h9WZTbqdsB9kGX1PBa
         WKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=571jW6FGyqsUVdEUZjpt0PGMuYOerK8/5F+ejOXkXW8=;
        b=HIKX0mlXobLFPzxJQLkwuxVL5Tl2Xy87KwKwwJK36yJyqU48v8ntSS00BHF89I66PK
         Ju4bBkAThdgiAfjrXeQnsteCMOInqrcFX6Ih8cSPojFyRlFoDVi+79+ntXCf9ax9VgUv
         CRft589unUjTzsmogL3Nlqq3GuvvHriaf689k0A/XjKTsAylBvCyeB4ZNcDdb1Fh1wj1
         oC7em+eHbrWnbqnFTofHJgoeuPWKdefHHgudtAcaEIgr6t4VM7r9Wp3addN13h274XD1
         eaFvlf/z7irr1ELgzmef4sig95sbUcCg3Md+RiV27DKap9C7bxOswtAOx3yW/gBWSngC
         7tTQ==
X-Gm-Message-State: AOAM531xZuBPLSjVv8sxm9W3p8lTuEF5GU+e9I8jrV7RSI1ble6MS2q0
	XsO5NMTkcPGNAO5kS0YubMYZdb7iJfpIhQ==
X-Google-Smtp-Source: 
 ABdhPJzSj+mVquhAElXJCxOtuKcz+m27tfFd1RfQiREcn67jZB6z1v7vQEltWI7KiSIL61rb3sRhLA==
X-Received: by 2002:a05:6a00:14d4:b0:50e:12c8:4868 with SMTP id
 w20-20020a056a0014d400b0050e12c84868mr13457391pfu.72.1652622575429;
        Sun, 15 May 2022 06:49:35 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:48be:3d3d:c26:7949])
        by smtp.gmail.com with ESMTPSA id
 z22-20020a63e556000000b003c644b2180asm4961650pgj.77.2022.05.15.06.49.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 May 2022 06:49:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 07/22] makedumpfile: Use right TARGET for ppc32
Date: Sun, 15 May 2022 06:49:07 -0700
Message-Id: 
 <d06c0543cddd9a8d31e300b7e3b30cc6527de9aa.1652622481.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652622481.git.akuster808@gmail.com>
References: <cover.1652622481.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 May 2022 13:49:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97104

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f994a19220ab42d3d8002adc89a04b3904020feb)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.1.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.1.bb b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.1.bb
index c3f965b041..eb004c2ed5 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.1.bb
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.1.bb
@@ -36,9 +36,13 @@ SECTION = "base"
 # If we do not specify TARGET, makedumpfile will build for the host but use the
 # target gcc.
 #
+
+MAKEDUMPFILE_TARGET ?= "${TARGET_ARCH}"
+MAKEDUMPFILE_TARGET:powerpc = "ppc"
+
 EXTRA_OEMAKE = "\
     LINKTYPE=static \
-    TARGET=${TARGET_ARCH} \
+    TARGET=${MAKEDUMPFILE_TARGET} \
     ${PACKAGECONFIG_CONFARGS} \
 "
 
-- 
2.25.1


