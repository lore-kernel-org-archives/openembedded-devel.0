Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.31185.1612759091310802466
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 20:38:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Td6aRrtv;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id j11so7128518plt.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Feb 2021 20:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dm40YUxLf1fpbByChIUgdC0s2EwuLP07gtq5gAM/k2k=;
        b=Td6aRrtvV9hVWm/1IpRM7VuBk0W9ZpGbKMdW9veJnA0FMwqkDEjceZQY1vGJzNwDPe
         DNuFgAeowgHzb/MVwUplRwjlJck9pAe1nA/b0kvIWmz4lLSmPu3xC0Kwf8Keo+39BGOE
         6+x4JEC2H2xlqGAP5v90t3R1+LWRIGKRwoW1SV7ghje1EsOcFexolJMoZjGkTCtZdDFO
         Q3XYfqy7f1ZrduZgQ13/7l9gVA+YAX2bsPATyga0I22/v1VIT1L/AEJPHo2xi3xt61Sf
         gKFiDn1hKn7UwSscHfNZh0CkLeOmoEMp2Q2u4Y7Xw6G/V7ZNw/jmqKm09U5dC5u3VlN6
         u+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dm40YUxLf1fpbByChIUgdC0s2EwuLP07gtq5gAM/k2k=;
        b=SIpM7jYUFM+uigH9oWJ+6rSixogenRKGyh8gmbvZ9DTEqDvoGlj/QuvoaY00tj3adL
         H6a7gbUGEhFiffNXRdI1AcuoPq5E1pH6tTw52+gd7Om/cst3Hra3Gpltt7rkla3fWQQl
         FwW7SaWl/7IC8JEJRbo8pEyW5fy3bNaWn+Hj40upzDG9VPmrsd12/1erVeMth9yNNqnr
         qgPZjRU6OvSMUpgOWyEHNUi5ZLaH0n7T3HrvROrT7JRNGVVOcqKg5koj1c6McFBVMIF3
         +x2lzvzPIO7l3a2j5DEdTlKtelWW8FGfBevMiNwMM8jbPSLrfg3/mMUGkIgTqYURV6+X
         zFHw==
X-Gm-Message-State: AOAM531pmTXnUGTQN+wYilzbrSnjHO0La86nFxVigJDx37rPiny9U17R
	VQ3vjrjXYuHguosPUwsOKMYPOsrluD7OZw==
X-Google-Smtp-Source: ABdhPJxP/+g5MW994PuFNmnLL4zci1l1XvCRqr65zG/GA2RauQM4fh07xogkHV/dYIJUp5+XpIYm0A==
X-Received: by 2002:a17:902:eacb:b029:e1:2de4:72b6 with SMTP id p11-20020a170902eacbb02900e12de472b6mr14723736pld.17.1612759090547;
        Sun, 07 Feb 2021 20:38:10 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d188])
        by smtp.gmail.com with ESMTPSA id y21sm16991523pfp.208.2021.02.07.20.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 20:38:09 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] boinc-client: Fix build with autotools 2.70+
Date: Sun,  7 Feb 2021 20:38:08 -0800
Message-Id: <20210208043808.3398944-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On arches which are not same as build host it finds
ac_cv_c_undeclared_builtin_options = cannot detect
and errors out.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/boinc/boinc-client_7.16.16.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.16.16.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.16.16.bb
index 441bcd3ac3..d2e81ee780 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_7.16.16.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_7.16.16.bb
@@ -55,11 +55,12 @@ EXTRA_OECONF += "\
     --without-wxdir \
     --without-x \
     --with-boinc-platform=${TARGET_SYS} \
+    ac_cv_c_undeclared_builtin_options='none' \
 "
 export PKG_CONFIG = "${STAGING_BINDIR_NATIVE}/pkg-config"
 
 do_configure_prepend () {
-	if "${@bb.utils.contains('DEPENDS', 'gtk+', '1', '0', d)}" = "0"
+	if [ "${@bb.utils.contains('DEPENDS', 'gtk+', '1', '0', d)}" = "0" ]
 	then
 		export GTK2_CFLAGS=""
 		export GTK2_LIBS=""
-- 
2.30.0

