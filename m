Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E75ADCAC5B5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 12:28:57 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.11197.1758716930966404913
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 05:28:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kFzYNeuR;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-631793a68b9so7687900a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 05:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758716929; x=1759321729; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fLa2aDwT6EG/VmbUr7bRxQc2HVPMedeL4jhbGRAxEAY=;
        b=kFzYNeuRd++wD125SjSxsfstOmliPVunBlpAPC4mJCrs7drqOFJPy29ZSlLJdVZwMr
         Woe+nZ98/+14/ojYmIkuc6lqld2hYP3Rb2WjSsG7A5hKhQkYlnynoEB8AzIbf5cphVLB
         H+ILuNl3iDjTaO9oNyMflAMr1sIXdTVsSH+8asdWjaQJVChOCnHXocZevh6Wqfkoba0s
         eWetzsxdRkLq47g1ojMchzq4yPPhWX/227SsFEC2k6E1B5wF6H0zVwvbzhyKOe9fUHHH
         pcIP7QpIYEKira5Cf3vGeKDOwyIVwUBJxOdlNVSzVJxIhNSHX/kOSmZZUpH6hOE4MGvJ
         sbPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758716929; x=1759321729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fLa2aDwT6EG/VmbUr7bRxQc2HVPMedeL4jhbGRAxEAY=;
        b=KHb7kwP3iG1AB1+Kp+jvcdkqbegUIXmph0MZPrxMUkmBH5uoYYWJmHz08AcHIXBE/N
         xEckSeeKO47/GaKbma356N2JybXP4aXvnQSNm2c57CnM8HEIdsCeFeaB2OeUMANH7xhh
         LVRM536SaBWuOGFHRPqTE5CNQY0e2r9tWdSsUiXxljop/rqCB1RbchzWlfo0ozKvioZk
         X+XEXZCjXuE6xIvg0lMY2kv3MLe3HsGg43wZ8KYtlV43RhHF2tSMi0donieVMwqoLpnd
         uZR+13rQGr2kC2fS3ubZp8HukR92sQkrladOj5+hGS14vur7FNZBuxjLAWTtdp8/pVYh
         Ag8w==
X-Gm-Message-State: AOJu0Ywewb9vg4vAn5fYwdl/TrCB9sRRD3jefUnmrkx+jaFoGIwcStbB
	aowGHLlCos6JbxIPPjQyWmaAnU4pdoFkr2t6WO69Gl7WtpKtGym/9Id4xbPgWA==
X-Gm-Gg: ASbGncsG5zwvy4bcnkrYH2pc7aYQ1pEFXW//xqFBBluquDOAg+A1AhjqgNo64f2vQL3
	oAdscuzFO7WPkKtMQFegcSq91C/HVqgu2XwCVmLom4wFCjQwcYp7IE40g7H362MdrGKf9CJRYgN
	WLMTlZJ3uIdbgJJTKLSS264WiIHdad1kvwL7k7381qRzr/wmPsQfgIvXbuIPd2675H4saVTQMla
	iXHz5eP9YAKF07HZXpMJrkCimKenRMkGF3OLqPXdj8LQgTzd6so7Ah9xanQhLCyIJ6A722/sl8z
	XzIcoo7pPUcRN4zHG1H1ndk9lDHP+93ve+cMd8bv8d0tJFgytyXsD1p2GWCFP4MnfGVZychcpBM
	7AlRSK7N5q3o2+oFqZYEM
X-Google-Smtp-Source: AGHT+IFRfz8yPiDbixpxsP7y77unNI8ISFVOhcRLeKcFXmqnHs/hjLiu3oOU59o9qAFFgiEGDEulAg==
X-Received: by 2002:a05:6402:2081:10b0:632:6c7:ef1 with SMTP id 4fb4d7f45d1cf-6346782871dmr4793523a12.29.1758716929225;
        Wed, 24 Sep 2025 05:28:49 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63469f30772sm3024835a12.22.2025.09.24.05.28.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:28:47 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 07/20] gnome-font-viewer: add opengl to REQUIRED_DISTRO_FEATURES
Date: Wed, 24 Sep 2025 14:28:25 +0200
Message-ID: <20250924122839.4184719-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924122839.4184719-1-skandigraun@gmail.com>
References: <20250924122839.4184719-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 12:28:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119810

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  ERROR: Nothing PROVIDES 'libadwaita' (but /build/layers/meta-openembedded/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_43.0.bb DEPENDS on or otherwise requires it)
  libadwaita was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'gnome-font-viewer', 'libadwaita']

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 052866b19632d0cce1c7295b3a94cf570a3f887e)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-gnome/gnome-font-viewer/gnome-font-viewer_42.0.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_42.0.bb b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_42.0.bb
index c14e57c7c0..cd0c9310a6 100644
--- a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_42.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_42.0.bb
@@ -14,7 +14,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gtk-icon-cache gettext features_check mime-xdg
 
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 SRC_URI[archive.sha256sum] = "cfa2b8dfff21a105a1a021dadfa213f13627e6a179a77c7b59fdcedaca848dcc"
 

