Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web08.4382.1623220727022147514
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 23:38:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MnTs9w6G;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id my49so19971389ejc.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 23:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=654Q/qnzxnMp/NqporoN5iApS/8Eg+lxaSaFOavcEps=;
        b=MnTs9w6GtQkXQRUHtuo3+x7PWehNDWu21sYDH0+xhVmSxgQ0fRp78enJkApTx7QCgR
         /0a66neffbnqNPv93e51HX61B7SeWGDH0fIN/MxyU3ZUGMdrgECiob0VzsbQoXDHEDvV
         nXC/c6wcz44xeEMtysZwXywWnqhDSUL7WL2ZzXd8dPUTir6HMsuNOmFGqx9T3FV/OVQQ
         pEStP5PLgnfiQtbDGRfH/HkfG32qvJrG0uHTyrbdvW9rAE788yxmn+ZzcytjHTw86rp8
         esI81UOM5m5PjtsiieKALo3rbcAnw3PlQE9LGl0DhbkJPGxiPW8/Q32JmiBW1OqaQXgI
         ckbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=654Q/qnzxnMp/NqporoN5iApS/8Eg+lxaSaFOavcEps=;
        b=E/XtzsqexgqpA44c9T9TM6oNi1+5f6R5k9QIh7/6vWeA0+to4GvhrZqTkcYNSaZIdb
         DLPIjyOTps3Y/P5YAqATkB9AvYCoaT97x1XgfabQwsG9TRLSve0WQKe+LskiPz10P/d6
         JmbzUKuWUxeOWO5YW3DRfTM9rGX2eLpNB0FkKP87YUyxX4SnDAgunZ5gbf40Y11+xsWO
         uW0gr1Hm9boXywUTffZEVo0zb+0Ewy3ZI2CntBWqnYUtk3+b/o0mz/32IILWc8xAbL8r
         IsG0HNNi/RLMtehyMFXI7JmGdSvfBBoDERHKb7WwM5oHIemClnnd5cJca2uzU2bofOda
         WTDg==
X-Gm-Message-State: AOAM533AGpyi+2/DrGrxbQrifMyNcTMSQv+nYNXiSuGSIKMkYgbhOLPf
	0pYU6Lcxdr/dBSaLnCbGtK+dN7lqGurptA==
X-Google-Smtp-Source: ABdhPJwcqFuBlOdj1FRwPKZ0NKF7+g4F6avREHAKtbCe7ddLUiD/0Kf31MYHAhi/rsb6MsdRoFd8lg==
X-Received: by 2002:a17:906:19d6:: with SMTP id h22mr27737490ejd.156.1623220725399;
        Tue, 08 Jun 2021 23:38:45 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f297e89b85a8a6897bdbe62.dip0.t-ipconnect.de. [2003:f0:7f29:7e89:b85a:8a68:97bd:be62])
        by smtp.gmail.com with ESMTPSA id o4sm690810edc.94.2021.06.08.23.38.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 23:38:44 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 04/28] evolution-data-server: upgrade 3.40.1 -> 3.40.2
Date: Wed,  9 Jun 2021 08:38:07 +0200
Message-Id: <20210609063831.3400611-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609063831.3400611-1-schnitzeltony@gmail.com>
References: <20210609063831.3400611-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../evolution-data-server/evolution-data-server.inc           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
index 870a9c0e9..86c7dea44 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
@@ -9,5 +9,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
 
 inherit gnomebase upstream-version-is-even
 
-SRC_URI[archive.sha256sum] = "eac75f348aa5defbe9473fa30ab6084635ee64d8e3eaaec60a62c27f149c3e22"
-PV = "3.40.1"
+SRC_URI[archive.sha256sum] = "ec82951639f32a5cece80a8b0b9aa3f66b7d318e3ee2c1c35234f2e2bde8a418"
+PV = "3.40.2"
-- 
2.31.1

