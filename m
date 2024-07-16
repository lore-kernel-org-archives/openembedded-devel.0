Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 327B2C3DA59
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 12:56:30 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.10137.1721134582708692337
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jul 2024 05:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M8vSANdI;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2eecb63de15so60581381fa.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jul 2024 05:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721134580; x=1721739380; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kJfrO1QLLwmqolDlYX/ILzA+kuyxFlh9woIlowsx/P0=;
        b=M8vSANdI+N17kxeVmpl0BZIpgMiD5+U1rkXd6OETtiviKkEmvZtk5LkTqKpdnHhXJa
         3YyqbzTe+tZqMDmZbc4k32EENfJLLNO+JMIOTCAkU+a9NV6jxysus1l3vDFDIClRn2X/
         0Hzum6KVfntVq2YwZJZn41vddMzAv0rtIlq9af4IiUyghrD3VxT6K3CnYOhuhbUPRxO/
         cC8HWxkRe0RPjb/gTOkP1EMqfTpmSlXJ9X1sdjg/ZrjeFG5vdi6YQ7ATSKMZRfoq1GLI
         rXUP2gJvoY8O+umWkw7HKihh1Xl1RL/+VB49/xQCAfyvS7Mo7lRJ14eIagmjs31yA4Sa
         uifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721134580; x=1721739380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kJfrO1QLLwmqolDlYX/ILzA+kuyxFlh9woIlowsx/P0=;
        b=R3HRELQwqy+KdVQsvjzDJevGOrtxzMh0wWIpiFB+z8twCdgeGqMGYVruWk4Wi9u7DM
         ZlL5UX1WEPUZYvTkx8KhA874Mz+tuvr2Xsn2J9FXSW/EJhd06mxE6ZODpJVhJxryi596
         mcdAv5IXDXNocj4q0GO1MJrwiJJ+DOAi4IXwklFDtJle8YcHZFW5lMKUpgTX38dnvvV0
         P73xYwjvEfLMBgv+i+vu41HHwKxGIQGFjFTcPhfijiR1tGrWYgtC7bVtXEtS22WhMCpt
         E13zc/ecVogjxI3NWW5jdSEk/oiRk04umJjGELraaXMgbRUAeLquE3Ih+MnaHwPM3XdF
         DqqQ==
X-Gm-Message-State: AOJu0Yz/fKOjAQnorSfETQt1cl3v+n17nTplvgkbsk4VcFNxfJerO36Y
	bf+veHSOa5Kyajk+TAPjq88pYOarqg48WdixC1tRAjwqYbpnBGEx/ZZrfg==
X-Google-Smtp-Source: AGHT+IEnXkeiCkfiqBVk57B9AHioSfwDI2SUBgVsGYE7wr6hTR3KrzUQzreVty4IiuaOe/wx5vIvbA==
X-Received: by 2002:a2e:b55c:0:b0:2eb:ed3a:9c65 with SMTP id 38308e7fff4ca-2eef416ebd9mr14736231fa.15.1721134579698;
        Tue, 16 Jul 2024 05:56:19 -0700 (PDT)
Received: from Unimatrix08-Jammy.marelli.com (host-95-231-134-228.business.telecomitalia.it. [95.231.134.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680daccbafsm8891838f8f.51.2024.07.16.05.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 05:56:18 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] vbxguestdrivers: upgrade 7.0.18 -> 7.0.20
Date: Tue, 16 Jul 2024 14:56:17 +0200
Message-Id: <20240716125617.1597303-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jul 2024 12:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111374

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../{vboxguestdrivers_7.0.18.bb => vboxguestdrivers_7.0.20.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_7.0.18.bb => vboxguestdrivers_7.0.20.bb} (97%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.18.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.20.bb
similarity index 97%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.18.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.20.bb
index 47f616e99..714814fba 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.18.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.20.bb
@@ -15,7 +15,7 @@ SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2
     file://Makefile.utils \
 "
 
-SRC_URI[sha256sum] = "d999513533631674a024762668de999411d8197060c51e68c5faf0a2c0eea1a5"
+SRC_URI[sha256sum] = "5cf5979bef66ebab3fcd495796b215a940e8a07c469d4bc56d064de44222dd02"
 
 S ?= "${WORKDIR}/vbox_module"
 S:task-patch = "${WORKDIR}/${VBOX_NAME}"
-- 
2.34.1


