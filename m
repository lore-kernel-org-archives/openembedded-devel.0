Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A9EAD3F28F
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:53 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web10.29971.1729278814127398869
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ke41EeGx;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e2975432b8cso2822634276.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278813; x=1729883613; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBGVOt5awdpplfZ2LNL8HfkD2a2mFO79ov4rLTz+jRk=;
        b=Ke41EeGxZJKhcQ5sFcpTkLrBoRPzYrZONcDkbGIJSrEw5JCJFWHOjMFKXm5OduHt1N
         uxvs7FEc2rl+s7+cyXUyxsMcPwNdoYvHK430UFfY1tOMTWcmD/DLArRRQqUiseOYyjvh
         fJVCzAtiDQLJOKarkHYmqNLP4GIrLdzTRODS0CyK4cgxxy9kRnhD28u8CVSym4g9LR2H
         Z3mDzCTn078CI5xboJK0NXvmFZVHpous27W5/JpWDWf5VuYG3V/kxtdUn2afu7xY5qOK
         e2Zs/JlN964iwzltPhmHfuMWRq78WNf2eFnzI4xJqlJBGjM3+Wd0LX32DK5JwdmG7QEz
         sJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278813; x=1729883613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBGVOt5awdpplfZ2LNL8HfkD2a2mFO79ov4rLTz+jRk=;
        b=nM2IrCZRKAz1RbqWuKljDRisS8QI+ZQLJ7qevWcKYsNGhIDdz2NG7ClnPYCrptspt9
         IPFuUMCia6J+RJojfhU8CB+CHGQQNoEpa5JFHkA6o/1dHbSW+ti6R+Bxu5Old5sL4YzV
         QpU9/oFRrMAWQ25TFKjowtX0JI7uUdyUV5FNOkNkKMDrhaDbBiu/6dm0yVZ3m9UVWX9x
         qfrJJ9IXFjzA4ut9xJoUtpG2Bj7nzoaDAlb1l+7oQicnkfYvO/ac74Y54hZkCqh76Q28
         xMcaP1+tW6xc/0DPJRUC7fBUQbjuElrwSAwfa3YxwO8HCJBgR+EZfhmAQs5dcAp27xQx
         cF0A==
X-Gm-Message-State: AOJu0Yzmo5F7ucBBwoOSDeJuUrwgqEU3+tGXn3Irn9DeffXvtpa95XRR
	2aJ8RxJ7TlsryOTFHVuwwWGnvIXdtdl4S1J8HCUmr+DZDrLnJANSPfNmng==
X-Google-Smtp-Source: AGHT+IFy/vbgmSxrkmklQu1GzTgJIDkwNF7LWXt+J6n+bQHWI9uRvQXwJATiHhLZM5nsi3QBpF3HYA==
X-Received: by 2002:a05:690c:660b:b0:6e2:12e5:35a2 with SMTP id 00721157ae682-6e5bfbac257mr42403827b3.4.1729278812705;
        Fri, 18 Oct 2024 12:13:32 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:32 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 34/68] python3-keras-preprocessing: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:21 -0400
Message-ID: <20241018191101.25184-35-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113021

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-devtools/python/python3-keras-preprocessing_1.1.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1.2.bb b/meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1.2.bb
index 749b6c8c9..5a2d7d950 100644
--- a/meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1.2.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1744b320500cc2e3112964d00cce7aa4"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "d2a0e10437cfa5c2d09458a84fb58d05"
 SRC_URI[sha256sum] = "add82567c50c8bc648c14195bf544a5ce7c1f76761536956c3d2978970179ef3"
 
 PYPI_PACKAGE = "Keras_Preprocessing"
-- 
2.43.0


