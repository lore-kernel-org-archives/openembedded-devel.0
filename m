Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web09.25069.1609683188317704756
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Jan 2021 06:13:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f2VYsU3G;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id jx16so33401227ejb.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Jan 2021 06:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WBx2/SdSwAP9pTsDmb9GqB/RAM96Xeezj0BDVp8vISw=;
        b=f2VYsU3Gpm7rBoetqjEbbrjlFKk8U8C0PuikY9t7fJ1Ib6noX5jPAfRsMXIxo5EZjS
         SAIs8jMstkyHe9SXObgAn5UyvEa5tZU8o0ZnEAU3hBbMR0luR5pyRjeWq3YXDEJ4YDso
         oSu+VBbsSbnM9reZo4UTr+Wf9eVDfT0K8F5pckx/koUxdvF+OuZcbwkbgtoXKnrFNrlp
         bpa7FKJ1wGg1HvMOxRDg3zJkokFyIPN48L8jnUCfymtzC6m8GHHAtEcfsN50PJFIIqqi
         Pjq0rzJbarv4GuMmzWUjMrlGQlRTlsj4UwQHnpKYnSFb+dEcnYe+r8ZCmpHr3eC5MIPc
         xB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WBx2/SdSwAP9pTsDmb9GqB/RAM96Xeezj0BDVp8vISw=;
        b=bDZLiri51GaUR2/FneAar7P0qzB4Oi3UsZjnao4kjwnam3yi4kO1yZYw6ju5Ow3icf
         SrmcEXVnYfk5Qd7fh7CRH6OObwr6lc+eSy3CjsSyNURqbkuF/mCUoFra5m6VU0lNVcND
         0h2jP9DDRycPYOaUmE1uFpbuA/DmwIn3orAXkkpBwOmCC0LJIbZRPBMnaYXV7cXbzDif
         nO6nabpzVnb4RmpkZ1ABv4o8AIH4/TjkINYYnqzR8wv2j94j8pfQb9iATo3JZbxRZBas
         /cxZRBPwavdEslHHJ1t5/XOaPcKfHodK+N3+kW8vfCy2m9SZP/fspbCwtHZ2D9smp729
         dtXg==
X-Gm-Message-State: AOAM531S8y5GiYNJw+Q9vNSmbPlW0BGLByConty4qb64se9IWmZfqhqM
	/RuHcVWadOOqZqEo9I+scQBZS07bHfw=
X-Google-Smtp-Source: ABdhPJzb+Arc1wW4vf2i4+X+C9Yfv7muwhq88uTw57A1asek7fhRs4wp6nTo0ZrZGakdleWOtgoA4Q==
X-Received: by 2002:a17:906:1cd4:: with SMTP id i20mr64734641ejh.415.1609683186945;
        Sun, 03 Jan 2021 06:13:06 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47430798383ab6418f4c8a.dip0.t-ipconnect.de. [2003:f0:7f47:4307:9838:3ab6:418f:4c8a])
        by smtp.gmail.com with ESMTPSA id r16sm42385370edp.43.2021.01.03.06.13.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jan 2021 06:13:06 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][V2 08/16] xfce4-datetime-plugin: upgrade 0.8.0 -> 0.8.1
Date: Sun,  3 Jan 2021 15:12:39 +0100
Message-Id: <20210103141247.1637618-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103141247.1637618-1-schnitzeltony@gmail.com>
References: <20210103141247.1637618-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 0.8.1
=======================
- Fix build with panel 4.15
- Update configure.ac.in syntax and enable debug when building from git
- Remove GSourceFunc casts
- Fix font size (#30)
- Add new README.md and update AM_INIT_AUTOMAKE
- Add basic GitLab pipeline
- Update URLs from goodies.x.o to docs.x.o (Bug #16159)
- s/http/https
- Update .gitignore
- Make build less verbose
- Translation Updates:
  Albanian, Armenian (Armenia), Belarusian, Eastern Armenian, English
  (Canada), Estonian, Galician, Hebrew, Interlingue, Persian (Iran),
  Slovak, Spanish, Turkish, Uyghur, Uzbek

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...datetime-plugin_0.8.0.bb => xfce4-datetime-plugin_0.8.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/datetime/{xfce4-datetime-plugin_0.8.0.bb => xfce4-datetime-plugin_0.8.1.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.0.bb b/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.1.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.0.bb
rename to meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.1.bb
index a1fc139bb..f95995b07 100644
--- a/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.0.bb
+++ b/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.1.bb
@@ -5,5 +5,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "b88e47af4e9e156e43dc993f18218bd3"
-SRC_URI[sha256sum] = "cd358bc2ff0707b8ef1504396a19b0a27f802c2ec7bceb5cebe2c7baf6adebd4"
+SRC_URI[sha256sum] = "e9f6f15be29ceb5c45718006b46dbd19b89981617d0768b2ef942b5a70af2540"
-- 
2.26.2

