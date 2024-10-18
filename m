Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F90D3E18F
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:49:03 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.29989.1729278834992812475
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XxkaFUFv;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e5a5abc915so22121697b3.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278834; x=1729883634; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZRqY7S7rOsQzuJoPn8p3m97Xcfn5YtaMjxHT659XQFI=;
        b=XxkaFUFvjk3iDjbhjqc+Z0Mdpi+/5pMyhD0ukmwJS7NLeNRy+XkIN/LPapHhLpUsri
         jIgFRB8EDXt/IBQAEMqGTvdc9u7DCLO0IHt4qWBJ+hcl74nCj1OphwUbLGYLWIzYdpXT
         u53iJPsJyPIlsUwuHQ6gncrMPui+LS+Oc0lHpJbt3dNUai2cAlzVu/EQJDjhRLmWZCjK
         D7OetxGWo6R0BzDh27g5ZPfUS7iXvVnx6GMB80QDJxZSBNs2BPepC18Xt7n8ufFPu4Uq
         u3AgPExL+jSolNb6SIyx6GpKwvqknr46ozxkCOT9//dZHx8D41fXXuMACNtBtUWOx+FO
         B90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278834; x=1729883634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZRqY7S7rOsQzuJoPn8p3m97Xcfn5YtaMjxHT659XQFI=;
        b=uzYZBusoz3lLxnjwf7H6WF03XpK/WP5tBDFLivg+WKybBD206xOYVzCArIAWoUjr83
         Tnt/eDIjxf4BMqhKIbYnhj2N55m1r0p3hNvepqCbCyFeVAyydyL+G1gRieWylsKOO1Hf
         bCfbk4ufyD9PmvHZPec24yUPLwtcfAt8w73HyOI9Vzbuvj7Ab/C2XqoHTiZ3cXcTu+nE
         icisQYqs7tmGwnhbTHpSrg349zLlMTF0ca4NKmjEspeAildEo4UmZ7Aymdi0ppBJuslQ
         4IC27j6DQsup4EWD3Vk8t/Y7A42rttKsN9SaBPUhftEnI2ldLH/5/BgGBz5NnC4pg9Od
         k+5A==
X-Gm-Message-State: AOJu0YxaWh0HlNPBL6TSBMvqLKddyIooy8vAyx3yXDg0MIWCMQ24U1Z3
	RaYZOUTZDSOvuhHBCl01y06bvE/5RZjQ+Ycmg1gaPzD9XcCLG4ge1Cm+Ew==
X-Google-Smtp-Source: AGHT+IEC3UIzx9pW0yMuG1juX0fsyzG6ADj3h5yVNo/xJ1dbrk7jC34lxsqAy9/5FuAbtFEL0sZOGA==
X-Received: by 2002:a05:690c:6e07:b0:6e5:aaf7:68d0 with SMTP id 00721157ae682-6e5bfc62adfmr41263317b3.18.1729278833595;
        Fri, 18 Oct 2024 12:13:53 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:53 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 66/68] python3-webencodings: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:53 -0400
Message-ID: <20241018191101.25184-67-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:49:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113053

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-devtools/python/python3-webencodings_0.5.1.bb        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-webencodings_0.5.1.bb b/meta-python/recipes-devtools/python/python3-webencodings_0.5.1.bb
index cedc79081..81709435b 100644
--- a/meta-python/recipes-devtools/python/python3-webencodings_0.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-webencodings_0.5.1.bb
@@ -2,7 +2,6 @@ SUMMARY = "Character encoding aliases for legacy web content"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
 
-SRC_URI[md5sum] = "32f6e261d52e57bf7e1c4d41546d15b8"
 SRC_URI[sha256sum] = "b36a1c245f2d304965eb4e0a82848379241dc04b865afcc4aab16748587e1923"
 
 inherit pypi setuptools3
-- 
2.43.0


