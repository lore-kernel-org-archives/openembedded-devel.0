Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F46BE7719A
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 12:22:48 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web10.19080.1736252560810348627
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 04:22:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O90OVGrq;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e53c9035003so19250770276.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 04:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736252560; x=1736857360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fgeuUGV07SREsDI/B8/M+LLLMGRSeFem/nAnqmo52F0=;
        b=O90OVGrqUm9ArScmqiU+Th0SzzekBpU9v2HzNomt3f+Ry97WX/SFk8tVP2Fliqzi3N
         3iFs6AeEWNF6UE6+B2wRXNvc6pC5RgPGsygRVuoAeu9Kn0SvGfRt1pEYS9rYxsV4pqX/
         CaLsgpog7CUsTKsgJMV8flGbCTw0DuYfVOx05PCTY02J98iU2q7YioPaLt8m0/Uk51z1
         fbh8O6eur1RYmvwu7WY3J9jv4lbmTh7RZ5hZ6a5de5o6qufjPX0qxYih3QEcOc+D1+U3
         ggIDQFoF2lJVvBeAmJmmLvh04iW+q1wzWJO0Rq/rLbfSyHpxrffoglu8NVA5LHBT+9RE
         WYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736252560; x=1736857360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fgeuUGV07SREsDI/B8/M+LLLMGRSeFem/nAnqmo52F0=;
        b=IK8tnGRpNR3kMGj/KmgCnaAyrdVlakc7lnTBoIpTSFZ9dGD1f6+ZQg4H7jzHuMY4RD
         +bpBs65pj/DKdIhGYM58+5VAVtQl1TUw5rZTA80IDiO0JTJAqTnAbLYGvR1baDr+DuhB
         AgkIXkXMAWm7te8AymnrycWbAqqYuLuZVJV3qIHDxZ/JfAyZG7uzN9kWhk1QA5mBW2BX
         bGbXFsUQO7uxy7ANRISL0jG6qAXnO694ODqesNlDkbhptW+HGKhVxpEm1c+bNmfaUYsR
         zdD7c2wNEMpjwmkAFsxcDJToePFDU7rndqotLMZo9aNiTMffYa2KUVKYLFLpSSX5Tjuf
         +8Sg==
X-Gm-Message-State: AOJu0YzO6X6eYaIU3TzxBlwJq02es/LnSDlWgSuCtFlndZZf0aDA3OfU
	vOFGZkVHCogNQx8xKemX/9pdKk7x3ome2hLOTDE9Zc+LtBOJM4lYaNkAFG7c
X-Gm-Gg: ASbGnctXg+1nHUi1nPQDSikVinGeoYq1yK7NVsIo3zwGHJRe/mSbBosTICnKj88nO8i
	IBReGZKRzLY9BqBa7iSplSueZCY9vxc+3ePv0LP+YfdZBmm3Mc89SxWd0oUHZwWmiKq7l65cmDB
	HDjuQHprUD0YX9b2pzNkIGzMqWJvLJUpy/0bVCyglREQrknVQeN3JDj5S76HRV+x2Ha3aVRxtxG
	/xmoF0U400OddrP7DYMKyNOmy7keEFcfSlwXZgqM3r099BIkJBoHJqbQj/SUMpO0QGFB6M=
X-Google-Smtp-Source: AGHT+IE5ju9zt2wonYzvFgnbyIh6goYu+VAtxgVBssGMlHZ2fVjvygwgKoIhXJ42HCHDVcPY5oeHkw==
X-Received: by 2002:a05:690c:2902:b0:6ef:7f89:d923 with SMTP id 00721157ae682-6f3f820cd01mr414663637b3.31.1736252559724;
        Tue, 07 Jan 2025 04:22:39 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:c122:4970:902f:30e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e73e7c05sm88318047b3.15.2025.01.07.04.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 04:22:39 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 1/3] geary: add itstool-native dependency
Date: Tue,  7 Jan 2025 07:22:36 -0500
Message-ID: <20250107122238.1517492-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 12:22:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114694

From: Markus Volk <f_l_k@t-online.de>

fixes:
| Configuring org.gnome.Geary.service using configuration
| Program itstool found: NO
|
| ../git/help/meson.build:21:6: ERROR: Program 'itstool' not found or not executable

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 34962ffbbef0a7b8af82121655ec78a4b7c7e055)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-connectivity/geary/geary_44.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-connectivity/geary/geary_44.1.bb b/meta-gnome/recipes-connectivity/geary/geary_44.1.bb
index decae6b2c7..93cad3fc88 100644
--- a/meta-gnome/recipes-connectivity/geary/geary_44.1.bb
+++ b/meta-gnome/recipes-connectivity/geary/geary_44.1.bb
@@ -18,6 +18,7 @@ DEPENDS = " \
     gtk+3 \
     icu \
     iso-codes \
+    itstool-native \
     json-glib \
     libhandy \
     libical \
-- 
2.43.0


