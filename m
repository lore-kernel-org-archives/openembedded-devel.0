Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5835CCD185
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 20:09:55 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.28098.1760558986364266934
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Oct 2025 13:09:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aBX26qp0;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b555ab7fabaso6447723a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 13:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760558985; x=1761163785; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhtfzdPFsvs8UwRoqGVroiZHAm67rK0PJylQIe3AHTY=;
        b=aBX26qp0wYJu767yeYNF+u7tKyClU19gd7wZNk/vnGQrX5fhwddXq2yFloE7YQITZG
         V90XbE/0UJWu2xBlkWix98Gvh5VzAFSRWntNgdV++pX5N6L6JUeDvIjqJlCVgZcRalkT
         MzXmJK2nOkuzM4OtxfPfSU/WXqOEc6E5OEynVYif+FdPLHgOzAMS2x6bYl08JU2bX5Fs
         NKHYRjB09NR8Yl7lpPt+SoaUpGMYCd7o068GvDWGj0QwQFN5iWTqIgXG3p3I0/b1UyG9
         dzqo1V4BsR29M8lCDlQDS7QQ+cSMPq4GF+0LoS/cTseOiSjqbfp6T96piLGXxtpyPgwg
         2HrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760558985; x=1761163785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hhtfzdPFsvs8UwRoqGVroiZHAm67rK0PJylQIe3AHTY=;
        b=WrlxN53zXGRkSU4wVDoc/U7kxI4CmjMFwtbFqz9xkc8bomIfWrPR+19RCJSEDYSKjq
         IwU3469AKL1mS7mJVfmFEXwXyK+r4jWStyi93q3E8vB17gS+wQdjBNKgqrd0/C5Xrfmn
         lpcKV4+1wDGVoIwtMUyxIIwyeC9wgj0ui9BI/8Fi7beqwB5/Qgv3vFAW5oaQ9XhywQ6u
         +7dRZSPPRIiAyclaXrMbfhB7lhYk2uoBqVileKefylAi3zFcxxz49kCycDLXMBJVQRRZ
         nnktfY6vYTFVdnff5NsmcCPJFuWnmExzOS6mub5YtpDGun2emzrEVruORIubhJpP/2UH
         +kxQ==
X-Gm-Message-State: AOJu0YwQbFcMrWhqq2jtPpIWZANqFnxnfsay8+urqdWrSHFs40yGBezC
	nnCVaqO1hDwb3jKGfdCnyX1uVMvZdPK0LUhHDyiGBMpCDEzuwPUSsAGt59y+VmWf
X-Gm-Gg: ASbGncuzxZhF73QRbbF/UUnf0Qou6yDB0TMiBu0rR4pOHb/45mzGooM+rQzzbJooEYS
	IuqCpW/WG+oXJ8W/ilQ1q84CtHAfiBXH7O0zNdSdwXuLIB0EJtw4d9rQMEXr3PgxR7uioEB4ty7
	6D4HuAPWgFPtoK7pcmC7lqXPIDEKh1adB2307OG+DBIb+CLOB1SA6bfMIng9PGL5H4LX3p1yNlE
	SJlPf8algmnfUcUz0QZmAj2jW29PLiNtJhO7mBtrwZ+TQYqa8UJM9/SSESEPdY+Pu2G27MaY9Y9
	xyfih4sVh+8rKRswtAv94skARo7UicVS34DhLRmhu1OKXf0gS2nqTy7BcYkumfbOwlTcytflhZL
	IQIaP45Hr9TGbjFSb6QlmrL2I3+GZN2AMiliqA2tnbl0//rgJzpk6L3scYHNjoUmQ3bfiJiyuN8
	G6p3iwrNHCXlCHNlMVh5aUc8noL4FeTmziO2p1wUsR2UHyGpJFHtPWD/yaVkKQ0vME22o/3ypQD
	tGUNUzfdEQ=
X-Google-Smtp-Source: AGHT+IE22UHbxGb4fz3Qs9FIaFx8LqecMyJstNPDpTnq9wobe63/bCeFSymu61RQ4t8CbGq0gt+gkw==
X-Received: by 2002:a17:903:3c4d:b0:267:44e6:11d3 with SMTP id d9443c01a7336-29027379986mr381282095ad.21.1760558985257;
        Wed, 15 Oct 2025 13:09:45 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::a529])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099313b28sm5181325ad.3.2025.10.15.13.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 13:09:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-lazy-object-proxy: Remove __pycache__ from packaging
Date: Wed, 15 Oct 2025 13:09:42 -0700
Message-ID: <20251015200942.996584-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015200942.996584-1-raj.khem@gmail.com>
References: <20251015200942.996584-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 20:09:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120715

They make the package non-reproducible morever these are cache files anyway

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-lazy-object-proxy_1.12.0.bb               | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.12.0.bb b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.12.0.bb
index b0296dfc95..acd84efd21 100644
--- a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.12.0.bb
@@ -11,3 +11,8 @@ SRC_URI[sha256sum] = "1f5a462d92fd0cfb82f1fab28b51bfb209fabbe6aabf7f0d51472c0c12
 PYPI_PACKAGE = "lazy_object_proxy"

 inherit pypi python_setuptools_build_meta
+
+do_install:append() {
+	# contain moddate, makes is non-reproducible
+	rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/lazy_object_proxy/__pycache__/*.cpython-*.pyc
+}

