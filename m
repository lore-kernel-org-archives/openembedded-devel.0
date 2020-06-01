Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.48691.1591047949112564693
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:45:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tqEBEaag;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id v19so955404wmj.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2SP+W1dtmYOPFGydo9NxKMjBfdxh7AbM6S3qbcvoCU0=;
        b=tqEBEaag0ha88DAN4V+M0Se4JOqtyhMzJV2jqLsJSy2rbcVykE9hElLhbEC1ofMqYm
         FIU2BeK1vRJyMLGIgbU8K8g0RTmz5cu7BnLiidkoR8+jq4Jo2abZfurHWEzDtQR62qEi
         sohJpLt6QiyfZYpMxhU3Q4U1N0UU0Z5R9FIvJp3R6qh+3UdU7UzTb6eOIR3XJKBjikEH
         +MVUfzfsRAedIfPGWwyz9RIXM8JGx4zDI52cKExydqB0YhMnIQGzuBjwC78JR9G5EPAq
         MsWXimmXjEzRQLpwEhjXKRA+EsEvDWoC1fh34bdZ9RC3t/pGBpmLIVS/giGYP3xnUJrB
         X/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2SP+W1dtmYOPFGydo9NxKMjBfdxh7AbM6S3qbcvoCU0=;
        b=pEk1Jxzwg3GagRvE0EAhj/HQzhuYxzkDPGYCWR2hxadfYfyg/SWKvrxS8bP7024rLm
         Bu0QBHpFz+6Wex0eTi+ugRvZtxzw6B1mC7ygTSjtpVN5mn+vrPLOb4ugy3nzocmApYc+
         CKubF7r8MnQHHhC/ZXbw3CFfXW85afcMYsx35ogos48Y/s6506Dpek8gFKwCA850DJls
         guheFU2dJjq8hJQs9w+lHTExrTuq2dh1qnnxqDkNpQ840NFopkFfjhsv2CnHZhDcCEHp
         legKP68PKbVph8zp/Boyk6KZzOS3OvySEQsJt8a2Logu904sttIabHp9k+zRZAsxuTf/
         5T+A==
X-Gm-Message-State: AOAM5331Zizh95xhpVRXn0dvyEYGao9Uom0V09DnzF5WHcTKX5fM/EU6
	G2T6HEY1eei3fGuvBrVCA1BHejDe9qs=
X-Google-Smtp-Source: ABdhPJz6a2VcIDpHnyQtLpmOOucjfIQzP40/1Jg4HEHwKndt/nXW0we91fGz1XcZXFPR/4hBeF5baw==
X-Received: by 2002:a7b:cf2c:: with SMTP id m12mr1150789wmg.70.1591047947465;
        Mon, 01 Jun 2020 14:45:47 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.45.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:45:46 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 20/38] gnome-desktop3; upgrade 3.34.5 -> 3.36.2
Date: Mon,  1 Jun 2020 23:44:58 +0200
Message-Id: <20200601214516.26624-21-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

===============
Version 3.36.2
===============

- Translation updates

===============
Version 3.36.1
===============

- Translation updates

===============
Version 3.36.0
===============

- Translation updates

===============
Version 3.35.91
===============

- Translation updates

===============
Version 3.35.90
===============

- Fix crash in idle monitor

==============
Version 3.35.4
==============

- Remove unused API not compatible with wayland

==============
Version 3.35.3
==============

- Add utility function to start a transient systemd scope
- Blacklist seccomp on riscv64 architecture as its not supported yet
- Honor XKB_CONFIG_ROOT environment variable

==============
Version 3.35.2
==============

- Fix time display issue with Japanese translation (Tianhao Chai)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{gnome-desktop3_3.34.5.bb => gnome-desktop3_3.36.2.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop3_3.34.5.bb => gnome-desktop3_3.36.2.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.5.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.36.2.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.5.bb
rename to meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.36.2.bb
index 63a96c8ee..1f5acd8d0 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.5.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.36.2.bb
@@ -14,8 +14,8 @@ inherit gnomebase itstool pkgconfig upstream-version-is-even gobject-introspecti
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
 
-SRC_URI[archive.md5sum] = "1cbcb9d9a5159447b9a45079c6157ca5"
-SRC_URI[archive.sha256sum] = "ef13203bed721d271227d9928d91937733c312ef79b6f5c00b6c02e8e0b2fa21"
+SRC_URI[archive.md5sum] = "9fa17a6e2eacde3f9dd0df6be10091b2"
+SRC_URI[archive.sha256sum] = "38f994dcb1e1ae093d1c929c7acc4f88e39111e43b5fdc13125b0f6e2311c789"
 
 SRC_URI += " \
     file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch \
-- 
2.21.3

