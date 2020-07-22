Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web12.489.1595457267641164048
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2020 15:34:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E/GCIr10;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id br7so4175527ejb.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2020 15:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=YRrlcKy/y4wSmgO35qZ1KuWpyIGcGrmdKdKpTU9+za8=;
        b=E/GCIr10iBQGc1Hv16xH0TWlQGwhyQJ6A9xJCuneAjCMhrY8sCgDu8XiL8hjxmqzIm
         HV5Cy6eHRgypNtK9C413ykEnIvm7MasOWw9l7j/jw8LPjrAmAeRoFgCDMHmzx9jb9gth
         nwsjGMFgM2/GlyjmTVRMZg7tjqt7xFOxjkkaMWPXWrewVB6rI8HPqCS6WexJ77an4c7B
         a56Acrkz/26qywetCqDqePnvnnE0VReSTbdb4aYSVgAMD233YQ03jb5ISYRmtpndqgqf
         yCSo5oZ8p17NejqK74zzAuXygGpwe4sGuJD10mH7ub3/ZFhbJ0ZDfzeVqvpd3QH0/7ZA
         DEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YRrlcKy/y4wSmgO35qZ1KuWpyIGcGrmdKdKpTU9+za8=;
        b=gWeO/TvAH0AOxHXjs9UXWLxr/vKEPAnQyMGnKKyIfxubEHzxmBCuZzF8llklBW5YVn
         uc+MBIpPCG7zFLaB6Xzi9z4akAL//eIe11Vd6IOvUoiz6pT/21ZmeIb/7nJZ/yec1nIq
         p+UzR8w8eipBsyTY7YYa5Zduy1Uf8ckU61hRK7PP1C1s758ojjF4/Jv9DH65bn3M/CAx
         s5wtM7fGpvA5C5ctgEu5IOhr8wYp+puqzciiMj2LgPIVom796DxLaWjugHd9RdXB6JXf
         HecXnAE99pu1fKoWIxfttXfIgGL4KONDR7WG/nelfCmH8qgH6Uxie/0UecTVTWfNjqwX
         CCaQ==
X-Gm-Message-State: AOAM5321GUC9BK22OaNjTf6ygRaacKYwOVOwihcXzNjPCjBbs8SRFRMH
	fhLv5ew55WseXb8YBzYz1Yb0qenh
X-Google-Smtp-Source: ABdhPJx8gGE/kS16MHLW4Q6ZVourhO+AtIE810lIECT09uGxYM7XzT/4WNm0N0a14cFk0pwzHLdA4w==
X-Received: by 2002:a17:906:c452:: with SMTP id ck18mr1706546ejb.415.1595457265959;
        Wed, 22 Jul 2020 15:34:25 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0b6195abb66966ead5e06a.dip0.t-ipconnect.de. [2003:f0:7f0b:6195:abb6:6966:ead5:e06a])
        by smtp.gmail.com with ESMTPSA id t20sm643527ejd.124.2020.07.22.15.34.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 15:34:25 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/3] graphene: upgrade 1.10.0 -> 1.10.2
Date: Thu, 23 Jul 2020 00:34:15 +0200
Message-Id: <20200722223415.8963-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200722223415.8963-1-schnitzeltony@gmail.com>
References: <20200722223415.8963-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

see bugs fixed at [1]

[1] https://github.com/ebassi/graphene/releases/tag/1.10.2

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../graphene/{graphene_1.10.0.bb => graphene_1.10.2.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/graphene/{graphene_1.10.0.bb => graphene_1.10.2.bb} (72%)

diff --git a/meta-gnome/recipes-gnome/graphene/graphene_1.10.0.bb b/meta-gnome/recipes-gnome/graphene/graphene_1.10.2.bb
similarity index 72%
rename from meta-gnome/recipes-gnome/graphene/graphene_1.10.0.bb
rename to meta-gnome/recipes-gnome/graphene/graphene_1.10.2.bb
index f715dd23d..ef1898610 100644
--- a/meta-gnome/recipes-gnome/graphene/graphene_1.10.0.bb
+++ b/meta-gnome/recipes-gnome/graphene/graphene_1.10.2.bb
@@ -9,8 +9,8 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gobject-introspection gtk-doc
 
-SRC_URI[archive.md5sum] = "07f72436bc7a85d12f5edd9fcedd0184"
-SRC_URI[archive.sha256sum] = "406d97f51dd4ca61e91f84666a00c3e976d3e667cd248b76d92fdb35ce876499"
+SRC_URI[archive.md5sum] = "a2c26c4f44a02ca053e0e9afb63cc94c"
+SRC_URI[archive.sha256sum] = "e97de8208f1aac4f913d4fa71ab73a7034e807186feb2abe55876e51c425a7f6"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-- 
2.21.3

