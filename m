Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D29D36103
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:17 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.27893.1730831946887032897
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:39:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g9eVgMgD;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e35bf59cf6so1087217b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831946; x=1731436746; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESEQa0jYagJhpnl0IIlD5qCDT/MDN6245NYMabYoGdY=;
        b=g9eVgMgDunc9YA9fQzN4S5Tz4WgLj9IrC3M0sgQN/Dp4kVSSaxORJjKkGc5MAwK0Ig
         q1YEMUrc7tOH5pQW5sv6sHzuoNLTaVqoj2GSX6eVUOpWZ9QXEO5FI7jDSUDTMK1YFXgP
         MWUizShKB5OpUDFGl9MwINJwyWM0gZzV/7FflImWaH/obdTcmQZ/nRC8tKmEVnQOJVE+
         zrZedOyghCbINra7C6RsM6LV3ydHxtJ3J/ug6P0HLtg36bRVxgY0NBcvMu/VG8gHpnV9
         +qJ2niZAybD5pMveXeOZ5BStWsHLEmiC/1oUU5pk83TbE3TuPlzgORYpssyX6e8rw8PF
         OPHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831946; x=1731436746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ESEQa0jYagJhpnl0IIlD5qCDT/MDN6245NYMabYoGdY=;
        b=olT0O8VifS0uIdPYEhxHB+THoT2cdIebNjwGVe54aSRWwaDYNhKd7vLdEultSISJHX
         xOIdE+DrnWYtcCWns5j0WtJEtTSGCBw6tfz5uPyui3kbZKO2/6VS8SMOIudCM4tCL0JN
         FlqVUafHsp9UC/BvpAg0sZkajkMeBYYh1zgmbI6v0WQJDZ5TXY0h6vkkGRuyUbk5zWWt
         PGYf9LQhyxaRRCNk/FsCPAAOtLx6erF33Z+5RrGHOqAMvmjClNzup2MZ0hQIUXWa87BU
         CVfddTRdVrJPgNOd6KvzkR04PTkrs25cmoZDq4FvnreEMfYhdKvkJC11PfrfK85YkOt1
         6JXQ==
X-Gm-Message-State: AOJu0YxyXyOu61J44Kk8ZIlaWXxoyhQtHBQH/JKXAgTm6xVbCRnFjRet
	dJDt0V1ggZ5CWewcmyIIMdGqErS8vjwPH9/Pgo9eOeuexkEwAr2DYG54YVeb
X-Google-Smtp-Source: AGHT+IH6OwqVDz8ZV1c0Ss/TGy/NSQYv1gIeyvd5Ijmqi9rGCVhzLQPXYx8yERivfhQTsnhxSugnsg==
X-Received: by 2002:a05:690c:640f:b0:6dd:b8ff:c29c with SMTP id 00721157ae682-6ea643b8bc8mr141579107b3.17.1730831945525;
        Tue, 05 Nov 2024 10:39:05 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:39:05 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 082/161] ttf-hunkyfonts: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:58 -0500
Message-ID: <20241105183658.34982-84-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113597

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb
index 8a75fe38b..8101c7d7a 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb
@@ -15,5 +15,4 @@ FONT_PACKAGES = "ttf-hunky-sans ttf-hunky-serif"
 FILES:ttf-hunky-sans = "${datadir}/fonts/truetype/HunkySans*.ttf"
 FILES:ttf-hunky-serif = "${datadir}/fonts/truetype/HunkySerif*.ttf"
 
-SRC_URI[md5sum] = "b933312967842e5737b5415fa22d682a"
 SRC_URI[sha256sum] = "3fc528737ccd12ec3c09c4a91447d241d3c5bceeeb4d24b7f2c29b15c9735328"
-- 
2.43.0


