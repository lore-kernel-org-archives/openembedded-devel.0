Return-Path: <alexis.cellier@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67199C282CD
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 13:39:05 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.52992.1741009142452733138
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Mar 2025 05:39:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=IgQGPAqr;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: alexis.cellier@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4399d14334aso41059105e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Mar 2025 05:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1741009141; x=1741613941; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i9N6LrtDtbM5hIcFotkuBrZKuea2xgJoCRV6ZkyZAaU=;
        b=IgQGPAqrOsF0ovBzp1BH4UYlLKGVDvg+ItTZqdksT2XndJPDz4n2DvtmP5NyvLbsM0
         iposXZ8pSw7rnlJtgRThNpp5XVXYsYPOatYqMhT7zZhSzp8HeuAC0TIQJQLdKF/L2xRA
         5regduYT3rfdAFY/+gCSEuSBIw+CYnQMZ6Gng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741009141; x=1741613941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i9N6LrtDtbM5hIcFotkuBrZKuea2xgJoCRV6ZkyZAaU=;
        b=WdZtktuG5+OyyxNqPUpBGwyxc04brrIXbjWCn0Z9/YY2fpii0EcOjrYw3Qd1ySQhsh
         Lq0iH+cr6/Oo5yAUYUZRmJCrakYjTj9mOmjln6+s4fh2mNCg5t0Z33x3Vr/qUn7KWwYw
         jruVET1Pv4tdofB0SS5x2kx4oeg2rUhJH3phSQPnBmMvO76RZWVEA+y7OtNTSUFCK0Qx
         AZGwIq4DipIxrhUiCSEYX9H5lCW8Ykib3e+jeBScuCFajcEvpWW96Yc/v/l4FQZHhoaZ
         e5QSUahjDuik7VELGwOhmqv50l8KA28UvC1ZiVBeMBbtPfyLaPMOpsabOlIS6x8gS2Ww
         XbQA==
X-Gm-Message-State: AOJu0YwEP7+C6//GidMf1h4NXi1eOrdYK6BWhjwTH8FYrKqsI3nwWr4s
	3wCI9NGGpGXUZHgR5UzAaLK5OdLQt7Xei6kR/Wy9FvdapnO/V6PvGZHfWQZ7tZe5Pt3QHAeO4OJ
	M
X-Gm-Gg: ASbGncv9kJdxvHuBgVTaD56cpTTQKrxtVGJ2lX7/jQwjAMj840ZR54h6D47GthS8ZNr
	r+JvnRpca4vl1PG8NMJHAbkmlhQsP2SN26Xu68DwAHPtgnJENn+ZIZ+dZzQtEE8facXLojjqiRL
	ffT8C55O8p7OdonSQsUmqgLxJVZj2pd3W0zzFn7aGCDEZK73UL4PovlTBaWoUICO0+khN1sBnyL
	hQJQSJE4N5YwoODlgT1txti4Un5ByyWoZ7wAjFa1N4qROkZRwshgmRTvuUB2M5yvXCLUsdOIHzW
	UHEUzfWBPQSQhABI5zv59yzqfkVtr6NN4K+2X3Sz/0gtAEeuFWvFHXIiBqyBa6UiS6yEA0U=
X-Google-Smtp-Source: AGHT+IHXfeqlHwh1KBTDl6/erDeBW7ylhyBt+2uiK62q+OqCyLZsNTs1CxARC5BdnRFkoTkM8NPHIg==
X-Received: by 2002:a05:600c:4e8c:b0:43b:c9c5:da2d with SMTP id 5b1f17b1804b1-43bc9c5dc60mr4583885e9.5.1741009140905;
        Mon, 03 Mar 2025 05:39:00 -0800 (PST)
Received: from falke.. (176-147-181-65.abo.bbox.fr. [176.147.181.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba5710c2sm186763735e9.32.2025.03.03.05.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:39:00 -0800 (PST)
From: Alexis Cellier <alexis.cellier@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Alexis Cellier <alexis.cellier@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [scarthgap][PATCH] systemd: add libpcre2 as RRECOMMENDS if pcre2 is enabled
Date: Mon,  3 Mar 2025 14:38:40 +0100
Message-ID: <20250303133840.101752-1-alexis.cellier@smile.fr>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Mar 2025 13:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115725

The libpcre2 is now dlopen'ed, so it is not automatically added to the
DEPENDS anymore. Add it to the RRECOMMENDS list.

Cc: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Alexis Cellier <alexis.cellier@smile.fr>
---
 meta/recipes-core/systemd/systemd_255.17.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_255.17.bb b/meta/recipes-core/systemd/systemd_255.17.bb
index 8f5170929f..f85ad61080 100644
--- a/meta/recipes-core/systemd/systemd_255.17.bb
+++ b/meta/recipes-core/systemd/systemd_255.17.bb
@@ -188,7 +188,7 @@ PACKAGECONFIG[oomd] = "-Doomd=true,-Doomd=false"
 PACKAGECONFIG[openssl] = "-Dopenssl=true,-Dopenssl=false,openssl"
 PACKAGECONFIG[p11kit] = "-Dp11kit=true,-Dp11kit=false,p11-kit"
 PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam,${PAM_PLUGINS}"
-PACKAGECONFIG[pcre2] = "-Dpcre2=true,-Dpcre2=false,libpcre2"
+PACKAGECONFIG[pcre2] = "-Dpcre2=true,-Dpcre2=false,libpcre2,,libpcre2"
 PACKAGECONFIG[polkit] = "-Dpolkit=true,-Dpolkit=false"
 # If polkit is disabled and networkd+hostnamed are in use, enabling this option and
 # using dbus-broker will allow networkd to be authorized to change the
-- 
2.48.1


