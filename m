Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.4382.1623220739615684151
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 23:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SbxKXFj4;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id dj8so27435609edb.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 23:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8tWVZfqftOODuT6+9aWrjOlLJKqagunwsZoBgQsYHXI=;
        b=SbxKXFj4cF7gGYqnML4Bs7cnuIMEX5HuFo4PUMoN2TNxHel+VDe5NtJv1CM5BeGQ/m
         cgaw1/pMN+mNMqNzqY/fAjFBexqR1Vh1wIPmfBrFT/Yfn3RZto4DF95cN2DceNqSJi6R
         32yTHdsfGwQMqECXPBn5C+M2Ze+TV/fHvjfdeah0RFs73A01Khv0yHSyec3oYmojL0cr
         3irrdZWG7zf3sMtMbqGkQKwpclUSxE8bKs+whHbped/T0dgvRTqJ636N+YsRL+70LhO+
         wlAaQdmocFERC/sRHfA2jB2vQX9NGbd8LUS0n9d7dCPAV2pTycXp7hEoGwQ7ht3bUxI0
         yt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8tWVZfqftOODuT6+9aWrjOlLJKqagunwsZoBgQsYHXI=;
        b=ABK8c8mVXpte/Z4o//CE0LJVP4/R2tIYT72QK0MiaKTgeCIwuzcV54R/hJmVcu7Cfo
         15K15Mvps7+aA/JQGCwvpYasJicdFQ7Uo1SfNgL5A8VS/UWRTR3z9/nj5Z8RETGJI5Ok
         02i1awlO1gvOYZClbaHBxAYOsNBXvLp3KvIZCq73n0ksyyNtMaq5SLeVi4y+WlsF7Z3r
         nTz8C3xLjHB50lWeX7nx849zy75+luB/0K0KBTbTRGXFKYhpQaOTwsFJKuIzG+tqf4Tm
         jjTgnVaSay1HGfToyJvLMGdUyCHGHkXg/XOcWmoAma2EA5G57j2QNDPeGbM0F442a+mL
         Fn+w==
X-Gm-Message-State: AOAM533jM4FkBFhgopUlEm4LM/pzr6Q24jPf4C+T5yRvJWN4ifjynMW/
	mNZFFqIv8lswkyU8y9LGKfdB+37r4dlGvg==
X-Google-Smtp-Source: ABdhPJxux02ZFnnUlaAjlMrQ3bCHqEMLHou3D83eWU8z+UabzBsLWaiZ2WTBDXfoc8Bjffcut8J65w==
X-Received: by 2002:aa7:c1da:: with SMTP id d26mr29080389edp.92.1623220738165;
        Tue, 08 Jun 2021 23:38:58 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f297e89b85a8a6897bdbe62.dip0.t-ipconnect.de. [2003:f0:7f29:7e89:b85a:8a68:97bd:be62])
        by smtp.gmail.com with ESMTPSA id o4sm690810edc.94.2021.06.08.23.38.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 23:38:57 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 21/28] nautilus: upgrade 40.1 -> 40.2
Date: Wed,  9 Jun 2021 08:38:24 +0200
Message-Id: <20210609063831.3400611-21-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609063831.3400611-1-schnitzeltony@gmail.com>
References: <20210609063831.3400611-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Major changes in 40.2
=====================
* Fix missing "Open Scripts Folder" menu item (Ondrej Holy)
* Prevent reopening of previewer on window focus (Felipe Borges)
* Keep working directory when executing scripts (AntÃ³nio Fernandes)
* Translation updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../nautilus/{nautilus_40.1.bb => nautilus_40.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_40.1.bb => nautilus_40.2.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_40.1.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_40.2.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_40.1.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_40.2.bb
index 75fc03237..ee58df2b3 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_40.1.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_40.2.bb
@@ -22,7 +22,7 @@ inherit gnomebase gsettings gobject-introspection gtk-doc gettext features_check
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-SRC_URI[archive.sha256sum] = "8ecfb90174a0bd5815b1ceb9cbfcd91fec0fb5e34907a4f2df2d05e5d6c99d33"
+SRC_URI[archive.sha256sum] = "b71ef2fe07e5eea89a2bb1e5bd30947bd18873bfb30f79cbf17edfbd4d20f60d"
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.31.1

