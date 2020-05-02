Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.2782.1588415828040080193
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 May 2020 03:37:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OsUc2zWi;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id k1so14835254wrx.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 02 May 2020 03:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ObFGsdsOOFKZ5gEzpe2VSGi4nAMxk0jQ6B8uBOZW1Dw=;
        b=OsUc2zWilRFcGSVm6WIH6ZB/AxDSLXYqb7N8FcNs5vn63dXn3UxlMZsajqhY3+KBCv
         zO4GNkUFkxtsdbiBTSi7nDBDXcTAcxjyVEfIcseTTVszl0DhnXk9cPT8MG0vfqjOX7Gv
         2yGboYxZEi67QhtatR6tME07HzaCrmCj0GitDmGnzDbMu7FcwoJBvyI50a0kNUSbBXvc
         iFz6rboMMJJGlVaE992Bg/MF9+sN+hmVcmhjgd7aGV7MIVlkLLyCdThtYRnW6KKDyolR
         08XBJT1QMn0SMbtLn0L00aV4ZpCDRMbvfCCIcLg6MUaFJiCzrd8pCYjRyKmIm6tI27Y7
         FoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ObFGsdsOOFKZ5gEzpe2VSGi4nAMxk0jQ6B8uBOZW1Dw=;
        b=Ti3AacY5uVPzLbR5e2KQlSlP56ZZUS7WFB/nkJR/Yp8r57k8sW3qX2LRLDuXiDivCR
         BUCCJKPkbX0VXZ/B534ShQN3p5HI6T8FgOZ2JG0Qqa4C1E1me1NFNC1anKIHMCamqM0j
         RMPFREgKmKRtncWKWsS6xb8KWiwIc0HMs52670RpQR5W7122iKF6y93yIoJ7nxlhygH4
         Jug5+F5rLZP9iIyrzNgcEo6cuJkAFaDrSzdeh6nMrJ+fLXBlGJgawzmBEXLkefJmDcfT
         KCWMG8+DLAVa9z4p6CYNnUVddL03QQPhh2+osTaGyP4lNdfpDjy5EbCMbS87rHE3C6nG
         k8Pg==
X-Gm-Message-State: AGi0Pubq7oQ8N+xKF0O6+TEcUluG8uDPjfV+t/159uBq3MmjU2/BIVVe
	8sZdQp/erZ7JKsYgqSw7tWmZKS5K
X-Google-Smtp-Source: APiQypLTyCFD6z7pXzGYBWTnc6DcQQeH9fqp+AGokWMZSZF40yEAsVw44W6Ce0g0hxD0t2KGV0rYDw==
X-Received: by 2002:a5d:6a85:: with SMTP id s5mr6968961wru.122.1588415826176;
        Sat, 02 May 2020 03:37:06 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F0ED486929800066C503824.dip0.t-ipconnect.de. [2003:f0:7f0e:d486:9298:6:6c50:3824])
        by smtp.gmail.com with ESMTPSA id y70sm3804698wmc.36.2020.05.02.03.37.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2020 03:37:05 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2] file-roller: upgrade 3.32.4 -> 3.32.5
Date: Sat,  2 May 2020 12:36:57 +0200
Message-Id: <20200502103657.16172-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

version 3.32.5
--------------

 Bugs fixed:

  * libarchive: do not follow external links when extracting files.
  * libarchive: overwrite symbolic links as well if requested by the user.

 New or updated application translations:

  * Kurdish (Sorani) (Jwtiyar Nariman)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
v1 -> v2: set correct checksums
 .../{file-roller_3.32.4.bb => file-roller_3.32.5.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/file-roller/{file-roller_3.32.4.bb => file-roller_3.32.5.bb} (81%)

diff --git a/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.4.bb b/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.5.bb
similarity index 81%
rename from meta-gnome/recipes-gnome/file-roller/file-roller_3.32.4.bb
rename to meta-gnome/recipes-gnome/file-roller/file-roller_3.32.5.bb
index a95735c9b..2070f18a9 100644
--- a/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.4.bb
+++ b/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.5.bb
@@ -13,8 +13,8 @@ DEPENDS = " \
 
 inherit gnomebase gsettings itstool gnome-help gettext upstream-version-is-even mime-xdg
 
-SRC_URI[archive.md5sum] = "21982b8d298cb2994a99494399dcb2d5"
-SRC_URI[archive.sha256sum] = "1b3b2cbfcb444e0d150bfd063add9d5181c8ab24f0593e5a8894399297214017"
+SRC_URI[archive.md5sum] = "2afc688ac66a50213f6c42ee99479a96"
+SRC_URI[archive.sha256sum] = "d53d30b4b45f61158b7e550b71a8a5556e877695f43a2ceb88be895960e54176"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'packagekit', '', d)}"
 
-- 
2.21.1

