Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A04CD128A
	for <webhook@archiver.kernel.org>; Sun,  7 Apr 2024 23:15:08 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.94330.1712531706071528196
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Apr 2024 16:15:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R53drrJ0;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a4644bde1d4so539665366b.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 16:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712531704; x=1713136504; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1T7Ji+/DX5FViXlTAuorBbWDHcPODXQINDiDpPadnqA=;
        b=R53drrJ0OF9jXh1h1ZBVk+5+tGKko3B0GtSDzD83RuZJvEmP8c/U0hebHGr6+xX1+R
         uf07XebTMm/AiDlXzvEk0OTaGdEfHXRIZfabrYJFhelmY3YrmvW60oGkc9ygsD+kigcM
         4cIiUXmCFAs73hl8qHrZHJEiIqEtEIhZmMX/27kaKrKOvVLUNPEt256kczVu4ZtnhmEB
         dxP1zBW67tI9Zk+ndivuk6MHp9t6VFrQlifAG0LG8YFxyLcbwW3lHk9sr3ua4lNFbamZ
         vTA0z+7+VKExwoEwb1OZ+qoF2Kf1fO3CSgTTtfuJm4dngslL0lJOTlDLR8lX509exnAl
         49Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712531704; x=1713136504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1T7Ji+/DX5FViXlTAuorBbWDHcPODXQINDiDpPadnqA=;
        b=a9HmZkGITq5tq/w9689pvcqg/NDx1la6365uZajCEZXNRMCSAHpWhFdmVMKBM0RKGe
         wivIJ4IGfsSDbcW1zeRHY3bISbvT3jO59ztFv+NxnIF+5PPMXMQd7uHpnkXwecFgx5Fc
         T4FJJ3z/4+AcaTth4SlKuqJBothW4odcrP5H3pUK3fm6zgBaYBLMeuETZTHEO/tPRqEU
         6U2v0I3vf5kGmmH6TjE+SCIm8cSDaBw0GhW0x92r1+Ic/4H1LZkH/CjSPnQYdWnmJycl
         LlzeEmGLenjzo1cv6PxIu+zunezp3ZyvV2JqfpE54L7bzGn6le9wTt7xxKrZ4RrwOae8
         vcFA==
X-Gm-Message-State: AOJu0YyIxnURZHtaYqyeI8Zd1UUiD4E9HLToPfd6olx7aJwmKxK7m+7E
	YRvtuKAn+jNjDabzd7/1Ohqp2NdEHC0/gDI4i7Jab359p9LOHOS8LW9tjRAoU+I=
X-Google-Smtp-Source: AGHT+IF55F+xJ6Bphh6133eahDDuIQLT4ipvYsoePMsnIK8/jleVFaTgg3B+/8FtMQ5nEtMXg9VdRg==
X-Received: by 2002:a17:906:c109:b0:a51:b36e:61c7 with SMTP id do9-20020a170906c10900b00a51b36e61c7mr4290568ejc.13.1712531703729;
        Sun, 07 Apr 2024 16:15:03 -0700 (PDT)
Received: from control-center.home (58-175-98-95.ftth.glasoperator.nl. [95.98.175.58])
        by smtp.gmail.com with ESMTPSA id hg13-20020a1709072ccd00b00a4660b63502sm3736566ejc.12.2024.04.07.16.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 16:15:03 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH v2 3/4] python3-sqlalchemy: upgrade 2.0.25 --> 2.0.27
Date: Sun,  7 Apr 2024 23:13:42 +0000
Message-Id: <20240407231343.999886-3-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240407231343.999886-1-t.f.g.geelen@gmail.com>
References: <20240407231343.999886-1-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 23:15:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109858

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 ...ython3-sqlalchemy_2.0.25.bb => python3-sqlalchemy_2.0.27.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.25.bb => python3-sqlalchemy_2.0.27.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.25.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.27.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.25.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.27.bb
index 35011553c..e5a837659 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.25.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.27.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c78b979ae6c20775a28a287d32092cbb"
 
-SRC_URI[sha256sum] = "a2c69a7664fb2d54b8682dd774c3b54f67f84fa123cf84dda2a5f40dcaa04e08"
+SRC_URI[sha256sum] = "86a6ed69a71fe6b88bf9331594fa390a2adda4a49b5c06f98e47bf0d392534f8"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.34.1


