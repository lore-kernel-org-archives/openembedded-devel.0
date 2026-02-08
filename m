Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C57B4EF06E3
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 14:51:59 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26623.1770562310321630827
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Feb 2026 06:51:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kZLjAtxa;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so18786135e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Feb 2026 06:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770562309; x=1771167109; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=slkvdu2xLhEJ16szkneItP5BU8wT9UOAc76yGgxpnkw=;
        b=kZLjAtxaCnFub4I1+u6IkrDeb5YnZ50qL87Ydwy2yqJqXS0fMgklzuAN01C4s/0BJO
         EtsXqGcmRC72VD3ibBaQogOdJfELrI/iHk8A5NcgyTrPRhkEt07RZb3onMJ/BhzEsw/a
         YioU31aCxMRXTRVP+nJYTSKjp5mspOs8+askXSDkRl1lMATIjGbw/Xyk21P9zeUJlqzW
         Q5fU68FG0P8iH425FfYoItVTQWbEeEUEaJtmXuoVl8/TcOTABu9agTZX7Lk9B9xSc9ll
         gIbIgpVoaW3xnZYeIUQ4qI9xkVhyrSNZKzDGkDiKKtjyIliAAlrWzB1sm1d4W8oZZPjH
         mMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770562309; x=1771167109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=slkvdu2xLhEJ16szkneItP5BU8wT9UOAc76yGgxpnkw=;
        b=jFVu7Sd4pJbLvBjbrVB8tuvY3g6P6wXKp/84EMRo5MGfyvb7L2XR75HJT7JYn0bqfq
         T94m9V4iEaBTeJQFnj5GdN7x7OfNiRhMOyEZBTaZX0THzhtXyKSeybk0WY5qBHC7IC9i
         YTqQ4d/N2+9HGTCT7LhE0eK/Ipr0nIoQdfV4BpRaKbFhbP0GCH2tGi3hfj18vwfZ2Rf8
         ZfhN5s4YA+/xMd8K0TVHbaCK6jsVSFtsbYvzsum0N7B9zw8KW9YYy08ecS8AW2hcustc
         xH3b8nm/FjMZtLHbfZM8UyfwzMhT1FTWweVsGTf3YwYc6409aFI/CM3yU1FVXni3kOKv
         nkWw==
X-Gm-Message-State: AOJu0Yxaus5rsfYvf7A4UgL9rzO78UykkhkxAsbi8diorih6W9GyY89u
	0uUqZWF90oveKI486lzH3fZsI0pO5Ylb21ejTF4/TvHQwehDPznojuixjrXcAg==
X-Gm-Gg: AZuq6aKNd7+BpXGARjyByAwUjJfEoOGOurL3rBX3BX/V0taT3YHkYg71ZIjZf+tRndl
	tsaiKt0rul29nObedyAltmcY1nD0K7FVmvB/lvPS8XVBFzQHm1ffR5lCXjzE9JMQmHE2n3Fks59
	tKHFBzC9uOQbCqkTm0f5tdVwuPVKTn6ohwSS25UD3LL9hyn0oWXDch1CvwoQdzdh4c3K2g8RMyo
	Hc7FAcj9CvWLZrRvRO8r79bhk3a3bAYUPxHlelsRPst2beWmqVf6auGungeuUXbPBmTgarpg38r
	hRsJda/O9uSBe1YY2MJbiEKheD8HH038xm79Xp+gR7SsJk8apsKaTMAY0OnY959hXUfl95HS2HL
	wZAKFPulA8NNtMiZ6RTSKONbGbrJJXF63XlXXK/k42cXYQz1FIxnwO5gDA+nJ1giLU1wNYIngot
	MBI2qL1ajP
X-Received: by 2002:a05:600c:3e16:b0:483:1403:c47f with SMTP id 5b1f17b1804b1-483201d9fc5mr115552785e9.6.1770562308592;
        Sun, 08 Feb 2026 06:51:48 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d2ba61sm402354155e9.1.2026.02.08.06.51.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 06:51:48 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH 04/10] gnome-shell-extensions: upgrade 46.1 -> 46.4
Date: Sun,  8 Feb 2026 15:51:37 +0100
Message-ID: <20260208145143.20464-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260208145143.20464-1-skandigraun@gmail.com>
References: <20260208145143.20464-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Feb 2026 14:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124277

Changes:
46.4:
* Update template CI images to fix release pipeline

46.3:
* places-menu: Fix a11y labelling
* places-menu: Fix opening drives with mount operations
* window-list: Fix hiding when entering overview with gestures
* workspace-indicator: Only show previews of regular windows
* Misc. bug fixes and cleanups

46.2:
* apps-menu: Fix a11y of category labels
* window-list: Fix long-press support
* Misc. bug fixes and cleanups

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...-shell-extensions_46.1.bb => gnome-shell-extensions_46.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell-extensions_46.1.bb => gnome-shell-extensions_46.4.bb} (84%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_46.1.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_46.4.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_46.1.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_46.4.bb
index b79f70c60c..c683b03d86 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_46.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_46.4.bb
@@ -6,7 +6,7 @@ inherit gnomebase gettext gsettings features_check
 
 REQUIRED_DISTRO_FEATURES = "x11 polkit systemd pam gobject-introspection-data"
 
-SRC_URI[archive.sha256sum] = "c5ba50700da77a986f0060beedacfc017e7ec82283f2a6384842a0807bc4553f"
+SRC_URI[archive.sha256sum] = "03ddc4ab865343c65bdd9a991a3b72c61e166a069c2dd7f9ec60ee5f0a8ba2b0"
 
 EXTRA_OEMESON += " \
     -Dextension_set=all \

