Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 512B0E7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 11:22:30 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.17625.1734002543133192498
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Dec 2024 03:22:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cl0o1kFo;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d3e829ff44so3137617a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 03:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734002541; x=1734607341; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HqFYW/WqlDloqSCpaFt6KNzf1zN6qv9xNaSsVJCCne4=;
        b=cl0o1kFoDfq6/Phmm1bK8Jc2KOJPxC44tLKSIYqLr9/aWFMZG1FiM0EsjKM3tfKUIf
         u1iZV6xBi93AF2T1naBSD2S5B7er+NxxaMf0nfxATyVlvDcToSC5HmILhBHA4/R8tPiq
         jtnuYHQSgICQy2kD0qs5Og+2U5ipOS1W14jJY44+vsm6rjvmW9QbPIwV7QgwFsCe0YCh
         m3F9YbYcJOg3LBedGb7Vao/l7kFKblbUYSMleZJGPUzCUZYPywj4nsTa3/StSrKUF4dN
         3qeTZ0RwG9oy7kEuiATYtX5JJPsOCfLzXmxaSNn1hC5ZdVQxnduTyqtuNb0oikEXFN1i
         tXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734002541; x=1734607341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HqFYW/WqlDloqSCpaFt6KNzf1zN6qv9xNaSsVJCCne4=;
        b=QCebMF1C5cPSoeEuAAz0VhYEOrss0f3BaHNn1rEnvrqtOW8+he5zWMaeG8sWyCCADT
         Q6xCM8lfrh9q+wv8W0xXX5yhfLrloHc+FtK3uOeFAx81IkwU2yWJv1MTJ/QEMp9k9zen
         mgN0jO8StIHxoFPCKHmXxwvH2JSsuMXPQmYHdBh3J/FOT8u0vpeUr+ILm4tFVI74Z9f5
         EXn483EkWKkiYqSqp8seb52lf3YYyZvew1+v/k+XTqypUtToCB1KCw2qqFhltQzQoUsr
         NXAO51PhKB85EOjidgXj59M20yFB8mdUfUNi+SCse22DQOZa16btQEstA+SKDR2J0YwF
         NA+A==
X-Gm-Message-State: AOJu0Yyj+R3yEiKpsogpDV2AdHk+vi2WAEqcZDQjCj0xRLNbiA/0+m/V
	vieQROZy7bCNHsis7HDBBOQlE1EjgVQQyuy9wB0TZ3gwNr5h7iEmH8oaD5zb
X-Gm-Gg: ASbGncuTyL1KUb3iM7KT0R6lL6DcPbCYr/xJ0CVZlTCYy0lNNXcl5uZwppMbgzIwlEQ
	+zvQ04EYSwoKsyT3oN8Hmkzj5n1Kwc3y4Q8ArgJY362oExqBqhdxhlqxxYXuNbZOrH1Q8b7QWip
	v8wjOSMM9ImGPI2Fje4IsWBYWR1UPRgiO7+yTP42PfG6nWA0Ti7fsHNqVcHduJMmvnPb2AvtEMP
	QVBw0BDlbNgfNnYrIDDt2rCXGg7pWqoMHxeuL+hLe+cqV0Et3NQax2wLwOLn/ycFzARoHtxC+JU
	zvDWqlg=
X-Google-Smtp-Source: AGHT+IEyMXHP/8lBesVoAhSirsNFvbmFFnQ880oaOur7yldGKRa+LSdQ75MFpVdLETQM/VULlSxYOg==
X-Received: by 2002:a05:6402:51d3:b0:5d0:e7a0:154a with SMTP id 4fb4d7f45d1cf-5d4edcd1f16mr735432a12.8.1734002540724;
        Thu, 12 Dec 2024 03:22:20 -0800 (PST)
Received: from Unimatrix04-Jammy.. ([2a02:b021:8010:1b12:32b:6bda:ab2b:ad0b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3f3942d86sm6293221a12.76.2024.12.12.03.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 03:22:20 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] vbxguestdrivers: upgrade 7.0.20 -> 7.1.4
Date: Thu, 12 Dec 2024 12:22:18 +0100
Message-Id: <20241212112218.1623613-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 11:22:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114290

From: Gianfranco Costamagna <locutusofborg@debian.org>

Also enable arm64 support

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../{vboxguestdrivers_7.0.20.bb => vboxguestdrivers_7.1.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_7.0.20.bb => vboxguestdrivers_7.1.4.bb} (96%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.20.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.1.4.bb
similarity index 96%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.20.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.1.4.bb
index 444b86a1b..70587c430 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.20.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.1.4.bb
@@ -7,7 +7,7 @@ DEPENDS = "virtual/kernel"
 
 inherit module kernel-module-split
 
-COMPATIBLE_MACHINE = "(qemux86|qemux86-64)"
+COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm64)"
 
 VBOX_NAME = "VirtualBox-${PV}"
 
@@ -15,7 +15,7 @@ SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2
     file://Makefile.utils \
 "
 
-SRC_URI[sha256sum] = "5cf5979bef66ebab3fcd495796b215a940e8a07c469d4bc56d064de44222dd02"
+SRC_URI[sha256sum] = "872e7a42b41f8558abbf887f1bdc7aac932bb88b2764d07cbce270cab57e3b5e"
 
 S ?= "${WORKDIR}/vbox_module"
 S:task-patch = "${WORKDIR}/${VBOX_NAME}"
-- 
2.34.1


