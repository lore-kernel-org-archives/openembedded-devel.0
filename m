Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C26CD2A547
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 19:35:19 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.32007.1729107314697406421
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Oct 2024 12:35:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PhjLzZhe;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-430ee5c9570so2441475e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 12:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729107313; x=1729712113; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jBbA6psl1FDaHwEoEwlSxsXcc91iOZYPMKciUTYnd00=;
        b=PhjLzZheUQhDGDLDj2qhZ7/RFL7rzSn9yKVnvcjSrcFpaRBJRalk6LkomosrIQl9Yo
         sn/PDvrDe9cteB3VOX2iiqyjaeX/l8asYfmGbEMqzZTc73/Xl7bIAeTYpdIlNMeiHGfW
         rJSXBAnU2wBnO5+uA9atH4pGJUuKuvYLdhhTLHDuxJ3Z4D7ychDSZ6i3AWIFxGcgQtDJ
         50nV0cz4TOcGWn9KwXncN3iKfF+3PHIGztr5MyTY30y+7gkTEAanRlccsfFJ6FMHaaDh
         eQ48BXv6kyh+XEi75MoDV0s9nlPrj8qAh6D6w+Au/bx2F8mE6Vefl5h7rI1CROhaBuKd
         TM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729107313; x=1729712113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jBbA6psl1FDaHwEoEwlSxsXcc91iOZYPMKciUTYnd00=;
        b=sZCrDq20mk7QaGje0Driwnf2vb7UhcWNRlCrk8RswTuc0zuz8IWnc1WzUByXlB/VDh
         xLzof77mcZUo/seYv/xG+fGhBiNtmCeHWkRlzGum6XEyrS2JvATpWwa0/uH6xwyp6XAP
         0tiSqGfYkjFsibz1oalJTfzuFoZHFj5zkMimNEEP5KAAlB86frbKWihCx0gVeov/1Nyf
         C6o5tL1k6BDXKWwqIi/XlMYOG/WEY0zopKzfdJvvZRWh0gRW0n1RPdVHdpvrvUjYQVAq
         7XRnHlGXag8urNNyzgHzBwIwN6mx4i6l6zJcJcDpW+zG8QH0f5sZObf1y9wR1sKhNR/w
         EyHA==
X-Gm-Message-State: AOJu0YyotiCL/F/gEj8XapHNVQfqm7ljasgiInAfPW9qx+tVJdQwdAph
	k9eFXaKZn6V8RSkhYF2Tvnb8wqLv/mVd08dx7boPZwCu1tNCQIIl25EDpw==
X-Google-Smtp-Source: AGHT+IE4QrXEyUK0s9k30jFCJCQhfIn8O4lFJHYqTtgzr74rOlDsoki/Fsdf1NBiTGRPxLEglXsjwA==
X-Received: by 2002:a05:600c:5108:b0:430:9fde:3b92 with SMTP id 5b1f17b1804b1-431255e033bmr189415435e9.14.1729107312767;
        Wed, 16 Oct 2024 12:35:12 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fbf838dsm5120724f8f.78.2024.10.16.12.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 12:35:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/13] python3-meld: do not depend on python3-cgitb
Date: Wed, 16 Oct 2024 21:34:53 +0200
Message-Id: <20241016193505.3459828-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 19:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112942

It's not mentioned anywhere in source code, and
python 3.13 has removed it.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-python/recipes-devtools/python/python3-meld3_2.0.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-meld3_2.0.1.bb b/meta-python/recipes-devtools/python/python3-meld3_2.0.1.bb
index 7ebf9f141..97eea4682 100644
--- a/meta-python/recipes-devtools/python/python3-meld3_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-meld3_2.0.1.bb
@@ -14,6 +14,5 @@ SRC_URI[sha256sum] = "3ea266994f1aa83507679a67b493b852c232a7905e29440a6b868558ca
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-    python3-cgitb \
     python3-xml \
 "
-- 
2.39.5


