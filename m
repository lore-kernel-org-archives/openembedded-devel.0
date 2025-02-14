Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F0F8C02198
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 08:36:38 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.16716.1739522189005516582
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Feb 2025 00:36:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YB19zwaF;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38f1e8efef5so935792f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Feb 2025 00:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739522187; x=1740126987; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qd1+hKfCpkaK4xM1efacdFSOI1/3ly/mf3ZspZaI3/I=;
        b=YB19zwaFUpymMirR6RsO8xoJ4hFhU0GyHVFbIyAwkkOpsIHHft2QIl+as/L/hLQdPP
         Nr+KmEJHiPOWWGj9Jm19sLGk5bK0AAxbQyhAY0T9kW1EowcZjYx8OFOdJxrr6dbZbaa2
         cwxyoGAm2G3HTiaC/j0isDPKqbkErBOEohcfKhxRXEmlYjcDKFn5SXqXTm//PY/cKnlN
         4zBn85Mlb3eWeEOQn1SCMzKC7vkhFh8GO/PhPdk5mT8KEEzv3uuYdbaJk4LV3feaP4Ca
         nhV+4GFzupAoV6bXze8Mu8IlqlL4BSI7JZrnltR/arsXd2KBLl5ozSjL95Tq9sYO7dek
         AG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739522187; x=1740126987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qd1+hKfCpkaK4xM1efacdFSOI1/3ly/mf3ZspZaI3/I=;
        b=Pvlv/3d+yOtcAt5XgF0vgs4fLLVw+tlPxVG176+TRveY0uVLrrUVbXTYWM+7rjQlOQ
         18Eq5XgKaKlj+wDdidKi8LNurURnEEH2MeGIAQuQiEVQlOly+IkwHASkpS3hnudpu9Fs
         KOhEmi4UIFMqFGDD5GXTrDIWYdL1laK3p0ipCliFR9koXJ9FIb8vnqiEQywc3/IAztch
         blAhY7JYcf7/CGoX7fL4+han+XX7h3XoLJtidhg0DzgcVcqGqd+Alantzj9FczuB+m3d
         iEvbmt9r6nIjySfw1NakjT65b8hU8J2RK6WmIexu6evnOFecXeMx/BDADsMlmKB+bfLS
         ddRA==
X-Gm-Message-State: AOJu0YwnLqYGaeJ2Mp0J/C436+FEbLLP5U7UQBQL7Lz2RmDH6PYxie9L
	lIN2VZsjmFYlfSYBY5Gb05GINHN07j/Z8KvuWewEcZSDRADD4MQScLTkuQ==
X-Gm-Gg: ASbGncvQFELYGau4GtNOjf70VBR2gRhkShuupuDHV0BHT9ssxM+71fWuu6Uupz8SUMR
	jmjHxYHZpupxVKJYhQWkF0hBZ3z/G8LD+ipyaTVgTdXFKf7I3LuCB8BLh2k7tT4EEciQ3NHx4cY
	DUtDRINzNp01UGDalRl21cGFdTT8r9c5/lmmlz0WYavK6PMgQYfgisog6JGsZF9mT0g0uu4d0Vn
	3GfVP5s4FebFHcX/0xoed7H+ZVKoK6LK+drNepYbikol4TqbunMMObHTHyyemUPvdZqenPFnMLr
	jLnTIEmdM+PbCtV0pmPZc1FteUpAWFw=
X-Google-Smtp-Source: AGHT+IGKc2B+G2dNPEz6xkHNxJLf3KZfn3xdo1wce2KvNx4Kz0EcjqpN/QVq/Gmx4egdRjuzwVpAQw==
X-Received: by 2002:a05:6000:1446:b0:38d:dd70:d705 with SMTP id ffacd0b85a97d-38f244dfdb9mr8296007f8f.15.1739522187059;
        Fri, 14 Feb 2025 00:36:27 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8730sm4092017f8f.93.2025.02.14.00.36.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 00:36:26 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] pahole: fix python3 PACKAGECONFIG
Date: Fri, 14 Feb 2025 09:36:24 +0100
Message-ID: <20250214083624.1169991-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Feb 2025 08:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115478

As a build time dependency, python3 provides python3-core - set the
PACKAGECONFIG accordingly to avoid build failure.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/pahole/pahole_1.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.28.bb b/meta-oe/recipes-devtools/pahole/pahole_1.28.bb
index ea2d0bab0d..83f4bbc7db 100644
--- a/meta-oe/recipes-devtools/pahole/pahole_1.28.bb
+++ b/meta-oe/recipes-devtools/pahole/pahole_1.28.bb
@@ -17,7 +17,7 @@ S = "${WORKDIR}/git"
 
 inherit cmake pkgconfig
 
-PACKAGECONFIG[python3] = ",,python3-core,python3-core"
+PACKAGECONFIG[python3] = ",,python3,python3-core"
 
 EXTRA_OECMAKE = "-D__LIB=${@os.path.relpath(d.getVar('libdir'), d.getVar('prefix') + '/')} -DCMAKE_BUILD_TYPE=Release -DLIBBPF_EMBEDDED=OFF"
 

