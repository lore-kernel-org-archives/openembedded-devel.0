Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14447CAC5B7
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 12:29:08 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.11209.1758716944329758398
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 05:29:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XJ2Vd6M9;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-62ec5f750f7so11370818a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 05:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758716943; x=1759321743; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U33dN7pdCNPAP5kbk1lfDZwuUhURal9BkxVllnuvaTc=;
        b=XJ2Vd6M9vUxWb15k8gtN6AlN/uxIMPd3koTEMt9AcHJYcz/Av100RhS17o7TtY1/hh
         gForv/0GgcUljgvghVslSV0E842xQZdWdZ7PP3sYw6rbKFntcKH/Fx4R2S0fsSnvZ7l3
         0nAtnYPnKdA0cTzT6l2ZHrWeE8MRW4u+jR2zZ7g70cxxsCESc926dT2CTeXK440cJUEK
         s3Gxn9IksPkl6sEGV8cN3b7AQf9LLd3bGkTqhWZosQn9B/VWDquq0GMdAWEEiGgs74Bq
         GKZylO+Rov8QG7XLbiCWWbWjosDiWe+X0Kbni543SQRscuORn5Q6QXQ+9Ud4z6ehlDPF
         oH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758716943; x=1759321743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U33dN7pdCNPAP5kbk1lfDZwuUhURal9BkxVllnuvaTc=;
        b=UpErkVvZXzKk5n+r+JTmZXSnw/eBwBuSjg7dfxJHkY7+MVqTfiSMr/ETt/DqaBkPFV
         W48ncAbr9/qyVNwDoD1hSmg4vl/oBzYPehhGGa8A/CfiT2bJGkYpFSzQn9dyc+ZcKff5
         442m0Ed4NfQp54O8hetplgAhEVRRRWkWJzMyO1Bx++3LuQ+c9OZ3x+eCpT1CzlzikzZ7
         yhCLKInAHApRQEazIEXRVyIjNtCj2BbZnUa1IXL2Hlz3jUVyZuYFNv4nf4uTKgl4aCLs
         6xv4JG4/JltkGoKZqk8l8NiZcWm1OEtgvq/mM76PxC+FYt0ligVsXIqXsu3UWnqVvOT+
         4dkQ==
X-Gm-Message-State: AOJu0Yyp9WtNGWn+SEsGXHD3O9NjksHfze/fQlYlBXvxlYdPIZ+OrkPj
	ayogleDVwEqRRQBz2+mbldkJXbscN9VHnJ5EXrxhn9RqEQRQK6o9g5lKF5uckQ==
X-Gm-Gg: ASbGncvT4R6iisN4j6XszPQ6SMfAnGkMZOxtP9qRijZu5kW2SuQ5O2JgF4LK86ghFQZ
	wJwliU3pbVLQ6RMFhGXxeF8H6/jz5LW6MHFp5FoGa9MNncJC99TEjWTlD+yNH75v97bLE2BKb10
	PKXkYvKwLIGjce6IlDgAApTGyxbSqjJEf5aJ0P33pYszuJ3IUwxATajhzjWgnlFsgp5wSWBaNaQ
	mCEVRfj6tWJssHYwznXZsVEhe0Ymhk9JrDBtLor41pa2hoJ9tdr68uC8YeYg902blR9p33/Zcxf
	ioB1CbRFdmf5XAmp7sOwXe45EOLI0vYWAggeJYDB8xKfQwkGVi41qFI1Cg6qRfFIRRDD7edm/SH
	jiYz/D+Sth7aX0UfbPfJK
X-Google-Smtp-Source: AGHT+IEMqDhsJk3SoFNuEWRkanoVIRittqB8fJTK0B/KFaBWNmD84b6Z6zisNh9XDIud88MsYfSjGg==
X-Received: by 2002:a05:6402:2554:b0:633:bb72:da49 with SMTP id 4fb4d7f45d1cf-634677799dfmr5621456a12.9.1758716942558;
        Wed, 24 Sep 2025 05:29:02 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63469f30772sm3024835a12.22.2025.09.24.05.29.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:29:01 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 17/20] nautilus: add opengl to REQUIRED_DISTRO_FEATURES
Date: Wed, 24 Sep 2025 14:28:35 +0200
Message-ID: <20250924122839.4184719-18-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924122839.4184719-1-skandigraun@gmail.com>
References: <20250924122839.4184719-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 12:29:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119820

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  ERROR: Nothing PROVIDES 'gnome-desktop' (but /build/layers/meta-openembedded/meta-gnome/recipes-gnome/nautilus/nautilus_42.2.bb DEPENDS on or otherwise requires it)
  gnome-desktop was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'nautilus', 'gnome-desktop']

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit dd10f8edaae118f8fc1e51c89efb006826a40769)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gnome/nautilus/nautilus_42.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_42.1.1.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_42.1.1.bb
index 6d942204f6..a36ccec472 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_42.1.1.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_42.1.1.bb
@@ -23,7 +23,7 @@ def gnome_verdir(v):
 
 SRC_URI[archive.sha256sum] = "8519d4565e842aa3d31d0fe39b21d48ac54edc0f0658fe1d8ea2da4e704c1b66"
 
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 EXTRA_OEMESON += " \
     -Dtests=none \

