Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F15EED116F6
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 12:34:00 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6583.1764678834713766404
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 04:33:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dtYpCd+t;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso48995805e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 04:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764678833; x=1765283633; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wLfgY+MP4zpFLUAonRNRpjtY4ofPeoUYvMJZZE0JAko=;
        b=dtYpCd+tJsDDhdKVyGDJpYkYHFkYfAFPXHVH7gSPlOfejIKwz1JHBS6zzo+pULuhkn
         a9FdS6HXMaZJZmOAPV+prNQKEtHBSi/w6iMx5vILlyWDqi+ucDDZoWVEVMIoh9pypybt
         kQedZNlHF39xECnzgyupFV+S0S3tjWdmNVBU2svXe9GCpayt24cjn+QNzrOrNMr5J9Z4
         54gFPDIOJHUepEf/hZ0TobAapXSVfejjho3AQ/kf3dKC5cunFMaaJjootDYr+v+VtwVH
         +RHmtuvaFYQYPd6QTgzpRDMxrszHO9QvS0Soq44NEZo7ObjgUi9QjwUeQOHACBLSnQ6B
         3AQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764678833; x=1765283633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wLfgY+MP4zpFLUAonRNRpjtY4ofPeoUYvMJZZE0JAko=;
        b=Jm63dsfjfZNRonZWYsgl26T+VIL/8+o6uh91yX2ylSHdilFIxyR4x7cA6c3cqaBDic
         nsQQWsHCXKNx6DNsfZImAyuDFOazjS1g5P1t9TLiBYGGulDNbDA0X2hoTq/jsyXcnqOn
         2tdvIea+h8MDShXjbhTpFyOBKHmoMP8FYKS1YQBjxQWkZtEne5ZBZe2PBisS6n9OiRF6
         iocKXXIzT4lfBCbdApD4SyvnNdO3YpSgVd4OA5p4WGi8iDK5YbNDMnd44Y3cZey1tIeN
         6ZinLRIch5uhjTbfb9DEbzq1KP0DEjUMAM44k+oe4o0OjLmjtkc6HA2j9fFOQbQYrHSS
         pBlg==
X-Gm-Message-State: AOJu0YxtUkUO4l1BfdnD6hRNi7i/Uf7i4yfLqqtSlznmcv7TtdQrLfNs
	Jh9TmZanwLxGIdDNI4Xq3C8WGGUp1GPene7uMERPXvur5UOnEfpVp3nrOVyAww==
X-Gm-Gg: ASbGnctqvjnBy/ELSVyYqd+oikeASGTXrEI+yzq+euio3W8Ikqa0ccvWQ97yQDp0dSt
	9FDMA1fuPEHVS8aDtHJSzeYTX2C8HCeSU09BKrFRXrdDz9S/7zas2dhpdabPYI3Hh7ONNLz8+d7
	ypndqJNcfxr67HtwPJ9EV2qR+2COAuK1IDqB/zcZvdBUJ+V/P9bgL/Id+NTvJ3LgP3FjY2AKTjq
	LhGFaw3514o0wFnxVVFVr28qk1qBbsfUPEJ+Axxnn5QVSnSg7otLkANkS+uWuZF3wyEDyiyTgbk
	1KGn1AlQ/CnR+mMBYaToyaI2/uOl3XnvnvAHpsNteg51BiwXSrD0NWnzY5IismG60LVHyR5XK9x
	jCzgvcvuDgwxlt4w7wUoPoDjtLlBiysAO9c8E74e7tHfBm6jN1nRLise4Gy4ZIxfTXP73nZv1Rd
	ANY9Vuzujr
X-Google-Smtp-Source: AGHT+IEvXWQPkbse+1TZFYvV9GFzs3TTKhUQHH6xAG6PoHPjcvvJBrVljAaaP1qKdRS2oerdUw662A==
X-Received: by 2002:a05:600c:4506:b0:477:7bca:8b2b with SMTP id 5b1f17b1804b1-477c0190e57mr490716025e9.15.1764678832650;
        Tue, 02 Dec 2025 04:33:52 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4791164ceecsm303438075e9.14.2025.12.02.04.33.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 04:33:52 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 1/3] babeld: fix installation with usrmerge
Date: Tue,  2 Dec 2025 13:33:49 +0100
Message-ID: <20251202123351.1645828-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 12:34:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122261

In case usrmerge DISTRO_FEATURE is enabled, the recipe installed
the application to /bin folder, which is however a symlink to /usr/bin,
so the installation ultimately failed.

To fix this, set the correct prefix for the installation.

This is a partial backport of f91983f1f3e897d25ab477fdfb5baed89ccc0daf

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-protocols/babeld/babeld_1.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/babeld/babeld_1.10.bb b/meta-networking/recipes-protocols/babeld/babeld_1.10.bb
index 529cccf872..79b954478f 100644
--- a/meta-networking/recipes-protocols/babeld/babeld_1.10.bb
+++ b/meta-networking/recipes-protocols/babeld/babeld_1.10.bb
@@ -24,6 +24,6 @@ do_compile () {
 }
 
 do_install () {
-	oe_runmake install.minimal PREFIX=${D}
+	oe_runmake install.minimal TARGET=${D} PREFIX=${root_prefix}
 }
 

