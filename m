Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web12.15416.1599908127287861822
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Sep 2020 03:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OkthAHAK;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id c8so12898028edv.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Sep 2020 03:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BzUQvbDaN06gLwxVa6MYv62HycjIhKcEqyYlPdzKjKc=;
        b=OkthAHAKuBsysPKT8B9RiYj3kTyVvCj3+SnWY89+s4HU9y8WmFA2P0WOCrPh+Zpme+
         S3mgfWv87lf1g6iuCP309qBN6Ko9z5Cr/YJPT/bDS04WqF7Kvso1VFLmJbuua468RDWf
         93oH1Kll3uXuE42T7VmmnUAFTys9xPS7la+81ngTW0I2CRah/+3+6LSjC9HMHERW6kHB
         qoItL0jTIgcrjEsZX+K0i203uM9YIbpOGHSHepcjMGcp3aHvoF7xZZccVwRNg3nnTmu0
         ZwyCdTGHp+VvCpPfcZYwxtkNnSAG6JRJdgb16pQXQEE3BzyaPs+TPGXEGbUjOWv+2YUP
         wE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BzUQvbDaN06gLwxVa6MYv62HycjIhKcEqyYlPdzKjKc=;
        b=ojEbnxY8jkmGz9O6k2qma/IDJKJm+6Wk524fMcjx/KFtapWRAUKdes+oyB0Mgs4aw5
         hgJDDrEiVNxp4QRl+U+JVLwgVQx1ErSxl29ySAdLwvImNfJlyMhOPlzyFuGtaT8W9Hpt
         iy4bZZmqEKFiUKxlIA9ARowHMfWpdV8lv8VDJIC3dlfIx5jIVgzBAyHbAUBumsZnholA
         hXh9OASx2LwtOxKzMHe0Ux3aG3DvhY5Puv1aLfWilZSZpcVIp5ke1zBkFbnfVbpYFqLq
         Bsq5QY74FN0wG/UipLKX966p1E2PdFpA8pIMjQvvKTDAW8ZwPu91TqYztTSJtD4B8qNV
         4s3w==
X-Gm-Message-State: AOAM5315cssKvpxkgojuhdiuEru9oJbHWNXSWudBbdrPJeC4Dc09Plsi
	Ygxk8oPL6hqBjEj0V5aF0sHEO14BDyg=
X-Google-Smtp-Source: ABdhPJyaTEpvFnafBD5rdFJh2IehfJR5FoVhQFiWkCTgi9DUoy5B2WL+j970CZEElvgu4KHb0f57Rg==
X-Received: by 2002:a05:6402:c15:: with SMTP id co21mr7388378edb.268.1599908125279;
        Sat, 12 Sep 2020 03:55:25 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f09d547e003a5d689f02ebc.dip0.t-ipconnect.de. [2003:f0:7f09:d547:e003:a5d6:89f0:2ebc])
        by smtp.gmail.com with ESMTPSA id n4sm2984650ejj.19.2020.09.12.03.55.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 03:55:24 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/3] gedit: add source-code-pro-fonts to RRECOMMENDS
Date: Sat, 12 Sep 2020 12:55:14 +0200
Message-Id: <20200912105515.72222-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200912105515.72222-1-schnitzeltony@gmail.com>
References: <20200912105515.72222-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Would call gedit almost unusable without source-code-pro-fonts

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb b/meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb
index 75f1737c62..afd9146ac8 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb
@@ -36,3 +36,4 @@ FILES_${PN}-python += " \
     ${PYTHON_SITEPACKAGES_DIR} \
 "
 
+RRECOMMENDS_${PN} += "source-code-pro-fonts"
-- 
2.26.2

