Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 292E4C46CD3
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 07:52:57 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.57808.1702626775317047897
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 23:52:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=afHcsT/S;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-552dc0d0e28so35659a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 23:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702626774; x=1703231574; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AUdgv4WWflcEmcAs09zIUGvX4R//XANa9Svkr6EJgL4=;
        b=afHcsT/SFDNsIX3Ep2S60Jb9cfmRrQrT6C6J9Pmzj9gAK58o3skcHyLCsbGzjsEQHQ
         vFIYr/b1rz+IwEtp2v7/fgw3UWRCr15OkAAMmD2jDKItwXAgL/Jm+wLaO2FeDJ4QGiiZ
         tabsNkHONKFjBenS0fwFqbMswENOhQp/TCd1G5NJIdjA/aD6OW76pbeSNcKPWcglL2Ul
         QFM2tNHNsGNMEr12UFu2zlCqR2lkmH6JAigawggAQj7gvya9hker/Wuv8EZbgCGxhN1B
         GI6C85emLzIAJ+RmCcmYgO3I/6YcT/t7tpKoipR5nFQTAAK2S0LJflmb9/DtWZQ5aJKQ
         xMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702626774; x=1703231574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AUdgv4WWflcEmcAs09zIUGvX4R//XANa9Svkr6EJgL4=;
        b=cjZLVviFBmr6y/v3k8YY64h5c4dvMPWDh9/wzn6lLJI4yaJgz+tv/UN4jZ7dPNvVZS
         DTZS4vBDlHJH0QULp378DvPdYW0am1omfESAi9/vw2sPbubVfWUkGCdNNb1yy7oBIV4i
         CwqdsdQ7P97zAcefG+DWjx6Cdv9c+VwZLhUX+GyozSUT/Ggnui4w0wdfutbTJwdNHmya
         tUFc3T27kzaKDd9XfWoBVGURSC/3s15ZhLgdYNeP8Stab1hKVjVwGX1/JBDbHA09Av55
         3WOusTSB9aheUTTZa7OZHjGamdFxo0k8ET99+h66P5BgqoXFrlk7GLn9keLg6HvhbUyz
         KpOQ==
X-Gm-Message-State: AOJu0YyB0B5VoQ5JCKjYoNfqHLvs5IVVWhxD4Kds0Gdf+aoMXA5/bUl6
	2wd9fkDTWgdSAepc1AL3SIhBOou9meA=
X-Google-Smtp-Source: AGHT+IF3V0wFLeWOQ15zV54MbQUDS0+qtCb6FmwB2tTgtjWpvoSYb+1ArOqQX6q4SEZ1HXvQuz0wXg==
X-Received: by 2002:a17:906:a847:b0:a19:a1ba:8cd0 with SMTP id dx7-20020a170906a84700b00a19a1ba8cd0mr5229710ejb.110.1702626773774;
        Thu, 14 Dec 2023 23:52:53 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id le9-20020a170907170900b00a1e2aa3d090sm10348666ejc.206.2023.12.14.23.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 23:52:53 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/20] python3-django: remove unneeded distutils dependency
Date: Fri, 15 Dec 2023 08:52:33 +0100
Message-Id: <20231215075239.3049865-14-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231215075239.3049865-1-alex@linutronix.de>
References: <20231215075239.3049865-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 07:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107507

Nothing in the source tree requires it at runtime.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-python/recipes-devtools/python/python-django.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-django.inc b/meta-python/recipes-devtools/python/python-django.inc
index e030ff408..11d5e6301 100644
--- a/meta-python/recipes-devtools/python/python-django.inc
+++ b/meta-python/recipes-devtools/python/python-django.inc
@@ -28,7 +28,6 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-threading \
     ${PYTHON_PN}-unixadmin \
     ${PYTHON_PN}-xml \
-    ${PYTHON_PN}-distutils \
 "
 
 CVE_PRODUCT = "django"
-- 
2.39.2


