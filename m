Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.4430.1623220730681109002
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 23:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FnMpOdAA;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a11so35960481ejf.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 23:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=tF4MRStS14X3jntw4wWoyVELZQ5MxPxk/UY1CebKpAc=;
        b=FnMpOdAA5iIRhFBThJIvqeSefbFUcWAIXCFgSjm5yf3htt35gxe3KDPI77aJz5oIRK
         oM3SFIKP7hL8OpCwlNtIz/k+H6rWfk3HI8eYrRxrUsVuO1IMxV+V0lOzG8dg2eWzFFIO
         k+fgm+jNcV+St0YomlLyHqRQwj8h6qP6dadvF9ksoCbqky8NTR6eObts9nkabdqAeMWH
         NP4Ml/duMdA2rkcMvysiWXEcvg/9Ie3ceUH7C1fUqCVKDmJ3xb9jGeZyNUB7zghYBysJ
         3swdr5gigp4Ns3bAZESHt0ytGlf2lrugQVLMTtgamcUVYHnZsy66W0kjDceShgXrF99G
         U22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tF4MRStS14X3jntw4wWoyVELZQ5MxPxk/UY1CebKpAc=;
        b=nDq2rQKu6c/O2oY+LlDmaEKorS8aWHS4Ba8TXucWwkqggKeNS5pzVZINXtoOt0ajZW
         kksnPHEAuwVWgDT6jtr7k+zXIF5dScbGRlox2ZkG0hjQsmWomSH7o93hDpwre8Moreh+
         QpZePyXxJm8iDs3fpMsvkiRAaa19Ao1SBOx8i2BO5LlLYHPltrCbV+hsEyumxZCfGUKv
         WnTPVvS2VklGF1izk6R6Zbdsz7Fv2msqPWcvZAkgrbu3JTTL/MyyV3hk+R5X/SobIH3u
         o82lyow6H8zDi0S9GzEOX24a7KKbYsfvRvp6NkvjqRcTiDCLrBj2CE8rhWCVyO+aK3q0
         By/g==
X-Gm-Message-State: AOAM532A7WNeCLgdXLvVBq40ltFCxgA/63bE0zwed8Dq6dU/lqtmebMw
	cxNeqQOvDpxyktbPpGqjjuql33l5UJPudg==
X-Google-Smtp-Source: ABdhPJzGEXmZ+jZOH7KaQ9naUd2LdhRdkaAhYZ7upWQ1wDrT9Fvmx4UTCpG/u0xJA5JgnexhwiVrKQ==
X-Received: by 2002:a17:906:7c10:: with SMTP id t16mr16703494ejo.204.1623220729129;
        Tue, 08 Jun 2021 23:38:49 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f297e89b85a8a6897bdbe62.dip0.t-ipconnect.de. [2003:f0:7f29:7e89:b85a:8a68:97bd:be62])
        by smtp.gmail.com with ESMTPSA id o4sm690810edc.94.2021.06.08.23.38.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 23:38:48 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 09/28] gnome-keyring: upgrade 3.36.0 -> 40.0
Date: Wed,  9 Jun 2021 08:38:12 +0200
Message-Id: <20210609063831.3400611-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609063831.3400611-1-schnitzeltony@gmail.com>
References: <20210609063831.3400611-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{gnome-keyring_3.36.0.bb => gnome-keyring_40.0.bb}       | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-keyring/{gnome-keyring_3.36.0.bb => gnome-keyring_40.0.bb} (89%)

diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.36.0.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_40.0.bb
similarity index 89%
rename from meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.36.0.bb
rename to meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_40.0.bb
index 3fc16bb0a..fce28bd86 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.36.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_40.0.bb
@@ -17,12 +17,11 @@ DEPENDS = " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} \
 "
 
-inherit gnomebase gsettings features_check remove-libtool gettext upstream-version-is-even
+inherit gnomebase gsettings features_check remove-libtool gettext
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.md5sum] = "38f0732845a510a8dff4f154c3406f65"
-SRC_URI[archive.sha256sum] = "a264b57a8d1a71fdf0d66e8cd6033d013fb828be279c35766545eb9bb3734f87"
+SRC_URI[archive.sha256sum] = "a3d24db08ee2fdf240fbbf0971a98c8ee295aa0e1a774537f4ea938038a3b931"
 SRC_URI += " \
     file://0001-Set-paths-to-ssh-agent-and-ssh-add-by-configure-opti.patch \
     file://musl.patch \
-- 
2.31.1

