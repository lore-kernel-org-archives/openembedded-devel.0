Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web08.10277.1605380670018772927
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2020 11:04:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tehH8mGa;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 34so6214946pgp.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2020 11:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1R/rymQqaaiExnSDP3QtZ8kQogpl3rKu/StBYIV9JdY=;
        b=tehH8mGaj19JKkd4DLCv7faLGfjDxXU09m2AiXG5ZIrWTWiIAc2PLwhgNCali4CPcm
         Yhh65cyK8eKYFuHF0MAnXQIROE0rH0xIQYjwK4id+j7w5a2+KCDLDHlEbJj+meKvYbmi
         PktUpLm9GmZd0iV/eDHGOO/0pWNhQLsUs1syb8y/bWdszxXSrk9A909Fba9bCrT26mph
         D2an1R2wf/3u3UUDhRrq1iNJoTYVCklcXE5fXelz9QRBcjRYDO3LzxL4wE5aj8/qjHwZ
         pmKdyyQsWAJvrvp9+V0yawKVrsz/oYNaBCYXHEqh+Ghi3VJtuQGp80KYVM67FgJkP+/r
         UB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1R/rymQqaaiExnSDP3QtZ8kQogpl3rKu/StBYIV9JdY=;
        b=rO1x44cM2CRfb4ylHS/AWhQRFVqnVwVItgQavGBpBK9M5ddLPX4E4vvfVnQkGnpD7S
         gFABZ1msuUrsZyX3S3nHsdf+3GGSniGqcsb844qPc952dAEBaTT/MDqjRKST2Bop74xk
         XuAFQ/HX2X3DROn4Rx2Cqd0XWiQ2ckPz2Ie0p1G330KLlbArK5s9LMFZz3Zm3Uiqblit
         m1EiHyRy1U9lHuudtSkqKe0Jb1BrDU24XR6dHOOTOUhYYxYVuXkXe9rf6qgdDm6djVQV
         5CnsydXuLjFRuG5MIcOkFbM8gTpI2h9aglSqV0NssLZNLh5qlsx7g01yQ4Of9dWULyvS
         peIQ==
X-Gm-Message-State: AOAM533HC/iiesuyu4MOpkLrhL2Jw5/80WrdLhXM4kvVFlwvyqSGX1B4
	hDFnXK0T5xDYa1dQVWe5ObwgbztmTPSS4QG4
X-Google-Smtp-Source: ABdhPJwXn19I9FTdy+6JCYFetVW34orI/JQcob6bk79EfZHZDmM8jg9QGmF9r7C7Si6uQEi++kFQjA==
X-Received: by 2002:aa7:9ddb:0:b029:18b:396b:70a3 with SMTP id g27-20020aa79ddb0000b029018b396b70a3mr7259158pfq.3.1605380669281;
        Sat, 14 Nov 2020 11:04:29 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id 82sm13274444pfv.149.2020.11.14.11.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 11:04:28 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 4/5] spece: Add leading whitespace for append operator
Date: Sat, 14 Nov 2020 11:04:21 -0800
Message-Id: <20201114190422.2777143-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201114190422.2777143-1-raj.khem@gmail.com>
References: <20201114190422.2777143-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/spice/spice_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index 9d3a0e6cb5..fad8b639e6 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -32,7 +32,7 @@ S = "${WORKDIR}/git"
 inherit autotools gettext python3native python3-dir pkgconfig
 
 DEPENDS += "spice-protocol jpeg pixman alsa-lib glib-2.0 python3-pyparsing-native python3-six-native glib-2.0-native"
-DEPENDS_append_class-nativesdk = "nativesdk-openssl"
+DEPENDS_append_class-nativesdk = " nativesdk-openssl"
 
 export PYTHON="${STAGING_BINDIR_NATIVE}/python3-native/python3"
 
-- 
2.29.2

