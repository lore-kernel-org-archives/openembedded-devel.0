Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66CC3CDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 14:33:07 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.282687.1697639581499271730
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Oct 2023 07:33:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Waew3ELx;
 spf=pass (domain: konsulko.com, ip: 209.85.208.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-53de8fc1ad8so11805826a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Oct 2023 07:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1697639579; x=1698244379; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8mWiwdZJzdXjyoczT6FZ7zmWRHDjD36nTCI5hPbUBp4=;
        b=Waew3ELxaeKDSAC1Ippeq9riSllQPh2xjrrnwkWJoltjbD/Bnt09970UfYGoj4EkGc
         WuCh6suOTwe2NYuoEhM+lZVDjHR6UN1OQDMmjJom1bIsozHWOYflYF01Mdp8t/9InMIR
         tjn45H1M/ZEGZfAJyGLz/x+g58Jw0tbPzUVt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697639579; x=1698244379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8mWiwdZJzdXjyoczT6FZ7zmWRHDjD36nTCI5hPbUBp4=;
        b=I0OkTQuouc4451J/wpZSfpHjmEKjWC5RUhu651sDBEWHWrx4LhnChS96PFZQ+W4/VY
         XrvkYfupPhZUGLJQb1EsMEhfpHACLXIALhIVeHP5rPoOvCLHpoMVDX+ArJhX7avcN/5o
         xq9XEECThLSAWSyQyYJAQonMgBRhMJt086e/mnqvphWkmiJ3QwfqiIwhCc3U/Jrz8Vt4
         E+bVzzPvom7gtjekF7/mrsIsTw1/weZYRKwaPGAJtaWXwTGCX7n02Y8lfJ+E+YXF0PRf
         ijk2yni3G9dl6n3bykAnxR6/7TJe4MMeOuj3zU8U4lxSb3+DMIVpsLKUmgt8hboQ2WN+
         mGhA==
X-Gm-Message-State: AOJu0YyiG+BXl4Iv1nxK3gr9KBbiHbWRTfG16UmAJF24i63ROAk61kEW
	TIZ93VPuDazAq3uxMISsfmcJQH/qxffGvCUGgqc=
X-Google-Smtp-Source: AGHT+IGHpU/MTaiFIqll6OnoKGx+fCnCPOpAtJFBobKGJHz2W6NdwMLVWZikfATYg4+SALAZkxOouw==
X-Received: by 2002:a50:9fae:0:b0:53e:1f7d:10f2 with SMTP id c43-20020a509fae000000b0053e1f7d10f2mr4178292edf.10.1697639579350;
        Wed, 18 Oct 2023 07:32:59 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id z22-20020a50cd16000000b00536ad96f867sm2934556edi.11.2023.10.18.07.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 07:32:58 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] sip: upgrade 6.7.11 -> 6.7.12
Date: Wed, 18 Oct 2023 17:32:56 +0300
Message-Id: <20231018143256.1901031-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Oct 2023 14:33:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105576

Upgrade to version 6.7.12:

- Added sipPyTypeDictRef() to the v12 and v13 ABIs. sipPyTypeDict()
  is now deprecated and must not be used with Python v3.12 and later.
- Classes will automatically support being iterated over if they
  implement __getitem__() or operator[] and have a method annotated
  with __len__.
- The latest version of ABI v13 is v13.6.0.
- The latest version of ABI v12 is v12.13.0.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-oe/recipes-devtools/sip/{sip_6.7.11.bb => sip_6.7.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/sip/{sip_6.7.11.bb => sip_6.7.12.bb} (83%)

diff --git a/meta-oe/recipes-devtools/sip/sip_6.7.11.bb b/meta-oe/recipes-devtools/sip/sip_6.7.12.bb
similarity index 83%
rename from meta-oe/recipes-devtools/sip/sip_6.7.11.bb
rename to meta-oe/recipes-devtools/sip/sip_6.7.12.bb
index 66ec979ac..00823cf1a 100644
--- a/meta-oe/recipes-devtools/sip/sip_6.7.11.bb
+++ b/meta-oe/recipes-devtools/sip/sip_6.7.12.bb
@@ -11,6 +11,6 @@ LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
 inherit pypi setuptools3 python3native
 
 PYPI_PACKAGE = "sip"
-SRC_URI[sha256sum] = "f0dc3287a0b172e5664931c87847750d47e4fdcda4fe362b514af8edd655b469"
+SRC_URI[sha256sum] = "08e66f742592eb818ac8fda4173e2ed64c9f2d40b70bee11db1c499127d98450"
 
 BBCLASSEXTEND = "native"
-- 
2.39.2


