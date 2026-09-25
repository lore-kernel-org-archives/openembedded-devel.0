Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4780CC98321
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 17:23:29 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3508.1790357004312335593
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Sep 2026 10:23:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=p/CaQiVe;
 spf=pass (domain: konsulko.com, ip: 74.125.225.140, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3920so8788025e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 10:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790357002; x=1790961802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tOSCm7gMAMQPHinySzG8DWTIqyiq4xAm8wtq4QvZl/s=;
        b=p/CaQiVenav2W95Dhw8F14IC588a/kouZyDTBlfilxeabCEuGGd3N2DGoI3Ox1N3+s
         4V0csadrkj8m/g13Vi4SwGbJe/LfKhQgPEs8hXl3z8vRu9xEiwo/eIt7d3dxDPfK4J+r
         56jWzHI/gdjwZtrbRYolw2n1rxrKae/xNhLeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790357002; x=1790961802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tOSCm7gMAMQPHinySzG8DWTIqyiq4xAm8wtq4QvZl/s=;
        b=Dp6QMLsdZDdJcGvqmx471vJPa67FupGcCMZuxE46sxydJX36RoYDtVkxmNs6Inu8Fp
         4KTxMXKR7cBd16jPiEbRN1c3jp8l2F/PlIYMGuPvnNeRVdzlqhPmkrrj3dK8o/ZyZtXh
         /lPADTCRXcNo0NLvcZbw8UZZvUxbWcYj4J0JWlvLaEb7R8sjX04xHOaKoaWkjFN0GTry
         JJvYywHcBu5JCbo4DAEDEJcRt186TV253bLo56QksaVo/Bf6jPVBFYoX+NQmpEiOJZjL
         1cAKdudXz5rvPgpUovSNTIn8W7C2ztkqeTVPZbeCi1v/5emctW2PRvbpwV6XsAoqT6Cx
         0e7Q==
X-Gm-Message-State: AFuF++keF5Zsi1lhIO9n/bBJMMwLlj6wAZW3n4CwuslhI5RyySbD0u+b
	IQGnZqs9+lkHQZfRTZ9+nrRX4A/lwzb6Oq+suwjCQmJipAqOUt39nnqrWoFkOho8i+4vN9QeSzK
	xIq4v
X-Gm-Gg: AYBFou180tHY1cPuVHQdOWmP4cvZrgoRgrxYUlhmupBc+ZtSNiM9RxhnLy2ACdxB3XV
	I+LpGjao+d52wKoisrZim6E3n0jxbmcdDbVwcl6w8ZqqIpgDc3VI9In/j2h6mjqDiN0bRm54d1A
	uK6JDzgDoWGrc874d4DGG8Kq9N6G8mp4EcEGmVWrnmqgxJj9yFw2j1gvB7h1DXgjlGHpyrVM6vx
	Wqgkwa0XiOgTMWACPnEqMZyucM5TJ8MW6XyNKuY3Y03mvWbW4t5fZv2itzjVdMfoe1MOnFqHgol
	r8jR0cBY6JabBB7SoBdU4RDBpdPJGJBUTBnVfCeQhKe8DqrfyWOAIHKhlYtlf8XHraLEHBczs4e
	n63jnhYlS8kpqcsuVCHo4TZf0y4GJTpOHoHP4I3oOL3K+Nso08usjlVoThNAMwohHV+gKRh+KFR
	wqm33mY/Sa3bf39qtVU7TKnYxs3P5rvKm0JhkWe9NsiTlXpnSj0HTPBeDPuHREKHAt5vlR5T8QN
	jJYoDOM4lA9ywT4SHlh7fD+CcMBBPp8MEqfcN88w0YQIW09wy9KUsIiY7kW8foJsu/X2LiCIt5d
	QPmN8+MKKU5/kRBR+/8z+qg=
X-Received: by 2002:a05:600c:4ed2:b0:49f:e3f2:f5a3 with SMTP id 5b1f17b1804b1-49fe6685393mr120635445e9.0.1790357002322;
        Fri, 25 Sep 2026 10:23:22 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff069d071sm89732515e9.5.2026.09.25.10.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 10:23:21 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [meta-python][PATCH] python3-pydantic: Minor improvements
Date: Fri, 25 Sep 2026 20:23:16 +0300
Message-ID: <20260925172316.2588209-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 17:23:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130312

Apply minor improvements:

- Do not explicitly set PV
- Use oe.utils.trim_version('${PV}', 2) in the SRC_URI

This work was sponsored by GOVCERT.LU.

Suggested-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-pydantic_2.13.5.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.13.5.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.13.5.bb
index 7c5dcdcb26..4ad7df88de 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.13.5.bb
@@ -12,8 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 inherit python_hatchling ptest-python-pytest
 
 SRCREV = "001dea020e0809844e5b17666432c9135a976f46"
-PV .= "+git"
-SRC_URI = "git://github.com/pydantic/pydantic;protocol=https;branch=v2.13-fixes"
+SRC_URI = "git://github.com/pydantic/pydantic;protocol=https;branch=v${@oe.utils.trim_version('${PV}', 2)}-fixes"
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
 CVE_PRODUCT = "pydantic:pydantic"
-- 
2.47.3


