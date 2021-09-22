Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.1452.1632322909610340164
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 08:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pfC01H8k;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id k23-20020a17090a591700b001976d2db364so2530502pji.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 08:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d/cZLMx8yWeum06/sOE21EE7FGPSpVhGL/EppQXv888=;
        b=pfC01H8kp5W1CDQdIMTI8QMjf8vgagsNQe6isdWfy19+QGfc8ErLgnxDvI2VBASKKs
         8tJQjBg9OrcFv+NxVURP9kMI8AZNZRj9Co+FySK0YCxi5OFYaRb6F09FdU1LzQB2Kldh
         gTEhzqEueC8S5RIOEgY60waRGXuurseIS5j+ctqGVQkpVF1eDUHEdGerrsKVIYVoLd8M
         Mqgae+tTQRhLr5qORhGmo5l5pZ+iT7220LlJ9igOXJPScEAqvbjhLWmf/fvDsRQtgCfi
         TYwaaZQnIfOFqA70dc03fIiyP25sfhqE7jQFbilqwy7NKJWhuAUmH26ES9EuHUPkQbrH
         /8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d/cZLMx8yWeum06/sOE21EE7FGPSpVhGL/EppQXv888=;
        b=P+vAEer5IJQbJq4Nx/lZcyZiFPVD2zoXnKPsYT4GGa/ZiL4ehQhZuV8yVKKSjOCogm
         irZvngh/KYgZ13DKM/8qcpvkXm2Esm75s+SdU/Dv0G5YXc0g9eRNrWLT95CRrWW4Tp85
         248xWyX6xnUtGVZnKFOFQgQ83LC1KPfyOPhem/NXc8/nEm52AKQQp4Xbzxb/GNZ4p2j1
         Mw5H1VeWoEInWoyhg1pxghT1dvHMQX19VGJ8IYFPMZsKENAK+3xXu87XbXDBF+H0oJxg
         zZBuL5K51VF6+7iyvWfXAJU+fGg3AJm9WX6cyqEKDu23h3GjGPG2azYsKQzkZFa4ocbT
         O5eg==
X-Gm-Message-State: AOAM533KzZ5mCKj6l6td6WDLR8l6k1QNHncB4tznpwaqsTb+y8eLU2/Q
	qNyAh3W6jxC50Dn08I+jHCdUN5J1D3H80w==
X-Google-Smtp-Source: ABdhPJy4+YGKKvJQFhsLq1frtoMqidloMf5sG045+5fFhbZfpoKIY0lDb6gCA7NHD2Zns1lSwuhSaw==
X-Received: by 2002:a17:90b:4f8a:: with SMTP id qe10mr11825551pjb.5.1632322908817;
        Wed, 22 Sep 2021 08:01:48 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id t15sm2767392pja.1.2021.09.22.08.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 08:01:48 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/3] postfix: Inherit pkgconfig
Date: Wed, 22 Sep 2021 08:01:43 -0700
Message-Id: <20210922150145.705595-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was part of default dependencies before

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-daemons/postfix/postfix.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index 7bf258374c..1ae32af283 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -20,7 +20,7 @@ CLEANBROKEN = "1"
 
 BBCLASSEXTEND = "native"
 
-inherit update-rc.d useradd update-alternatives systemd lib_package
+inherit pkgconfig update-rc.d useradd update-alternatives systemd lib_package
 
 INITSCRIPT_NAME = "postfix"
 INITSCRIPT_PARAMS = "start 58 3 4 5 . stop 13 0 1 6 ."
-- 
2.33.0

