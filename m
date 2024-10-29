Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB89DD5B87D
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 04:25:08 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.11978.1730175905754112836
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 21:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XRz58+pa;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3e60f6ea262so2455661b6e.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 21:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730175905; x=1730780705; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhhQfSgE31kUwqSQ9Vw7J+VDTp2u88ij71TY53diBnA=;
        b=XRz58+pasRjFlA0+tBEZFyQj3PNIsUIBJ/qKOb4gvR7ceG63z9zMNLCN9WAHvXjYPc
         Xhut/EB+ocdoyIfbyXd0fWrHrjN1u4I6Qdcpt+el85bQmvDDn7eBOTXoCW/P1K3370h+
         qRNmejqwH+5UfmVIGLV337o8E9xSGxFOuICwxZBPspzSoTGQLFP7bNY9ffG/tq1wm1sd
         AlFHRHobAZK2SaLogm7p86Gz3btZSrFmmGzC6m7OmckzYUzTk4bI9Zd/PMGtpiyIwC7A
         ss0C8oGmdNyExMgjvmcsaPipLZmWWnexZRJjFs+xM6wcMTEz+2hMs0CwFKRvtu7WmgFX
         zSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730175905; x=1730780705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yhhQfSgE31kUwqSQ9Vw7J+VDTp2u88ij71TY53diBnA=;
        b=WhU9ThsoDZwxyn3L7dyE2An2ZBuc9Jz7ypdaQbHM85E37eAwKVxqTJp1hcpIAY0jAl
         xzvAMQ2ySQrwd2wEkHxr625crL97PEuPfVlRQEmuzayA74RxUsP/pZENw2ljgh3nB4OP
         Qn/P5BamwW+D8RmdlYNKmo7/cf5uFAQtSrLT9w983Fm3668JCcAPr0GhO1eBaHv4mfKi
         MK1PPZuIJGm2ssPH9opeoP4mMtUNrrSJAyVKCF60w3w4zi2ZHESqM1wYz31DyzKZvh+o
         cxplU2/oER3leatOLQKFtWzPqTcFENRgTsmRBRtqNOVlyWcFMz9qW2zlF3VlcxrxLD69
         xbOw==
X-Gm-Message-State: AOJu0Yy3dxeVB7vx0E1JAIf4H/3USCcTG3tDHZYL57lPwRRe+0re/zj/
	dhOP1Jt53gbYfmGJWT4FMNrYol/uVAzPEX9O+xlgPWKmuUhaaIAdfsa3AllE
X-Google-Smtp-Source: AGHT+IEty3XN6ArP3V6UFgz7RZ2N36TaiG+IkwxiKNJQNofKv1pl8dzASXRIW3IErNknCJ0UoWSO/w==
X-Received: by 2002:a05:6808:384a:b0:3e0:374a:1a60 with SMTP id 5614622812f47-3e6384c4db2mr9157023b6e.30.1730175904849;
        Mon, 28 Oct 2024 21:25:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::8085])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8679cbesm6710198a12.24.2024.10.28.21.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 21:25:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 5/5] python3-pydantic: Upgrade to 2.9.2
Date: Mon, 28 Oct 2024 21:24:57 -0700
Message-ID: <20241029042457.4125617-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241029042457.4125617-1-raj.khem@gmail.com>
References: <20241029042457.4125617-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Oct 2024 04:25:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113321

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...python3-pydantic_2.8.2.bb => python3-pydantic_2.9.2.bb} | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.8.2.bb => python3-pydantic_2.9.2.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.8.2.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.9.2.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pydantic_2.8.2.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.9.2.bb
index de610d7815..b776d05dce 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.9.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "6f62c13d067b0755ad1c21a34bdd06c0c12625a22b0fc09c6b149816604f7c2a"
+SRC_URI[sha256sum] = "d155cef71265d1e9807ed1c32b4c8deec042a44a50a4188b25ac67ecd81a9c0f" 
 
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
@@ -24,12 +24,15 @@ RDEPENDS:${PN} += "\
     python3-image \
     python3-io \
     python3-json \
+    python3-jsonschema \
     python3-logging \
     python3-netclient \
     python3-numbers \
     python3-profile \
     python3-pydantic-core \
     python3-typing-extensions \
+    python3-tzdata \
+    python3-zoneinfo \
 "
 
 inherit ptest
@@ -38,6 +41,8 @@ RDEPENDS:${PN}-ptest += "\
     python3-cloudpickle \
     python3-dirty-equals \
     python3-email-validator \
+    python3-html \
+    python3-hypothesis \
     python3-pydoc \
     python3-pytest \
     python3-pytest-mock \

