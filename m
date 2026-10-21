Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7574.1792575049980491696
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:30:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Q+S17nqW;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-18cdcfc05ffso502699c88.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575049; x=1793179849; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qRmWPLXpTjUvZ/R6YXZXwRgJPUBZlIjpRkbSr1takPA=;
        b=Q+S17nqWwBWsrOGk0OSbS4KJQy5e5SLcpEBLEfpRSH1lsY122Sr/nEv4pAdj3LopNO
         djI/fWf0wOen07kTV1OHQktuOxmmqkZP0YoOjTMVjWMpOJIDWF+6s9Caa7tCc+mJV7dg
         iD0XU2yuqEbSaj1DV9l1+ywLsPcmOvv1aunChbkRacUYnetaHKb3ycYLqKciuUud2SQb
         6mfxsfKpgEMZQUw42bo7pvdw/z8glKH9LGZPfbHlqnKrA4kfDAsnKDK7WheWNLvg/Uv9
         MYHoARjz7R2xfGAv5wqdkeGih8YkqMqiJBHr41aW0yHmjCZR79nmLLtXbmLJhjftFR0u
         blng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575049; x=1793179849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qRmWPLXpTjUvZ/R6YXZXwRgJPUBZlIjpRkbSr1takPA=;
        b=b0CsK0q8T9sQqseUTs9u7YcN8kE5+bc+vyW6Jqs+LkquimXovd36I6GxXZP0WtkNGG
         6QL5+8FuEpLxzqxtI/cXZF8H786ct/zwxB8dRFE0ayo34Ibuf/EDEnHCJYwexrO9JOr3
         NsH7ZymUSslvsWGn7SLtRG3CaGBdcNVn4LhVwlK5Mj/2IDc3Y3cZY+AgHnNC4sLYZORA
         L/X+43HICkgbUqJ+o4JynHeFmJmY0akMC89Rs0CMWwlKlEgKitpxFh15FtpfURpsMRYV
         Z0iiBJN+nnvA/KDVNlWoHBMF46iG2Z6brsKEYeataIib8cKi3tEQTieHp0D7ocHz5po4
         /dYQ==
X-Gm-Message-State: AFq9FYJlzhnPwN9daw/A6v8h2VGajYDOS1ZF4EKhrjgFGSV6BYo35w9u
	/K9ItU2HKKTHKFlOz4mRW02j+4VZmpwYV9TnfqKL/UkjNJ9v0gWpuubfjB4ugw==
X-Gm-Gg: AYBFou2JX+0Ic7CGlOh42rzppb5DFiDjhxWfIRZAsI7pgVJLmBqkvcNKLC3rb2Ix0hJ
	9iMeGIVqmP8+yIBmrovFv5FU96H5G6fCBlUv9nXNQ2QGzma4+i2hgfHNrLmyxbgkjgmeK/0FA0+
	vvjiX/MI9p87fYNMP8zc1Vyay3a667eAsSEnn/uySdwUmyeopDGUxMvrmxeNGWAcexnV8GfH/cl
	NuhAugsGnvOX8PXdaMX/RcfaRjLw/vfbgDmLYu1exukSCTj/pyaCsJ01ts18QIg6rWU+eoa/hFe
	86mETBg3Oj/Jh6PkRryS9TTL+34fA356pPI5/dPIWbrFL8cr+fKUbhdKx6xTgLDOetRHTf0aKIa
	iSoywrWhKKMUxfKFCNuy/xSG3kQaNi8zbAzjEc7t7dO/4gLJVLsVoYWPWbhYF/V2ZblIF7/OJj3
	ozjkiXA/oIGHuw9oLphAy8XGiTvj2hsVvSeBxdcdxpb8Y16rwNBJ/e0NaRDcPOOVTgFpTCLQ1L7
	MigVjGvq//iDao7NNVFkpUHemRASe1oRphFpS7i29cr7RLXfL9cgYKAY6+j/mXUKYK+UdHs3pB7
	lF1iy7BuZfHTYBU7CtlJgHwuXcZUuC0=
X-Received: by 2002:a05:7022:b047:20b0:14c:1f57:3ea9 with SMTP id a92af1059eb24-190a6adce43mr2019068c88.26.1792575048534;
        Wed, 21 Oct 2026 02:30:48 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:30:48 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-webserver][blacksail][PATCH 44/44] swagger-ui: upgrade 5.33.2 -> 5.33.3
Date: Wed, 21 Oct 2026 22:28:57 +1300
Message-ID: <20261021092857.3585453-44-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:30:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131231
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/swagger-api/swagger-ui/releases/tag/v5.33.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 67b4387a4d9f2fbc111b52ec6cd3b7620116c6d1)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../swagger-ui/{swagger-ui_5.33.2.bb => swagger-ui_5.33.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.33.2.bb => swagger-ui_5.33.3.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.2.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.3.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.2.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.3.bb
index aeee9e4da6..6f69070033 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.2.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=main;protocol=https;tag=v${PV}"
 
-SRCREV = "e89a91f13cdee432d97ca9d3d1ac1969ff797036"
+SRCREV = "38ca10e1867a66525751590d8d51011973107ad1"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 
