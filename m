Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33CBAEB2717
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 20:46:22 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3328.1770756373526634705
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Feb 2026 12:46:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FHfCCyxt;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso10795845e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Feb 2026 12:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770756372; x=1771361172; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IL/vw1PHQ8I8al97gRgXm7IL9KiRdYmbjEGLENBSCIM=;
        b=FHfCCyxtyAYjWMZUiLi3cH4QSja2lCd2JL9+/Ea492O7cHwYkJacy6lcdcvoVaOVlA
         o48vuSkkRV8UTtquw/RUQSwMzfRoSNTTTNivxAzt1qkCoHVUY1boFluT2MXi5Ecrt/n2
         i1xyezIu6ESxC4fWAiXenIdtw8/g6//Vmi5cXE7XR4Hv821VLkFDUjm/Gat8qPK38+Tf
         IswxhhIrr3VoOu5xduvRUFGF+DrboyEdX9kcwyJg4koLjyV4qDH0vbySk2UwCMQU2qII
         PGN6/XoXDIR/PGNyHMyKB6EmrX1qK6UDU08O8JH8IMnWlKn4W249a2YPdgyC11flASt6
         4Apg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770756372; x=1771361172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IL/vw1PHQ8I8al97gRgXm7IL9KiRdYmbjEGLENBSCIM=;
        b=STQJnXa9028JPlukMxWyBQz6Mny3I2Uq3OkjoNQsBwYREY4t3rgI7075MmLt7qt16/
         PVWWiBH8LDnjDGhDgWt20w2o6IlUWv8ChYSL1+tL6jUJ7DsFUQAAHkULYWGg4Z5S4EIi
         9S6MWwlQe1WALzrJoJQzb11Q5IJaYCkHpVQYFJyxrvMafERz2eqK2OZffi9D82u5x/07
         /UrZwWQ85gzvjmPYUI9vIkNcU48RlotnTF4/FcPVgo/ohWizG24OEFM5Wq1UCU9i17kB
         woB7zb4ZIQS2fp5KHO5ceCTCBtAs0ZeAYhm/wbz9KJ0R3iTijrVNOHGKkIi1gyBTAchK
         LVwQ==
X-Gm-Message-State: AOJu0YzRaTvMQItFFKtD00X/JoE/djdNY3PUyWIjqRJJk5IxzPzEfHvt
	wEAkOt5Mp9oWvrt4763kRDW8tFgrv1UyWhScS09KiXYjS4URU1hMP5zJbdeGOQ==
X-Gm-Gg: AZuq6aJPdhhVaOGqunGsCuxxpdCjECU62XFk/vppWBwcpw8Xd7ERnUUVEanyVMFBNlt
	Z0rNKs2Xs5IvMI4uRjou8VbtwVcNNW3tQljs5peIwHfEAZhkqA9A6EgKH7NkbiasSI5623SywMk
	5eKjaMzGfoIgLfQ4KfYnWDnRrhSLObQPXrm4yowIOLyLgRtOsBBOJyBxKLejvqH5pA/6E2Msk7Y
	JSo6jnDH0cK9ZQhFkbHuu7hkVgJGXWRcA0sW8XiczyC2sEK2bppHz9tkjQKIlSoxVXom6fkmnpw
	JaaEtmWfye6SIQu1gr+TMIdT7dtAEYZErSP8mM9FT0P3Uxd0AlMmcHLFQjBDDoN/fZqEU/c2V5E
	U0VeYvJWMzGGAM7H9O8m2tlwhGZGj2+yN8owgm08R2aHI1jpagcvNxBrx8N6Mv6/gh/QT9hCQMz
	wJ//DLT7IDXH6gDLrSI8kL
X-Received: by 2002:a05:600c:468b:b0:479:3a86:dc1c with SMTP id 5b1f17b1804b1-48320229cf1mr249229765e9.36.1770756371861;
        Tue, 10 Feb 2026 12:46:11 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376d3a32basm20198176f8f.14.2026.02.10.12.46.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 12:46:11 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][whinlatter][PATCH 2/2] python3-django: upgrade 4.2.27 -> 4.2.28
Date: Tue, 10 Feb 2026 21:46:10 +0100
Message-ID: <20260210204610.169129-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210204610.169129-1-skandigraun@gmail.com>
References: <20260210204610.169129-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Feb 2026 20:46:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124326

Contains fixes for CVE-2025-13473, CVE-2025-14550, CVE-2026-1207,
CVE-2026-1285, CVE-2026-1287 and CVE-2026-1312

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{python3-django_4.2.27.bb => python3-django_4.2.28.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.27.bb => python3-django_4.2.28.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.27.bb b/meta-python/recipes-devtools/python/python3-django_4.2.28.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-django_4.2.27.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.28.bb
index 86425ca724..2c6d33991c 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.27.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.28.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "b865fbe0f4a3d1ee36594c5efa42b20db3c8bbb10dff0736face1c6e4bda5b92"
+SRC_URI[sha256sum] = "a4b9cd881991add394cafa8bb3b11ad1742d1e1470ba99c3ef53dc540316ccfe"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \

