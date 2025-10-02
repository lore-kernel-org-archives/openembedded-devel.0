Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A8FCCD18C
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 12:59:47 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.7971.1759409986921779718
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 05:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aQb58qcI;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so193744366b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 05:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759409985; x=1760014785; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AeWDvbgAEuXwj8VuxAsgtyW0BVgvwnc5hQdSPr7CqwE=;
        b=aQb58qcIhBML31de+CphP/+eEuiu0yN0EpGyl+izGTBBCOCssj3yDlv46ifteq1n+/
         Zx1afaQYLzvR1/ro78mFH3bYcvJd9KedoC+KwtZXKEdCtP2R+b4zMPyBTpOss+jfRgZ/
         E38LyETB9OuGbaj+aQNuPbDba9TDw1qEN9bO4jzY3l0kJ1L4QrnpThy0osey8/P6DBHd
         IvWpaV0CQ+cOVHdFefSpqyriakVSqNsa+mcHjSOVd/ok2fX9pFhPq1SJ92T5pVSFYPLC
         6iW3lK0Orx5/wHVqiBg5jghu5+tOFFQImo+FDLXxGFy9MIYNSpJBS5UBu0aG4xQc7XQz
         I69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759409985; x=1760014785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AeWDvbgAEuXwj8VuxAsgtyW0BVgvwnc5hQdSPr7CqwE=;
        b=Uc66Q4RznYyVd14v7VbhW3KcVRg0O3sCFJbDl//sn+aNZdgn4MQB0X0bjWInGQpZg9
         ToEGcUxGP8rjHpswyQ9ScBmR9uR6fM1ZBDvzQg8hF6bnTPVBGYPF8NwWz95fQfV4afW/
         boK3qU7wq6eU0dZgAkzT7txWQchdBPh/5uYkj4WEwCmojepEpa1mEdzQ9rmk1hKT2BKS
         Dd6fa+Iq1+4U+GrMjfzo5b/gf/PsIRrz+21uWb7Anepgxud0tLrM/DO9FXmNKi4ekDzM
         nMIvjCpIfnchtZyF5EUnqwygueUlrpVNC3XqjA7lrgFCg1bi881BYbaP5ataNuKKZ/go
         I7Ww==
X-Gm-Message-State: AOJu0YwZ/01tQLA2WFj4dzCHHsXELg7oNP/KzW7+5QcHjNICCeBqZRqh
	8EucTZGkrubrQ1t662Jef/OtwR1GUhECsFnBE36etLbLskWWyPRRDiesKHl3ng==
X-Gm-Gg: ASbGncsnaRquWvf4Vi21/g2EKK0C1s6tvNMPu3u6a0Mg5CoDOoZGGGZEzwqu6I4ekaC
	qAlJdNWtEL1xxvF00mIfcY8jYCIh2PgIxvgD4AnJ5W7zXHcyB/67qV72zlwA89lwsPW8wSiotoC
	lj04yZ//jgPDb1quZbmALFAkFsVxDxGrj+/zlrIa/HS7zLt6iRy+u4d+FasjnsATOEiYB2qa5D7
	rQNosj2X4MMv0Z/WUEeTP3Krb+SYZdOKOl8klPVEO3BLUJzaQiLJLbRh6Wy60pZgXSH5RPNqJXl
	HxuzVGqEHD9JaX4Hf4h6tiyr5531HPfH0xkII77l15WQA7WlHjy5FoALmi15R/iFA/kmhndsFND
	uegTPLeTURcb7ql/EPutapsfvnz5eVpLEOXu/3E+zVfzJWpblMf2EtcQ=
X-Google-Smtp-Source: AGHT+IH8iRYmw1PNKxF6N9OcLzWkiBLFsqIdadiyHErjVoWlvY7s5KRbrcYGN2kPlk/Sh0n6AwDZIw==
X-Received: by 2002:a17:907:96a2:b0:b44:b01a:7b45 with SMTP id a640c23a62f3a-b46e9765465mr945556666b.55.1759409985143;
        Thu, 02 Oct 2025 05:59:45 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b03sm194127166b.84.2025.10.02.05.59.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 05:59:44 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 24/26] python3-pyparted: add missing run-time dependencies
Date: Thu,  2 Oct 2025 14:59:24 +0200
Message-ID: <20251002125926.2624522-25-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002125926.2624522-1-skandigraun@gmail.com>
References: <20251002125926.2624522-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 12:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120193

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9249052f98dde632173cbad95c7e6a3cd5e42651)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python-pyparted/python3-pyparted_3.12.0.bb               | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.12.0.bb b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.12.0.bb
index 9dd362766d..7a0d3987d2 100644
--- a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.12.0.bb
+++ b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.12.0.bb
@@ -17,7 +17,10 @@ DEPENDS += "parted"
 
 RDEPENDS:${PN}:class-target += " \
     parted (>= 2.3) \
-    python3-stringold python3-codecs python3-math \
+    python3-codecs \
+    python3-math \
+    python3-numbers \
+    python3-stringold \
 "
 RDEPENDS:${PN}:class-native = ""
 

