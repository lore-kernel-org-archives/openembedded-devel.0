Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web12.1009.1629567348521947346
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Aug 2021 10:35:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YeJEHfWt;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id k19so11554593pfc.11
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Aug 2021 10:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=umu56zORYF5eso1pY8q/hwvukQ7uAcDhiBSwC+wqIzQ=;
        b=YeJEHfWtsxwDa2/VwrITxOi33np1kwZOD21uB/uCblcmez0bG45X1t32+CyEYZ6jxc
         +iUG4OfXYvSBSAHUHDLBlLi+uXBScJ1nd75BW5rK0tXX5i4pEG19SFUeM8xOHGQa6txD
         fiBG9WMVliadDlpaYr6Ss0xC1kiZ0HP3mdZg4Zptz3qLYvCJ9gCtrUNlMak32sXCDuKk
         L4dDWELMGRZFAzoihnFYv8e70RXgL5u+gp+2lwyMeTFlSILQ1/ABTWLIY6h/+OEkPJA7
         i3AUuU9/KnNuF0zfU0WwMLhmsUbe64DOjYBZoT63/3nVuqs6sC03jKSRmbucW1KuaVd6
         1dRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=umu56zORYF5eso1pY8q/hwvukQ7uAcDhiBSwC+wqIzQ=;
        b=DQAt4mQv/Yvwdqk+u/S5AjmfsiQS9EuWpdQKndBWy8JT06ncIXFoDa1KqK0qkKw8xP
         hzeBqCH9BFME2eDTHdnPMc0YtaE5v9lAtdKwzmtyWPugQpUewPfH59Q8KR5aNjdyUDuq
         KIetigCNPpVJrUs0zcG3k4tjB0WcYYcDQiHpDQ+/p0mcYz1jOFs28punACYyv+ItWT0P
         XUOx6uQhilMFxk+HPsIOyKkgR4w9m4+9aq8LD3VSeZTR5hnNw3mjx0bD0dc3nwjn0tI0
         8rSzpImx98zrOhtq3CTw5BYoT9veH4AVyCkjKsiWqL1WeC7dSxtfJnRTYfmlmkOt4UHr
         kIrA==
X-Gm-Message-State: AOAM532PSOkkkX+o/BdW2PK33SbasavXWx5dVCPaP5MBwRH/36RZ8KLC
	KGfWOdQ72piUzwmBCvvQhauIVn8k5Vw=
X-Google-Smtp-Source: ABdhPJzMBlM79LOMPtVefBYC94C2/4QkoWA/GQE3WWI/e4RR7f+NQ7rKxshSrjivHDFYGg2o2jOU2w==
X-Received: by 2002:a63:cf0a:: with SMTP id j10mr24465794pgg.4.1629567347744;
        Sat, 21 Aug 2021 10:35:47 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:43c0:2d24:85b:da13])
        by smtp.gmail.com with ESMTPSA id n18sm10993315pfu.3.2021.08.21.10.35.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 10:35:47 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 3/7] fvwm: Package extra files and man pages
Date: Sat, 21 Aug 2021 10:35:37 -0700
Message-Id: <59715d3d2ecec96267adc4083b75a2621b669b3e.1629567241.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629567241.git.akuster808@gmail.com>
References: <cover.1629567241.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Avoids using installed-vs-shipped

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 566049b4f1ddc049c1f89a5838d1a71bb429faa3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb b/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb
index 51f5a4eca1..c93c510976 100644
--- a/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb
+++ b/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb
@@ -88,6 +88,8 @@ do_install_append() {
 # as well)
 PACKAGES = " \
     ${PN} \
+    ${PN}-extra \
+    ${PN}-doc \
     ${PN}-dbg \
 "
 
@@ -98,12 +100,16 @@ FILES_${PN} = " \
     ${datadir}/fvwm/ConfigFvwmDefaults \
 "
 
-RDEPENDS_${PN} = " \
-    xuser-account \
+FILES_${PN}-extra = " \
+    ${bindir} \
+    ${libexecdir} \
+    ${sysconfdir}/xdg/fvwm \
+"
+FILES_${PN}-doc = " \
+    ${mandir} \
+    ${datadir}/fvwm \
 "
 
-# by default a lot of stuff is installed and it's not easy to control what to
-# install, so install everything, but skip the check
-INSANE_SKIP_${PN} = " \
-    installed-vs-shipped \
+RDEPENDS_${PN} = " \
+    xuser-account \
 "
-- 
2.25.1

