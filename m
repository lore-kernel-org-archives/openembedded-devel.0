Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.48770.1591047944319778640
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:45:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d61mlPrm;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id u26so871025wmn.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=nXPzWaANmRSQriaG9MILPFVrqXHkhLXgZrrhH25SSWI=;
        b=d61mlPrmvlieT1eCuJs+HmEBkbL07jNGYDbVaDMCXRboWKjEO/99Pi/KROYi6mbZ7T
         lX69S2WLmIVLZiJQ61kQSkh3bydJzf0mh78F69PmvfFIN0TTrp43JfBEJeRZPnxb77c2
         t+QX/dloBd9VpaMfaIK3Z3cczaGDtoSoI8efG9uvVDGEBNTE/jJw+ho76s7V73EILwNt
         d+PJzk/+ssw8ivoErYJnu9QAhkFgrx38PkdEJjNh94Oi9nZ8+f39uBmtwYXFM+R94fv/
         8h2XnGUUHvIQ5a5ew5fq3QljBRAhSawwwQ/MpoWYUs9LrhHVCJ6YCd7rTGO7RgxpOEyl
         TGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nXPzWaANmRSQriaG9MILPFVrqXHkhLXgZrrhH25SSWI=;
        b=fZ9mlkFPyXI4L2f/tlW3eWuHF1AunSZ2CMRhvP5Dob/xCnQtlLXBL4gQA05hREvi5o
         a7On0WNDtV6Fdwk4E34pi4CSsUhSTG/P1xVZKYzC9RZtN3odj3z/XFiGJrinpO4Bcpyb
         ROegQtDAY0IHx0mi2kuXZnquiA0RhGqcjw2SE+fb7EqcOvQQNAESf41U67PCYQjgRoMJ
         GV4+bksgZZxarujH+PN8Sh5x+JFQhV4fev4rCbi8H+zwdZm5sgEaw1ztLudtFInHnc6f
         LuFZKygKESzjEv4Tg8wkiTyGaXCt6l1CwIyURASihL0aJm8zrxQppqFjr9TO2v13hoR4
         Uobw==
X-Gm-Message-State: AOAM532ZOxFfNWwRY9lyifEb1QOoJrDicxzjaX3vT1S5kLvIygoWKQX7
	NuM2pKQuPdr+4vYyyzXHCidhmWGheqM=
X-Google-Smtp-Source: ABdhPJw1fhF+kjhLsaT1TG1TAsSyzaduKFIXvQKHtaUxtXwwfzflHByBfDteyB2pprcAZF2JDU1mpg==
X-Received: by 2002:a1c:9dc7:: with SMTP id g190mr1215607wme.129.1591047942655;
        Mon, 01 Jun 2020 14:45:42 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.45.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:45:42 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 15/38] gnome-backgrounds: upgrade 3.34.0 -> 3.36.0
Date: Mon,  1 Jun 2020 23:44:53 +0200
Message-Id: <20200601214516.26624-16-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

===============
Version 3.36.0
===============

- new default & supplemental updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...nome-backgrounds_3.34.0.bb => gnome-backgrounds_3.36.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-backgrounds/{gnome-backgrounds_3.34.0.bb => gnome-backgrounds_3.36.0.bb} (68%)

diff --git a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_3.34.0.bb b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_3.36.0.bb
similarity index 68%
rename from meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_3.34.0.bb
rename to meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_3.36.0.bb
index 2350a7df3..6a765bd8b 100644
--- a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_3.34.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_3.36.0.bb
@@ -8,8 +8,8 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase allarch gettext upstream-version-is-even allarch
 
-SRC_URI[archive.md5sum] = "f350804df16cdc9ef5306087157cf31b"
-SRC_URI[archive.sha256sum] = "c2b7fb6db98c05e205053daaa7f58c7f06ff91b45c4006052af17c578ae7b47f"
+SRC_URI[archive.md5sum] = "1330dd3895b0cf054668a7c0db1c8487"
+SRC_URI[archive.sha256sum] = "b8cb81e4cf9d085fbb23540635b492d5c124a1f8611c2aa9ac6384111d77bb0b"
 
 FILES_${PN} += " \
     ${datadir}/backgrounds \
-- 
2.21.3

