Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47CDDF5A8CA
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 00:58:44 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1013.1776733123555131245
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 17:58:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IaNnvxd4;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-650789b22e3so4167334d50.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 17:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776733122; x=1777337922; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mo1Gc6oh09ZB3q2kN92HF+d6YfzvZs2VZ5eHP/6+xHw=;
        b=IaNnvxd4QWTYB2ZHYs8zbvD4JZn3ctcugotQ3ZV4sZf6lMUJiOY/uLSs45cVIvFc2k
         5ajinW9yaLP/HD3qpCWDm5X6NQ85kT4mBHoHdGDf1dIrthYcS7EXEBI2kNxJrenBKITH
         Gxz2RgXzj3GFfbWaOuH9MryPezD9WopmoFcyX0qZEzLnE1bkQ5cMHjRFFl8Lr7lIHUu3
         4w2nupyrJGnsw04bsRHT6R+akISx9pnEKoAT/cXpFSmrzMnWJrpUAH5/Ktq7RM1Xvgqr
         GTo4BmmAIYtKcof2ddGX/zES0QLwafjZKMn2wRDT+64RWWW2QD1NrOQVrtSrnGuYwUxg
         sI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776733122; x=1777337922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mo1Gc6oh09ZB3q2kN92HF+d6YfzvZs2VZ5eHP/6+xHw=;
        b=ZBRFhF8YaY6JoH7dANEH+5scepaLCmqSiuabDXsFl+S1zAnURIpewOpkdE/dSaBOeH
         0XEKjoupC6yzksT0N/2OamvGk1cM6iC6D+DJN2VPSEDUGdbTVuaWljuSwAAzkMSJ2SoV
         aBzvKla/locEcuR73Mie8nRnim6IiHSSjYbEx30Y7ZssIur6proKA1xHYxuumUhko4Ki
         ww4nDT2gneYhM7C/NoNd5ruxgmYrr3os+7pET1CeMaKKykzhov8nzd+1p7Li89nr3vzc
         p3VooAAc4PJX43AsSG8zKpwB5C4PG0sggVDnnJAeitFy9Xl3WkAmORl1KPeF8xCN9Y66
         bLDA==
X-Gm-Message-State: AOJu0Yych7XNPYUAtxFqpesgZoEpLgoLGCXFT/t2BlfjaSHlDJU0IxJ4
	IcU2+ceHlPpGUylVFbf9lAlAnICkinwo/I2fK3TaFhnXzJY1Zkj1Uoi0qATU9FxI
X-Gm-Gg: AeBDiev0Rh3FPpisKtOsKmvQojZ2n6tfDdlN7hWBbX9a3p7HU/GUXLpSbBwQJRbCCy9
	ogPg5X7/9WuZCo4J/QIQUwEsEkP+3FGwYDJ8lDf91RqkM9ZMTtUi1s2ogL33udq2VWxSqe6xnAA
	4I1hG+k4bIXUc4To5s/46DPkusIlaKZ1uDop6a+X69rghy6+XxhcX8KGyIYNAjz/Knn908uq0S2
	roXwVNy8q2b0OzIR6En+pWE2r0AX5m+f2uwqe+JzDCIbqItZCJZ9IhF+wSx1dVKERkqXEILnVef
	vH2TnpPU0sBoZuSIB5zAl6zD3c6XzFBJGWlK72A0kI8flN6R0tG+JSuDBnvSMEWRdotZMza7Tne
	JH25R6OYzsE+7rfyP4mAUodgdUmvoTFsTePUvzzcp/RIpxgXdB4kF3sYe1cT//CsgfNA+5uxlzU
	5HoTulYnCp30zRv2XgJoUralEg9ZE16fxWiutpK5zduIsYI1YJM0datEGY11hdZFjCLRSqtdomm
	SEzsKbd7fT/pDgSLYQQ8MP/A/ZAyxfOMRNEdClJkJuouYuQTU1xE55X/jtGMQ==
X-Received: by 2002:a05:690e:d49:b0:651:8944:c0de with SMTP id 956f58d0204a3-65310b9478dmr13508172d50.63.1776733122200;
        Mon, 20 Apr 2026 17:58:42 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65314b26598sm6039804d50.2.2026.04.20.17.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 17:58:41 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] webkitgtk3 update 2.50.5 -> 2.50.6
Date: Mon, 20 Apr 2026 20:58:33 -0400
Message-ID: <20260421005833.5976-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2026 00:58:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126522

This is a bug fix release.

Changelog: https://www.webkitgtk.org/2026/03/12/webkitgtk2.50.6-released.html

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../webkitgtk/{webkitgtk3_2.50.5.bb => webkitgtk3_2.50.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.50.5.bb => webkitgtk3_2.50.6.bb} (98%)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.50.5.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.50.6.bb
similarity index 98%
rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.50.5.bb
rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.50.6.bb
index 908898f254..c3f736568f 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.50.5.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.50.6.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://fix-ftbfs-riscv64.patch \
            file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch \
            "
-SRC_URI[sha256sum] = "8737631bac3e9c7ad3e5208f9370e076c09d9c45b39980021ce54edadcc6f94f"
+SRC_URI[sha256sum] = "2b281abf8894ffc6172152e5660b75eeeedbe1cc43d6783d09dc79f7c865bb42"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.43.0


