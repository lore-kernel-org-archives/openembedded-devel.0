Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4366FCA0EE8
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 04:35:10 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.14963.1758083707555655579
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 21:35:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ldTmr3ZG;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-71d60528734so42758877b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 21:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758083706; x=1758688506; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HTVt8SQc7c6lGLiCu3EvnNgy0kk/trDXhcmbcHzKe2I=;
        b=ldTmr3ZGEiock3670OcS+33cbgx6anXAdmRH/8AhyY4sTDPrcx/Zm2+XHvqG93sCk9
         3ekl9rVjtyPZJyiRYe7h9I1eihiI10WC/llp5UoS85y9IUbXDfTbZEH6Dmnu6JVhpoGm
         HxwSjfSqvR900whr0yst+qdShqz5FRwddBA4u4rFqckPM9vpPME/6kLEPsZrR3oM0p4O
         angaSNcxp04qtKbJuYB79j9rG/WgmBOHtruMOwoyfoE86PaKyvxGcOjOKOzE6pbJPtm1
         yMNn2CA8Kg8u1eUCPxY1xALIbhPHibyE7MZQHGe3sEA+6q06hYKjpeqQarrzR3NgVFso
         jxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758083706; x=1758688506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HTVt8SQc7c6lGLiCu3EvnNgy0kk/trDXhcmbcHzKe2I=;
        b=U9ZIYVsl9lkSyS9wN3/KofakSEqbW2NbLfMDtwg5o+AfkMLuivUtBzdeV+c5FbAGfw
         0MlHQhrnuFaZYNIk58kJt8udt5MsoApUhQabRxC1OY0RbQOPxItPuH1G03yPPOlu4FWQ
         +MJCAxgJ6rX9n5SCFcifV1GPP0ufVzNXxywCt4m2aweeTKv1E8gNzNtentVnPyYHMDhL
         BAuI5k1yzBj03RVr6PuErchk7JkPmyBzyhm9SoOLgOkXPrai66LG/4b6H/VlKL83BG3E
         O7FxBmrL6aWA9hp3M7ACLt3SJ3IjEA+YN9LGXcYvrIzLFBKfxWHynV5HmVYKcazpm+YZ
         8gJw==
X-Gm-Message-State: AOJu0Yzjw4eK9GMIlemWpgpK5X9aZzqqmZouAFBCv/bZf35UeS76edtl
	YLJ3LMCX4bpJwHLzFFuwX2lPRN3FI9QbZ4XMZj+H8f61+sd/1kOkez8eb5tIXdD+
X-Gm-Gg: ASbGncs9P9ClwBul/fTIO8UOSpdfcqi5Yggz8xS6mDARn4qOqGiLM503cnc+CIdTU58
	sFZ0D89/LB/Zbml+4yLgbo6WJ41ge6YTqGrg5KqcOQH5hA2+dF0xure62BxuUgEgRmnn2vkMaTW
	fPPqUwHUzqelMfnaQpqB/vd2BgWw8lWsPh91Z1xMS+BdIJFsb2fCnFglwKXJhRDP+YGrcxeMPOO
	dOt9v7uJqkDFsSABTvqF2lpkq95SWDOkCuzmOtriTBuOp00G/VoUEwTfTuG8TuK/59nfyt8i8wa
	MFrW/Ze0G1k5Niw5QcS+BQaNMcUTsKVQGCJ+yT4LFLQxNC4qgar1zTY2KmD9SnQOrB9g5rodgvY
	e8sQBkb8TBocPrEXEN+WkwZ8TppFr
X-Google-Smtp-Source: AGHT+IEv9DiyJ77Fj6jsl3Q7WcUZ/bJVBwweuNc+gtAy4sw2bX54xCXfXdFLO4L2oFGMxMZR1G1OKg==
X-Received: by 2002:a05:690c:b91:b0:733:b4c2:5595 with SMTP id 00721157ae682-7388ffc3f73mr6180027b3.11.1758083706026;
        Tue, 16 Sep 2025 21:35:06 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-72f76928fe2sm45686767b3.25.2025.09.16.21.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 21:35:05 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH] libxfce4windowing: update 4.20.3 -> 4.20.4
Date: Wed, 17 Sep 2025 00:34:40 -0400
Message-ID: <20250917043440.2256457-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 04:35:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119473

Changelog: https://github.com/xfce-mirror/libxfce4windowing/releases/tag/libxfce4windowing-4.20.4

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...{libxfce4windowing_4.20.3.bb => libxfce4windowing_4.20.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/libxfce4windowing/{libxfce4windowing_4.20.3.bb => libxfce4windowing_4.20.4.bb} (90%)

diff --git a/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.3.bb b/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.4.bb
similarity index 90%
rename from meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.3.bb
rename to meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.4.bb
index 988814a22f..5791d48895 100644
--- a/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.3.bb
+++ b/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=435ed639f84d4585d93824e7da3d85da"
 
 DEPENDS = "xfce4-dev-tools-native libdisplay-info libwnck3"
 
-SRC_URI[sha256sum] = "df2419a6bd960c0bfac3307eff593050857524642597eb35a26fb4f8261a017b"
+SRC_URI[sha256sum] = "db467f9ac4bac8f1c4e82667902841fc0957af835c29603d6659a57440b6f8cb"
 
 inherit features_check gobject-introspection gtk-doc xfce
 
-- 
2.43.0


