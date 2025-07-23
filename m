Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B88BC83F1A
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 17:28:58 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.21413.1753291734186779115
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Jul 2025 10:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MHd3oCM0;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-23636167afeso507005ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Jul 2025 10:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753291733; x=1753896533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K75wQ+9p2sBjh4+6MguthiXoiRwZI4gu55RRsrjgbrg=;
        b=MHd3oCM05Jmcnq3qYGlNzvxs7+7+5Rm+Bdcyb6b3sgAzjYmfbPNBwkVtWNmcTo6mk8
         CtWHyAgQLtZFm0KC++Ie4wKGSg96Osy9aHqJG0hbrIRyOXNBsBGdak2A2mye0Ws7Z2hm
         1Pjs3b6ajl34286pj/GsVnAAQMT85RjStNJ6BM2vwyS4jr5g0D0qGnZXJUR7VUcL2bLk
         yRT+olSB3AJE3xzHFaglAnRRufHjxsHs0+dB6wC/FYospGj9q7ktvXWhp3mcvR7XvNwE
         sr1dOQ93ZMaASOeL7qpJxthxjIgJ/NtT0VAFKeSyjFWnRaX59ne/WeCawKqAztkGBeeQ
         Hjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753291733; x=1753896533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K75wQ+9p2sBjh4+6MguthiXoiRwZI4gu55RRsrjgbrg=;
        b=XTD5FAtXke+KrN9bMovRendcyF6YlCaYa4as9MUNd4fmY+J0dygvppo0/X0gSYk2D1
         4IMkKbC5O0/kp+0LsUgbc+ElGkTZmNiDC/ppEnfZt+ZwTtDfKXNYu8r0nHPsZD7QvXnq
         z6cO7IL+vPcHTQdK++iLYwn8RV/P2rLwf1YSW3wHi/ZBlvHXNas/SYFk/S9w8qEp8JZG
         Ohg+xoX/JvrxGNvKwd8KD2A7hd8sDM08+zV36Us1Zlfr3R6YSamsyPyD2MJUTlOM2sDd
         yd7G4uflP8vDDNdir1qfwadImKjtumjzK0EhhfY8s1H/N8Z+9pcpqzkHnacwXj5UMADb
         BJyQ==
X-Gm-Message-State: AOJu0YxkXe+cavg8Z8tJPBMPGuUn4GTGRYO0JHpNgErl6BJaaNLWKzso
	NiUMUt+dFkvWtu9db73Jbg6hh4BI0xB8SIWs0WhQXPym1DPKyI/lynPljM0I3Geyht4=
X-Gm-Gg: ASbGncuWlUcGLBHmcKXhbkfUk31TaHqQLMPYwQpDYfSFZ9OCXCczL/dtIJVcJvNCWe1
	2iqNSWe58I9lTdA8R/YA8H3tfiYOAwA6zTbNII2bEmhatLx8rtKUU98SL/F8Fy52DAyn31BHG0A
	yA/Cig/w7o4qRA9qKVL3a6ODhcxgH0hhoIV5DUsMCV3zAgxIVz3z17j+E3YhnlxGCrK9cUKofQB
	hzBiJ2csFZ/+mmQC0uWQ7o4rhYO6t3dCKeChMuqXTE7Rofjt/M08ILGgT1JBWdohYNobg55Wmh3
	+oFl/s7UZwlPWOfqKQPqwEYIaMigFNGeHPU1J03lxaARYfAsUhx7dfGd1E03LGqwAvXYJCmzaWK
	AYHpHjnIAgSNXMTRIbOLGfYYe
X-Google-Smtp-Source: AGHT+IEtFBR0lmLUeqJbjh3RN/PkFOGE7pOUOgk3dEJMbF/QFsHcTKzV6eclwqVWakAccM/gxEZ94g==
X-Received: by 2002:a17:903:178e:b0:235:225d:3098 with SMTP id d9443c01a7336-23f981f2ef8mr60440595ad.46.1753291733259;
        Wed, 23 Jul 2025 10:28:53 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6d1db5sm100487395ad.142.2025.07.23.10.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 10:28:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-typeguard: Add missing rdep on pathspec for ptests
Date: Wed, 23 Jul 2025 10:28:50 -0700
Message-ID: <20250723172850.10267-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Jul 2025 17:28:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118719

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-typeguard_4.4.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_4.4.4.bb b/meta-python/recipes-devtools/python/python3-typeguard_4.4.4.bb
index 83dc52ca19..812288881d 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_4.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_4.4.4.bb
@@ -18,6 +18,7 @@ RDEPENDS:${PN}-ptest += " \
     python3-typing-extensions \
     python3-unixadmin \
     python3-mypy \
+    python3-pathspec \
 "
 
 DEPENDS += "\

