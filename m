Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29226CD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 10:00:36 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4054.1778666434890639511
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 May 2026 03:00:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QIDFzhCK;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7c58e6eb3edso16695147b3.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 03:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778666434; x=1779271234; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eNRhn87z8+maBAKlpa4JF8rd0akfkAzAxp4k+ZF4K/E=;
        b=QIDFzhCKCSSzXMd96zHWslpf52ocoFJ5BhsvN6SiMzvJA50U5eI7zlaQLmORU7gVLP
         hoJMAkIx8Ww+PDpj3lJCAYee7hI2dj4ISUSrRSg1DJ515/f3k5/0LVW7uSgcMyHqHKWt
         yCCItj8zBxaAZLqENE+OWZjQuPoe1/dOcgZa3Cnh+DAqheK9L0aBY8OYkBKSX9jJYDQf
         xPxdTrIFRjhgsUpKT/AdojfHG5lxG5kyqmhywHNGbuM1KAue6ovKQfyWSFJ61j1YSQ4l
         ZvhxCMd/W+BexNvdTIkRgPymIvwLSrKvKhrZyaXUT8jzcYacud9nnB7Xl7+OKfqe8XE3
         kxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778666434; x=1779271234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNRhn87z8+maBAKlpa4JF8rd0akfkAzAxp4k+ZF4K/E=;
        b=HSm19LagDGeO7vvVEZtJsUb2WP0BqX6SVCR4EE8YAktD2sgwO/q6KT7ICHVm1O9tVR
         VTYzGQnIi5QtWLTfQiHIGnDvG9/RjOm/I6AERZsA+pKXXiTT4OllPQmtVb/x2JoTtph4
         gL71elAmhabVkjuEDLa4EhwH5hyBUCze/b6GVAlaB6JUFVUb7P/kN67YmXuduFhub4hf
         vjsOq0uQTm4aLswhoMpsjpOGmJqAra9wR+ICaEebAeCjO6AIldvcL47k3pRj3EkVV/9A
         mKV4bd2Lkt/Cs4uxdY9S22W11Mbq8p7pfQqKHwd00t69yBzWZSagTFiubBdxOilaDPI2
         5myg==
X-Gm-Message-State: AOJu0YwnYXTJ4nzobWN2iySngsHdxuGoGyXZtNj6p8qCii+3ns9AopkI
	RaNeMns5DQVpXTFxc8Rn5IJEQdgsGTIrnGL2EauaDtB58wz3I3bWxwEJGw1j/PPM
X-Gm-Gg: Acq92OHr+/iUAGZrlHtjcRrQpcgE8IvcZhSSVfkMNFDG7kKGeULTCqyONW0jJ5I2jRF
	3mefZ40ABxkuyBmx+ZfJe7YJV0fK5klznAQMxUJiPBXcCHfhHXmIUfcj45gcQBTH5R2PRrU6v2s
	mMvNMftH4aEG65wUAWwql/O2/JS1+eG1ZeZ+4V+lMpInxhk+d3BqPOxK5WNFzXu1+3ZDAqmNZ4t
	v0yf81U7I0Y3zwRe9bFvVH6tyRrPuH5kwX8Yeb4jFgOmH8aOiPqMb5snZGndilHPhmLv4eH4i6K
	NjKtNY3AGfCAnR9n5D4Xsv68C8Dhpx9poGVnmwpLxget7wx6Zbn96kIR8FMLvBD2eyY67qVf3E/
	feu9mMaXQqK/EDV+5ND08KXFc9ofa1j+0oryUFhGri8AljR4PKuqqLrikNzGYC4iYAVlVVQ1n9I
	eD5Rzjv/Zlvv5YiCTy7Ted8E2P4/dnxooQyuETKK9FMeFKo+GvMnn8K3E3NINWOujivD3broRTm
	WyntmqVJL7fNAYLfymWbV3N5bnYhGtv5qQDo9Asnm9rN66kcoc=
X-Received: by 2002:a05:690c:9513:b0:7bd:e564:9b40 with SMTP id 00721157ae682-7c6dc5b92d5mr13935677b3.36.1778666433406;
        Wed, 13 May 2026 03:00:33 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd66019105sm179148017b3.0.2026.05.13.03.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:00:32 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH] orage: upgrade 4.20.2 -> 4.20.3
Date: Wed, 13 May 2026 06:00:13 -0400
Message-ID: <20260513100013.16224-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 10:00:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126963

- Fixed use-after-free in sound command execution (Issues #47 and #48).

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-apps/orage/{orage_4.20.2.bb => orage_4.20.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-apps/orage/{orage_4.20.2.bb => orage_4.20.3.bb} (88%)

diff --git a/meta-xfce/recipes-apps/orage/orage_4.20.2.bb b/meta-xfce/recipes-apps/orage/orage_4.20.3.bb
similarity index 88%
rename from meta-xfce/recipes-apps/orage/orage_4.20.2.bb
rename to meta-xfce/recipes-apps/orage/orage_4.20.3.bb
index 461e471146..d3727f25df 100644
--- a/meta-xfce/recipes-apps/orage/orage_4.20.2.bb
+++ b/meta-xfce/recipes-apps/orage/orage_4.20.3.bb
@@ -7,7 +7,7 @@ DEPENDS = "gtk+ xfce4-panel libical popt"
 
 inherit xfce-app mime-xdg
 
-SRC_URI[sha256sum] = "6bfd3da084c2977fb5cee26c8e94bf55e358da8e86dd2a83c6fa9174f24672a1"
+SRC_URI[sha256sum] = "d9f6a3bcd1fdcd83d8277bc1996684a02d06ef60492b69c2404815f3314d640e"
 
 PACKAGECONFIG ??= "notify"
 PACKAGECONFIG[notify] = "--enable-libnotify,--disable-libnotify,libnotify"
-- 
2.43.0


