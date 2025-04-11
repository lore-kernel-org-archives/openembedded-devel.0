Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F693C369A6
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 00:42:27 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.14024.1744332137077584166
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Apr 2025 17:42:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gcZgOToK;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-736c3e7b390so1352257b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 17:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744332136; x=1744936936; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d1of0wgCXrJNJz1YWQ+slG/ZGAqySsTwInmzsa3BuMY=;
        b=gcZgOToKtG/NhYpFO2Fg9C5yxkB5OOBPWO9gO6W1o9SUZmKS7b1fHvtploVto0ahz6
         rzQm4H5LQpa0z8FBlSXPL+t85gnzUBJdRQbZAF2TE35zFaod1hGIbUYHxFj7tkIdOjSk
         go5CukPJ1DZ+hi6lLlcwndXavvYxe1u73mdg6RZhtAQ21LGb+pgunvRMvYGWmvlGEMBk
         Dn7FTfHWTjZ7qROn57n1kMbCdOpdke2KiZynHxVJlUiMhnpf0F7kfhhfbvrKT7ZRK6Yx
         y+NBzp1fnuBr5JcOh9ubSj+0OH/iHZelgnZ5mCF8Bn4V3XVjXUA3Pb1Cn9SFkPeleNp2
         oyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744332136; x=1744936936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d1of0wgCXrJNJz1YWQ+slG/ZGAqySsTwInmzsa3BuMY=;
        b=D0gHp+5DSxuap9NHaW2a/av5A3mMrTMD4+/JmhlyAEBCJSK32r9CQUqN3ye7HoouoQ
         hyiqfvsKDf9iahgzwG+xFssGvyxYc+OLNJftyZ3yBBBV0ioQa3ZIQKRguZSiWLtIwiU8
         /R5GEeBoUnTAzxDUAGr4vgWbi87e1e5uwv/QtVJkWAVgl91cTgIP2JUMVbg7Zka9ytUd
         iN1cNZ6uce/JnuXsAIocNRyI6QbKHvLqdBqRXnWRzV78q4L09g1y1c6UtnDWncJ3tvPN
         jG9wqvHP5n7bUNLLTDFZ5dDRr1rQfr3YXOOc8w6jQXcaNC965QtK9zzXy+jouJgZs8uT
         dpyA==
X-Gm-Message-State: AOJu0YzITh+P+gBtQSl92bXqAIZgOgsE6JK5dflTuBc9uMdA2OxIvup9
	YBTdk3f23ryHB/PawtM+fXPVWp/Fyw2axz2I16Zre42G4HS95Dgsmum65Rv6
X-Gm-Gg: ASbGncuazr90AomR35ZtLe/h1+XN3qb0tgZGcpg6kGXv66d7WE8PGpPurI4ohSRJWFL
	5QeJuSkXA3d8jGkmnHFyXAmljhMnvRdzTPZVivpCwQPQLVSTc3c19AynTHnLBqs17Nffp/5eRmo
	UvkxUUJdMJsFXRax1ibt+/cDhHFkT3SbfB+T47QhZ0B5LwTTo1qSJlORGGWo5sGb2VjSQQEToYq
	IuVLdTS7bzY433AJn8qeCsWkypIi6xn/PTLVRlSGAYRhHmnirM67eO9h/AcAwqpJtKPMnmPC2uj
	e+J25gZqDtysVm3PwnqkPShkBjNtJPsH
X-Google-Smtp-Source: AGHT+IFIPkWKCfG85nukypr7BD18H1oec6qXarvQPQwTW5Or/ThnHSqVjGUr62NDno7yPMdW2hymTg==
X-Received: by 2002:a05:6a21:999b:b0:1f5:86ce:126a with SMTP id adf61e73a8af0-201799906f2mr1338562637.40.1744332136171;
        Thu, 10 Apr 2025 17:42:16 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c6464sm226987b3a.64.2025.04.10.17.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:42:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 11/12] pamela: Switch to using PEP-517 build backend
Date: Thu, 10 Apr 2025 17:42:00 -0700
Message-ID: <20250411004201.3826913-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411004201.3826913-1-raj.khem@gmail.com>
References: <20250411004201.3826913-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 00:42:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116785

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/pamela_1.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/pamela_1.2.0.bb b/meta-python/recipes-devtools/python/pamela_1.2.0.bb
index ff87e187ca..d343458aea 100644
--- a/meta-python/recipes-devtools/python/pamela_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/pamela_1.2.0.bb
@@ -6,7 +6,7 @@ SRC_URI[sha256sum] = "0ea6e2a99dded8c7783a4a06f2d31f5bdcad894d79101e8f09322e387a
 
 PYPI_PACKAGE = "pamela"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} = "libpam"
 

