Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B457C25B4F
	for <webhook@archiver.kernel.org>; Mon,  6 May 2024 20:54:53 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.2157.1715028888290172879
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 May 2024 13:54:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CCh1ni7x;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2e1fa1f1d9bso45818841fa.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 May 2024 13:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715028886; x=1715633686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0dYm7CgT9N3CfLtJcW3AmnrSLreaC1McsCoyco752Tc=;
        b=CCh1ni7xZqx7LXcKAruwFJGKjI6E9XnDrKPfncfMocltkaUlSy8doNeA50AUe5J4VR
         JxsyJyRq0fqZsqx+jWtvlgWd0zFLxQzRbfVi8iP3onu3duJBxyJm7HzDqhbCIJWe/qg+
         xk3C4Wo1nC1/qFynOEE2RStDrHwPnC1zn7ECu/BS8Vr9OJHD4RFNt9ur47lBb5kyON+q
         T37uESDgNtbhqny3UPcSfT/+2zGz9gh718IwA/H4rovcpdfEsxbgqirkHb611qP6R3Wk
         VvHvbH18UrqEKGIBgdJtM0v9SQDe682ugMN9loPN7k8MvbX4xf9h/Gc4soUEKK5L/3po
         cv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715028886; x=1715633686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0dYm7CgT9N3CfLtJcW3AmnrSLreaC1McsCoyco752Tc=;
        b=NNk2ypFMnJGtYYcog6ZMaT8YcUDIXNgtGcqJorwxorbej/kUHVGfHP+hj/Ikf7nh6e
         B5VluK2sLfzB455fQN6uvmPRjpQl8BkD4H1XQjUmTErlabkqyKCjxA2ZPvAk0e3MdeEj
         9GO3WO3p4h0hlt0N9S1p1uWdsPoGFLnb+M+jeO3Clamzt/Veir7dt35xnKFbUrHsD3FY
         FQv9RFEr/+1mkXuzRgJnglkxqLP65jJ+DK9mi8FGeMPxO4v38z59KXW2rHHMhovgXHm6
         vyAyf2njLNw1wWEsH1T1L+cvFbLvlhWHNR3GmtpKpdPAvMIyVQIlik7gnA9DT9gOat9q
         S70Q==
X-Gm-Message-State: AOJu0Yxl5GTKxygAfxhvTrasB6Ua1uwB5us9vYZcrm5MCL6SC8sET8b8
	CAB7T8iaYKCt6oZ+aMHATFSle/0uqo1c28tFVkqsLE6PPc/5cmrRbO9wVIED
X-Google-Smtp-Source: AGHT+IHFFNr1PGaawh3OZ9ueXkzNIBYtPbCELq1zbxi09abGnOzYjFcH9nyXOUMI4u/yoDfyY9TiLQ==
X-Received: by 2002:a2e:bb85:0:b0:2e0:c363:f9dc with SMTP id y5-20020a2ebb85000000b002e0c363f9dcmr7953206lje.40.1715028885530;
        Mon, 06 May 2024 13:54:45 -0700 (PDT)
Received: from control-center.home (58-175-98-95.ftth.glasoperator.nl. [95.98.175.58])
        by smtp.gmail.com with ESMTPSA id fi24-20020a056402551800b005727dc26598sm5550179edb.13.2024.05.06.13.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 13:54:45 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH] python3-zeroconf 0.132.0 -> 0.132.2
Date: Mon,  6 May 2024 20:54:40 +0000
Message-Id: <20240506205439.431315-1-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 May 2024 20:54:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110263

---
 ...{python3-zeroconf_0.132.0.bb => python3-zeroconf_0.132.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.132.0.bb => python3-zeroconf_0.132.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.132.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.132.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.132.0.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.132.2.bb
index ea8ef1cb9..421bd3b6c 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.132.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.132.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=6517bdc8f2416f27ab725d4702f7aac3"
 
-SRC_URI[sha256sum] = "e2dddb9b8e6a9de3c43f943d8547300e6bd49b2043fd719ae830cfe0f2908a5c"
+SRC_URI[sha256sum] = "9ad8bc6e3f168fe8c164634c762d3265c775643defff10e26273623a12d73ae1"
 
 DEPENDS += "python3-cython-native"
 
-- 
2.34.1


