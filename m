Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75125D2F7DA
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 10:54:10 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2991.1764932041048529787
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Dec 2025 02:54:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=KpKxxfHM;
 spf=pass (domain: konsulko.com, ip: 209.85.218.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so275236266b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 02:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1764932039; x=1765536839; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wAMT8e0O/rHgkPvsJpK9n8AVy0pZxDaPnbN4KeLIxy4=;
        b=KpKxxfHM6hTf0Ve8Jl7kNsAmy0+5nliFcwg+y+s9H2JztADC0oDrPlIsPlQsLQ1z8j
         rXz+jcw/Wdh3OLKO7RqEiVy6CfeaVBv/qF6CiyDR+32dFtSZmmrxIyrfkpgBiTLq3WQ3
         eBG5pqFKdbfpeorE/PoH6tlIIzOADOS1d9NXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764932039; x=1765536839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wAMT8e0O/rHgkPvsJpK9n8AVy0pZxDaPnbN4KeLIxy4=;
        b=OQWNFAq48Q+zQ8pxDLgu/IfvGNsynAtqCZol+JfL+JpN8sbpIkQ20z4CcLituyxTGy
         lZ9M3ZeUDEX7DI7h8aK2VRrSVB54OjLMxog2nvvpkufNlCN1wt0sLdrUUONVqj+GRuG9
         DBGZVwtH7swcAeV36vtE/0Jy/L+LQ4q3ALdsgsuAYmNOimgq8k6Tz7FSXzwl9084YMdU
         3b6upRZj9PZqISWodO1Wm9YqO7PJHi0Vmj7sUGA2vid6AtdQz+Ks/XLRJwKohN1a5DtI
         7cp2hgKanqR6jJdKyVQEqOgI0+Odfs/A5wBTnNm4xnfIBNCT0Xr0k7rkZ/qzp805/Agf
         9zpg==
X-Gm-Message-State: AOJu0YxTFcEXpU3wmHRf5kZDaWuzGvY7I93rvZO5vs9K7U1Q6wvCp6IN
	T4P7Qzq2H0YJsaGK22SacYhp2/mv7KpY8FawO3lIb6X+kdD3lBtDSjSJMAlV9tWSxEDyRHfTOM4
	u5RKi
X-Gm-Gg: ASbGncsJ5lYkY2kTOVVfMEI81Q2luALmmn35ey7M/rkTJlexeRstJsjpp5+dX0nUqoD
	VDLDfBEJ6MGwgBH2HIwfbeAc+oDDtyMCW13GLllTKb7XNU9GqeyqO+WIWB3aflxX0ft7tiHQtKr
	5D4TruYum170gu7eM1urMDOx6UolezrgKzHyvgVJd89zgNg6u6WQFW0IZP0nmIjB3L/lfJl09CU
	KpSF3dEZKut1XrHQkmIrf44uhg2aPwoeqHkfUAGsQmHLZuRebWxC8VZESNXd31hJT0ELLu8aXdN
	o2Ia7XXj8ltQML5jZTUClToJyVJkxFS4jWtLD4GOmSD8ZxQWRoLSXPSubMrU/9RN3VXkOLuJBbu
	vYpp0K26ZNQolgWAGFx6tJLNYqpKATK3DSowP1ogqC2Cc1Sf1i9Fc31CNp1O2dJow+qIHgMZ9Pl
	hIuMjAq5SaI9+BW06DAANE5LySEKgYObkB5BM=
X-Google-Smtp-Source: AGHT+IHhtjDsaEjPn/WHuk8YhCpY+Na3eF/lEcwiMvzvyuBWUzJLUcsOrXlNvuQGNQ6y8OayUKwnfw==
X-Received: by 2002:a17:906:7304:b0:b6d:5262:a615 with SMTP id a640c23a62f3a-b79ec6b93bcmr688179066b.41.1764932038901;
        Fri, 05 Dec 2025 02:53:58 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f44597e6sm346398466b.12.2025.12.05.02.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 02:53:58 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-huey: Upgrade 2.5.4 -> 2.5.5
Date: Fri,  5 Dec 2025 12:53:55 +0200
Message-ID: <20251205105355.1922620-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251205105355.1922620-1-leon.anavi@konsulko.com>
References: <20251205105355.1922620-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 10:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122345

Upgrade to release 2.5.5:

- Fix for pypi

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-huey_2.5.4.bb => python3-huey_2.5.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-huey_2.5.4.bb => python3-huey_2.5.5.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-huey_2.5.4.bb b/meta-python/recipes-devtools/python/python3-huey_2.5.5.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-huey_2.5.4.bb
rename to meta-python/recipes-devtools/python/python3-huey_2.5.5.bb
index 9402dee2f1..d80ece1fc7 100644
--- a/meta-python/recipes-devtools/python/python3-huey_2.5.4.bb
+++ b/meta-python/recipes-devtools/python/python3-huey_2.5.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4"
 
 PYPI_PACKAGE = "huey"
 
-SRC_URI[sha256sum] = "4b7fb217b640fbb46efc4f4681b446b40726593522f093e8ef27c4a8fcb6cfbb"
+SRC_URI[sha256sum] = "a39010628a9a1a9e91462f9bf33dc243b006a9f21193026ea47ae18949a12581"
 
 RDEPENDS:${PN} += " \
 	python3-datetime \
-- 
2.47.3


