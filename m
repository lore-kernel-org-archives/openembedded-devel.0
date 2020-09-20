Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.20561.1600613451577906939
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Sep 2020 07:50:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IpLCzQ/U;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id nw23so14272505ejb.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Sep 2020 07:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/z2HEtWYCGmoW5ZpFXRddwrWyPMbTT6wkOrfeX8nJ14=;
        b=IpLCzQ/Uzji/igB7HSzv52oBarSMSpBpbPXZj1C5rW5PcM9R5s8DLjLqh6cT2VLStY
         V2haa80zXjpeRLJ9HJ9L7Sxgvhn5eCOEM7v0HnNVMSNnsfs2CbJ/P1yef9VqEJOu624Z
         u1oTbrY0H5VSdZqQJw/yeaJeghwIFdpD4Nmlh884XMxxYf+lQe2/R/gVJnK6nhTJfhZA
         Od/BNM29FcoyGNLH3puGCRv6yiKpbkXArZbFmL+B3X++dqjZIhRN5KzlCCLVD/EyaoG1
         0gIaKoN+SwOCZLDzzDFIrSfzk/qodsNd8TpNU646+v0NzG70FglAosjhb0OqOWDGaGI4
         v/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/z2HEtWYCGmoW5ZpFXRddwrWyPMbTT6wkOrfeX8nJ14=;
        b=Cz3b/1aieXAIXwfj+ckMPAYjfDWSt4RScXnATHP1dZ30xTdxbr3TAei/ljX/Jlt7Jd
         81LZuUPCKMpaNHPAch9PO9TYaIkd1KElcasnOEnJp0trRcDb1+ufKG8KQRZDtJf2Cku6
         Opcc+sbfVxFpt4XOksc5ShswBXOkeMpSefhWUc0uMBCooeNDmc8EGF/q9jldv8XtufjT
         giCe7gOmqvmT5rZ8JwvzzholnVvvVgpqgTgychPZAzQyFt7f+M5LP/PGDTdxjuEuSDBy
         MKLxepOVKhVS3CHAdYiPvGuOeK75gfkD47hHC447Po8LrVcYphW/k3N+LQulVQ09Hv17
         nrbA==
X-Gm-Message-State: AOAM532WDpDZUfmEbfumz793oi64wTKsIFJHIiZwrpsuJsMFOdfLTMJt
	QAzYkQd5amrF74jKlpdNybmG+zP45kc=
X-Google-Smtp-Source: ABdhPJwpj7FdytIxqR06fZngAf5Axy/bbiAZ/GBt2B2iF3ImLARuNG3IVdHy1xvwami/PDVQDHZHnA==
X-Received: by 2002:a17:906:488d:: with SMTP id v13mr44817810ejq.524.1600613449635;
        Sun, 20 Sep 2020 07:50:49 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f33b24861ef8a9f58bb5121.dip0.t-ipconnect.de. [2003:f0:7f33:b248:61ef:8a9f:58bb:5121])
        by smtp.gmail.com with ESMTPSA id m10sm6785777edf.11.2020.09.20.07.50.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2020 07:50:48 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 02/11] gnome-desktop3: upgrade 3.36.5 -> 3.36.6
Date: Sun, 20 Sep 2020 16:50:30 +0200
Message-Id: <20200920145039.2240-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200920145039.2240-1-schnitzeltony@gmail.com>
References: <20200920145039.2240-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

===============
Version 3.36.6
===============

- No changes

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{gnome-desktop3_3.36.5.bb => gnome-desktop3_3.36.6.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop3_3.36.5.bb => gnome-desktop3_3.36.6.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.36.5.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.36.6.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.36.5.bb
rename to meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.36.6.bb
index fcdb2aee4..a383da479 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.36.5.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.36.6.bb
@@ -16,7 +16,7 @@ inherit gnomebase itstool pkgconfig upstream-version-is-even gobject-introspecti
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
 
-SRC_URI[archive.sha256sum] = "eea1242994109fa3f05793963ee25c3df23bc84b0f0b81f03ec3c294c27ab753"
+SRC_URI[archive.sha256sum] = "d23c76947c781f447fb39538dec509408b161b291a75a4ce1c14c2b3d33344f6"
 
 SRC_URI += " \
     file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch \
-- 
2.26.2

