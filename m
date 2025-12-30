Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B12C9EE020B
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 14:29:12 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65071.1767104949802352667
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 06:29:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QAqlZcUP;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso81069545e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 06:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767104948; x=1767709748; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e7S3X1ymN6TbyXCnNSOetwGwdshOhtb5v4U94N1eqzE=;
        b=QAqlZcUPI9XHw01on7VGOxeeXirZ4bfTTRW5S9BTizlYxIqRnf90zOnUkC5jiPJ/vz
         4Z69z9dAcY9WSmAwJ8+OdbGl4F/Kferje2Vy66KnkXVLhuuunEEllbBRlKq+zMZjPJFO
         FODXh+QzqIdhZiHKHzuZk10+LhlF2T7yGeO+NyyHmLIQ6ozfiKnskOKGyn7Hi3Dji1Hm
         3ClOe1m1mY2v26zUBdgp4OVFdiVU497CboEHJvokMGB/gMpAb1tjKTR5bYFlnbblCXy6
         wwc4FcQXSGVfGLUJISjMaOadU+Uip7ihRxENICFjOKAwrvDZ3m0vA5MAP8Z1ugxz5bdo
         RayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767104948; x=1767709748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e7S3X1ymN6TbyXCnNSOetwGwdshOhtb5v4U94N1eqzE=;
        b=bKbe2dMfrdTjg+oNXMvzgbHaPUgRHmtN6qT8H2IIj86Ao8US2VbRcEWS4zHqA1BLDq
         /ENLUfXukfEMe8KuNQqxTvZknWVt0ZYqrsr5mjH/or1yo6SAuqKJwDFYnpE8rztO6R6I
         hdsVNMTkmVZ0tkpHpOnxclAwB+hxyBmzmNnKBEfLAVfh9OkiNOtWayD56VuiV6cFvdk4
         /ef9m0IxjXKYA70ofZtrNQetqwnAKVO7j0x9+D5OHj+TExUo0g2fZirrzqhesEV9WS6k
         odgA32E29qEHylL2/W9CEOjecECgC3lScbrqekLLdWYI87gAi3FPNVfwLuTNB2TvqnKL
         mysg==
X-Gm-Message-State: AOJu0YxI5eWXJtd82zSz9i5585Skz/5edRSAu4zuZMfFLUgac9tbt5Dt
	550ZHpajDjN3AA+E+0IsYY8KwLX3cmAsKy3eAVDtCMaLzlhEkyU3peceFrYjzQ==
X-Gm-Gg: AY/fxX7bQ+d6Lzy3If321DDrOx4kvX4VaPcqwUJnwovq4q7i8znhyEZfdHdn546UPNF
	14qIMmGqtE3Yu35sLpADk+1727tWp2bjrglknhX+vkxCBjf3Aveeimh6Is+6QtPlvbYoM5fKPlS
	TQ8wY7M6ahEeK2/SIM7Or2i+QGVv/sM6Ur5SgbjWPEewNn+g56rOCtW0u6BZxVbN67PgETu/Klb
	1KLmKjKSMPitccJSTHNhn6dL1jvFegb83XV+5P2QTccCFH/PIIC0woAlKgvNnFGOi+Cy/zfAAgM
	Fk49GYuzVa1A+nvw8P0MazONCRGe5hPm1wW1OFJfhWCN1bG7n4DU2BnwdSkqe8hbEU7TVBPdXpt
	oYQ0pZpUMp5zTM54ENa+8hhowW/B5OGQOt6Rend8ieEe75QpQyECMekMV2DGi8Gdi/Qusd+jBBj
	YPDzj8zcEf
X-Google-Smtp-Source: AGHT+IEKC3EFmJnpZ8kLO6ICwsdd/Eo03rHc1vhNSNlLsa/PsIe9Qdhju26HgUpwIUE8deQRZyjfqw==
X-Received: by 2002:a05:600c:1385:b0:477:7b16:5fb1 with SMTP id 5b1f17b1804b1-47d3a5f47b3mr236655005e9.7.1767104948049;
        Tue, 30 Dec 2025 06:29:08 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273e4d5sm653345045e9.6.2025.12.30.06.29.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 06:29:07 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 07/10] python3-werkzeug: set CVE_PRODUCT
Date: Tue, 30 Dec 2025 15:28:59 +0100
Message-ID: <20251230142902.730667-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230142902.730667-1-skandigraun@gmail.com>
References: <20251230142902.730667-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 14:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123023

The relevant CVEs are tracked using palletsprojects:werkzeug CPE, which makes
the the default python:werkzeug CPE to not match anything.

See CVE db query:
sqlite> select * from products where PRODUCT like 'werkzeug';
CVE-2016-10516|palletsprojects|werkzeug|||0.11.11|<
CVE-2019-14322|palletsprojects|werkzeug|||0.15.5|<
CVE-2019-14806|palletsprojects|werkzeug|||0.15.3|<
CVE-2020-28724|palletsprojects|werkzeug|||0.11.6|<
CVE-2022-29361|palletsprojects|werkzeug|||2.1.0|<=
CVE-2023-23934|palletsprojects|werkzeug|||2.2.3|<
CVE-2023-25577|palletsprojects|werkzeug|||2.2.3|<
CVE-2023-46136|palletsprojects|werkzeug|||2.3.8|<
CVE-2023-46136|palletsprojects|werkzeug|3.0.0|=||
CVE-2024-34069|palletsprojects|werkzeug|||3.0.3|<
CVE-2024-49766|palletsprojects|werkzeug|||3.0.6|<
CVE-2024-49767|palletsprojects|werkzeug|||3.0.6|<
CVE-2025-66221|palletsprojects|werkzeug|||3.1.4|<

Set the CVE_PRODUCT so it matches the relevant entries.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-werkzeug_3.1.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.4.bb b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.4.bb
index 2cfb5864b1..0886dbfef1 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.4.bb
@@ -12,6 +12,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dc88300786f1c214c1e9827a5229462"
 
 SRC_URI[sha256sum] = "cd3cd98b1b92dc3b7b3995038826c68097dcb16f9baa63abe35f20eafeb9fe5e"
 
+CVE_PRODUCT = "werkzeug"
+
 inherit pypi python_flit_core
 
 RDEPENDS:${PN} += " \

