Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B356EC5DF69
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:11:01 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27842.1786651854300339406
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:10:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IvaIiMut;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cc61541f8cso18840045ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651854; x=1787256654; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hurrd8TD+U2C+X9OVvVUrM3z7rNQpKXQqTkGPxoScJ0=;
        b=IvaIiMutgp6rieJ1y2Ad/OZ00gho+E1NWm3PEaaNcUKmTYLDznBUr1lhPNdvybHB/E
         w3jSI4fUxZNmxLFywp8Z7fo1h082UQduqT7TGqIFfGIWuNgk2gtsVyIua9GHpxPlPfhq
         Bf0ABTZOtt+ARzfCaOXcFgIEJOeHP3/pdyMQMFEapnEqDpxIj+zqf+sVT+bvbn5Eo0eM
         AX2ZuyZSNoC3PG5RXoJokzDG7VefiSRpJ3d73XbqABmuLmgepSHrALh9MjWpYQRks0yh
         r1rpL65PMfqL8Lv4V0Vp8FLlKLPLRBL5qVmJabkuJUaM8HHYIrV4sWu9O4PjkT0pWeuZ
         papA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651854; x=1787256654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hurrd8TD+U2C+X9OVvVUrM3z7rNQpKXQqTkGPxoScJ0=;
        b=WmTVxdNSAyIGdylxMMi8G4Wob8kyeZ0PhH+Eh9efBLTgQmJcSBCm3nY2s27ZpnM39Y
         AVwb5H6nHRk0chskZKURlvFeo/oGoUKVarK/oBaIxS3jS/zW7tRSiFyjN05onW1ysbtW
         sefRsRbgCsDnaVQd+zAG74sBRo6Qkhjod8EsSXucReXKj2dWZQuYCUYNQArliRGWQF2v
         XeFszUAgHbHLEEKRssyEb1n2bIGSNc2kVdFN+cGBhGx/nC9MQ/pmbg3Xv698sDw55wdt
         KryVwpeBWL4XKTreKmCYQJwLBqz90r5rIR0caS+q+hEEGjxRSk1ffnZ29CgCJi/1rVGj
         v/ZA==
X-Gm-Message-State: AOJu0YyCDbc6UcQZ5mS3r+MYychYG0urFNoitS2ITl//dPoQ5hWuc8zN
	8XXYEGuOQpFCuDhu6h1H+7mGWin/hEmCCAAI7f1gA50m/horQxQbYg2q/jAgPupn
X-Gm-Gg: AR+sD10X6UZDajyqFjN87DhiwnUZd5CC20lqmrbIyeQO4vrTHVy8Z/fjicwgma1a4nC
	JrYKpZvpR3kaYZtsNAaSXecNUuClmeeX2d1ch+U/XorJ0eDH7zGMgUkskOSwIj6D/NfShWdxeuU
	2DPYacrP/JJeCAljqP2P8JrxqQo7TbXt+5rGb7JfCzZ316iHVQhzXBLPwJN2qP4vS8tq3f6VLlj
	lTKqH0QwQAZD4FZAsE+LjoR1cKA1SGN4zJAn+DvCtw9TQXbBggQeUH6aSd0evtwDtUUa+dnwUMz
	5MatVL89ve+yPRsKrwY3aAMo4Ft8VL/ZQbgrTal9KUkMesQlIC7Ldb29A5rr4kyC6EdQvlk5CKz
	RCfO7IBPXOLHT8vKN2Hw9kY3PPuLsdfjqk6b52K6IGCMkE+3dORQykts9bpRDRKoDldHISAwTKb
	o2LLqQeQJBl8x++H52bAX5qlDuriozD2G7bydwqTjS1qs5m79t1LLHwFSxOe2u9TKENGAGKeftc
	/qsPbdweCD9gpzXxPqWohnfUlvX0haYlb26ID/kBVimkq9EW3JDaieV5X8C3UABQT9UYqxu+IhR
	TQE4+EjolA8a7Js7PUctgAo/a2ZvRAxSOOGLXtg0CZheaMZwAZb9Vai2FH4WCTNd9cf3vkHy74m
	Ah95g8njF+oaMifYx5JNF/1t0isuKROn/QhNKP7S4bKwX0g==
X-Received: by 2002:a17:903:1a0d:b0:2d2:72b6:556b with SMTP id d9443c01a7336-2d37f7b7ca7mr102965675ad.13.1786651853591;
        Thu, 13 Aug 2026 13:10:53 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:10:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 77/80] python3-zopeinterface: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:08:31 -0700
Message-ID: <20260813200834.1302829-77-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:11:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129021

setuptools3.bbclass and python_setuptools_build_meta.bbclass no longer
add python3-wheel-native to DEPENDS by default, following oe-core
commit e546c697b7 ("classes/setuptools3: remove wheel dependency"),
since setuptools >= 70.1.0 no longer needs the external wheel package
to build a wheel.

This recipe's pyproject.toml/setup.py still declares wheel as a build
requirement, so pyproject-build's --no-isolation dependency check now
fails:

  ERROR Unmet dependencies (checked against .../recipe-sysroot-native/usr/bin/nativepython3):
  	wheel
  		wanted: any
  		found: not installed

Add python3-wheel-native to DEPENDS directly to satisfy it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-devtools/python/python3-zopeinterface_8.5.bb        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-zopeinterface_8.5.bb b/meta-python/recipes-devtools/python/python3-zopeinterface_8.5.bb
index a148622f13..f9fd55ff6f 100644
--- a/meta-python/recipes-devtools/python/python3-zopeinterface_8.5.bb
+++ b/meta-python/recipes-devtools/python/python3-zopeinterface_8.5.bb
@@ -6,6 +6,8 @@ PYPI_PACKAGE = "zope_interface"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
+
+DEPENDS += "python3-wheel-native"
 SRC_URI[sha256sum] = "7a3ba1c5877f0f3e3906b02ddf793abed2becc2948116414ce0e1dd820b68d6d"
 PACKAGES =. "${PN}-test "
 

