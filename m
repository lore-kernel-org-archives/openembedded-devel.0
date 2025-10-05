Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAAAACAC5BB
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 22:15:03 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.20465.1759702502648335404
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Oct 2025 15:15:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hw89L/r/;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afcb78ead12so743485866b.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 15:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759702500; x=1760307300; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UhpSy+Bu/IjncjU9zkf3eRwwlBtCMJUFzvT4IpWogw8=;
        b=hw89L/r/hiyDMBlJK2KKsDd5KIIZ2cjnoFZ+r7HehiI+FHkgwag2AvAQT4QrquZWL1
         UKp9iop1f9jPIXukYv8fwbZngkl9csGlqI0l3X0E1qkCKr3wC6pUuk+FRcToDdTd/hki
         AokLCyOW5LdiwhO1j1jdaXPXHdVwXA0PFoygvjveKVvLKeGh9iQcRcARvMYWldvUwjU+
         xO3C3L6e+/lUqcd649tq7hcY0/v1JVUnaU0vH/QKANsU/mTMyt5aPouT0ys8IOFqI2y6
         7xdPhiiQk2hNR8pL9MEVAQtJYpb89p0xRXQ/LbZB3Tq+oZMhnJd0o3dZ3Z+byLatWi3z
         V2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759702500; x=1760307300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UhpSy+Bu/IjncjU9zkf3eRwwlBtCMJUFzvT4IpWogw8=;
        b=IkLTZh8lP8+LUnrc1/ngA88oo3lilhX1utZCijEEyI98aj39nLwiq0/ETiIKFZGtbH
         Ya+dsbJs7G5TVU/jYomXnVKfr0yyUjKnh6IOVXV36wqFzAGtaWoR/q237Ns8UgRbJheH
         7yut55qcy4MDdxWwHLSMqL/In+BhDSwYxNy+8cDeQH9XUSjgfCTFvjjOXfBOiVCHIl7m
         AqmCQe54GgED7diiw09Y2HYLxcQvFOv0T2R01j3X90zLEXAeSJx77wI75cNKpr602d+w
         uA5Wf6h4tCeRFcvZqHEqvERC7GpHGWXLtj8RRdxwQK9XRDg7uTQqYun5/JazzdQGIeaY
         aZSw==
X-Gm-Message-State: AOJu0YyGOCPlIhuLwWoSm1ark+/PlvibLNEpce21TvDh3TpC7aUCOh1E
	1t49SeMV3F73EgN5s+pC2akakd8+qIoVM0Xqhaogc/c22PpLNaB84Q17IN5Sel2h
X-Gm-Gg: ASbGncuLZS/Qlle7sODuuJ6XgJ3JORDZLa+es6t5FF4Xp4KH9NTD/ifg4k6sGsCGGdB
	xpSvZSqIghC3+8efeCh0Wdr2jX9oJSEWtZ0Nv5P8eYAeWsZJQUSm43LuFL+I+yZnPQUI6sNV9lP
	NpI3hiNeqH/UzTlAzVpobtjd1dKWDrWZQCqSSXa4rVvopfQDMQhw8Vpfbu01Bp9ax+D3bHQ6ziv
	X8gM1E0IZsxtTIVbxIo/3yQvBbd/+z95yrlXPJT9fLWxPTbWEap2J6geMh/VO+DeVyahbtTl8QC
	RbITMYOp5iwxEKJGrqrIPJEYxlHpon1Uy/gmgONUYTeRo7nzLCDebmFRnFTNviS+2IvLXrStj0M
	GSKLVIKc/VfwRq5hOhHriV/WKWJ/p+GPbjqDz310zop81NbeFXR0j11K5dHKRIlxBFicJ45euEx
	plJtWdIY+V8UoBNdBQpEhihsIKte3nXiTju7M262DajREjh3yVI5ft5Elr/K9BKvqZUMA=
X-Google-Smtp-Source: AGHT+IHZn9mQIPbtKEBTNK3J7AQq52Vja29OpNqh6vxK+3E/IeDPpOxAmMclj8lxu74RZ2mSHlGqTQ==
X-Received: by 2002:a17:907:3d9f:b0:b3e:b226:5bba with SMTP id a640c23a62f3a-b49c23431famr1292695466b.15.1759702500353;
        Sun, 05 Oct 2025 15:15:00 -0700 (PDT)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173a5dsm991696866b.85.2025.10.05.15.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 15:14:59 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH] python3-stevedore: change to correct build backend
Date: Mon,  6 Oct 2025 00:14:10 +0200
Message-ID: <20251005221408.551361-3-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 22:15:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120257

Recipe was using the wrong build backend and a warning was being thrown.

---
 meta-python/recipes-devtools/python/python3-stevedore_5.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-stevedore_5.5.0.bb b/meta-python/recipes-devtools/python/python3-stevedore_5.5.0.bb
index 5ec38fdb5e..5f63f6b128 100644
--- a/meta-python/recipes-devtools/python/python3-stevedore_5.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-stevedore_5.5.0.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "d31496a4f4df9825e1a1e4f1f74d19abb0154aff311c3b376fcc89dae8
 
 DEPENDS += "python3-pbr-native"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += "python3-pbr python3-six"
 
-- 
2.43.0


