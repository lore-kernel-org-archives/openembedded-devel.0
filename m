Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5E62CCD18E
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 09:45:21 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.11870.1760521517422032728
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Oct 2025 02:45:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mjWcev0p;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so803961b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 02:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760521516; x=1761126316; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0QxoY6y1IRiQR3AxmRZCqecvgS2zivtCt7SmTDERu0w=;
        b=mjWcev0pij31Nir6aAVqI641hAGQrH41WtGHlbi/Hoihj5AVy8gzCnl4m5DEy9gIf8
         3pMO490H94clXKVAecvYJA6Kt3iGDmkjbK97igCQdsEYMbFi3k5p08XmlAdk4IdCsBK7
         zxX8SMyyMWLaaAZv24n5CVjHxADzHCmhSD0QqYhkbAmBtaL27++dRNtKELsRPQ3JVo+3
         Nc9IGN/vt7YNVvLjTFjoH90Y2N8DyZ5uXfZtFQSmb8taCk0XKV9TSOYltjLBKwyWtFU0
         UVOK4ZiktiIXXNr/JKOkHweeIB6LH6hFtir8v2+/3wTDCfGFMMmdY4sjT21hl3QUVQUt
         xbfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760521516; x=1761126316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0QxoY6y1IRiQR3AxmRZCqecvgS2zivtCt7SmTDERu0w=;
        b=JblBVjSVXjoq+pNdJ1X9ZSVN58qrD0H9edZrytjt/DbD4Gyoy9lzgf7zJZFAuHF3Bg
         OshKtg7xhYtlMk1fq7sVKE72ptBl8NsOSWuhNMr0yEviF8cnjhGU6K+elmmWcf+TZnRr
         evLOpQhBoYVQba1jtnTCL0p/PMKRR3Up3WhEWbN0NXLraE0mMzWnZdd23Xjr0vP9bZht
         TOKxTGquU2KwuZXodgQK9cH6xEh57Bgl/ecHhkUm37qJ9AUYLg/HF8algL3256dJNomm
         8rcYDiYb8mpL4iZkrXSfQEQKXU8l1yfNFahMq9k/Y3n2RuliJNQv8GB4Ul1yGRKjPCwO
         t+Ng==
X-Gm-Message-State: AOJu0YzIuS/DnqwJ8ZnDqikva4w4hvWg8RKVrycrGnaUCesMHYGU+mrF
	6XME/kUFFvsZqYgjOJx2BP9pYUUidqA3FSA3SHjNuh4RpucjOqo/uGKRf3P5uw==
X-Gm-Gg: ASbGncurwiLKAsreaTnV+3UFtE7xVmTN3e+Bzf/RnI+2gevulo4x9TG7ReEUVGVisp7
	mfgpSqcISoC7AqHV7XO5TIJigVk3rHw2bzuKvzF3PaOVH9yOOREIQminfTB5IdIQDip9pD/Gww1
	pfWgZtCSYMIa3rmEdAfYadcrVCBdEnRc2rB+Rw8fvGU6u411gBR1y0gAYIELjCwh40pQNL0cWNH
	AuzvAeOoOKyJ7a2psmIalfYSjbQKoDKkdFQpAtA67SCSS0xoxasSMNljjJA4wLrlM/JG1/WVNCk
	wUHye310qBfdlQmVfF1sw56fk0GM+RQI59eSJbDEXh4WHuYyQ1//rc1q8wz8gRHQvhH8ClrIWHo
	rp9OUqE1mnn41m37t4YG+XEQckNFXDjlVCfhY/G1wCjLME72aQs6iTCU=
X-Google-Smtp-Source: AGHT+IF5C0IikcHUGdFyEavrYItzl330BhDreclCyI0JT+f6YvNU354t/9+ZhDKkFbkuPGIN0FwiQg==
X-Received: by 2002:a05:6a20:6a05:b0:2cd:fbcf:147f with SMTP id adf61e73a8af0-32d96e5d671mr48618517637.14.1760521516500;
        Wed, 15 Oct 2025 02:45:16 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b67bab72112sm9889773a12.2.2025.10.15.02.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 02:45:16 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ninette Adhikari <ninette@thehoodiefirm.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][scarthgap][PATCH 1/2] monkey: Update status for CVE-2013-2183
Date: Wed, 15 Oct 2025 22:45:07 +1300
Message-ID: <20251015094508.1808322-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 09:45:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120702

From: Ninette Adhikari <ninette@thehoodiefirm.com>

Current version (1.6.9) is not affected. Issue was addressed in version 1.3.0

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 17bcf478a512c7d75baa3b68e8f650aff7d17bbe)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
index ee5dc16198..183d252e41 100644
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
@@ -90,3 +90,4 @@ CONFFILES:${PN} = "${sysconfdir}/monkey/monkey.conf \
                    ${sysconfdir}/monkey/plugins/auth/monkey.users \
                    "
 
+CVE_STATUS[CVE-2013-2183] = "cpe-incorrect: Current version (1.6.9) is not affected. Issue was addressed in version 1.3.0"

