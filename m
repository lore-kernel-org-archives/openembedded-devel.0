Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E41C54EAA
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 13:02:40 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.101351.1674824554205435060
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Jan 2023 05:02:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cDEt1E4x;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id j17so3422901wms.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Jan 2023 05:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=470/bXnZ7WD4WQXfjpKTC+agVGSlrZ3Am/fEVgAPe/Q=;
        b=cDEt1E4xE9vfJmybn3YiSYALLu/Cprid5QWj1JQl76a9U21T868VD1WWXV2GpgAZTJ
         MuRTg39ljh2ZakF06pYung2wKkKHWlUy0wQTjLeau6hkXZ7RWTV/qGy7oHNVMav8z+XC
         Wg6lj89uKPaXUqV/9gurhroOgKwWLMuT2rD7ewC9ru0jDTpnamD0hiA+QIrU7/JeqGjN
         JU+SF/t4BngpPTYEvVAYeAY3uf0xm4iNOXFRGA8mOFScJiiDXsbtKBVe8YFzxcynXSPs
         AjU44yBHIy1fGWbFqsF3TLDD5VcBA5NImoShSozVBl1HEbzQz6xJ1ql0BRVdS0GGLxsr
         u42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=470/bXnZ7WD4WQXfjpKTC+agVGSlrZ3Am/fEVgAPe/Q=;
        b=s1/yJoN03Gqdwr3X9XvhTTEh6gypehPot9PRzA+cUt7l1/OIiuCyp+UWXFoIyNSPkE
         n/hRXPNXDdl0ky+l9IhI/OD2hCBgrVE7EM7TwB8eueikOnVjfINYRtaNgooPwRriF5m/
         KmsijDr2EZgQ/JaZ0Lsq1wtyraE52LPD9REyeq02rK3bunkvHeEoFpg1a5PuEXe/V7nJ
         wgikYuYEMN5sAIDEbkC2NuQye9VfcqWMHEo4VLvMpAbH23cQtnNwyE+es/7S3UBx1o3w
         hOpI/H2SK8hppVAJ7gFkMt9/VqzGLcg40xRzeb9f+VRdLi0X39ATKmwdIvrWT8s4UI/a
         CIxw==
X-Gm-Message-State: AFqh2krPKNpzrdvSVBVPfJktfUpombYgWjiLzJqNKKEx/230a4h1nomS
	jg05x2gntQ0OzXLZIVsyOtcrzxHBF4U=
X-Google-Smtp-Source: AMrXdXtcjpZPTmoEKmELlsY7Wc9TCqMv1J2ziLJNPvzJnQDrLQFM3zgP4LctB8GJ+nU9Jp4FJ9zMxg==
X-Received: by 2002:a05:600c:22c6:b0:3da:fc30:bfc5 with SMTP id 6-20020a05600c22c600b003dafc30bfc5mr40565213wmg.13.1674824552471;
        Fri, 27 Jan 2023 05:02:32 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id h23-20020a05600c499700b003dab40f9eafsm4143479wmp.35.2023.01.27.05.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 05:02:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/6] keyutils: fix Upstream-Status formatting
Date: Fri, 27 Jan 2023 14:02:21 +0100
Message-Id: <20230127130225.1280161-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127130225.1280161-1-Martin.Jansa@gmail.com>
References: <20230127130225.1280161-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jan 2023 13:02:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100817

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...1-tests-toolbox.inc.sh-update-regex-for-getting-endian.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-security/keyutils/files/0001-tests-toolbox.inc.sh-update-regex-for-getting-endian.patch b/meta-oe/recipes-security/keyutils/files/0001-tests-toolbox.inc.sh-update-regex-for-getting-endian.patch
index 769118e422..314487aef6 100644
--- a/meta-oe/recipes-security/keyutils/files/0001-tests-toolbox.inc.sh-update-regex-for-getting-endian.patch
+++ b/meta-oe/recipes-security/keyutils/files/0001-tests-toolbox.inc.sh-update-regex-for-getting-endian.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] tests/toolbox.inc.sh: update regex for getting endian
 Update regex for getting endian in following condition:
 /proc/777/exe: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2
 
-Upstream-Status: Submited [Submitted to keyrings@vger.kernel.org ]
+Upstream-Status: Submitted [Submitted to keyrings@vger.kernel.org ]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
-- 
2.39.1


