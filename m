Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2802DD70DF3
	for <webhook@archiver.kernel.org>; Thu, 28 Nov 2024 21:39:40 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.104519.1732829975606661040
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Nov 2024 13:39:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LbzvmIzr;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-434a9f2da82so10784755e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Nov 2024 13:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732829973; x=1733434773; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WHGkZjT+BST8jEoiCf8+VwNL9TcSADrFBmDOILWdt+A=;
        b=LbzvmIzrWtCsfJYngR+yM7HdJ6nrI67U92nQ9eaTau7XGQtsFfXsaI/L3pwP05uhL7
         fxz9gotypO8hgjXF/4ID1Ic+1uS/Pk1SNq9KMprd68Xsqafip9G0DntgavxHsjSX1nAt
         yc9B5QTm0HJMM7KPorryhcqn4tY/Dr6uPBKN0x3HV1tK9Rvic/vT/tq5nQ3+G3tvwNAD
         xV/bHKqQG/R/3PTiIN9PRANie31xMCVgOYAMb13ztQwARWFSYrasu7vvYqWhd5Hk0XT3
         OM6aAw96GXcma4OXnVF1QabQx4eecZbi9BeIUiZ/4ryI5KL3Fq3sG92hKIP4oioS3ZTu
         auAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732829973; x=1733434773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WHGkZjT+BST8jEoiCf8+VwNL9TcSADrFBmDOILWdt+A=;
        b=vofU1Fpuj5rNGLIeywMilqyiBNsnnUUm8BnvUrCciy/UK3yjeS1x8DQ8WtsKcQIsk6
         rvKVtC8TZ7JEtwkdQn5ZgE9AifWwo90shqQhzmLJ4zJJDDx7mW+ZTh+nxXfC++YnBwjH
         JNFkabLKzpW9GCMzt64z4oXFK3U/ve172FG/1c+QkC0RN5oNyfCPwKSmAsH0ps9dP6as
         AIhc14n3PWelHV9zo2i89rhLb5PkbjaOzKwJfsjQijx0i1YAIh/luA0IqmxC+vSlPCQx
         m5Vtsg102Y0zPw7KKEGfCCiH6iLPVSYHmhcF2yk5ljnMUUjPGhDDOG28Jg0mX0gDnRIT
         kGMg==
X-Gm-Message-State: AOJu0YxeBBqJ0O5Dsl0NISaGqzulh9sAvJVIFZX9f0k+yg7TqP3nWo8d
	qHFvoECT5CM+qb4Hcd59CPXyO28rhO9cttaD3rDvEb0Ad/RIPNSUtRpn/w==
X-Gm-Gg: ASbGnctcD72wHRfGEqP6/7dx3IEDpgm7weiJ2zxmBGuB/eMIu4LbTd+Cd5QfpxOZsZG
	gWWvVdmCFCFQNZokYFKxRXOWBcilpEllsckE8Pnr22t5Avi6dvEtQMKuNAXfuXA9QO7ZnTI1Lw2
	ElcrYvgqSRsq5BYqDZ/Ka8Ioii6+pUqQLhq5SfeJDOjLtnIs4O5E0rRJ024T0amAqm6qlSXTpXm
	Df1nnHgIGe6DheJEADFZASAfhoKHRJsRnQRZzwVix2jrvlR37a5iTTUB8cSyg+QPW8Bp/Q9De0=
X-Google-Smtp-Source: AGHT+IHTbYzQMcv4uOTf+vZiH/LyOt/Ci1aHS8RguzaStVsi1Q8hGplI5K2ih3CdqYUnvuqAWieTDg==
X-Received: by 2002:a05:600c:3111:b0:430:563a:b20a with SMTP id 5b1f17b1804b1-434a9dc01b2mr73363905e9.11.1732829973458;
        Thu, 28 Nov 2024 13:39:33 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0f7dccasm32974895e9.43.2024.11.28.13.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 13:39:32 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [meta-python][PATCH] packagegroup-meta-python: remove python3-isodate
Date: Thu, 28 Nov 2024 21:39:27 +0000
Message-ID: <20241128213927.3725-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Nov 2024 21:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114111

This recipe was located in oe-core but has now been removed.

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb       | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 72dfa792a..6866ed93c 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -196,7 +196,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-ipython \
     python3-ipython-genutils \
     python3-iso3166 \
-    python3-isodate \
     python3-isort \
     python3-itsdangerous \
     python3-javaobj-py3 \
-- 
2.43.0


