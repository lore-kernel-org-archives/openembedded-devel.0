Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A79DCD3E1AD
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:42 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.29949.1729278796793625325
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SNJCAyqN;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e297bd161e0so2292356276.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278796; x=1729883596; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNisbtjjdskOWUwBamykYTrS57IbvPEWKP0Y3Q8pZI8=;
        b=SNJCAyqN6MzDLZCfe8Q9RBKD5OY00AYb/8mhJxMNIKr9jvZxjvhua0PekCgQv6Sf3/
         GnFC/OePY1y38zN+7W4LfktcdNFQHCkTmrDEmZCCpG2GFt/OfvnJWAhghI8n5lp8EXUO
         2U8v4A+is/KUu3H3sxb8UY951oEZUEV3aU5uJ29R3LH66+iHvMln8zmNevvHr5at099k
         gNmDUdhaKQZZJQeM4YplxlkRmVbvOz1zrvvx7Ol6YVf5xtrXnHa9AYDeTB6rFvPvEXap
         QDR48Y00lLo+zTotMi+FHZzUfGpwwUmyfxUkQj1VQUilg2dTL8ehEl+5O6tQqWnUku4o
         dtyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278796; x=1729883596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cNisbtjjdskOWUwBamykYTrS57IbvPEWKP0Y3Q8pZI8=;
        b=NrVZtS4oxdxXsKqG7/7tNCNEkqVSb1YGTsQaF955ztgN2unGxwA32TPaRZbZhl51DD
         wzk4c+lLa09pqB808+zIHX+6yg7yIbdGnFOtPxOiGKWJCrdD8zU1TDgejimOSP+xWdT6
         poDSBOzH7ECxNiRHz4O0ZT+sQWmpEnsi8+M9Cxnq/6SvJuO1tWNN7LB7hajIYch0TM0+
         8uwsfRgowwCS4V5VGDsQCSOTpAKX1ryI1aHAqlBtnLwBUGMa+Z7OFglVLkBf7cRNaS0h
         LvVQLR2ywA6sFROCvEHw7G3lXfyenwtejj2EPWkXRsOuhe/pYT4HXGObHCH4DNrTY8J2
         5P/g==
X-Gm-Message-State: AOJu0Yx7k9IZA1nDBEGsg2dSLOBtSBNP2wY2O0xJrs2sUooKdbpsrCNa
	RJ/CEnKEwI6pzyTcLrvus5Y24QigK2GW3i73vk38heBp8CFoKHA88Kfs0A==
X-Google-Smtp-Source: AGHT+IE8zK/jgmNV0rMkBhRsEybosWTtohbD+qpVv/toUXpzsco7CzLQzp1bNMEKW0UToXbT5vOUwQ==
X-Received: by 2002:a05:690c:f10:b0:6e2:1864:cf14 with SMTP id 00721157ae682-6e5bf749a5amr41333997b3.8.1729278795416;
        Fri, 18 Oct 2024 12:13:15 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:15 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 07/68] python-flask-bootstrap.inc: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:05:54 -0400
Message-ID: <20241018191101.25184-8-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112994

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python-flask-bootstrap.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-flask-bootstrap.inc b/meta-python/recipes-devtools/python/python-flask-bootstrap.inc
index 24c76ce94..e476b41ad 100644
--- a/meta-python/recipes-devtools/python/python-flask-bootstrap.inc
+++ b/meta-python/recipes-devtools/python/python-flask-bootstrap.inc
@@ -2,7 +2,6 @@ DESCRIPTION = "An extension that includes Bootstrap in your project, without any
 LICENSE = "Apache-2.0 & MIT & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a03749709f06118a17349deb5a210619"
 
-SRC_URI[md5sum] = "e40d50f5c5b6438c1c6200a6f2871f81"
 SRC_URI[sha256sum] = "cb08ed940183f6343a64e465e83b3a3f13c53e1baabb8d72b5da4545ef123ac8"
 
 PYPI_PACKAGE = "Flask-Bootstrap"
-- 
2.43.0


