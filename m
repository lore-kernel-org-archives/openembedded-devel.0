Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EAB6CD6E4A
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 03:40:25 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3762.1780544419388560235
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jun 2026 20:40:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=l4KaRiro;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2bf22d29dabso1601615ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jun 2026 20:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780544419; x=1781149219; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8tfZqV3z4B5Dmombx+BNA1/H1ZattmC0RuK1jiU9F3I=;
        b=l4KaRiroM83/RLBuTkjyCwGlRJcqVPIElIFRojIl6WVyXwUKmzhkRD+93EMGw6nCp9
         f9rjPQ27Ce8RD/SMSxBKW8I3z51NYl9nfXGj5HURU4l8S4wUVE1TC4JkXvixagPeuYrQ
         WKJE3klWi3YrSIL07PvauYady8Q7MEyoEZMLwq9GqZpRBif7ZQ9tTVUFbX5XE88igMU8
         VRjD3NYCEdQ0eudOgViQzWJ4USLgmbtWdslf+q/W9f+t9zYNsGfrpgvJkvtw7tjnQ6yK
         Z2zFiQxK3NIWf2w8xKSbYg10eIz8OneRnZQwgW2z14JKdZdaSI+l8IAJOztLiTrIc3p7
         YhGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780544419; x=1781149219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8tfZqV3z4B5Dmombx+BNA1/H1ZattmC0RuK1jiU9F3I=;
        b=gUI+mKDWZaWDA+1QP+b/vxdCsfwLfawZOcfmtf/lJyUb3NM+8riEaAXoCQtUVtyTsn
         0WZMR4+5yN0NrZgG0+At2QxjJh22lBK6xzfv84HGmKsODVIWBKLhUbkAMg4pHv299g6a
         gnptxgzSrx6poEoGVgCjJzWi4ceUv6NnDENhF8Qx+rb9KiM6SKS+imAKdgWBptxveMu4
         qFBzyeC0wKF4DGIRe7tfl2XxAFg1Od8r+IhHyovc8zh09rojaXsWSPhBf4owpQ10H7EA
         DbXTvXqzOVdYV+tCiWbk4CCPGc7warOJ/wcKLRQQQuNCI3OyamFDd6JeXcZDoc/v6EHa
         +daQ==
X-Gm-Message-State: AOJu0YykcBXhtcrL/ruI1G4u5YlkJXdKJqCqbn+zvtuLtGc3P/VNDw1s
	kvcHbDM4tvZxHfuj4WLjDdGaY5MXdrqoHUSPYhZlG2Q0Hb+PinTzPfaeXkCoKw==
X-Gm-Gg: Acq92OHA2vnUhgeISRgA6VYhBbgdHJgcnaUOdak0j9ia0Z89HC3B27HqkgqNf1m6W2Q
	x68jkDF+2v2OMeVAGKISbT9tik33826gJT/5lw8LPDFB8YpckdMWGh66S00tg/6VZ7oG2Iq3l8y
	IJ+0+dBPyeiBmnMLwAfPBNmrKEELn396n4vCWx2E3aBwx0TmGngpEyU8n5D9Z8VneDfOIU+QMbS
	tO8z0aGrOOoIa4o9zWWqOOdF2X1OTpIyu/E/La67aty8c0VDGU/dh9J3eZtXSItzH9kI0BWH35h
	ts6+986AIqycNjHEoGtQW7Ej3ilvBClrVpVVQoUpBbMZ+Tbi63CFzfGfHmJIFmNkfowJCvOFbuK
	j1BbLULWBvMteTH/m/dgZRzfnP7Qtg6Vp0otr1C90HyA9IYu9OKgXx6gNitBO/0v8qrs7JjCL39
	OfWx1Or07/0mnK2v2Ng+aJp8TePKuBujDGtM/vffSnzQM9sPY=
X-Received: by 2002:a17:903:1a10:b0:2c0:cf44:3b60 with SMTP id d9443c01a7336-2c1644d82aemr67512585ad.36.1780544418624;
        Wed, 03 Jun 2026 20:40:18 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d395sm55632295ad.17.2026.06.03.20.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 20:40:18 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 2/2] python3-django: upgrade 5.2.14 -> 5.2.15
Date: Thu,  4 Jun 2026 15:40:05 +1200
Message-ID: <20260604034005.2879319-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604034005.2879319-1-ankur.tyagi85@gmail.com>
References: <20260604034005.2879319-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Jun 2026 03:40:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127393

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://docs.djangoproject.com/en/dev/releases/5.2.15/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-django_5.2.14.bb => python3-django_5.2.15.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_5.2.14.bb => python3-django_5.2.15.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.14.bb b/meta-python/recipes-devtools/python/python3-django_5.2.15.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-django_5.2.14.bb
rename to meta-python/recipes-devtools/python/python3-django_5.2.15.bb
index e9bfabc734..557c2f1522 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.2.14.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.2.15.bb
@@ -2,4 +2,4 @@ require python3-django.inc
 inherit python_setuptools_build_meta
 
 SRC_URI += "file://0001-fix-test_msgfmt_error_including_non_ascii-test.patch"
-SRC_URI[sha256sum] = "58a63ba841662e5c686b57ba1fec52ddd68c0b93bd96ac3029d55728f00bf8a2"
+SRC_URI[sha256sum] = "5154a9bf84ac01dde011e367f355c07dbb329532e06810dcf3ef2af269e236e7"

