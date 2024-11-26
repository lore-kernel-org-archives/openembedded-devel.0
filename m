Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D93D5A6E7
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 06:49:20 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web11.40337.1732603758099484254
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Nov 2024 22:49:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TkCoTQcy;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e388ff24cfeso4729466276.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 22:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732603757; x=1733208557; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KiOUy6hLuh+GI0lt3Vc/KqHv0rRz3GT2UWvBA27t5ts=;
        b=TkCoTQcyjqifX01ZrE/2KOoNso+5SVV5MYDMfUQsuzreRwwvpkUCYBZXCWWOKp1okd
         1SxjLaY6UPgPLRilH5yEWlY8o9repvDJIVl9eGPT5rljgPZacjED7BkJ38mhdzZO/Bnj
         pFlBQmGl5oVU5yMHD5CrPmB54cq16Sr90WbmDQ4AqOmMNBKzyoZci2aiqR3StnggA4J8
         RMojv5E9syi8TvjUlzxQ6+pHUt/uoKrgHbPjNxyubZTPKmi7LVdnkvR5HbKCHOzUa81p
         2mA12+ZWCbeCDzs0EXib/5zHb/Vo0xiK8IT+McdYgTAHrsee4815g/5Tzp+frq8WOMbD
         sMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732603757; x=1733208557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KiOUy6hLuh+GI0lt3Vc/KqHv0rRz3GT2UWvBA27t5ts=;
        b=cqSEf0ICwvLXuJD8YQ88xvd8+oY6Z74GsR7dCI8yZx+IJkEDRZC+Cu9bnzRljayIaH
         tZyHkZSNoZWsIaaBEjgltW1IylrXOqbReOGNOsreQQrxZT4kMl51wt3EqF6TcHIvySFv
         OnD0Z7b2hK4kj7QWWhkOJyUcddtA36BauNzF0lCjEZT7TFYB01IliQo9CJFUTfgrlj2A
         rDz/VHLRQRuRJWAbodGbnQnMnzW+EegqGS3ZzZW6EX2AOs0J2CjK18jtINPRaBiBJufv
         fxucTq149LdR4pfN60xbKoDgmY8277fNnV3c+kifYFI/nkg5tNOsDEq4FLUg37T5zsur
         2p9Q==
X-Gm-Message-State: AOJu0Yz7QwYH7uHoftK73xFTeLqfhW4S/jAvRQdhfEeLhYoeefXTefq9
	5ry34shv7ZBVem0T/YTYKJwzz38KIMrQdC5Ko6tdk/96No10A+mNq1RatcVn
X-Gm-Gg: ASbGncvWD4tbg7gYMV0fz335Xt8fXnszLun3UcG4zUMnEgcPJEebZQEtFAYAEUv4NC7
	3406eabD3J2AFMZ/hBZAhBlw3QudMaP8fb7nAJoJQ2sbLoYj3VQnx7nyVrnPArkiPNk+R7oTgVY
	tWqzD2xa+YSbzc2HEXaI6ReTccavqZ4iGy7RduEjsNKQHPZfFlxNxHU/6fy47hJbfmt/hS7QGFV
	j1BaP8LNZJ5YLpX2PcziBhDrKVmCpP3FiUnNCSE3/SmTYXf1eVd0HR6
X-Google-Smtp-Source: AGHT+IHYdH5Rb/ZFlwgiAJdQ4lc1nO6oUiznBXDBiVgO2Ci/zj9zu1PVyxorUbrZUMHoicEhLZPDnw==
X-Received: by 2002:a05:6902:1029:b0:e35:d93a:c9bb with SMTP id 3f1490d57ef6-e38f8ad8dd8mr13366194276.10.1732603756783;
        Mon, 25 Nov 2024 22:49:16 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e38f6084765sm2920711276.25.2024.11.25.22.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 22:49:16 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 2/2] xfce4-settings: ignore some warnings.
Date: Tue, 26 Nov 2024 01:48:53 -0500
Message-ID: <20241126064854.1685359-2-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241126064854.1685359-1-schonm@gmail.com>
References: <20241126064854.1685359-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 06:49:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114059

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.3.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.3.bb
index 7bfcb492f..f9620d85d 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.3.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.3.bb
@@ -11,6 +11,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI += "file://0001-xsettings.xml-Set-default-themes.patch"
 SRC_URI[sha256sum] = "2db9e99be503280739a08779503bdf11db8b9db9851c3a981deb449002f3f1a1"
 
+CFLAGS += " -Wno-deprecated-declarations -Wno-implicit-function-declaration"
 EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
 
 PACKAGECONFIG ??= " \
-- 
2.43.0


