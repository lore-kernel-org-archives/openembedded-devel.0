Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.48688.1591047943432023729
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:45:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UMBVbo6X;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id r15so1008806wmh.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=T0d2bf880Jo0pnq4cGiTaWXpLkmFiL5RnBSM0wwKkjg=;
        b=UMBVbo6XB42v6YqFxybdvZCe2zxKcSZqjs9o+CmfXqu0vje2bm+Wlft7v5IXJ+JoiY
         9rUAJNU8BJR0q8IzN8CdL5bufkmSoK0efsuO+q4kxoK8kEscCaHh6w17NMdS1Myvt74a
         1ZecQ7Pg5ZjA/YpAdHxEmuFdHhea8Qf/sZwO/oeLmdRh2Op3LNBzOj0m7qzarf74Q3hC
         XKsMddyfPYJSSHS/m8Bm5FWOP78EpE/67m7KDZPCl4PUF65fA3ms0bYIC9AXdC5RxkHY
         j3F5dVt4xfxpWLxkSa+oDCByQmsO6XjwS9LkbSiiD/Up3RK6GOmJpFLE+EZm3hzznY5G
         mjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T0d2bf880Jo0pnq4cGiTaWXpLkmFiL5RnBSM0wwKkjg=;
        b=fND96DO3pXat6CPxAjTCvwc1ry/n9Q1KiCp9kt5jBS9PoLrmdhvFLGh+BTCLzRMhrt
         Uya2ntJc0ItiOOomiy465ONPQ7d9gC0q8qg1DMA/E7PIqgqYVkzEsn1BcyTbqrwiRJEx
         H4LDvD7Uy6AzkCy/f5EvMMfe7Fu81l5E48Qun5X0Pw9JP1Rxe+Tb5s3sS6+mgjyvWJHk
         jkJmG0hs9ErZixwEIdsnfhYGPyWokO3J5iuanUuyO34Eh1LtR+rKFMAEFp/4l++Lmxfm
         PRQz8GfLyu0a7o0GObDxYybuSnwzQdjz9/Zea6c7pouL/atbLGfNo2Xawp9UYhFxXKD1
         ykfQ==
X-Gm-Message-State: AOAM532XqDT1I+IMN+29I8eFeaCYbYCFFkMQgi4Q9z+aFb2LNfYPcVlN
	BBe7jYBJedkGNg2+WLVt51UaTXH3RwY=
X-Google-Smtp-Source: ABdhPJx8myMU1USiN5MWaB6pPqmQnwx5clwaCL6SKw+3Ql/OeodzYZZIamTZoXbbJig7ZlXxFW13Ng==
X-Received: by 2002:a05:600c:22c1:: with SMTP id 1mr1245239wmg.50.1591047941815;
        Mon, 01 Jun 2020 14:45:41 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.45.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:45:41 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 14/38] gdm: upgrade 3.34.1 -> 3.36.2
Date: Mon,  1 Jun 2020 23:44:52 +0200
Message-Id: <20200601214516.26624-15-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

==============
Version 3.36.2
==============
- Fixes for when GDM isn't started on its configured initial VT
- Don't hardcode path to plymouth
- keyutils has a .pc file so use it
- Chrome remote desktop fix
- Always use separate session bus for greeter sessions
  This runs dbus-run-session, so the binary needs to be available
- Translation updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/gdm/{gdm_3.34.1.bb => gdm_3.36.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gdm/{gdm_3.34.1.bb => gdm_3.36.2.bb} (89%)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_3.34.1.bb b/meta-gnome/recipes-gnome/gdm/gdm_3.36.2.bb
similarity index 89%
rename from meta-gnome/recipes-gnome/gdm/gdm_3.34.1.bb
rename to meta-gnome/recipes-gnome/gdm/gdm_3.36.2.bb
index a47bf6fcf..fbf25a30c 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_3.34.1.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_3.36.2.bb
@@ -14,8 +14,8 @@ REQUIRED_DISTRO_FEATURES = "x11 systemd pam"
 
 inherit gnomebase gsettings gobject-introspection gettext systemd useradd upstream-version-is-even features_check
 
-SRC_URI[archive.md5sum] = "65d1fd4bb85e8b133d1cbffb80ecf62e"
-SRC_URI[archive.sha256sum] = "e85df657aa8d9361af4fb122014d8f123a93bfe45a7662fba2b373d839dbd8d3"
+SRC_URI[archive.md5sum] = "18384eb8345dbee5a8219916debf7e43"
+SRC_URI[archive.sha256sum] = "3f561c10ae2e5942b03026f02c0aa7d8712e382708b17a0970874df8175b83a8"
 SRC_URI += "file://0001-Ensure-pam-file-installation.patch"
 
 EXTRA_OECONF = " \
-- 
2.21.3

