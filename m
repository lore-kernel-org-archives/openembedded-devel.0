Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web12.22905.1596976519718386806
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Aug 2020 05:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rtTja+zU;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id f24so6700568ejx.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Aug 2020 05:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T4shGMTtUYXjzp3MDUNXyogsJw+TieEEkZ2LDjUrR48=;
        b=rtTja+zU6O+srns51mXFOOv+EkUdVnBOInq1iSbOh9ueQn6hMOn254reeo2F99XuTa
         gkof+XwLqwSMyPaHjUXhm2LzLDzUrcHnYNN3+krrE1BIQuEWtgPC8Pu4c3TX/G7mXjbl
         qbF1ZbQ69cCctSmpBOy1BwrmZoPILAKdJnNP843y2sowmeLxa9HBplTzaCNk1QatLtCl
         bADY9Ozi46a/KPQzsZBqaqKpAzE8txVtmWy8c6JwMo3OuVsWcpnMkInlpAmjL8x4o0LR
         7MmQ7MjcnNkkImqKLBnkugSuyDBUFKuyLG/1cLozqbw2s5SqYnSRnRLfwFmXeobJGl7t
         dWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T4shGMTtUYXjzp3MDUNXyogsJw+TieEEkZ2LDjUrR48=;
        b=uGpIhO9BXsIJyyD0hu4wZsnaDQp1rPmwxzIUmx3Dz/zTRTDiaeJL95aM2LwInrNZXx
         +l47rdTOXaieX+CvAQIaK/WT0Ps7ccze/0NZeBtT8ZdS02SrFA38SgH8dhb9VCgIrJws
         MRn74fs9AFlxWIPjf/5X/DgCZ0vlI21WnTU5cxB9k+NYFSWG4oPbOOfdhRMAVkWCkOdc
         DaSYrKeX150SiaN/aZsx0J7vaY9kBomcFw2kgB3u6886KLpwfBjJStzK4wGQTRPHaK4/
         0FZAirwjtdeZZx8iHe3zUMV7uvIDOqbrXt09UnX5eOaAhpHAlD1/w11Q/krO76DEJWwg
         xkLA==
X-Gm-Message-State: AOAM533zv343dmwGcABL+T3j4RlFp0qqcr9WCI7TGN7K7RDZgU/y/RPQ
	7lt+bWHoi9D/8gYx6BeXvUZpsV9Q
X-Google-Smtp-Source: ABdhPJy5gjqU6CpyP0hudJny6bAS9HvePfmKl7MYWnUKGkJAZn2LdlPUVMOHNHnJvu4GUklsdFhHpg==
X-Received: by 2002:a17:906:924b:: with SMTP id c11mr18055174ejx.75.1596976517748;
        Sun, 09 Aug 2020 05:35:17 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f102180f54bc478636fc7f8.dip0.t-ipconnect.de. [2003:f0:7f10:2180:f54b:c478:636f:c7f8])
        by smtp.gmail.com with ESMTPSA id b24sm10070260edn.33.2020.08.09.05.35.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 05:35:17 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/6] tumbler: upgrade 0.2.8 -> 0.2.9
Date: Sun,  9 Aug 2020 14:35:02 +0200
Message-Id: <20200809123507.267616-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 0.2.9
=======================
This is a bugfix release from the stable xfce-4.14 branch. This release
addresses the issue described in Bug #28 and partially solved by the
previous release 0.2.8. The issue now is completely solved by adding
the correct orientation handling when fallback code for generating jpeg
thumbnail takes place.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../tumbler/{tumbler_0.2.8.bb => tumbler_0.2.9.bb}             | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_0.2.8.bb => tumbler_0.2.9.bb} (88%)

diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.2.8.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_0.2.9.bb
similarity index 88%
rename from meta-xfce/recipes-xfce/tumbler/tumbler_0.2.8.bb
rename to meta-xfce/recipes-xfce/tumbler/tumbler_0.2.9.bb
index e0d4845a0..d364c8033 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.2.8.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.2.9.bb
@@ -6,8 +6,7 @@ DEPENDS = "freetype gdk-pixbuf poppler curl xfce4-dev-tools-native libxml2 libgs
 
 inherit xfce gtk-doc
 
-SRC_URI[md5sum] = "5d541608b3962fd2b16e23a266fd7a10"
-SRC_URI[sha256sum] = "0999b9a3deb57010956db6630ae7205813999147043171049a7b6c333be93e96"
+SRC_URI[sha256sum] = "6508906f03e5a6ae3f6503b71b056df47d336d5504f39df6ce0bb9c5248007b6"
 
 INSANE_SKIP_${PN} = "dev-so"
 
-- 
2.26.2

