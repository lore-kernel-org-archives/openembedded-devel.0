Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web10.797.1590783399373865294
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 May 2020 13:16:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l5MvyHss;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id v2so380654pfv.7
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 May 2020 13:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZlnBtghLBaffFyQN6/cZM+KgjCoFAj+u3StYHKWffHg=;
        b=l5MvyHssscw2JDg8s28JVAjYHrqi9UfrLHqozZJk0Shu3wMliLdZYc846l/R70kK/5
         A/E4hP/By6/3B1gyJN/Q1VlmaADkyIaXfoF7oXjaIgEIR9qe3fXIVNS34t8YOUbRo7bo
         R2U+5vU0qYeLziZ2kw7SyPRqOViWH8WneWpXsPd1zullHT1VQ5x6HIvMVnfSivPfmXWU
         GkF5JpawlHHmiPlw8NVFzF6gKaCopxt7fcSuGmOgv8JyoF3zwmT57AqPck5s8h7XVgaR
         As6May0SuKvNwxIR7VL8lsEigv8fAuFnFmpDTp8j6Or7TCMjegu936cn68SBQMVs5W1p
         Dmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZlnBtghLBaffFyQN6/cZM+KgjCoFAj+u3StYHKWffHg=;
        b=mZnPFmquA9sg/uR/fA6Fg6+VY1UZrAsAEgHGSMRzsGIjeC1/kYOOmGMu+9No/B3GXn
         8iN/UdwkPbuV8xC6UkFALuKhScK2nigC6vaHZWRv/tIJcZ6Dahs+Eerrkif4J/lBPtpy
         PsGUkhSTMCILlaeOTO1nEmgB6EN3tWjQAAAfWgJZF4OaYHcKjfV5rRnFyqeeMFeSyOgN
         L2UqFfbPXVwTW37XDrr/nt0rggByXFiIsKMA5fwm9/1ICydttPu5L7Fk6YFqZSZuSO5e
         M70Ph5XktYz6CdkIBS+M4UH8pD3Li8y/UP7V8fglCVDycvcPxCnusDxR7fcbunrVPfuh
         kPbA==
X-Gm-Message-State: AOAM533BE4piNRWevFiK5pMOIeAP3Il4/nBhFvg8+ljwA4bwdsCQiLef
	LdoQuuuNkyGZgdu704LuflU2CPIDdfs=
X-Google-Smtp-Source: ABdhPJxTxxZ0NB7lSJdgcdHikDYfgl22fDT2+SdKKKZw70voZB73NdtyiaVoYCwFrqpDWTdbcCMNiA==
X-Received: by 2002:a63:3114:: with SMTP id x20mr10192363pgx.52.1590783398305;
        Fri, 29 May 2020 13:16:38 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net (c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
        by smtp.gmail.com with ESMTPSA id v12sm251025pjt.32.2020.05.29.13.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 13:16:37 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	"Robert P . J . Day" <rpjday@crashcourse.ca>,
	Jacob Kroon <jacob.kroon@gmail.com>
Subject: [meta-oe][PATCH v2] dfu-util-native: Remove DEPLOY_DIR_TOOLS from sstate-outputdirs
Date: Fri, 29 May 2020 13:16:35 -0700
Message-Id: <20200529201635.644083-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In commit 1ef92d2423d6d6546e4f0585478540212b26f3a0 deploying the native
tool was changed to use DEPLOYDIR, so setting DEPLOY_DIR_TOOLS for sstate-outputdir
dependency should have been changed as well.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Robert P. J. Day <rpjday@crashcourse.ca>
Cc: Jacob Kroon <jacob.kroon@gmail.com>
---
v2: Remove setting sstate-outputdirs it is not needed

 meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb b/meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb
index feb16fa730..4305e3b408 100644
--- a/meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb
+++ b/meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb
@@ -16,7 +16,6 @@ do_deploy() {
 
 addtask deploy before do_package after do_install
 
-do_deploy[sstate-outputdirs] = "${DEPLOY_DIR_TOOLS}"
 # cleandirs should possibly be in deploy.bbclass but we need it
 do_deploy[cleandirs] = "${DEPLOYDIR}"
 # clear stamp-extra-info since MACHINE_ARCH is normally put there by
-- 
2.26.2

