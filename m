Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDDC0C25B7E
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 18:10:48 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.3096.1716315040552100314
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 May 2024 11:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FNKUHeO+;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1ecddf96313so94110775ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 11:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716315040; x=1716919840; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T3r/+7eXM+R0U9mKqtzRrYn6WmyjZWLMSmMRGlJqbxA=;
        b=FNKUHeO+dzYvC/y3If4IGj5mtiRiiJp3j3LlwSK9iC4C7kIm8sZvsq4R9Km0XA5JPJ
         aZtnrYVAKbdoNSJSGKG/F1WScTJsmRHlFNuDLBJyCtavY4L6Zk9qvIigH6s/+ZDC9IDG
         /br+9Kg/CoKiTMS/BEox2pkqsT77dLKXWBYcurqhtyvyGnLSTfVqyOzHEI6DZNAwEJSE
         i4vC+wFjbW67uEYiR0iYt1hZtlCFIPHwywmG3X6XA6oOtbElzGK2VA4wRQMp+3dmwdwH
         mnEAYvj1Js9Tt1zz9b0OIkaGitpc0of9R3E8ISsgYzRofILyEPvIQDEZycQKm3gCLsKl
         Ig0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716315040; x=1716919840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T3r/+7eXM+R0U9mKqtzRrYn6WmyjZWLMSmMRGlJqbxA=;
        b=EbQoyYoXjwDflFYZidQWTJ1YfnVuho7Tif8c1HpC/ofjV+B7reFyq3v9sauZ8jDK/Z
         V52ZgQYJCkDXlPzyqzpEiGXDKWZB+krLnOsGp24AKi/lBrlRh86N96SUTFMR+LQ3gn9u
         NRw36qsgHEypiMxomAwdOgNXNyUGjOsQ9zt57e1kIT3Pmuyal/Edp/qEHEz46JqMFZ/l
         Gf8zzvdBEKI28aeKjovSHgsRrEHrywvP6kS/whe89ZNbzNYp59iEF+95Lf8Eu6aQvks0
         al5qKzAQfxq9J0pRdTVWZYOQPWCaiJ6MejA+k8yuNt+lp3Y0hEASrsielDI01sOYKUcR
         vwCg==
X-Gm-Message-State: AOJu0Yyv+NX2QiuXrWJDjTnp1tobT8VoiKPsNfGLneNF2WIHGu1zGr3M
	O1Osrc7CnqTQUaokU1HWp0ZutvR7YFr4eUBCacw5DVsPec6PLyePJWl7uK56i+M=
X-Google-Smtp-Source: AGHT+IEjjVfjJRxBSGk1bvH1zCQr1zLUkB0gep53mFANYYLI1N8LfJw8udHgMLyTBZs0UQtpkVQyEg==
X-Received: by 2002:a17:903:2447:b0:1f2:f6ca:fbd8 with SMTP id d9443c01a7336-1f2f6cb00a5mr123564975ad.8.1716315039817;
        Tue, 21 May 2024 11:10:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c136354sm224799075ad.244.2024.05.21.11.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 11:10:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][ 14/22] menulibre: Upgrade to 2.4.0
Date: Tue, 21 May 2024 11:10:15 -0700
Message-ID: <20240521181024.426176-14-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521181024.426176-1-raj.khem@gmail.com>
References: <20240521181024.426176-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 18:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110463

Switch SRC_URI to github release artifacts

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../menulibre/{menulibre_2.3.2.bb => menulibre_2.4.0.bb}     | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-apps/menulibre/{menulibre_2.3.2.bb => menulibre_2.4.0.bb} (83%)

diff --git a/meta-xfce/recipes-apps/menulibre/menulibre_2.3.2.bb b/meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb
similarity index 83%
rename from meta-xfce/recipes-apps/menulibre/menulibre_2.3.2.bb
rename to meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb
index 7491b509cc..71d3ab4d29 100644
--- a/meta-xfce/recipes-apps/menulibre/menulibre_2.3.2.bb
+++ b/meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb
@@ -12,9 +12,8 @@ DEPENDS = " \
 inherit setuptools3_legacy gtk-icon-cache features_check
 REQUIRED_DISTRO_FEATURES = "x11 gobject-introspection-data"
 
-SRC_URI = "git://github.com/bluesabre/menulibre.git;protocol=https;branch=master"
-SRCREV = "94bef4060714fa65c7246c25b87410b52a149f94"
-S = "${WORKDIR}/git"
+SRC_URI = "https://github.com/bluesabre/${BPN}/releases/download/${BP}/${BP}.tar.gz"
+SRC_URI[sha256sum] = "d906acf9cc13b0e15b8e342ae9aab8b0680db336a382d0c42f5d5f465f593c9f"
 
 do_compile[noexec] = "1"
 
-- 
2.45.1


